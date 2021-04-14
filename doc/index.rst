.. _SERAPH_board:

SERAPH L432KC by Materiam
################

Overview
********

The Seraph L432KC is a breakout board for the little but mighty STM32L432KC
ultra low power Cortex M4 MCU. With its three bright RGB leds and user/BOOT0
button, it's been especially designed for learning Zephyr and to be easily
integrated into your projects.

The STM32L432KC shines for its low power consumption, so we chose to power it
with an STLQ020 ultra-low quiescent current LDO power supply that can source up
to 200 mA and consumes a mere 100μA at a 200mA load and only 300 nA at no load!

The USB data lines are ESD protected through the USBLC6-2SC6 from ST. The Vin
voltage input is reverse polarity protected and there is also a 500 mA
resettable fuse to protect the USB/VIN power source from overcurrents.

Last but not least, We have included big, high quality and confortable
buttons for BOOT (white) and RESET (black) functions that go easy on your
fingers and lets you put the SERAPH board on DFU mode quickly without the need
of jumpers or connecting-disconnecting the USB cable.

The STM32 built-in DFU bootloader lets the user program the device without
an external hardware programmer while saving valuable flash memory for user
applications. Not a single kb is wasted on the integrated bootloader. Just press
the user button (BOOT0) while holding RESET in a fast and simple finger movement
and the green led will light indicating DFU mode.


- STM32L432KC MCU in UFQFPN32 package

- Flexible board power supply:

  - USB VBUS or external source(3.3V, 5V, up to 5.5V)
  - Power management access point

- Three LEDs: USB communication (LD1), power LED (LD2), user LED (LD3)
- One push-button: RESET

.. image:: img/seraph.gif
  :width: 250px
  :align: center
  :height: 188px
  :alt: SERAPH L432KC

More information about the board can be found at the `SERAPH website`_.

Hardware
********

The STM32L432KC SoC provides the following hardware IPs:

- Ultra-low-power with FlexPowerControl (down to 28 nA Standby mode and 84
  |micro| A/MHz run mode)
- Core: ARM |reg| 32-bit Cortex |reg| -M4 CPU with FPU, frequency up to 80 MHz,
  100DMIPS/1.25DMIPS/MHz (Dhrystone 2.1)
- Clock Sources:

  - 32 kHz crystal oscillator for RTC (LSE)
  - Internal 16 MHz factory-trimmed RC ( |plusminus| 1%)
  - Internal low-power 32 kHz RC ( |plusminus| 5%)
  - Internal multispeed 100 kHz to 48 MHz oscillator, auto-trimmed by
    LSE (better than |plusminus| 0.25 % accuracy)
  - 2 PLLs for system clock, USB, audio, ADC

- RTC with HW calendar, alarms and calibration
- Up to 3 capacitive sensing channels: support touchkey, linear and rotary touch sensors
- 11x timers:

  - 1x 16-bit advanced motor-control
  - 1x 32-bit and 2x 16-bit general purpose
  - 2x 16-bit basic
  - 2x low-power 16-bit timers (available in Stop mode)
  - 2x watchdogs
  - SysTick timer

- Up to 26 fast I/Os, most 5 V-tolerant
- Memories

  - Up to 256 KB single bank Flash, proprietary code readout protection
  - Up to 64 KB of SRAM including 16 KB with hardware parity check
  - Quad SPI memory interface

- Rich analog peripherals (independent supply)

  - 1x 12-bit ADC 5 MSPS, up to 16-bit with hardware oversampling, 200
    |micro| A/MSPS
  - 2x 12-bit DAC, low-power sample and hold
  - 1x operational amplifiers with built-in PGA
  - 2x ultra-low-power comparators

- 13x communication interfaces

  - USB OTG 2.0 full-speed crystal less solution with LPM and BCD
  - 1x SAIs (serial audio interface)
  - 2x I2C FM+(1 Mbit/s), SMBus/PMBus
  - 3x USARTs (ISO 7816, LIN, IrDA, modem)
  - 2x SPIs (3x SPIs with the Quad SPI)
  - CAN (2.0B Active)
  - SWPMI single wire protocol master I/F
  - IRTIM (Infrared interface)

