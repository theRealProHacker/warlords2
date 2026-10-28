; res_0709 file_off 0x9090

res_0709_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  8b560a           mov dx, word ptr [bp + 0xa]              
  0006  8b5e0c           mov bx, word ptr [bp + 0xc]              
  0009  1e               push ds                                  
  000a  688c04           push 0x48c                               
  000d  53               push bx                                  
  000e  52               push dx                                  
  000f  66ff7606         push dword ptr [bp + 6]                  
  0013  9a0a00bf12       lcall 0x12bf, 0xa                        -> 12bf:000a
  0018  83c40c           add sp, 0xc                              
  001b  6a00             push 0                                   
  001d  9a2b00bf12       lcall 0x12bf, 0x2b                       -> 12bf:002b
  0022  59               pop cx                                   
  0023  5d               pop bp                                   
  0024  cb               retf                                     
  0025  00               db 00                                    
