; ovl16 stub 2fa9 file_off 0x47ab0 size 0x14e

ovl16_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec58           sub sp, 0x58                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  8b760a           mov si, word ptr [bp + 0xa]              
  000b  8b7e0c           mov di, word ptr [bp + 0xc]              
  000e  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0013  837e0e00         cmp word ptr [bp + 0xe], 0               
  0017  7c37             jl 0x50                                  
  0019  8976fe           mov word ptr [bp - 2], si                
  001c  8bc7             mov ax, di                               
  001e  050a00           add ax, 0xa                              
  0021  8946fc           mov word ptr [bp - 4], ax                
  0024  50               push ax                                  
  0025  ff76fe           push word ptr [bp - 2]                   
  0028  16               push ss                                  
  0029  8d46f8           lea ax, [bp - 8]                         
  002c  50               push ax                                  
  002d  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0032  83c408           add sp, 8                                
  0035  66ff76f8         push dword ptr [bp - 8]                  
  0039  b8fe05           mov ax, 0x5fe                            
  003c  8cda             mov dx, ds                               
  003e  b90800           mov cx, 8                                
  0041  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0046  6a1e             push 0x1e                                
  0048  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  004d  83c40e           add sp, 0xe                              
  0050  837e1000         cmp word ptr [bp + 0x10], 0              
  0054  7503             jne 0x59                                 
  0056  e9ec00           jmp 0x145                                
  0059  666800000300     push 0x30000                             
  005f  666802000f00     push 0xf0002                             
  0065  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  006a  83c408           add sp, 8                                
  006d  ff760e           push word ptr [bp + 0xe]                 
  0070  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  0075  59               pop cx                                   
  0076  52               push dx                                  
  0077  50               push ax                                  
  0078  8bc7             mov ax, di                               
  007a  050a00           add ax, 0xa                              
  007d  50               push ax                                  
  007e  8bc6             mov ax, si                               
  0080  03060a06         add ax, word ptr [0x60a]                 
  0084  50               push ax                                  
  0085  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  008a  83c408           add sp, 8                                
  008d  ff7612           push word ptr [bp + 0x12]                
  0090  1e               push ds                                  
  0091  680e06           push 0x60e                                ; "Time: %d"
  0094  16               push ss                                  
  0095  8d46a8           lea ax, [bp - 0x58]                      
  0098  50               push ax                                  
  0099  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  009e  83c40a           add sp, 0xa                              
  00a1  16               push ss                                  
  00a2  8d46a8           lea ax, [bp - 0x58]                      
  00a5  50               push ax                                  
  00a6  8bc7             mov ax, di                               
  00a8  052800           add ax, 0x28                             
  00ab  50               push ax                                  
  00ac  8bc6             mov ax, si                               
  00ae  03060a06         add ax, word ptr [0x60a]                 
  00b2  50               push ax                                  
  00b3  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  00b8  83c408           add sp, 8                                
  00bb  ff7614           push word ptr [bp + 0x14]                
  00be  1e               push ds                                  
  00bf  681706           push 0x617                                ; "Cost: %d"
  00c2  16               push ss                                  
  00c3  8d46a8           lea ax, [bp - 0x58]                      
  00c6  50               push ax                                  
  00c7  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  00cc  83c40a           add sp, 0xa                              
  00cf  16               push ss                                  
  00d0  8d46a8           lea ax, [bp - 0x58]                      
  00d3  50               push ax                                  
  00d4  8bc7             mov ax, di                               
  00d6  053c00           add ax, 0x3c                             
  00d9  50               push ax                                  
  00da  8bc6             mov ax, si                               
  00dc  03060a06         add ax, word ptr [0x60a]                 
  00e0  50               push ax                                  
  00e1  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  00e6  83c408           add sp, 8                                
  00e9  ff7616           push word ptr [bp + 0x16]                
  00ec  1e               push ds                                  
  00ed  682006           push 0x620                                ; "Strength: %d"
  00f0  16               push ss                                  
  00f1  8d46a8           lea ax, [bp - 0x58]                      
  00f4  50               push ax                                  
  00f5  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  00fa  83c40a           add sp, 0xa                              
  00fd  16               push ss                                  
  00fe  8d46a8           lea ax, [bp - 0x58]                      
  0101  50               push ax                                  
  0102  8bc7             mov ax, di                               
  0104  055000           add ax, 0x50                             
  0107  50               push ax                                  
  0108  8bc6             mov ax, si                               
  010a  03060a06         add ax, word ptr [0x60a]                 
  010e  50               push ax                                  
  010f  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0114  83c408           add sp, 8                                
  0117  ff7618           push word ptr [bp + 0x18]                
  011a  1e               push ds                                  
  011b  682d06           push 0x62d                                ; "Move: %d"
  011e  16               push ss                                  
  011f  8d46a8           lea ax, [bp - 0x58]                      
  0122  50               push ax                                  
  0123  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0128  83c40a           add sp, 0xa                              
  012b  16               push ss                                  
  012c  8d46a8           lea ax, [bp - 0x58]                      
  012f  50               push ax                                  
  0130  8bc7             mov ax, di                               
  0132  056400           add ax, 0x64                             
  0135  50               push ax                                  
  0136  8bc6             mov ax, si                               
  0138  03060a06         add ax, word ptr [0x60a]                 
  013c  50               push ax                                  
  013d  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0142  83c408           add sp, 8                                
  0145  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  014a  5f               pop di                                   
  014b  5e               pop si                                   
  014c  c9               leave                                    
  014d  cb               retf                                     
