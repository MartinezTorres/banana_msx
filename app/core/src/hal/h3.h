#pragma once

#include <stdint.h>

#include "os_mmu.h"
#include "log.h"

static constexpr unsigned long long operator ""_K(unsigned long long i) { return        1024 * i; }
static constexpr unsigned long long operator ""_M(unsigned long long i) { return 1024 * 1024 * i; }
extern "C" typedef void (*InitType)(void);

#define Module(name, address, size, other) struct __attribute__((__packed__)) { uint8_t PAD_ ## name[address-64_K]; union { uint8_t name[size]; struct { other; }; }; }
#define STRUCT(...) struct { __VA_ARGS__ };
#define UNION(...) union { __VA_ARGS__ };
#define IO(name, offset) struct __attribute__((__packed__)) { uint8_t PAD_ ## name[offset]; volatile io name;}


union H3_T {

	union io {
		uint32_t DW;
		struct __attribute__((__packed__)) { uint16_t word0, word1; };
		struct __attribute__((__packed__)) { uint8_t byte0, byte1, byte2, byte3; };
		struct __attribute__((__packed__)) { 
			uint8_t bit00 : 1, bit01 : 1, bit02 : 1, bit03 : 1; 
			uint8_t bit04 : 1, bit05 : 1, bit06 : 1, bit07 : 1; 
			uint8_t bit08 : 1, bit09 : 1, bit10 : 1, bit11 : 1; 
			uint8_t bit12 : 1, bit13 : 1, bit14 : 1, bit15 : 1; 
			uint8_t bit16 : 1, bit17 : 1, bit18 : 1, bit19 : 1; 
			uint8_t bit20 : 1, bit21 : 1, bit22 : 1, bit23 : 1; 
			uint8_t bit24 : 1, bit25 : 1, bit26 : 1, bit27 : 1; 
			uint8_t bit28 : 1, bit29 : 1, bit30 : 1, bit31 : 1; 
		};
	};
	
	struct __attribute__((__packed__)) GPIO_PORT {
		enum CFG_E { 
			INPUT = 0,
			OUTPUT = 1,
			F0 = 2,
			F1 = 3,
			F2 = 4,
			F3 = 5,
			DISABLED = 7,
		};
		union {
			uint32_t CFG[4];
			struct __attribute__((__packed__)) { 
				CFG_E cfg00 : 4, cfg01 : 4, cfg02 : 4, cfg03 : 4, cfg04 : 4, cfg05 : 4, cfg06 : 4, cfg07 : 4;
				CFG_E cfg08 : 4, cfg09 : 4, cfg10 : 4, cfg11 : 4, cfg12 : 4, cfg13 : 4, cfg14 : 4, cfg15 : 4;
				CFG_E cfg16 : 4, cfg17 : 4, cfg18 : 4, cfg19 : 4, cfg20 : 4, cfg21 : 4, cfg22 : 4, cfg23 : 4;
				CFG_E cfg24 : 4, cfg25 : 4, cfg26 : 4, cfg27 : 4, cfg28 : 4, cfg29 : 4, cfg30 : 4, cfg31 : 4;
			};
		};
		io DATA;
		enum DRV_E { 
			L0 = 0,
			L1 = 1,
			L2 = 2,
			L3 = 3,
		};
		union {
			uint32_t DRV[2];
			struct __attribute__((__packed__)) { 
				DRV_E drive00 : 2, drive01 : 2, drive02 : 2, drive03 : 2, drive04 : 2, drive05 : 2, drive06 : 2, drive07 : 2;
				DRV_E drive08 : 2, drive09 : 2, drive10 : 2, drive11 : 2, drive12 : 2, drive13 : 2, drive14 : 2, drive15 : 2;
				DRV_E drive16 : 2, drive17 : 2, drive18 : 2, drive19 : 2, drive20 : 2, drive21 : 2, drive22 : 2, drive23 : 2;
				DRV_E drive24 : 2, drive25 : 2, drive26 : 2, drive27 : 2, drive28 : 2, drive29 : 2, drive30 : 2, drive31 : 2;
			};
		};

