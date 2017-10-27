/*
 * (C) Copyright 2010,2011
 * Dmitry Konyshev, Emcraft Systems, probables@emcraft.com
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */
#include <common.h>
#include <asm/arch/stm32.h>
#include <asm/arch/stm32f2_gpio.h>
#include <asm/errno.h>

/*
 * STM32 RCC FSMC specific definitions
 */
#define STM32_RCC_ENR_FSMC		(1 << 0)	/* FSMC module clock  */

/*
 * FSMC registers base
 */
#define STM32_FSMC_BASE			0xA0000000
#define STM32_FSMC			((volatile struct stm32_fsmc_regs *) \
					STM32_FSMC_BASE)
/*
 * FSMC NOR/PSRAM controller register map
 */
struct stm32_fsmc_regs {
	struct {
		u32	bcr;		/* Chip-select control		      */
		u32	btr;		/* Chip-select timing		      */
	} cs[4];
	u32	rsv0[57];
	struct {
		u32	bwtr;		/* Write timing			      */
		u32	rsv1;
	} wt[4];
};

/*
 * External SRAM GPIOs for FSMC:
 *
 * D0..D15, A0..A23, NOE, NWE, NBL1/0, CLK, NL, NWAIT
 */
#if 0
static const struct stm32f2_gpio_dsc ext_ram_fsmc_gpio[] = {
	{STM32F2_GPIO_PORT_B, STM32F2_GPIO_PIN_7},

	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_0},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_1},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_3},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_4},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_5},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_6},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_8},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_9},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_10},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_11},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_12},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_13},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_14},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_15},

	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_0},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_1},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_2},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_3},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_4},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_5},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_6},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_7},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_8},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_9},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_10},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_11},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_12},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_13},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_14},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_15},

	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_0},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_1},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_2},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_3},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_4},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_5},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_12},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_13},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_14},
	{STM32F2_GPIO_PORT_F, STM32F2_GPIO_PIN_15},

	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_0},
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_1},
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_2},
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_3},
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_4},
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_5},

#ifdef CONFIG_FSMC_NOR_PSRAM_CS1_ENABLE
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_7},
#endif
#ifdef CONFIG_FSMC_NOR_PSRAM_CS2_ENABLE
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_9},
#endif
#ifdef CONFIG_FSMC_NOR_PSRAM_CS3_ENABLE
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_10},
#endif
#ifdef CONFIG_FSMC_NOR_PSRAM_CS4_ENABLE
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_12},
#endif
};
#else
static const struct stm32f2_gpio_dsc ext_psram_fsmc_fmc_gpio[] = {

	{STM32F2_GPIO_PORT_C, STM32F2_GPIO_PIN_6},
	{STM32F2_GPIO_PORT_C, STM32F2_GPIO_PIN_7},
	{STM32F2_GPIO_PORT_C, STM32F2_GPIO_PIN_8},
	
	{STM32F2_GPIO_PORT_B, STM32F2_GPIO_PIN_7},
	
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_0},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_1},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_3},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_4},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_5},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_8},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_9},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_10},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_11},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_12},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_13},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_14},
	{STM32F2_GPIO_PORT_D, STM32F2_GPIO_PIN_15},
	

	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_0},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_1},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_3},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_4},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_5},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_6},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_7},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_8},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_9},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_10},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_11},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_12},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_13},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_14},
	{STM32F2_GPIO_PORT_E, STM32F2_GPIO_PIN_15},
	
	{STM32F2_GPIO_PORT_G, STM32F2_GPIO_PIN_13},

};

#endif
int fsmc_gpio_init_done = 0;

