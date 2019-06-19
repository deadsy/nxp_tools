# nxp_tools
Patches and Bug Fixes to NXP Microcontroller Tools.

NXP provides host tools to create firmware images for their microcontrollers.
As provided there are some bugs which make the tools crash in Linux.
Fortunately NXP provides BSD licensed source code for the tools as a part of the middleware/mcu-boot package within their SDK.
This repo provides some minimal patches on their source code to fix issues with their tools.
Hopefully NXP will merge in these fixes, but in the meantime we all get the goods...

## SDK

 * Based on SDK_2.6.0 (circa June 2019)
 * ./middleware/mcu-boot/tools

## Tools Built

 * elftosb 4.0.0
 * blhost 2.2.0
 * sdphost 1.0.0
