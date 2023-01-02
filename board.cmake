# SPDX-License-Identifier: Apache-2.0

board_runner_args(dfu-util "--pid=0483:df11" "--alt=0" "--dfuse")
#board_runner_args(jlink "--device=STM32L432KC" "--speed=4000" "--reset")
board_runner_args(jlink "--device=stm32l432kc" "--speed=2000" "--reset")
board_runner_args(stm32cubeprogrammer "--port=swd" "--reset=hw")


include(${ZEPHYR_BASE}/boards/common/dfu-util.board.cmake)
include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
include(${ZEPHYR_BASE}/boards/common/stm32cubeprogrammer.board.cmake)
