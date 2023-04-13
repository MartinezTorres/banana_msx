#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/kthread.h>
#include <linux/fs.h>
#include <linux/gpio.h>
#include <linux/cdev.h>
#include <linux/delay.h>
#include <linux/sched/clock.h>
#include <asm/uaccess.h>

#include <linux/mm.h>
#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/of_device.h>
#include <linux/of_platform.h>


#define DEVICE_NAME "banana_msx"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bananananama");
MODULE_DESCRIPTION("Banana MSX Module");

#define MAPPED_MEMORY_ADDRESS  0x58000000
#define MAPPED_MEMORY_SIZE  (128 * 1024 * 1024)

static struct {

	char __iomem *mapped_memory;
} msx;


////////////////////////////////////////////////////////////////////////
// MEMORY MAPPING DEVICE

static int banana_msx_open(struct inode *inode, struct file *file) { return 0; }
static int banana_msx_release(struct inode *inode, struct file *file) { return 0; }

static ssize_t banana_msx_read(struct file *file, char *buf, size_t count, loff_t *pos) {

	//printk(KERN_INFO "Banana MSX: read %d bytes from address %08x\n", count, (u32)*pos);

    if (*pos >= MAPPED_MEMORY_SIZE) return 0;

    if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;

    if (copy_to_user(buf, &msx.mapped_memory[*pos], count)) return -EFAULT;

    *pos += count;

    return count;
}

static ssize_t banana_msx_write(struct file *file, const char *buf, size_t count, loff_t *pos) {
	
	//printk(KERN_INFO "Banana MSX: write %d bytes from address %08x\n", count, (u32)*pos);
	
    if (*pos >= MAPPED_MEMORY_SIZE) return 0;

    if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;

    if (copy_from_user(&msx.mapped_memory[*pos], buf, count)) return -EFAULT;
    
    *pos += count;

    return count;
}

static loff_t banana_msx_llseek(struct file *filp, loff_t offset, int whence) {

    loff_t new_pos = -1;

    switch (whence) {
    case SEEK_SET:
        new_pos = offset;
        break;

    case SEEK_CUR:
        new_pos = filp->f_pos + offset;
        break;

    case SEEK_END:
        new_pos = MAPPED_MEMORY_SIZE + offset;
        break;
    }

    if (new_pos < 0 || new_pos > MAPPED_MEMORY_SIZE)
        return -EINVAL;

    filp->f_pos = new_pos;
    return new_pos;
}

static int banana_msx_mmap(struct file *filp, struct vm_area_struct *vma)
{
    struct page *page = NULL;
    unsigned long size = (unsigned long)(vma->vm_end - vma->vm_start);

    if (size > MAPPED_MEMORY_SIZE) return -EINVAL;
    
    vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
	vma->vm_flags |= VM_IO;
   
    page = virt_to_page((unsigned long)msx.mapped_memory + (vma->vm_pgoff << PAGE_SHIFT)); 

    return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page), size, vma->vm_page_prot);
}

static const struct file_operations banana_msx_fops = {
	
    .owner = THIS_MODULE,
    .open = banana_msx_open,
    .release = banana_msx_release,
    .read = banana_msx_read,
    .write = banana_msx_write,
    .llseek = banana_msx_llseek,
    .mmap = banana_msx_mmap,
};

static struct {
	
	dev_t dev;
	struct cdev cdev;
	struct class *class;
	struct device *device;
	
} d;


static int banana_msx_init_device(void) {
	
	int err = 0;
	
    msx.mapped_memory = ioremap(MAPPED_MEMORY_ADDRESS, MAPPED_MEMORY_SIZE);

    
    if ((err = alloc_chrdev_region(&d.dev, 0, 1, DEVICE_NAME))) {
        pr_err("Failed to allocate device number\n");
        return err;
    }
    
    printk(KERN_INFO "Banana MSX allocated with major: %d, and minor: %d\n", MAJOR(d.dev), MINOR(d.dev));

    cdev_init(&d.cdev, &banana_msx_fops);
    d.cdev.owner = THIS_MODULE;

    if ((err = cdev_add(&d.cdev, d.dev, 1))) {
        pr_err("Failed to add device\n");
        unregister_chrdev_region(d.dev, 1);
        return err;
    }
    
    if (IS_ERR(d.class = class_create(THIS_MODULE, DEVICE_NAME "_class"))) {
        pr_err("Failed to create class\n");
        cdev_del(&d.cdev);
        unregister_chrdev_region(d.dev, 1);
        return PTR_ERR(d.class);
    }

    if (IS_ERR(d.device = device_create(d.class, NULL, MKDEV(MAJOR(d.dev), MINOR(d.dev)), NULL, DEVICE_NAME))) {
        pr_err("Failed to create device\n");
        class_destroy(d.class);
        cdev_del(&d.cdev);
        unregister_chrdev_region(d.dev, 1);
        return PTR_ERR(d.device);
    }
    
    return 0;
}

static void banana_msx_exit_device(void) {
	
	device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
	class_destroy(d.class);
	cdev_del(&d.cdev);
	unregister_chrdev_region(d.dev, 1);
	
	iounmap(msx.mapped_memory);
}

////////////////////////////////////////////////////////////////////////
// GENERAL INIT

static int __init banana_msx_init(void) {

	int err = 0;
    if ((err = banana_msx_init_device())) return err;
    
    printk(KERN_INFO "Banana MSX: initialized\n");

    return 0;
}

static void __exit banana_msx_exit(void)
{
	banana_msx_exit_device();
	
    printk(KERN_INFO "Banana MSX: exited\n");
}

module_init(banana_msx_init);
module_exit(banana_msx_exit);

