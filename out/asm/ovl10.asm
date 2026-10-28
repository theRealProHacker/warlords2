; ovl10 stub 2f8a file_off 0x43c40 size 0x9b

ovl10_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  9a2a008d2f       lcall 0x2f8d, 0x2a                       -> ovl11:0689
  0008  90               nop                                      
  0009  0e               push cs                                  
  000a  e80700           call 0x14                                
  000d  90               nop                                      
  000e  0e               push cs                                  
  000f  e85900           call 0x6b                                
  0012  5d               pop bp                                   
  0013  cb               retf                                     

ovl10_0014:  ; ENTRY
  0014  55               push bp                                  
  0015  8bec             mov bp, sp                               
  0017  83ec02           sub sp, 2                                
  001a  56               push si                                  
  001b  33f6             xor si, si                               
  001d  eb44             jmp 0x63                                 
  001f  66680500ffff     push 0xffff0005                          
  0025  6a01             push 1                                   
  0027  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  002c  83c406           add sp, 6                                
  002f  8946fe           mov word ptr [bp - 2], ax                
  0032  8bc6             mov ax, si                               
  0034  6bc064           imul ax, ax, 0x64                        
  0037  8b168a3f         mov dx, word ptr [0x3f8a]                
  003b  03d0             add dx, ax                               
  003d  8b46fe           mov ax, word ptr [bp - 2]                
  0040  6bc014           imul ax, ax, 0x14                        
  0043  03d0             add dx, ax                               
  0045  81c26407         add dx, 0x764                            
  0049  ff368c3f         push word ptr [0x3f8c]                   
  004d  52               push dx                                  
  004e  8bc6             mov ax, si                               
  0050  6bc014           imul ax, ax, 0x14                        
  0053  050000           add ax, 0                                
  0056  68042c           push 0x2c04                              
  0059  50               push ax                                  
  005a  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  005f  83c408           add sp, 8                                
  0062  46               inc si                                   
  0063  83fe08           cmp si, 8                                
  0066  7cb7             jl 0x1f                                  
  0068  5e               pop si                                   
  0069  c9               leave                                    
  006a  cb               retf                                     

ovl10_006b:  ; ENTRY
  006b  55               push bp                                  
  006c  8bec             mov bp, sp                               
  006e  56               push si                                  
  006f  33f6             xor si, si                               
  0071  eb20             jmp 0x93                                 
  0073  666832001400     push 0x140032                            
  0079  6a03             push 3                                   
  007b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0080  83c406           add sp, 6                                
  0083  8bde             mov bx, si                               
  0085  6bdb14           imul bx, bx, 0x14                        
  0088  ba042c           mov dx, 0x2c04                           
  008b  8ec2             mov es, dx                               
  008d  2689878501       mov word ptr es:[bx + 0x185], ax         
  0092  46               inc si                                   
  0093  83fe08           cmp si, 8                                
  0096  7cdb             jl 0x73                                  
  0098  5e               pop si                                   
  0099  5d               pop bp                                   
  009a  cb               retf                                     