		enum PULL_E { 
			PULL_DISABLED = 0,
			PULL_UP = 1,
			PULL_DOWN = 2,
		};
		union {
			uint32_t PULL[2];
			struct __attribute__((__packed__)) { 
				PULL_E pull00 : 2, pull01 : 2, pull02 : 2, pull03 : 2, pull04 : 2, pull05 : 2, pull06 : 2, pull07 : 2;
				PULL_E pull08 : 2, pull09 : 2, pull10 : 2, pull11 : 2, pull12 : 2, pull13 : 2, pull14 : 2, pull15 : 2;
				PULL_E pull16 : 2, pull17 : 2, pull18 : 2, pull19 : 2, pull20 : 2, pull21 : 2, pull22 : 2, pull23 : 2;
				PULL_E pull24 : 2, pull25 : 2, pull26 : 2, pull27 : 2, pull28 : 2, pull29 : 2, pull30 : 2, pull31 : 2;
			};
		};
	};
	
	Module( CCU, 0x01C20000, 1_K, UNION (
	
		IO( PLL_CPUX_CTRL_REG, 0x0000); // PLL_CPUX Control Register
		IO( PLL_AUDIO_CTRL_REG, 0x0008); // PLL_AUDIO Control Register
		IO( PLL_VIDEO_CTRL_REG, 0x0010); // PLL_VIDEO Control Register
		IO( PLL_VE_CTRL_REG, 0x0018); // PLL_VE Control Register
		IO( PLL_DDR_CTRL_REG, 0x0020); // PLL_DDR Control Register
		IO( PLL_PERIPH0_CTRL_REG, 0x0028); // PLL_PERIPH0 Control Register
		IO( PLL_GPU_CTRL_REG, 0x0038); // PLL_GPU Control Register
		IO( PLL_PERIPH1_CTRL_REG, 0x0044); // PLL_PERIPH1_CTRL_REG
		IO( PLL_DE_CTRL_REG, 0x0048); // PLL_DE Control Register
		IO( CPUX_AXI_CFG_REG, 0x0050); // CPUX/AXI Configuration Register
		IO( AHB1_APB1_CFG_REG, 0x0054); // AHB1/APB1 Configuration Register
		IO( APB2_CFG_REG, 0x0058); // APB2 Configuration Register
		IO( AHB2_CFG_REG, 0x005CA); // HB2 Configuration Register
		IO( BUS_CLK_GATING_REG0, 0x0060); // Bus Clock Gating Register 0
		IO( BUS_CLK_GATING_REG1, 0x0064); // Bus Clock Gating Register 1
		IO( BUS_CLK_GATING_REG2, 0x0068); // Bus Clock Gating Register 2
		IO( BUS_CLK_GATING_REG3, 0x006C); // Bus Clock Gating Register 3
		IO( BUS_CLK_GATING_REG4, 0x0070); // Bus Clock Gating Register4
		IO( THS_CLK_REG, 0x0074); // THS Clock Register
		IO( NAND_CLK_REG, 0x0080); // NAND Clock Register
		IO( SDMMC0_CLK_REG, 0x0088); // SDMMC0 Clock Register
		IO( SDMMC1_CLK_REG, 0x008C); // SDMMC1 Clock Register
		IO( SDMMC2_CLK_REG, 0x0090); // SDMMC2 Clock Register
		IO( CE_CLK_REG, 0x009C); // CE Clock Register
		IO( SPI0_CLK_REG, 0x00A0); // SPI0 Clock Register
		IO( SPI1_CLK_REG, 0x00A4); // SPI1 Clock Register
		IO( I2S_PCM0_CLK_REG, 0x00B0); // I2S/PCM0 Clock Register
		IO( I2S_PCM1_CLK_REG, 0x00B4); // I2S/PCM1 Clock Register
		IO( I2S_PCM2_CLK_REG, 0x00B8); // I2S/PCM2 Clock Register
		IO( OWA_CLK_REG, 0x00C0); // OWA Clock Register
		IO( USBPHY_CFG_REG, 0x00CC); // USBPHY Configuration Register
		IO( DRAM_CFG_REG, 0x00F4); // DRAM Configuration Register
		IO( MBUS_RST_REG, 0x00FC); // MBUS Reset Register
		IO( DRAM_CLK_GATING_REG, 0x0100); // DRAM Clock Gating Register
		IO( TCON0_CLK_REG, 0x0118); // TCON0 Clock Register
		IO( TVE_CLK_REG, 0x0120); // TVE Clock Register
		IO( DEINTERLACE_CLK_REG, 0x0124); // DEINTERLACE Clock Register
		IO( CSI_MISC_CLK_REG, 0x0130); // CSI_MISC Clock Register
		IO( CSI_CLK_REG, 0x0134); // CSI Clock Register
		IO( VE_CLK_REG, 0x013C); // VE Clock Register
		IO( AC_DIG_CLK_REG, 0x0140); // AC Digital Clock Register
		IO( AVS_CLK_REG, 0x0144); // AVS Clock Register
		IO( HDMI_CLK_REG, 0x0150); // HDMI Clock Register
		IO( HDMI_SLOW_CLK_REG, 0x0154); // HDMI Slow Clock Register
		IO( MBUS_CLK_REG, 0x015C); // MBUS Clock Register
		IO( GPU_CLK_REG, 0x01A0); // GPU Clock Register
		IO( PLL_STABLE_TIME_REG0, 0x0200); // PLL Stable Time Register 0
		IO( PLL_STABLE_TIME_REG1, 0x0204); // PLL Stable Time Register 1
		IO( PLL_CPUX_BIAS_REG, 0x0220); // PLL_CPUX Bias Register
		IO( PLL_AUDIO_BIAS_REG, 0x0224); // PLL_AUDIO Bias Register
		IO( PLL_VIDEO_BIAS_REG, 0x0228); // PLL_VIDEO Bias Register
		IO( PLL_VE_BIAS_REG, 0x022C); // PLL_VE Bias Register
		IO( PLL_DDR_BIAS_REG, 0x0230); // PLL_DDR Bias Register
		IO( PLL_PERIPH0_BIAS_REG, 0x0234); // PLL_PERIPH0 Bias Register
		IO( PLL_GPU_BIAS_REG, 0x023C); // PLL_GPU Bias Register
		IO( PLL_PERIPH1_BIAS_REG, 0x0244); // PLL_PERIPH1 Bias Register
		IO( PLL_DE_BIAS_REG, 0x0248); // PLL_DE Bias Register
		IO( PLL_CPUX_TUN_REG, 0x0250); // PLL_CPUX Tuning Register
		IO( PLL_DDR_TUN_REG, 0x0260); // PLL_DDR Tuning Register
		IO( PLL_CPUX_PAT_CTRL_REG, 0x0280); // PLL_CPUX Pattern Control Register
		IO( PLL_AUDIO_PAT_CTRL_REG0, 0x0284); // PLL_AUDIO Pattern Control Register
		IO( PLL_VIDEO_PAT_CTRL_REG0, 0x0288); // PLL_VIDEO Pattern Control Register
		IO( PLL_VE_PAT_CTRL_REG, 0x028C); // PLL_VE Pattern Control Register
		IO( PLL_DDR_PAT_CTRL_REG0, 0x0290); // PLL_DDR Pattern Control Register
		IO( PLL_GPU_PAT_CTRL_REG, 0x029C); // PLL_GPU Pattern Control Register
		IO( PLL_PERIPH1_PAT_CTRL_REG1, 0x02A4); // PLL_PERIPH1 Pattern Control Register
		IO( PLL_DE_PAT_CTRL_REG, 0x02A8); // PLL_DE Pattern Control Register
		IO( BUS_SOFT_RST_REG0, 0x02C0); // Bus Software Reset Register 0
		IO( BUS_SOFT_RST_REG1, 0x02C4); // Bus Software Reset Register 1
		IO( BUS_SOFT_RST_REG2, 0x02C8); // Bus Software Reset Register 2
		IO( BUS_SOFT_RST_REG3, 0x02D0); // Bus Software Reset Register 3
		IO( BUS_SOFT_RST_REG4, 0x02D8); // Bus Software Reset Register 4
		IO( CCU_SEC_SWITCH_REG, 0x02F0); // CCU Security Switch Register
		IO( PS_CTRL_REG, 0x0300); // PS Control Register
		IO( PS_CNT_REG, 0x0304); // PS Counter Register
	) );
	
