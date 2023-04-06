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

#define DEVICE_NAME "banana_msx"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bananananama");
MODULE_DESCRIPTION("Banana MSX Module");



#define MAPPED_MEMORY_SIZE  (8 * 1024 * 1024)
//#define VDP_MEMORY_SIZE (     256 * 1024)
//#define VDP_REGISTERS   (             64)


static struct {
	
	dev_t dev;
	struct cdev cdev;
	struct class *class;
	struct device *device;
	
} d;

static struct {
	
	u32 __iomem *timer_baseptr;
	u32 __iomem *gpio_baseptr;
} arm;

static struct {

	char mem[MAPPED_MEMORY_SIZE];
} msx;

static int banana_msx_open(struct inode *inode, struct file *file) { return 0; }
static int banana_msx_release(struct inode *inode, struct file *file) { return 0; }

static ssize_t banana_msx_read(struct file *file, char *buf, size_t count, loff_t *pos) {

	printk(KERN_INFO "Banana MSX: read %d bytes\n", count);

    if (*pos >= MAPPED_MEMORY_SIZE) return 0;

    if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;

    if (copy_to_user(buf, &msx.mem[*pos], count)) return -EFAULT;

    *pos += count;

    return count;
}

static ssize_t banana_msx_write(struct file *file, const char *buf, size_t count, loff_t *pos) {
	
	printk(KERN_INFO "Banana MSX: write %d bytes\n", count);
	
    if (*pos >= MAPPED_MEMORY_SIZE) return 0;

    if (*pos + count > MAPPED_MEMORY_SIZE) count = MAPPED_MEMORY_SIZE - *pos;

    if (copy_from_user(&msx.mem[*pos], buf, count)) return -EFAULT;
    
    *pos += count;

    return count;
}

static const struct file_operations banana_msx_fops = {
	
    .owner = THIS_MODULE,
    .open = banana_msx_open,
    .release = banana_msx_release,
    .read = banana_msx_read,
    .write = banana_msx_write,
};



static struct task_struct *polling_thread;
static volatile char polling_thread_should_stop;


static u64 notrace trace_clock_local(void)
{
	u64 clock = 0;

	/*
	 * sched_clock() is an architecture implemented, fast, scalable,
	 * lockless clock. It is not guaranteed to be coherent across
	 * CPUs, nor across CPU idle events.
	 */
	
	//preempt_disable_notrace();
	clock = (0xFFFFFFFF - arm.timer_baseptr[0x28/4]) & 0x0FFFFFFF;
	//clock = sched_clock();
	//preempt_enable_notrace();

	return clock;
}