int fsmc_nor_psram_init(u32 cs, u32 bcr, u32 btr, u32 bwtr)
{
	int rv = 0;

	cs--;

	if (cs > 3)
		return -EINVAL;
    //printf("%s",__func__);

	if (!fsmc_gpio_init_done) {
		int	i;

		/*
		 * Connect GPIOs to FSMC controller
		 */
		#if 0
		for (i = 0; i < ARRAY_SIZE(ext_ram_fsmc_gpio); i++) {
			rv = stm32f2_gpio_config(&ext_ram_fsmc_gpio[i],
					STM32F2_GPIO_ROLE_FSMC);
			if (rv != 0)
				goto out;
		}
        #else
        	for (i = 0; i < ARRAY_SIZE(ext_psram_fsmc_fmc_gpio); i++) {
                if(i<3){
        		    rv = stm32f2_gpio_config(&ext_psram_fsmc_fmc_gpio[i],STM32F2_GPIO_ROLE_FMC_AF9);
                }else{
                    rv = stm32f2_gpio_config(&ext_psram_fsmc_fmc_gpio[i],STM32F2_GPIO_ROLE_FMC);
                }
        		if (rv)
        			goto out;
        	}
        #endif

		fsmc_gpio_init_done = 1;
	}

	/*
	 * Enable FSMC interface clock
	 */
	STM32_RCC->ahb3enr |= STM32_RCC_ENR_FSMC;

	/* Errata 2.1.6 */
	__asm__ __volatile__ ("dsb" : : : "memory");
    #if 0
	/*
	 * Fake BCR read; if don't do this, then BCR remains configured
	 * with defaults.
	 */
	rv = STM32_FSMC->cs[cs].bcr;

	STM32_FSMC->cs[cs].btr = btr;
	if (bwtr != (u32)-1)
		STM32_FSMC->wt[cs].bwtr = bwtr;
	STM32_FSMC->cs[cs].bcr = bcr;
    #else
    STM32_FSMC->cs[0].bcr=0x00001297; STM32_FSMC->cs[0].btr=0x00170835; 
    STM32_FSMC->cs[1].bcr=0x000012db; STM32_FSMC->cs[1].btr=0x301f1022; 
    STM32_FSMC->cs[2].bcr=0x000030d2; STM32_FSMC->cs[2].btr=0x0fffffff; 
    STM32_FSMC->cs[3].bcr=0x000030d2; STM32_FSMC->cs[3].btr=0x0fffffff; 
    STM32_FSMC->rsv0[0] = 0x00000000;
    STM32_FSMC->rsv0[1] = 0x00000000;
    STM32_FSMC->rsv0[2] = 0x00000000;
    STM32_FSMC->rsv0[3] = 0x00000000;
    STM32_FSMC->rsv0[4] = 0x00000000;
    STM32_FSMC->rsv0[5] = 0x00000000;
    STM32_FSMC->rsv0[6] = 0x00000000;
    STM32_FSMC->rsv0[7] = 0x00000000;
    STM32_FSMC->rsv0[8] = 0x00000000;
    STM32_FSMC->rsv0[9] = 0x00000000;
    STM32_FSMC->rsv0[10]= 0x00000000;
    STM32_FSMC->rsv0[11]= 0x00000000;
    STM32_FSMC->rsv0[12]= 0x00000000;
    STM32_FSMC->rsv0[13]= 0x00000000;
    STM32_FSMC->rsv0[14]= 0x00000000;
    STM32_FSMC->rsv0[15]= 0x00000000;
    STM32_FSMC->rsv0[16]= 0x00000000;
    STM32_FSMC->rsv0[17]= 0x00000000;
    STM32_FSMC->rsv0[18]= 0x00000000;
    STM32_FSMC->rsv0[19]= 0x00000000;
    STM32_FSMC->rsv0[20]= 0x00000000;
    STM32_FSMC->rsv0[21]= 0x00000000;
    STM32_FSMC->rsv0[22]= 0x00000000;
    STM32_FSMC->rsv0[23]= 0x00000000;
    STM32_FSMC->rsv0[24]= 0x00000018;
    STM32_FSMC->rsv0[25]= 0x00000040;
    STM32_FSMC->rsv0[26]= 0xfcfcfcfc;
    STM32_FSMC->rsv0[27]= 0xfcfcfcfc;
    STM32_FSMC->rsv0[28]= 0x00000000;
    STM32_FSMC->rsv0[29]= 0x00000000;
    STM32_FSMC->rsv0[30]= 0x00000000;
    STM32_FSMC->rsv0[31]= 0x00000000;
    STM32_FSMC->rsv0[32]= 0x00000000;
    STM32_FSMC->rsv0[33]= 0x00000000;
    STM32_FSMC->rsv0[34]= 0x00000000;
    STM32_FSMC->rsv0[35]= 0x00000000;
    STM32_FSMC->rsv0[36]= 0x00000000;
    STM32_FSMC->rsv0[37]= 0x00000000;
    STM32_FSMC->rsv0[38]= 0x00000000;
    STM32_FSMC->rsv0[39]= 0x00000000;
    STM32_FSMC->rsv0[40]= 0x00000000;
    STM32_FSMC->rsv0[41]= 0x00000000;
    STM32_FSMC->rsv0[42]= 0x00000000;
    STM32_FSMC->rsv0[43]= 0x00000000;
    STM32_FSMC->rsv0[44]= 0x00000000;
    STM32_FSMC->rsv0[45]= 0x00000000;
    STM32_FSMC->rsv0[46]= 0x00000000;
    STM32_FSMC->rsv0[47]= 0x00000000;
    STM32_FSMC->rsv0[48]= 0x00000000;
    STM32_FSMC->rsv0[49]= 0x00000000;
    STM32_FSMC->rsv0[50]= 0x00000000;
    STM32_FSMC->rsv0[51]= 0x00000000;
    STM32_FSMC->rsv0[52]= 0x00000000;
    STM32_FSMC->rsv0[53]= 0x00000000;
    STM32_FSMC->rsv0[54]= 0x00000000;
    STM32_FSMC->rsv0[55]= 0x00000000;
    STM32_FSMC->rsv0[56]= 0x00000000;
    STM32_FSMC->wt[0].bwtr=0x0fffffff; STM32_FSMC->wt[0].rsv1=0x00000000;
    STM32_FSMC->wt[1].bwtr=0x0fffffff; STM32_FSMC->wt[1].rsv1=0x00000000; 
    STM32_FSMC->wt[2].bwtr=0x0fffffff; STM32_FSMC->wt[2].rsv1=0x00000000;
    STM32_FSMC->wt[3].bwtr=0x0fffffff; STM32_FSMC->wt[3].rsv1=0x00000000;
    __asm__ __volatile__ ("dsb" : : : "memory");
    #endif

    #if 0
    {
        uint32_t *fmc=(uint32_t*)STM32_FSMC_BASE;
        printf("\n");
        for(int i=0;i<8;i++){
            printf("fmc[%d]=%08X\n",i,fmc[i]);
        }
        for(int i=0;i<4;i++){
            printf("STM32_FSMC->cs[%d].bcr=%08x ",i,STM32_FSMC->cs[i].bcr);
            printf("STM32_FSMC->cs[%d].btr=%08x \r\n",i,STM32_FSMC->cs[i].btr);
        }

        for(int i=0;i<57;i++){
            printf("STM32_FSMC->rsv0[%d]=%08x\n",i,STM32_FSMC->rsv0[i]);
        }
        
        for(int i=0;i<4;i++){
            printf("STM32_FSMC->wt[%d].bwtr=%08x ",i,STM32_FSMC->wt[i].bwtr);
            printf("STM32_FSMC->wt[%d].rsv1=%08x \r\n",i,STM32_FSMC->wt[i].rsv1);
        }
        
    }
    #endif
	rv = 0;
out:
	return rv;
}