	Module( CPUCFG, 0x01F01C00, 1_K, UNION (
		IO( CPUS_RST_CTRL_REG, 0x0000); // CPUS reset control register

		IO( CPU0_RST_CTRL, 0x0040); 
		IO( CPU0_CTRL_REG, 0x0044); 
		IO( CPU0_STATUS_REG, 0x0048);

		IO( CPU3_RST_CTRL, 0x0100); 
		IO( CPU3_CTRL_REG, 0x0104); 
		IO( CPU3_STATUS_REG, 0x0108);

		IO( CPU_SYS_RST_REG, 0x0140); // CPU System Reset Register
		IO( CPU_CLK_GATING_REG, 0x0144); // CPU clock gating Register
		IO( GENER_CTRL_REG, 0x0184); // General Control Register
		IO( SUP_STAN_FLAG_REG, 0x01A0); // Super Standby Flag Register
	) );

	
	
	
	Module( IO_TIMER, 0x01C20C00, 1_K, UNION (
		IO( TMR_IRQ_EN_REG, 0x00 ); // Timer IRQ Enable Register
		IO( TMR_IRQ_STA_REG, 0x04 ); // Timer Status Register
		IO( TMR0_CTRL_REG, 0x10 ); // Timer 0 Control Register
		IO( TMR0_INTV_VALUE_REG, 0x14 ); // Timer 0 Interval Value Register
		IO( TMR0_CUR_VALUE_REG, 0x18 ); // Timer 0 Current Value Register
		IO( TMR1_CTRL_REG, 0x20 ); // Timer 1 Control Register
		IO( TMR1_INTV_VALUE_REG, 0x24 ); // Timer 1 Interval Value Register
		IO( TMR1_CUR_VALUE_REG, 0x28 ); // Timer 1 Current Value Register
		IO( AVS_CNT_CTL_REG, 0x80 ); // AVS Control Register
		IO( AVS_CNT0_REG, 0x84 ); // AVS Counter 0 Register
		IO( AVS_CNT1_REG, 0x88 ); // AVS Counter 1 Register
		IO( AVS_CNT_DIV_REG, 0x8C ); // AVS Divisor Register
	) );
	
	Module( PIO, 0x01C20800, 1_K, STRUCT(
		volatile GPIO_PORT PA, PB, PC, PD, PE, PF, PG, PL;
	) );	

	Module( RAM, 0x58000000, 128_M, STRUCT(
		
		union {
			uint8_t blockA[16_M];
			struct {
				InitType init;
				uint8_t stack[2_M - 4];
				uint8_t program[1_M];
				Log<20> log;
			};
		};

		union {
			uint8_t blockB[16_M];
		};

		union {
			uint8_t blockC[16_M];
		};
		
		union {
			uint8_t blockD[16_M];
		};		
	));
};

static H3_T &H3 = *(H3_T *)64_K; // you can't assign the address zero, as it is UB.