static int notrace poll_gpio(void *data)
{
	uint64_t global_count = 0;
	uint64_t count = 0;

	u64 t1, t2, max_delay, mean_delay, int_counts;


	{
		uint8_t __iomem *base = ioremap(0xFFFF0000, 0xFFFF);
		base[0] = 0x16;
		
		int i;
		for (i=0; i<0xFFF; i+=0x40) {
			printk(KERN_INFO 
				"\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x"
				"\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x"

				"\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x"
				"\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x"

				"\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x"
				"\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x"

				"\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x"
				"\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x\\x%02x"
				, 
				(int)base[i+0x00], (int)base[i+0x01], (int)base[i+0x02], (int)base[i+0x03],
				(int)base[i+0x04], (int)base[i+0x05], (int)base[i+0x06], (int)base[i+0x07],
				(int)base[i+0x08], (int)base[i+0x09], (int)base[i+0x0a], (int)base[i+0x0b],
				(int)base[i+0x0c], (int)base[i+0x0d], (int)base[i+0x0e], (int)base[i+0x0f],

				(int)base[i+0x10], (int)base[i+0x11], (int)base[i+0x12], (int)base[i+0x13],
				(int)base[i+0x14], (int)base[i+0x15], (int)base[i+0x16], (int)base[i+0x17],
				(int)base[i+0x18], (int)base[i+0x19], (int)base[i+0x1a], (int)base[i+0x1b],
				(int)base[i+0x1c], (int)base[i+0x1d], (int)base[i+0x1e], (int)base[i+0x1f],

				(int)base[i+0x20], (int)base[i+0x21], (int)base[i+0x22], (int)base[i+0x23],
				(int)base[i+0x24], (int)base[i+0x25], (int)base[i+0x26], (int)base[i+0x27],
				(int)base[i+0x28], (int)base[i+0x29], (int)base[i+0x2a], (int)base[i+0x2b],
				(int)base[i+0x2c], (int)base[i+0x2d], (int)base[i+0x2e], (int)base[i+0x2f],

				(int)base[i+0x30], (int)base[i+0x31], (int)base[i+0x32], (int)base[i+0x33],
				(int)base[i+0x34], (int)base[i+0x35], (int)base[i+0x36], (int)base[i+0x37],
				(int)base[i+0x38], (int)base[i+0x39], (int)base[i+0x3a], (int)base[i+0x3b],
				(int)base[i+0x3c], (int)base[i+0x3d], (int)base[i+0x3e], (int)base[i+0x3f]
				 );
		}
	}
	

	arm.timer_baseptr = ioremap(0x01C20C00, 4096);
	arm.gpio_baseptr  = ioremap(0x01C20800, 4096);


	//while (!kthread_should_stop()) {
	t2 = trace_clock_local();
	
	int total_irq = 0;
	int_counts = 0;

	while (polling_thread_should_stop == 0) {

		if (count-- == 0 ) {
			//printk(KERN_INFO "%d %d\n", (int)arm.timer_baseptr[0x18/4], (int)arm.timer_baseptr[0x28/4]);

			preempt_enable_notrace(); // Disable preemption
			local_irq_enable();
			
			total_irq += int_counts;
			
			if (global_count) 
				printk(KERN_INFO "%05d: 10M iterations at mean: %d and max: %d and ints: %d\n", (int)global_count, (int)mean_delay/1024, (int)max_delay, (int)int_counts );
			count = 2000000;
			max_delay = 0;
			mean_delay = 0;
			int_counts = 0;
			t2 = trace_clock_local();
			
			if (global_count++ == 1) break;
		}
		
		if (count == 1500000) {
			local_irq_disable();
			preempt_disable_notrace(); // Disable preemption
			
		}

		if (count == 999999) {


			max_delay = 0;
			mean_delay = 0;
			int_counts = 0;			
		}
		
		t1 = trace_clock_local();
		int delay = t1 - t2;
		if (t1<t2) delay = 0x0FFFFFFF + t1 - t2;
		
		delay = delay * 1000 / 24;
		
		if ( delay > max_delay ) max_delay = delay;
		if ( delay > 250 ) int_counts++;
		mean_delay = (mean_delay * 1023 + 1024*delay) / 1024;
		t2 = t1;
	}
	
	printk(KERN_INFO "Total irq: %d\n", total_irq);
	
	// Wait for the polling interval
	//set_current_state(TASK_INTERRUPTIBLE);
	//schedule_timeout(msecs_to_jiffies(POLL_INTERVAL_MS));
//}

	while(!kthread_should_stop()) { ssleep(8); }

	iounmap(arm.gpio_baseptr);
	iounmap(arm.timer_baseptr);
	
	do_exit(0);
    return 0;
}


static int __init banana_msx_init(void) {
	
    int err = 0;
    
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
    
    
    // Start the polling thread
    polling_thread_should_stop = 0;
    
    if (IS_ERR(polling_thread = kthread_create(poll_gpio, NULL, "polling_thread"))) {
        pr_err("Failed to create polling thread\n");

        device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
		class_destroy(d.class);
		cdev_del(&d.cdev);
		unregister_chrdev_region(d.dev, 1);

        return PTR_ERR(polling_thread);;
    }
    
	kthread_bind(polling_thread, 3);
	wake_up_process(polling_thread);
    
    
    /*if (err = gpio_request(GPIO_PIN, DEVICE_NAME)) {
        printk(KERN_ERR "Failed to request GPIO pin\n");
        cdev_del(&cdev);
        unregister_chrdev_region(dev, 1);
        return err;
    }*/

    printk(KERN_INFO "Banana MSX: initialized\n");

    return 0;
}

static void __exit banana_msx_exit(void)
{
	// Stop the polling thread
	polling_thread_should_stop = 1;
    if (polling_thread) kthread_stop(polling_thread);
	
	device_destroy(d.class, MKDEV(MAJOR(d.dev), MINOR(d.dev)));
	class_destroy(d.class);
	cdev_del(&d.cdev);
	unregister_chrdev_region(d.dev, 1);

    printk(KERN_INFO "Banana MSX: exited\n");
}

module_init(banana_msx_init);
module_exit(banana_msx_exit);

