; res_0771 file_off 0x9710

res_0771_0001:  ; ENTRY
  0001  55               push bp                                  
  0002  8bec             mov bp, sp                               
  0004  83ec0c           sub sp, 0xc                              
  0007  c45e06           les bx, ptr [bp + 6]                     
  000a  6626837f0c00     cmp dword ptr es:[bx + 0xc], 0           
  0010  7403             je 0x15                                  
  0012  e99300           jmp 0xa8                                 
  0015  26837f1f00       cmp word ptr es:[bx + 0x1f], 0           
  001a  7f03             jg 0x1f                                  
  001c  e98900           jmp 0xa8                                 
  001f  268a470b         mov al, byte ptr es:[bx + 0xb]           
  0023  b400             mov ah, 0                                
  0025  50               push ax                                  
  0026  268a470a         mov al, byte ptr es:[bx + 0xa]           
  002a  b400             mov ah, 0                                
  002c  50               push ax                                  
  002d  268a4704         mov al, byte ptr es:[bx + 4]             
  0031  b400             mov ah, 0                                
  0033  c1e002           shl ax, 2                                
  0036  03d8             add bx, ax                               
  0038  26ff7715         push word ptr es:[bx + 0x15]             
  003c  8b5e06           mov bx, word ptr [bp + 6]                
  003f  268a4704         mov al, byte ptr es:[bx + 4]             
  0043  b400             mov ah, 0                                
  0045  c1e002           shl ax, 2                                
  0048  03d8             add bx, ax                               
  004a  26ff7713         push word ptr es:[bx + 0x13]             
  004e  16               push ss                                  
  004f  8d46f8           lea ax, [bp - 8]                         
  0052  50               push ax                                  
  0053  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0058  83c40c           add sp, 0xc                              
  005b  c45e06           les bx, ptr [bp + 6]                     
  005e  26ff7708         push word ptr es:[bx + 8]                
  0062  26ff7706         push word ptr es:[bx + 6]                
  0066  16               push ss                                  
  0067  8d46f4           lea ax, [bp - 0xc]                       
  006a  50               push ax                                  
  006b  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0070  83c408           add sp, 8                                
  0073  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0078  66ff76f4         push dword ptr [bp - 0xc]                
  007c  8d46f8           lea ax, [bp - 8]                         
  007f  8cd2             mov dx, ss                               
  0081  b90800           mov cx, 8                                
  0084  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0089  c45e06           les bx, ptr [bp + 6]                     
  008c  26ff771f         push word ptr es:[bx + 0x1f]             
  0090  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0095  83c40e           add sp, 0xe                              
  0098  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  009d  c45e06           les bx, ptr [bp + 6]                     
  00a0  268a4704         mov al, byte ptr es:[bx + 4]             
  00a4  26884712         mov byte ptr es:[bx + 0x12], al          
  00a8  c9               leave                                    
  00a9  cb               retf                                     
  00aa  55               push bp                                  