- 14-channel DMA controller
- True random number generator
- CRC calculation unit, 96-bit unique ID
- Development support: serial wire debug (SWD), JTAG, Embedded Trace Macrocell*


More information about STM32L432KC can be found here:

- `STM32L432KC on www.st.com`_
- `STM32L432 reference manual`_

Supported Features
==================

The Zephyr nucleo_l432kc board configuration supports the following hardware features:

+-----------+------------+-------------------------------------+
| Interface | Controller | Driver/Component                    |
+===========+============+=====================================+
| NVIC      | on-chip    | nested vector interrupt controller  |
+-----------+------------+-------------------------------------+
| UART      | on-chip    | serial port-polling;                |
|           |            | serial port-interrupt               |
+-----------+------------+-------------------------------------+
| PINMUX    | on-chip    | pinmux                              |
+-----------+------------+-------------------------------------+
| GPIO      | on-chip    | gpio                                |
+-----------+------------+-------------------------------------+
| I2C       | on-chip    | i2c                                 |
+-----------+------------+-------------------------------------+
| PWM       | on-chip    | pwm                                 |
+-----------+------------+-------------------------------------+
| CAN       | on-chip    | can                                 |
+-----------+------------+-------------------------------------+

.. note:: CAN feature requires CAN transceiver

Other hardware features are not yet supported on this Zephyr port.

The default configuration can be found in the defconfig file:
``boards/arm/nucleo_l432kc/nucleo_l432kc_defconfig``


Connections and IOs
===================

Nucleo L432KC Board has 6 GPIO controllers. These controllers are responsible for pin muxing,
input/output, pull-up, etc.

Available pins:
---------------
.. image:: img/nucleo_l432kc_arduino_nano.png
   :width: 960px
   :align: center
   :height: 720px
   :alt: Nucleo L432KC Arduino connectors

For mode details please refer to `STM32 Nucleo-32 board User Manual`_.

Default Zephyr Peripheral Mapping:
----------------------------------

- UART_1_TX : PA9
- UART_1_RX : PA10
- UART_2_TX : PA2
- UART_2_RX : PA3
- I2C_1_SCL : PB6
- I2C_1_SDA : PB7
- PWM_2_CH1 : PA0
- LD3 : PB3

System Clock
------------

Nucleo L432KC System Clock could be driven by internal or external oscillator,
as well as main PLL clock. By default System clock is driven by PLL clock at 80MHz,
driven by 16MHz high speed internal oscillator.

Serial Port
-----------

Nucleo L432KC board has 3 U(S)ARTs. The Zephyr console output is assigned to UART2.
Default settings are 115200 8N1.


Programming and Debugging
*************************

Applications for the ``nucleo_l432kc`` board configuration can be built and
flashed in the usual way (see :ref:`build_an_application` and
:ref:`application_run` for more details).

Flashing
========

Nucleo L432KC board includes an ST-LINK/V2-1 embedded debug tool
interface.  This interface is supported by the openocd version
included in the Zephyr SDK since v0.9.2.

Flashing an application to Nucleo L432KC
----------------------------------------

Connect the Nucleo L432KC to your host computer using the USB port,
then run a serial host program to connect with your Nucleo board.

.. code-block:: console

   $ minicom -D /dev/ttyACM0

Now build and flash an application. Here is an example for
:ref:`hello_world`.

.. zephyr-app-commands::
   :zephyr-app: samples/hello_world
   :board: nucleo_l432kc
   :goals: build flash

You should see the following message on the console:

.. code-block:: console

   $ Hello World! arm


Debugging
=========

You can debug an application in the usual way.  Here is an example for the
:ref:`hello_world` application.

.. zephyr-app-commands::
   :zephyr-app: samples/hello_world
   :board: nucleo_l432kc
   :maybe-skip-config:
   :goals: debug

.. _Nucleo L432KC website:
   http://www.st.com/en/evaluation-tools/nucleo-l432kc.html

.. _STM32 Nucleo-32 board User Manual:
   http://www.st.com/resource/en/user_manual/dm00231744.pdf

.. _STM32L432KC on www.st.com:
   http://www.st.com/en/microcontrollers/stm32l432kc.html

.. _STM32L432 reference manual:
   http://www.st.com/resource/en/reference_manual/dm00151940.pdf
