; ovl35 stub 301d file_off 0x5ad40 size 0xf6c

ovl35_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec64           sub sp, 0x64                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  b8042c           mov ax, 0x2c04                           
  000b  8ec0             mov es, ax                               
  000d  26a10f08         mov ax, word ptr es:[0x80f]              
  0011  d1e0             shl ax, 1                                
  0013  bb0a00           mov bx, 0xa                              
  0016  99               cdq                                      
  0017  f7fb             idiv bx                                  
  0019  8946f8           mov word ptr [bp - 8], ax                
  001c  c746f60400       mov word ptr [bp - 0xa], 4               
  0021  c746f40300       mov word ptr [bp - 0xc], 3               
  0026  c746f20200       mov word ptr [bp - 0xe], 2               
  002b  c746f00300       mov word ptr [bp - 0x10], 3              
  0030  c746ee0500       mov word ptr [bp - 0x12], 5              
  0035  c746ec0300       mov word ptr [bp - 0x14], 3              
  003a  90               nop                                      
  003b  0e               push cs                                  
  003c  e8df08           call 0x91e                               
  003f  ff76f8           push word ptr [bp - 8]                   
  0042  90               nop                                      
  0043  0e               push cs                                  
  0044  e8a804           call 0x4ef                               
  0047  59               pop cx                                   
  0048  666803000100     push 0x10003                             
  004e  6a02             push 2                                   
  0050  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0055  83c406           add sp, 6                                
  0058  8bd0             mov dx, ax                               
  005a  3b56f8           cmp dx, word ptr [bp - 8]                
  005d  7d02             jge 0x61                                 
  005f  eb03             jmp 0x64                                 
  0061  8b46f8           mov ax, word ptr [bp - 8]                
  0064  8946fa           mov word ptr [bp - 6], ax                
  0067  c746fe0000       mov word ptr [bp - 2], 0                 
  006c  eb67             jmp 0xd5                                 
  006e  8b5efe           mov bx, word ptr [bp - 2]                
  0071  6bdb1f           imul bx, bx, 0x1f                        
  0074  b8042c           mov ax, 0x2c04                           
  0077  8ec0             mov es, ax                               
  0079  268b9f1308       mov bx, word ptr es:[bx + 0x813]         
  007e  69dbe000         imul bx, bx, 0xe0                        
  0082  8b76fe           mov si, word ptr [bp - 2]                
  0085  6bf61f           imul si, si, 0x1f                        
  0088  b8042c           mov ax, 0x2c04                           
  008b  8ec0             mov es, ax                               
  008d  268b841108       mov ax, word ptr es:[si + 0x811]         
  0092  d1e0             shl ax, 1                                
  0094  03d8             add bx, ax                               
  0096  b81d1e           mov ax, 0x1e1d                           
  0099  8ec0             mov es, ax                               
  009b  2680a70100bf     and byte ptr es:[bx + 1], 0xbf           
  00a1  8b5efe           mov bx, word ptr [bp - 2]                
  00a4  d1e3             shl bx, 1                                
  00a6  8d469c           lea ax, [bp - 0x64]                      
  00a9  03d8             add bx, ax                               
  00ab  36c7070000       mov word ptr ss:[bx], 0                  
  00b0  8b5efe           mov bx, word ptr [bp - 2]                
  00b3  6bdb1f           imul bx, bx, 0x1f                        
  00b6  b8042c           mov ax, 0x2c04                           
  00b9  8ec0             mov es, ax                               
  00bb  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  00c1  750f             jne 0xd2                                 
  00c3  8b5efe           mov bx, word ptr [bp - 2]                
  00c6  d1e3             shl bx, 1                                
  00c8  8d469c           lea ax, [bp - 0x64]                      
  00cb  03d8             add bx, ax                               
  00cd  36c7070100       mov word ptr ss:[bx], 1                  
  00d2  ff46fe           inc word ptr [bp - 2]                    
  00d5  b8042c           mov ax, 0x2c04                           
  00d8  8ec0             mov es, ax                               
  00da  26a10f08         mov ax, word ptr es:[0x80f]              
  00de  3b46fe           cmp ax, word ptr [bp - 2]                
  00e1  7f8b             jg 0x6e                                  
  00e3  b8042c           mov ax, 0x2c04                           
  00e6  8ec0             mov es, ax                               
  00e8  26a10f08         mov ax, word ptr es:[0x80f]              
  00ec  8946fe           mov word ptr [bp - 2], ax                
  00ef  eb12             jmp 0x103                                
  00f1  8b5efe           mov bx, word ptr [bp - 2]                
  00f4  d1e3             shl bx, 1                                
  00f6  8d469c           lea ax, [bp - 0x64]                      
  00f9  03d8             add bx, ax                               
  00fb  36c7070100       mov word ptr ss:[bx], 1                  
  0100  ff46fe           inc word ptr [bp - 2]                    
  0103  837efe28         cmp word ptr [bp - 2], 0x28              
  0107  7ce8             jl 0xf1                                  
  0109  66680500fdff     push 0xfffd0005                          
  010f  6a01             push 1                                   
  0111  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0116  83c406           add sp, 6                                
  0119  ba042c           mov dx, 0x2c04                           
  011c  8ec2             mov es, dx                               
  011e  50               push ax                                  
  011f  26a10f08         mov ax, word ptr es:[0x80f]              
  0123  bb0300           mov bx, 3                                
  0126  99               cdq                                      
  0127  f7fb             idiv bx                                  
  0129  5a               pop dx                                   
  012a  03c2             add ax, dx                               
  012c  050800           add ax, 8                                
  012f  8bf0             mov si, ax                               
  0131  83fe16           cmp si, 0x16                             
  0134  7e03             jle 0x139                                
  0136  be1600           mov si, 0x16                             
  0139  c746fe0800       mov word ptr [bp - 2], 8                 
  013e  e91c01           jmp 0x25d                                
  0141  8b46fa           mov ax, word ptr [bp - 6]                
  0144  050800           add ax, 8                                
  0147  3b46fe           cmp ax, word ptr [bp - 2]                
  014a  7f1f             jg 0x16b                                 
  014c  8b46f8           mov ax, word ptr [bp - 8]                
  014f  050800           add ax, 8                                
  0152  3b46fe           cmp ax, word ptr [bp - 2]                
  0155  7e14             jle 0x16b                                
  0157  8b5efe           mov bx, word ptr [bp - 2]                
  015a  6bdb1d           imul bx, bx, 0x1d                        
  015d  b8042c           mov ax, 0x2c04                           
  0160  8ec0             mov es, ax                               
  0162  26c687ff0c00     mov byte ptr es:[bx + 0xcff], 0          
  0168  e9ef00           jmp 0x25a                                
  016b  c746fc0000       mov word ptr [bp - 4], 0                 
  0170  e99b00           jmp 0x20e                                
  0173  6aff             push -1                                  
  0175  b8042c           mov ax, 0x2c04                           
  0178  8ec0             mov es, ax                               
  017a  26ff360f08       push word ptr es:[0x80f]                 
  017f  6a01             push 1                                   
  0181  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0186  83c406           add sp, 6                                
  0189  8bf8             mov di, ax                               
  018b  8b46fe           mov ax, word ptr [bp - 2]                
  018e  6bc01d           imul ax, ax, 0x1d                        
  0191  ba042c           mov dx, 0x2c04                           
  0194  05e90c           add ax, 0xce9                            
  0197  b91e00           mov cx, 0x1e                             
  019a  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  019f  90               nop                                      
  01a0  0e               push cs                                  
  01a1  e85007           call 0x8f4                               
  01a4  83c41e           add sp, 0x1e                             
  01a7  0bc0             or ax, ax                                
  01a9  7412             je 0x1bd                                 
  01ab  8bdf             mov bx, di                               
  01ad  6bdb1f           imul bx, bx, 0x1f                        
  01b0  b8042c           mov ax, 0x2c04                           
  01b3  8ec0             mov es, ax                               
  01b5  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  01bb  7451             je 0x20e                                 
  01bd  8b46fe           mov ax, word ptr [bp - 2]                
  01c0  6bc01d           imul ax, ax, 0x1d                        
  01c3  ba042c           mov dx, 0x2c04                           
  01c6  05e90c           add ax, 0xce9                            
  01c9  b91e00           mov cx, 0x1e                             
  01cc  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  01d1  90               nop                                      
  01d2  0e               push cs                                  
  01d3  e81e07           call 0x8f4                               
  01d6  83c41e           add sp, 0x1e                             
  01d9  0bc0             or ax, ax                                
  01db  7512             jne 0x1ef                                
  01dd  8bdf             mov bx, di                               
  01df  6bdb1f           imul bx, bx, 0x1f                        
  01e2  b8042c           mov ax, 0x2c04                           
  01e5  8ec0             mov es, ax                               
  01e7  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  01ed  751f             jne 0x20e                                
  01ef  8bdf             mov bx, di                               
  01f1  d1e3             shl bx, 1                                
  01f3  8d469c           lea ax, [bp - 0x64]                      
  01f6  03d8             add bx, ax                               
  01f8  36833f00         cmp word ptr ss:[bx], 0                  
  01fc  7510             jne 0x20e                                
  01fe  c746fc0100       mov word ptr [bp - 4], 1                 
  0203  8bdf             mov bx, di                               
  0205  d1e3             shl bx, 1                                
  0207  03d8             add bx, ax                               
  0209  36c7070100       mov word ptr ss:[bx], 1                  
  020e  837efc00         cmp word ptr [bp - 4], 0                 
  0212  7503             jne 0x217                                
  0214  e95cff           jmp 0x173                                
  0217  8b5efe           mov bx, word ptr [bp - 2]                
  021a  6bdb1d           imul bx, bx, 0x1d                        
  021d  b8042c           mov ax, 0x2c04                           
  0220  8ec0             mov es, ax                               
  0222  26c687ff0c02     mov byte ptr es:[bx + 0xcff], 2          
  0228  8b5efe           mov bx, word ptr [bp - 2]                
  022b  6bdb1d           imul bx, bx, 0x1d                        
  022e  b8042c           mov ax, 0x2c04                           
  0231  8ec0             mov es, ax                               
  0233  2689bf000d       mov word ptr es:[bx + 0xd00], di         
  0238  8bdf             mov bx, di                               
  023a  6bdb1f           imul bx, bx, 0x1f                        
  023d  b8042c           mov ax, 0x2c04                           
  0240  8ec0             mov es, ax                               
  0242  26c687290802     mov byte ptr es:[bx + 0x829], 2          
  0248  8bdf             mov bx, di                               
  024a  6bdb1f           imul bx, bx, 0x1f                        
  024d  b8042c           mov ax, 0x2c04                           
  0250  8a56fe           mov dl, byte ptr [bp - 2]                
  0253  8ec0             mov es, ax                               
  0255  2688972a08       mov byte ptr es:[bx + 0x82a], dl         
  025a  ff46fe           inc word ptr [bp - 2]                    
  025d  3976fe           cmp word ptr [bp - 2], si                
  0260  7d03             jge 0x265                                
  0262  e9dcfe           jmp 0x141                                
  0265  8976fe           mov word ptr [bp - 2], si                
  0268  eb14             jmp 0x27e                                
  026a  8b5efe           mov bx, word ptr [bp - 2]                
  026d  6bdb1d           imul bx, bx, 0x1d                        
  0270  b8042c           mov ax, 0x2c04                           
  0273  8ec0             mov es, ax                               
  0275  26c687ff0c00     mov byte ptr es:[bx + 0xcff], 0          
  027b  ff46fe           inc word ptr [bp - 2]                    
  027e  837efe16         cmp word ptr [bp - 2], 0x16              
  0282  7ce6             jl 0x26a                                 
  0284  c746fe0000       mov word ptr [bp - 2], 0                 
  0289  e90e01           jmp 0x39a                                
  028c  8b5efe           mov bx, word ptr [bp - 2]                
  028f  d1e3             shl bx, 1                                
  0291  8d469c           lea ax, [bp - 0x64]                      
  0294  03d8             add bx, ax                               
  0296  36833f00         cmp word ptr ss:[bx], 0                  
  029a  7403             je 0x29f                                 
  029c  e9f800           jmp 0x397                                
  029f  8b5efe           mov bx, word ptr [bp - 2]                
  02a2  6bdb1f           imul bx, bx, 0x1f                        
  02a5  b8042c           mov ax, 0x2c04                           
  02a8  8ec0             mov es, ax                               
  02aa  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  02b0  7418             je 0x2ca                                 
  02b2  6aff             push -1                                  
  02b4  ff76f0           push word ptr [bp - 0x10]                
  02b7  6a01             push 1                                   
  02b9  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  02be  83c406           add sp, 6                                
  02c1  8bd8             mov bx, ax                               
  02c3  8a87a40c         mov al, byte ptr [bx + 0xca4]            
  02c7  e99d00           jmp 0x367                                
  02ca  bf0100           mov di, 1                                
  02cd  33f6             xor si, si                               
  02cf  eb61             jmp 0x332                                
  02d1  8bde             mov bx, si                               
  02d3  d1e3             shl bx, 1                                
  02d5  b8042c           mov ax, 0x2c04                           
  02d8  8ec0             mov es, ax                               
  02da  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  02e0  744f             je 0x331                                 
  02e2  8b5efe           mov bx, word ptr [bp - 2]                
  02e5  6bdb1f           imul bx, bx, 0x1f                        
  02e8  b8042c           mov ax, 0x2c04                           
  02eb  8ec0             mov es, ax                               
  02ed  26ffb71308       push word ptr es:[bx + 0x813]            
  02f2  8b5efe           mov bx, word ptr [bp - 2]                
  02f5  6bdb1f           imul bx, bx, 0x1f                        
  02f8  b8042c           mov ax, 0x2c04                           
  02fb  8ec0             mov es, ax                               
  02fd  26ffb71108       push word ptr es:[bx + 0x811]            
  0302  8bde             mov bx, si                               
  0304  6bdb14           imul bx, bx, 0x14                        
  0307  b8042c           mov ax, 0x2c04                           
  030a  8ec0             mov es, ax                               
  030c  26ffb78b01       push word ptr es:[bx + 0x18b]            
  0311  8bde             mov bx, si                               
  0313  6bdb14           imul bx, bx, 0x14                        
  0316  b8042c           mov ax, 0x2c04                           
  0319  8ec0             mov es, ax                               
  031b  26ffb78901       push word ptr es:[bx + 0x189]            
  0320  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0325  83c408           add sp, 8                                
  0328  3d0e00           cmp ax, 0xe                              
  032b  7f04             jg 0x331                                 
  032d  33ff             xor di, di                               
  032f  eb06             jmp 0x337                                
  0331  46               inc si                                   
  0332  83fe08           cmp si, 8                                
  0335  7c9a             jl 0x2d1                                 
  0337  0bff             or di, di                                
  0339  7417             je 0x352                                 
  033b  6aff             push -1                                  
  033d  ff76ee           push word ptr [bp - 0x12]                
  0340  6a01             push 1                                   
  0342  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0347  83c406           add sp, 6                                
  034a  8bd8             mov bx, ax                               
  034c  8a87a70c         mov al, byte ptr [bx + 0xca7]            
  0350  eb15             jmp 0x367                                
  0352  6aff             push -1                                  
  0354  ff76ec           push word ptr [bp - 0x14]                
  0357  6a01             push 1                                   
  0359  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  035e  83c406           add sp, 6                                
  0361  8bd8             mov bx, ax                               
  0363  8a87ac0c         mov al, byte ptr [bx + 0xcac]            
  0367  8b5efe           mov bx, word ptr [bp - 2]                
  036a  6bdb1f           imul bx, bx, 0x1f                        
  036d  ba042c           mov dx, 0x2c04                           
  0370  8ec2             mov es, dx                               
  0372  2688872908       mov byte ptr es:[bx + 0x829], al         
  0377  8b5efe           mov bx, word ptr [bp - 2]                
  037a  6bdb1f           imul bx, bx, 0x1f                        
  037d  b8042c           mov ax, 0x2c04                           
  0380  8ec0             mov es, ax                               
  0382  26c6872a0800     mov byte ptr es:[bx + 0x82a], 0          
  0388  8b5efe           mov bx, word ptr [bp - 2]                
  038b  d1e3             shl bx, 1                                
  038d  8d469c           lea ax, [bp - 0x64]                      
  0390  03d8             add bx, ax                               
  0392  36c7070100       mov word ptr ss:[bx], 1                  
  0397  ff46fe           inc word ptr [bp - 2]                    
  039a  b8042c           mov ax, 0x2c04                           
  039d  8ec0             mov es, ax                               
  039f  26a10f08         mov ax, word ptr es:[0x80f]              
  03a3  3b46fe           cmp ax, word ptr [bp - 2]                
  03a6  7e03             jle 0x3ab                                
  03a8  e9e1fe           jmp 0x28c                                
  03ab  c746fe0000       mov word ptr [bp - 2], 0                 
  03b0  e92701           jmp 0x4da                                
  03b3  8b5efe           mov bx, word ptr [bp - 2]                
  03b6  6bdb1f           imul bx, bx, 0x1f                        
  03b9  b8042c           mov ax, 0x2c04                           
  03bc  8ec0             mov es, ax                               
  03be  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  03c4  7514             jne 0x3da                                
  03c6  8b5efe           mov bx, word ptr [bp - 2]                
  03c9  6bdb1f           imul bx, bx, 0x1f                        
  03cc  b8042c           mov ax, 0x2c04                           
  03cf  8ec0             mov es, ax                               
  03d1  26c6872b0800     mov byte ptr es:[bx + 0x82b], 0          
  03d7  e9fd00           jmp 0x4d7                                
  03da  8b5efe           mov bx, word ptr [bp - 2]                
  03dd  6bdb1f           imul bx, bx, 0x1f                        
  03e0  b8042c           mov ax, 0x2c04                           
  03e3  8ec0             mov es, ax                               
  03e5  2680bf290805     cmp byte ptr es:[bx + 0x829], 5          
  03eb  7403             je 0x3f0                                 
  03ed  e9ca00           jmp 0x4ba                                
  03f0  8b5efe           mov bx, word ptr [bp - 2]                
  03f3  6bdb1f           imul bx, bx, 0x1f                        
  03f6  b8042c           mov ax, 0x2c04                           
  03f9  8ec0             mov es, ax                               
  03fb  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  0401  7418             je 0x41b                                 
  0403  6aff             push -1                                  
  0405  ff76f6           push word ptr [bp - 0xa]                 
  0408  6a01             push 1                                   
  040a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  040f  83c406           add sp, 6                                
  0412  8bd8             mov bx, ax                               
  0414  8a879a0c         mov al, byte ptr [bx + 0xc9a]            
  0418  e9ac00           jmp 0x4c7                                
  041b  bf0100           mov di, 1                                
  041e  33f6             xor si, si                               
  0420  eb61             jmp 0x483                                
  0422  8bde             mov bx, si                               
  0424  d1e3             shl bx, 1                                
  0426  b8042c           mov ax, 0x2c04                           
  0429  8ec0             mov es, ax                               
  042b  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0431  744f             je 0x482                                 
  0433  8b5efe           mov bx, word ptr [bp - 2]                
  0436  6bdb1f           imul bx, bx, 0x1f                        
  0439  b8042c           mov ax, 0x2c04                           
  043c  8ec0             mov es, ax                               
  043e  26ffb71308       push word ptr es:[bx + 0x813]            
  0443  8b5efe           mov bx, word ptr [bp - 2]                
  0446  6bdb1f           imul bx, bx, 0x1f                        
  0449  b8042c           mov ax, 0x2c04                           
  044c  8ec0             mov es, ax                               
  044e  26ffb71108       push word ptr es:[bx + 0x811]            
  0453  8bde             mov bx, si                               
  0455  6bdb14           imul bx, bx, 0x14                        
  0458  b8042c           mov ax, 0x2c04                           
  045b  8ec0             mov es, ax                               
  045d  26ffb78b01       push word ptr es:[bx + 0x18b]            
  0462  8bde             mov bx, si                               
  0464  6bdb14           imul bx, bx, 0x14                        
  0467  b8042c           mov ax, 0x2c04                           
  046a  8ec0             mov es, ax                               
  046c  26ffb78901       push word ptr es:[bx + 0x189]            
  0471  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0476  83c408           add sp, 8                                
  0479  3d0e00           cmp ax, 0xe                              
  047c  7f04             jg 0x482                                 
  047e  33ff             xor di, di                               
  0480  eb06             jmp 0x488                                
  0482  46               inc si                                   
  0483  83fe08           cmp si, 8                                
  0486  7c9a             jl 0x422                                 
  0488  0bff             or di, di                                
  048a  7417             je 0x4a3                                 
  048c  6aff             push -1                                  
  048e  ff76f4           push word ptr [bp - 0xc]                 
  0491  6a01             push 1                                   
  0493  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0498  83c406           add sp, 6                                
  049b  8bd8             mov bx, ax                               
  049d  8a879e0c         mov al, byte ptr [bx + 0xc9e]            
  04a1  eb24             jmp 0x4c7                                
  04a3  6aff             push -1                                  
  04a5  ff76f2           push word ptr [bp - 0xe]                 
  04a8  6a01             push 1                                   
  04aa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04af  83c406           add sp, 6                                
  04b2  8bd8             mov bx, ax                               
  04b4  8a87a20c         mov al, byte ptr [bx + 0xca2]            
  04b8  eb0d             jmp 0x4c7                                
  04ba  666a09           push 9                                   
  04bd  6a01             push 1                                   
  04bf  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04c4  83c406           add sp, 6                                
  04c7  8b5efe           mov bx, word ptr [bp - 2]                
  04ca  6bdb1f           imul bx, bx, 0x1f                        
  04cd  ba042c           mov dx, 0x2c04                           
  04d0  8ec2             mov es, dx                               
  04d2  2688872b08       mov byte ptr es:[bx + 0x82b], al         
  04d7  ff46fe           inc word ptr [bp - 2]                    
  04da  b8042c           mov ax, 0x2c04                           
  04dd  8ec0             mov es, ax                               
  04df  26a10f08         mov ax, word ptr es:[0x80f]              
  04e3  3b46fe           cmp ax, word ptr [bp - 2]                
  04e6  7e03             jle 0x4eb                                
  04e8  e9c8fe           jmp 0x3b3                                
  04eb  5f               pop di                                   
  04ec  5e               pop si                                   
  04ed  c9               leave                                    
  04ee  cb               retf                                     

ovl35_04ef:  ; ENTRY
  04ef  55               push bp                                  
  04f0  8bec             mov bp, sp                               
  04f2  81ec3006         sub sp, 0x630                            
  04f6  56               push si                                  
  04f7  57               push di                                  
  04f8  1e               push ds                                  
  04f9  68785d           push 0x5d78                              
  04fc  1e               push ds                                  
  04fd  68a05d           push 0x5da0                              
  0500  1e               push ds                                  
  0501  68af0c           push 0xcaf                                ; "%s\%s.itm"
  0504  16               push ss                                  
  0505  8d46a6           lea ax, [bp - 0x5a]                      
  0508  50               push ax                                  
  0509  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  050e  83c410           add sp, 0x10                             
  0511  6a02             push 2                                   
  0513  16               push ss                                  
  0514  8d46a6           lea ax, [bp - 0x5a]                      
  0517  50               push ax                                  
  0518  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  051d  83c406           add sp, 6                                
  0520  8946fe           mov word ptr [bp - 2], ax                
  0523  837efe00         cmp word ptr [bp - 2], 0                 
  0527  7d03             jge 0x52c                                
  0529  e99f02           jmp 0x7cb                                
  052c  6a02             push 2                                   
  052e  16               push ss                                  
  052f  8d46a6           lea ax, [bp - 0x5a]                      
  0532  50               push ax                                  
  0533  ff76fe           push word ptr [bp - 2]                   
  0536  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  053b  83c408           add sp, 8                                
  053e  c646a800         mov byte ptr [bp - 0x58], 0              
  0542  16               push ss                                  
  0543  8d46fa           lea ax, [bp - 6]                         
  0546  50               push ax                                  
  0547  1e               push ds                                  
  0548  68b90c           push 0xcb9                               
  054b  16               push ss                                  
  054c  8d46a6           lea ax, [bp - 0x5a]                      
  054f  50               push ax                                  
  0550  9aba490000       lcall 0, 0x49ba                          -> 0000:49ba
  0555  83c40c           add sp, 0xc                              
  0558  6a02             push 2                                   
  055a  16               push ss                                  
  055b  8d46a6           lea ax, [bp - 0x5a]                      
  055e  50               push ax                                  
  055f  ff76fe           push word ptr [bp - 2]                   
  0562  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0567  83c408           add sp, 8                                
  056a  33f6             xor si, si                               
  056c  e90801           jmp 0x677                                
  056f  6a14             push 0x14                                
  0571  16               push ss                                  
  0572  8bc6             mov ax, si                               
  0574  6bc01d           imul ax, ax, 0x1d                        
  0577  8d96d0f9         lea dx, [bp - 0x630]                     
  057b  03c2             add ax, dx                               
  057d  50               push ax                                  
  057e  ff76fe           push word ptr [bp - 2]                   
  0581  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0586  83c408           add sp, 8                                
  0589  8bde             mov bx, si                               
  058b  6bdb1d           imul bx, bx, 0x1d                        
  058e  8d86e3f9         lea ax, [bp - 0x61d]                     
  0592  03d8             add bx, ax                               
  0594  36c60700         mov byte ptr ss:[bx], 0                  
  0598  6a01             push 1                                   
  059a  16               push ss                                  
  059b  8d46a6           lea ax, [bp - 0x5a]                      
  059e  50               push ax                                  
  059f  ff76fe           push word ptr [bp - 2]                   
  05a2  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  05a7  83c408           add sp, 8                                
  05aa  6a01             push 1                                   
  05ac  16               push ss                                  
  05ad  8d46fd           lea ax, [bp - 3]                         
  05b0  50               push ax                                  
  05b1  ff76fe           push word ptr [bp - 2]                   
  05b4  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  05b9  83c408           add sp, 8                                
  05bc  8bde             mov bx, si                               
  05be  6bdb1d           imul bx, bx, 0x1d                        
  05c1  8d86e4f9         lea ax, [bp - 0x61c]                     
  05c5  03d8             add bx, ax                               
  05c7  8a46fd           mov al, byte ptr [bp - 3]                
  05ca  04d0             add al, 0xd0                             
  05cc  368807           mov byte ptr ss:[bx], al                 
  05cf  6a01             push 1                                   
  05d1  16               push ss                                  
  05d2  8d46a6           lea ax, [bp - 0x5a]                      
  05d5  50               push ax                                  
  05d6  ff76fe           push word ptr [bp - 2]                   
  05d9  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  05de  83c408           add sp, 8                                
  05e1  6a01             push 1                                   
  05e3  16               push ss                                  
  05e4  8d46fd           lea ax, [bp - 3]                         
  05e7  50               push ax                                  
  05e8  ff76fe           push word ptr [bp - 2]                   
  05eb  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  05f0  83c408           add sp, 8                                
  05f3  8bde             mov bx, si                               
  05f5  6bdb1d           imul bx, bx, 0x1d                        
  05f8  8d86e5f9         lea ax, [bp - 0x61b]                     
  05fc  03d8             add bx, ax                               
  05fe  8a46fd           mov al, byte ptr [bp - 3]                
  0601  04d0             add al, 0xd0                             
  0603  368807           mov byte ptr ss:[bx], al                 
  0606  6a02             push 2                                   
  0608  16               push ss                                  
  0609  8d46a6           lea ax, [bp - 0x5a]                      
  060c  50               push ax                                  
  060d  ff76fe           push word ptr [bp - 2]                   
  0610  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0615  83c408           add sp, 8                                
  0618  33ff             xor di, di                               
  061a  eb41             jmp 0x65d                                
  061c  8bde             mov bx, si                               
  061e  6bdb1d           imul bx, bx, 0x1d                        
  0621  03df             add bx, di                               
  0623  8d86d0f9         lea ax, [bp - 0x630]                     
  0627  03d8             add bx, ax                               
  0629  36803f20         cmp byte ptr ss:[bx], 0x20               
  062d  750d             jne 0x63c                                
  062f  8bde             mov bx, si                               
  0631  6bdb1d           imul bx, bx, 0x1d                        
  0634  03df             add bx, di                               
  0636  03d8             add bx, ax                               
  0638  36c60700         mov byte ptr ss:[bx], 0                  
  063c  8bde             mov bx, si                               
  063e  6bdb1d           imul bx, bx, 0x1d                        
  0641  03df             add bx, di                               
  0643  8d86d0f9         lea ax, [bp - 0x630]                     
  0647  03d8             add bx, ax                               
  0649  36803f5f         cmp byte ptr ss:[bx], 0x5f               
  064d  750d             jne 0x65c                                
  064f  8bde             mov bx, si                               
  0651  6bdb1d           imul bx, bx, 0x1d                        
  0654  03df             add bx, di                               
  0656  03d8             add bx, ax                               
  0658  36c60720         mov byte ptr ss:[bx], 0x20               
  065c  47               inc di                                   
  065d  16               push ss                                  
  065e  8bc6             mov ax, si                               
  0660  6bc01d           imul ax, ax, 0x1d                        
  0663  8d96d0f9         lea dx, [bp - 0x630]                     
  0667  03c2             add ax, dx                               
  0669  50               push ax                                  
  066a  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  066f  83c404           add sp, 4                                
  0672  3bc7             cmp ax, di                               
  0674  7fa6             jg 0x61c                                 
  0676  46               inc si                                   
  0677  3b76fa           cmp si, word ptr [bp - 6]                
  067a  7d03             jge 0x67f                                
  067c  e9f0fe           jmp 0x56f                                
  067f  ff76fe           push word ptr [bp - 2]                   
  0682  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0687  59               pop cx                                   
  0688  33f6             xor si, si                               
  068a  eb10             jmp 0x69c                                
  068c  8bde             mov bx, si                               
  068e  d1e3             shl bx, 1                                
  0690  8d867aff         lea ax, [bp - 0x86]                      
  0694  03d8             add bx, ax                               
  0696  36c707ffff       mov word ptr ss:[bx], 0xffff             
  069b  46               inc si                                   
  069c  83fe08           cmp si, 8                                
  069f  7ceb             jl 0x68c                                 
  06a1  be0800           mov si, 8                                
  06a4  e91f01           jmp 0x7c6                                
  06a7  e9a200           jmp 0x74c                                
  06aa  6aff             push -1                                  
  06ac  ff76fa           push word ptr [bp - 6]                   
  06af  6a01             push 1                                   
  06b1  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  06b6  83c406           add sp, 6                                
  06b9  8946f8           mov word ptr [bp - 8], ax                
  06bc  c746f60100       mov word ptr [bp - 0xa], 1               
  06c1  33ff             xor di, di                               
  06c3  eb18             jmp 0x6dd                                
  06c5  8bdf             mov bx, di                               
  06c7  d1e3             shl bx, 1                                
  06c9  8d867aff         lea ax, [bp - 0x86]                      
  06cd  03d8             add bx, ax                               
  06cf  368b07           mov ax, word ptr ss:[bx]                 
  06d2  3b46f8           cmp ax, word ptr [bp - 8]                
  06d5  7505             jne 0x6dc                                
  06d7  c746f60000       mov word ptr [bp - 0xa], 0               
  06dc  47               inc di                                   
  06dd  3bfe             cmp di, si                               
  06df  7ce4             jl 0x6c5                                 
  06e1  837ef600         cmp word ptr [bp - 0xa], 0               
  06e5  7433             je 0x71a                                 
  06e7  8b46f8           mov ax, word ptr [bp - 8]                
  06ea  6bc01d           imul ax, ax, 0x1d                        
  06ed  8cd2             mov dx, ss                               
  06ef  8d9ed0f9         lea bx, [bp - 0x630]                     
  06f3  03c3             add ax, bx                               
  06f5  b91e00           mov cx, 0x1e                             
  06f8  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  06fd  90               nop                                      
  06fe  0e               push cs                                  
  06ff  e8f201           call 0x8f4                               
  0702  83c41e           add sp, 0x1e                             
  0705  0bc0             or ax, ax                                
  0707  7411             je 0x71a                                 
  0709  8b4606           mov ax, word ptr [bp + 6]                
  070c  050800           add ax, 8                                
  070f  3bc6             cmp ax, si                               
  0711  7e07             jle 0x71a                                
  0713  c746f60100       mov word ptr [bp - 0xa], 1               
  0718  eb37             jmp 0x751                                
  071a  837ef600         cmp word ptr [bp - 0xa], 0               
  071e  742c             je 0x74c                                 
  0720  8b46f8           mov ax, word ptr [bp - 8]                
  0723  6bc01d           imul ax, ax, 0x1d                        
  0726  8cd2             mov dx, ss                               
  0728  8d9ed0f9         lea bx, [bp - 0x630]                     
  072c  03c3             add ax, bx                               
  072e  b91e00           mov cx, 0x1e                             
  0731  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0736  90               nop                                      
  0737  0e               push cs                                  
  0738  e8b901           call 0x8f4                               
  073b  83c41e           add sp, 0x1e                             
  073e  0bc0             or ax, ax                                
  0740  750a             jne 0x74c                                
  0742  8b4606           mov ax, word ptr [bp + 6]                
  0745  050800           add ax, 8                                
  0748  3bc6             cmp ax, si                               
  074a  7ec7             jle 0x713                                
  074c  c746f60000       mov word ptr [bp - 0xa], 0               
  0751  837ef600         cmp word ptr [bp - 0xa], 0               
  0755  7503             jne 0x75a                                
  0757  e950ff           jmp 0x6aa                                
  075a  8bde             mov bx, si                               
  075c  d1e3             shl bx, 1                                
  075e  8d867aff         lea ax, [bp - 0x86]                      
  0762  03d8             add bx, ax                               
  0764  8b46f8           mov ax, word ptr [bp - 8]                
  0767  368907           mov word ptr ss:[bx], ax                 
  076a  16               push ss                                  
  076b  6bc01d           imul ax, ax, 0x1d                        
  076e  8d96d0f9         lea dx, [bp - 0x630]                     
  0772  03c2             add ax, dx                               
  0774  50               push ax                                  
  0775  8bc6             mov ax, si                               
  0777  6bc01d           imul ax, ax, 0x1d                        
  077a  05e90c           add ax, 0xce9                            
  077d  68042c           push 0x2c04                              
  0780  50               push ax                                  
  0781  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0786  83c408           add sp, 8                                
  0789  8b5ef8           mov bx, word ptr [bp - 8]                
  078c  6bdb1d           imul bx, bx, 0x1d                        
  078f  8d86e4f9         lea ax, [bp - 0x61c]                     
  0793  03d8             add bx, ax                               
  0795  368a07           mov al, byte ptr ss:[bx]                 
  0798  8bde             mov bx, si                               
  079a  6bdb1d           imul bx, bx, 0x1d                        
  079d  ba042c           mov dx, 0x2c04                           
  07a0  8ec2             mov es, dx                               
  07a2  268887fd0c       mov byte ptr es:[bx + 0xcfd], al         
  07a7  8b5ef8           mov bx, word ptr [bp - 8]                
  07aa  6bdb1d           imul bx, bx, 0x1d                        
  07ad  8d86e5f9         lea ax, [bp - 0x61b]                     
  07b1  03d8             add bx, ax                               
  07b3  368a07           mov al, byte ptr ss:[bx]                 
  07b6  8bde             mov bx, si                               
  07b8  6bdb1d           imul bx, bx, 0x1d                        
  07bb  ba042c           mov dx, 0x2c04                           
  07be  8ec2             mov es, dx                               
  07c0  268887fe0c       mov byte ptr es:[bx + 0xcfe], al         
  07c5  46               inc si                                   
  07c6  83fe16           cmp si, 0x16                             
  07c9  7c81             jl 0x74c                                 
  07cb  5f               pop di                                   
  07cc  5e               pop si                                   
  07cd  c9               leave                                    
  07ce  cb               retf                                     

ovl35_07cf:  ; ENTRY
  07cf  55               push bp                                  
  07d0  8bec             mov bp, sp                               
  07d2  56               push si                                  
  07d3  57               push di                                  
  07d4  33ff             xor di, di                               
  07d6  b8042c           mov ax, 0x2c04                           
  07d9  8ec0             mov es, ax                               
  07db  268b368101       mov si, word ptr es:[0x181]              
  07e0  e98100           jmp 0x864                                
  07e3  8bde             mov bx, si                               
  07e5  6bdb16           imul bx, bx, 0x16                        
  07e8  b81d1e           mov ax, 0x1e1d                           
  07eb  8ec0             mov es, ax                               
  07ed  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  07f2  98               cwde                                     
  07f3  3b4606           cmp ax, word ptr [bp + 6]                
  07f6  756c             jne 0x864                                
  07f8  8bde             mov bx, si                               
  07fa  6bdb16           imul bx, bx, 0x16                        
  07fd  b81d1e           mov ax, 0x1e1d                           
  0800  8ec0             mov es, ax                               
  0802  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0808  755a             jne 0x864                                
  080a  8bc6             mov ax, si                               
  080c  6bc016           imul ax, ax, 0x16                        
  080f  ba0000           mov dx, 0                                
  0812  03d0             add dx, ax                               
  0814  81c28088         add dx, 0x8880                           
  0818  681d1e           push 0x1e1d                              
  081b  52               push dx                                  
  081c  666a00           push 0                                   
  081f  6a02             push 2                                   
  0821  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  0826  83c40a           add sp, 0xa                              
  0829  33d2             xor dx, dx                               
  082b  eb31             jmp 0x85e                                
  082d  8bda             mov bx, dx                               
  082f  d1e3             shl bx, 1                                
  0831  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0835  6bdb1d           imul bx, bx, 0x1d                        
  0838  b8042c           mov ax, 0x2c04                           
  083b  8ec0             mov es, ax                               
  083d  2680bffd0c07     cmp byte ptr es:[bx + 0xcfd], 7          
  0843  7518             jne 0x85d                                
  0845  8bda             mov bx, dx                               
  0847  d1e3             shl bx, 1                                
  0849  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  084d  6bdb1d           imul bx, bx, 0x1d                        
  0850  b8042c           mov ax, 0x2c04                           
  0853  8ec0             mov es, ax                               
  0855  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  085a  98               cwde                                     
  085b  03f8             add di, ax                               
  085d  42               inc dx                                   
  085e  3b162e48         cmp dx, word ptr [0x482e]                
  0862  7cc9             jl 0x82d                                 
  0864  8bc6             mov ax, si                               
  0866  4e               dec si                                   
  0867  0bc0             or ax, ax                                
  0869  7403             je 0x86e                                 
  086b  e975ff           jmp 0x7e3                                
  086e  8bc7             mov ax, di                               
  0870  5f               pop di                                   
  0871  5e               pop si                                   
  0872  5d               pop bp                                   
  0873  cb               retf                                     

ovl35_0874:  ; ENTRY
  0874  55               push bp                                  
  0875  8bec             mov bp, sp                               
  0877  56               push si                                  
  0878  33f6             xor si, si                               
  087a  66ff7606         push dword ptr [bp + 6]                  
  087e  666a00           push 0                                   
  0881  6a02             push 2                                   
  0883  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  0888  83c40a           add sp, 0xa                              
  088b  33d2             xor dx, dx                               
  088d  eb1a             jmp 0x8a9                                
  088f  8bda             mov bx, dx                               
  0891  d1e3             shl bx, 1                                
  0893  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0897  6bdb1d           imul bx, bx, 0x1d                        
  089a  b8042c           mov ax, 0x2c04                           
  089d  8ec0             mov es, ax                               
  089f  2680bffd0c06     cmp byte ptr es:[bx + 0xcfd], 6          
  08a5  7501             jne 0x8a8                                
  08a7  46               inc si                                   
  08a8  42               inc dx                                   
  08a9  3b162e48         cmp dx, word ptr [0x482e]                
  08ad  7ce0             jl 0x88f                                 
  08af  8bc6             mov ax, si                               
  08b1  5e               pop si                                   
  08b2  5d               pop bp                                   
  08b3  cb               retf                                     

ovl35_08b4:  ; ENTRY
  08b4  55               push bp                                  
  08b5  8bec             mov bp, sp                               
  08b7  56               push si                                  
  08b8  33f6             xor si, si                               
  08ba  66ff7606         push dword ptr [bp + 6]                  
  08be  666a00           push 0                                   
  08c1  6a02             push 2                                   
  08c3  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  08c8  83c40a           add sp, 0xa                              
  08cb  33d2             xor dx, dx                               
  08cd  eb1a             jmp 0x8e9                                
  08cf  8bda             mov bx, dx                               
  08d1  d1e3             shl bx, 1                                
  08d3  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  08d7  6bdb1d           imul bx, bx, 0x1d                        
  08da  b8042c           mov ax, 0x2c04                           
  08dd  8ec0             mov es, ax                               
  08df  2680bffd0c05     cmp byte ptr es:[bx + 0xcfd], 5          
  08e5  7501             jne 0x8e8                                
  08e7  46               inc si                                   
  08e8  42               inc dx                                   
  08e9  3b162e48         cmp dx, word ptr [0x482e]                
  08ed  7ce0             jl 0x8cf                                 
  08ef  8bc6             mov ax, si                               
  08f1  5e               pop si                                   
  08f2  5d               pop bp                                   
  08f3  cb               retf                                     

ovl35_08f4:  ; ENTRY
  08f4  55               push bp                                  
  08f5  8bec             mov bp, sp                               
  08f7  807e1a06         cmp byte ptr [bp + 0x1a], 6              
  08fb  7505             jne 0x902                                
  08fd  b80100           mov ax, 1                                
  0900  eb1a             jmp 0x91c                                
  0902  807e1a05         cmp byte ptr [bp + 0x1a], 5              
  0906  74f5             je 0x8fd                                 
  0908  807e1a02         cmp byte ptr [bp + 0x1a], 2              
  090c  7506             jne 0x914                                
  090e  807e1b02         cmp byte ptr [bp + 0x1b], 2              
  0912  7de9             jge 0x8fd                                
  0914  807e1a08         cmp byte ptr [bp + 0x1a], 8              
  0918  74e3             je 0x8fd                                 
  091a  33c0             xor ax, ax                               
  091c  5d               pop bp                                   
  091d  cb               retf                                     

ovl35_091e:  ; ENTRY
  091e  55               push bp                                  
  091f  8bec             mov bp, sp                               
  0921  83ec02           sub sp, 2                                
  0924  56               push si                                  
  0925  57               push di                                  
  0926  b8042c           mov ax, 0x2c04                           
  0929  8ec0             mov es, ax                               
  092b  26a10f08         mov ax, word ptr es:[0x80f]              
  092f  6bc003           imul ax, ax, 3                           
  0932  bb0a00           mov bx, 0xa                              
  0935  99               cdq                                      
  0936  f7fb             idiv bx                                  
  0938  8946fe           mov word ptr [bp - 2], ax                
  093b  33f6             xor si, si                               
  093d  eb23             jmp 0x962                                
  093f  8bde             mov bx, si                               
  0941  6bdb1f           imul bx, bx, 0x1f                        
  0944  b8042c           mov ax, 0x2c04                           
  0947  8ec0             mov es, ax                               
  0949  26c7872c080000   mov word ptr es:[bx + 0x82c], 0          
  0950  8bde             mov bx, si                               
  0952  6bdb1f           imul bx, bx, 0x1f                        
  0955  b8042c           mov ax, 0x2c04                           
  0958  8ec0             mov es, ax                               
  095a  26c7872e08ff00   mov word ptr es:[bx + 0x82e], 0xff       
  0961  46               inc si                                   
  0962  b8042c           mov ax, 0x2c04                           
  0965  8ec0             mov es, ax                               
  0967  2639360f08       cmp word ptr es:[0x80f], si              
  096c  7fd1             jg 0x93f                                 
  096e  33f6             xor si, si                               
  0970  eb77             jmp 0x9e9                                
  0972  33ff             xor di, di                               
  0974  eb3f             jmp 0x9b5                                
  0976  6aff             push -1                                  
  0978  b8042c           mov ax, 0x2c04                           
  097b  8ec0             mov es, ax                               
  097d  26ff360f08       push word ptr es:[0x80f]                 
  0982  6a01             push 1                                   
  0984  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0989  83c406           add sp, 6                                
  098c  8bc8             mov cx, ax                               
  098e  8bd9             mov bx, cx                               
  0990  6bdb1f           imul bx, bx, 0x1f                        
  0993  b8042c           mov ax, 0x2c04                           
  0996  8ec0             mov es, ax                               
  0998  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  099e  7415             je 0x9b5                                 
  09a0  8bd9             mov bx, cx                               
  09a2  6bdb1f           imul bx, bx, 0x1f                        
  09a5  b8042c           mov ax, 0x2c04                           
  09a8  8ec0             mov es, ax                               
  09aa  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  09b0  7503             jne 0x9b5                                
  09b2  bf0100           mov di, 1                                
  09b5  0bff             or di, di                                
  09b7  74bd             je 0x976                                 
  09b9  8bd9             mov bx, cx                               
  09bb  6bdb1f           imul bx, bx, 0x1f                        
  09be  b8042c           mov ax, 0x2c04                           
  09c1  8ec0             mov es, ax                               
  09c3  26c7872c080100   mov word ptr es:[bx + 0x82c], 1          
  09ca  b8042c           mov ax, 0x2c04                           
  09cd  8ec0             mov es, ax                               
  09cf  26833e1e0100     cmp word ptr es:[0x11e], 0               
  09d5  7411             je 0x9e8                                 
  09d7  8bd9             mov bx, cx                               
  09d9  6bdb1f           imul bx, bx, 0x1f                        
  09dc  b8042c           mov ax, 0x2c04                           
  09df  8ec0             mov es, ax                               
  09e1  26c7872e080000   mov word ptr es:[bx + 0x82e], 0          
  09e8  46               inc si                                   
  09e9  3b76fe           cmp si, word ptr [bp - 2]                
  09ec  7c84             jl 0x972                                 
  09ee  5f               pop di                                   
  09ef  5e               pop si                                   
  09f0  c9               leave                                    
  09f1  cb               retf                                     

ovl35_09f2:  ; ENTRY
  09f2  55               push bp                                  
  09f3  8bec             mov bp, sp                               
  09f5  83ec08           sub sp, 8                                
  09f8  56               push si                                  
  09f9  57               push di                                  
  09fa  c746fe0a00       mov word ptr [bp - 2], 0xa               
  09ff  c746fc0c00       mov word ptr [bp - 4], 0xc               
  0a04  c746fa0b00       mov word ptr [bp - 6], 0xb               
  0a09  c746f80900       mov word ptr [bp - 8], 9                 
  0a0e  b8042c           mov ax, 0x2c04                           
  0a11  8ec0             mov es, ax                               
  0a13  26833e1e0100     cmp word ptr es:[0x11e], 0               
  0a19  7405             je 0xa20                                 
  0a1b  9a6100f230       lcall 0x30f2, 0x61                       -> ovl63:2a11
  0a20  33ff             xor di, di                               
  0a22  e9ef00           jmp 0xb14                                
  0a25  8bdf             mov bx, di                               
  0a27  6bdb1f           imul bx, bx, 0x1f                        
  0a2a  b8042c           mov ax, 0x2c04                           
  0a2d  8ec0             mov es, ax                               
  0a2f  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  0a35  7505             jne 0xa3c                                
  0a37  8b46fa           mov ax, word ptr [bp - 6]                
  0a3a  eb69             jmp 0xaa5                                
  0a3c  8bdf             mov bx, di                               
  0a3e  6bdb1f           imul bx, bx, 0x1f                        
  0a41  b8042c           mov ax, 0x2c04                           
  0a44  8ec0             mov es, ax                               
  0a46  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  0a4c  7419             je 0xa67                                 
  0a4e  8bdf             mov bx, di                               
  0a50  6bdb1f           imul bx, bx, 0x1f                        
  0a53  b8042c           mov ax, 0x2c04                           
  0a56  ba0100           mov dx, 1                                
  0a59  8a4e06           mov cl, byte ptr [bp + 6]                
  0a5c  d3e2             shl dx, cl                               
  0a5e  8ec0             mov es, ax                               
  0a60  2685972e08       test word ptr es:[bx + 0x82e], dx        
  0a65  751f             jne 0xa86                                
  0a67  8bdf             mov bx, di                               
  0a69  6bdb1f           imul bx, bx, 0x1f                        
  0a6c  b8042c           mov ax, 0x2c04                           
  0a6f  8ec0             mov es, ax                               
  0a71  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  0a77  7412             je 0xa8b                                 
  0a79  b8042c           mov ax, 0x2c04                           
  0a7c  8ec0             mov es, ax                               
  0a7e  26833e1e0100     cmp word ptr es:[0x11e], 0               
  0a84  7505             jne 0xa8b                                
  0a86  8b46fe           mov ax, word ptr [bp - 2]                
  0a89  eb1a             jmp 0xaa5                                
  0a8b  8bdf             mov bx, di                               
  0a8d  6bdb1f           imul bx, bx, 0x1f                        
  0a90  b8042c           mov ax, 0x2c04                           
  0a93  8ec0             mov es, ax                               
  0a95  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  0a9b  7405             je 0xaa2                                 
  0a9d  8b46f8           mov ax, word ptr [bp - 8]                
  0aa0  eb03             jmp 0xaa5                                
  0aa2  8b46fc           mov ax, word ptr [bp - 4]                
  0aa5  25ff00           and ax, 0xff                             
  0aa8  8bdf             mov bx, di                               
  0aaa  6bdb1f           imul bx, bx, 0x1f                        
  0aad  ba042c           mov dx, 0x2c04                           
  0ab0  8ec2             mov es, dx                               
  0ab2  268b9f1308       mov bx, word ptr es:[bx + 0x813]         
  0ab7  69dbe000         imul bx, bx, 0xe0                        
  0abb  8bf7             mov si, di                               
  0abd  6bf61f           imul si, si, 0x1f                        
  0ac0  ba042c           mov dx, 0x2c04                           
  0ac3  8ec2             mov es, dx                               
  0ac5  268b941108       mov dx, word ptr es:[si + 0x811]         
  0aca  d1e2             shl dx, 1                                
  0acc  03da             add bx, dx                               
  0ace  ba1d1e           mov dx, 0x1e1d                           
  0ad1  8ec2             mov es, dx                               
  0ad3  2680a7000000     and byte ptr es:[bx], 0                  
  0ad9  2608870000       or byte ptr es:[bx], al                  
  0ade  b8042c           mov ax, 0x2c04                           
  0ae1  8ec0             mov es, ax                               
  0ae3  26833e1e0100     cmp word ptr es:[0x11e], 0               
  0ae9  7428             je 0xb13                                 
  0aeb  8bdf             mov bx, di                               
  0aed  6bdb1f           imul bx, bx, 0x1f                        
  0af0  b8042c           mov ax, 0x2c04                           
  0af3  8ec0             mov es, ax                               
  0af5  26ffb71308       push word ptr es:[bx + 0x813]            
  0afa  8bdf             mov bx, di                               
  0afc  6bdb1f           imul bx, bx, 0x1f                        
  0aff  b8042c           mov ax, 0x2c04                           
  0b02  8ec0             mov es, ax                               
  0b04  26ffb71108       push word ptr es:[bx + 0x811]            
  0b09  6a00             push 0                                   
  0b0b  9a5c00f230       lcall 0x30f2, 0x5c                       -> ovl63:2785
  0b10  83c406           add sp, 6                                
  0b13  47               inc di                                   
  0b14  b8042c           mov ax, 0x2c04                           
  0b17  8ec0             mov es, ax                               
  0b19  26393e0f08       cmp word ptr es:[0x80f], di              
  0b1e  7e03             jle 0xb23                                
  0b20  e902ff           jmp 0xa25                                
  0b23  8ec0             mov es, ax                               
  0b25  26833e1e0100     cmp word ptr es:[0x11e], 0               
  0b2b  7405             je 0xb32                                 
  0b2d  9a6600f230       lcall 0x30f2, 0x66                       -> ovl63:2bb6
  0b32  5f               pop di                                   
  0b33  5e               pop si                                   
  0b34  c9               leave                                    
  0b35  cb               retf                                     

ovl35_0b36:  ; ENTRY
  0b36  55               push bp                                  
  0b37  8bec             mov bp, sp                               
  0b39  8b4e06           mov cx, word ptr [bp + 6]                
  0b3c  8bd9             mov bx, cx                               
  0b3e  6bdb1d           imul bx, bx, 0x1d                        
  0b41  b8042c           mov ax, 0x2c04                           
  0b44  8ec0             mov es, ax                               
  0b46  268a87ff0c       mov al, byte ptr es:[bx + 0xcff]         
  0b4b  98               cwde                                     
  0b4c  8bd8             mov bx, ax                               
  0b4e  83fb03           cmp bx, 3                                
  0b51  7603             jbe 0xb56                                
  0b53  e9be00           jmp 0xc14                                
  0b56  d1e3             shl bx, 1                                
  0b58  2effa7190c       jmp word ptr cs:[bx + 0xc19]             
ovl35_0b5d:  ; case
  0b5d  33c0             xor ax, ax                               
  0b5f  e9b500           jmp 0xc17                                
ovl35_0b62:  ; case
  0b62  8bd9             mov bx, cx                               
  0b64  6bdb1d           imul bx, bx, 0x1d                        
  0b67  b8042c           mov ax, 0x2c04                           
  0b6a  8ec0             mov es, ax                               
  0b6c  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  0b71  c45e08           les bx, ptr [bp + 8]                     
  0b74  268907           mov word ptr es:[bx], ax                 
  0b77  8bd9             mov bx, cx                               
  0b79  6bdb1d           imul bx, bx, 0x1d                        
  0b7c  b8042c           mov ax, 0x2c04                           
  0b7f  8ec0             mov es, ax                               
  0b81  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  0b86  e98500           jmp 0xc0e                                
ovl35_0b89:  ; case
  0b89  8bd9             mov bx, cx                               
  0b8b  6bdb1d           imul bx, bx, 0x1d                        
  0b8e  b8042c           mov ax, 0x2c04                           
  0b91  8ec0             mov es, ax                               
  0b93  268b9f000d       mov bx, word ptr es:[bx + 0xd00]         
  0b98  6bdb16           imul bx, bx, 0x16                        
  0b9b  b81d1e           mov ax, 0x1e1d                           
  0b9e  ba0000           mov dx, 0                                
  0ba1  81c28088         add dx, 0x8880                           
  0ba5  03da             add bx, dx                               
  0ba7  8ec0             mov es, ax                               
  0ba9  268b07           mov ax, word ptr es:[bx]                 
  0bac  c45e08           les bx, ptr [bp + 8]                     
  0baf  268907           mov word ptr es:[bx], ax                 
  0bb2  8bd9             mov bx, cx                               
  0bb4  6bdb1d           imul bx, bx, 0x1d                        
  0bb7  b8042c           mov ax, 0x2c04                           
  0bba  8ec0             mov es, ax                               
  0bbc  268b9f000d       mov bx, word ptr es:[bx + 0xd00]         
  0bc1  6bdb16           imul bx, bx, 0x16                        
  0bc4  b81d1e           mov ax, 0x1e1d                           
  0bc7  8ec0             mov es, ax                               
  0bc9  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0bce  eb3e             jmp 0xc0e                                
ovl35_0bd0:  ; case
  0bd0  8bd9             mov bx, cx                               
  0bd2  6bdb1d           imul bx, bx, 0x1d                        
  0bd5  b8042c           mov ax, 0x2c04                           
  0bd8  8ec0             mov es, ax                               
  0bda  268b9f000d       mov bx, word ptr es:[bx + 0xd00]         
  0bdf  6bdb1f           imul bx, bx, 0x1f                        
  0be2  b8042c           mov ax, 0x2c04                           
  0be5  8ec0             mov es, ax                               
  0be7  268b871108       mov ax, word ptr es:[bx + 0x811]         
  0bec  c45e08           les bx, ptr [bp + 8]                     
  0bef  268907           mov word ptr es:[bx], ax                 
  0bf2  8bd9             mov bx, cx                               
  0bf4  6bdb1d           imul bx, bx, 0x1d                        
  0bf7  b8042c           mov ax, 0x2c04                           
  0bfa  8ec0             mov es, ax                               
  0bfc  268b9f000d       mov bx, word ptr es:[bx + 0xd00]         
  0c01  6bdb1f           imul bx, bx, 0x1f                        
  0c04  b8042c           mov ax, 0x2c04                           
  0c07  8ec0             mov es, ax                               
  0c09  268b871308       mov ax, word ptr es:[bx + 0x813]         
  0c0e  c45e0c           les bx, ptr [bp + 0xc]                   
  0c11  268907           mov word ptr es:[bx], ax                 
  0c14  b80100           mov ax, 1                                
  0c17  5d               pop bp                                   
  0c18  cb               retf                                     
  0c19  5d0b620bd00b890b dw 0b5d,0b62,0bd0,0b89                   jump table

ovl35_0c21:  ; ENTRY
  0c21  55               push bp                                  
  0c22  8bec             mov bp, sp                               
  0c24  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0c29  6a04             push 4                                   
  0c2b  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0c30  59               pop cx                                   
  0c31  c7066a160100     mov word ptr [0x166a], 1                 
  0c37  6a23             push 0x23                                
  0c39  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0c3e  59               pop cx                                   
  0c3f  90               nop                                      
  0c40  0e               push cs                                  
  0c41  e80c00           call 0xc50                               
  0c44  90               nop                                      
  0c45  0e               push cs                                  
  0c46  e8c302           call 0xf0c                               
  0c49  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0c4e  5d               pop bp                                   
  0c4f  cb               retf                                     

ovl35_0c50:  ; ENTRY
  0c50  55               push bp                                  
  0c51  8bec             mov bp, sp                               
  0c53  83ec30           sub sp, 0x30                             
  0c56  56               push si                                  
  0c57  57               push di                                  
  0c58  33ff             xor di, di                               
  0c5a  c746fc0000       mov word ptr [bp - 4], 0                 
  0c5f  be0800           mov si, 8                                
  0c62  eb11             jmp 0xc75                                
  0c64  8b5efc           mov bx, word ptr [bp - 4]                
  0c67  d1e3             shl bx, 1                                
  0c69  8d46d0           lea ax, [bp - 0x30]                      
  0c6c  03d8             add bx, ax                               
  0c6e  368937           mov word ptr ss:[bx], si                 
  0c71  ff46fc           inc word ptr [bp - 4]                    
  0c74  46               inc si                                   
  0c75  83fe16           cmp si, 0x16                             
  0c78  7cea             jl 0xc64                                 
  0c7a  be0100           mov si, 1                                
  0c7d  e9df00           jmp 0xd5f                                
  0c80  8bce             mov cx, si                               
  0c82  eb37             jmp 0xcbb                                
  0c84  8bd9             mov bx, cx                               
  0c86  d1e3             shl bx, 1                                
  0c88  8d46d0           lea ax, [bp - 0x30]                      
  0c8b  03d8             add bx, ax                               
  0c8d  368b07           mov ax, word ptr ss:[bx]                 
  0c90  8946fe           mov word ptr [bp - 2], ax                
  0c93  8bd9             mov bx, cx                               
  0c95  d1e3             shl bx, 1                                
  0c97  8d46ce           lea ax, [bp - 0x32]                      
  0c9a  03d8             add bx, ax                               
  0c9c  368b07           mov ax, word ptr ss:[bx]                 
  0c9f  8bd9             mov bx, cx                               
  0ca1  d1e3             shl bx, 1                                
  0ca3  8d56d0           lea dx, [bp - 0x30]                      
  0ca6  03da             add bx, dx                               
  0ca8  368907           mov word ptr ss:[bx], ax                 
  0cab  8bd9             mov bx, cx                               
  0cad  d1e3             shl bx, 1                                
  0caf  8d46ce           lea ax, [bp - 0x32]                      
  0cb2  03d8             add bx, ax                               
  0cb4  8b46fe           mov ax, word ptr [bp - 2]                
  0cb7  368907           mov word ptr ss:[bx], ax                 
  0cba  49               dec cx                                   
  0cbb  8bd9             mov bx, cx                               
  0cbd  d1e3             shl bx, 1                                
  0cbf  8d46d0           lea ax, [bp - 0x30]                      
  0cc2  03d8             add bx, ax                               
  0cc4  368b1f           mov bx, word ptr ss:[bx]                 
  0cc7  6bdb1d           imul bx, bx, 0x1d                        
  0cca  b8042c           mov ax, 0x2c04                           
  0ccd  8ec0             mov es, ax                               
  0ccf  268a87fd0c       mov al, byte ptr es:[bx + 0xcfd]         
  0cd4  8bd9             mov bx, cx                               
  0cd6  d1e3             shl bx, 1                                
  0cd8  8d56ce           lea dx, [bp - 0x32]                      
  0cdb  03da             add bx, dx                               
  0cdd  368b1f           mov bx, word ptr ss:[bx]                 
  0ce0  6bdb1d           imul bx, bx, 0x1d                        
  0ce3  ba042c           mov dx, 0x2c04                           
  0ce6  8ec2             mov es, dx                               
  0ce8  263a87fd0c       cmp al, byte ptr es:[bx + 0xcfd]         
  0ced  7c68             jl 0xd57                                 
  0cef  8bd9             mov bx, cx                               
  0cf1  d1e3             shl bx, 1                                
  0cf3  8d46d0           lea ax, [bp - 0x30]                      
  0cf6  03d8             add bx, ax                               
  0cf8  368b1f           mov bx, word ptr ss:[bx]                 
  0cfb  6bdb1d           imul bx, bx, 0x1d                        
  0cfe  b8042c           mov ax, 0x2c04                           
  0d01  8ec0             mov es, ax                               
  0d03  268a87fd0c       mov al, byte ptr es:[bx + 0xcfd]         
  0d08  8bd9             mov bx, cx                               
  0d0a  d1e3             shl bx, 1                                
  0d0c  8d56ce           lea dx, [bp - 0x32]                      
  0d0f  03da             add bx, dx                               
  0d11  368b1f           mov bx, word ptr ss:[bx]                 
  0d14  6bdb1d           imul bx, bx, 0x1d                        
  0d17  ba042c           mov dx, 0x2c04                           
  0d1a  8ec2             mov es, dx                               
  0d1c  263a87fd0c       cmp al, byte ptr es:[bx + 0xcfd]         
  0d21  753b             jne 0xd5e                                
  0d23  8bd9             mov bx, cx                               
  0d25  d1e3             shl bx, 1                                
  0d27  8d46d0           lea ax, [bp - 0x30]                      
  0d2a  03d8             add bx, ax                               
  0d2c  368b1f           mov bx, word ptr ss:[bx]                 
  0d2f  6bdb1d           imul bx, bx, 0x1d                        
  0d32  b8042c           mov ax, 0x2c04                           
  0d35  8ec0             mov es, ax                               
  0d37  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  0d3c  8bd9             mov bx, cx                               
  0d3e  d1e3             shl bx, 1                                
  0d40  8d56ce           lea dx, [bp - 0x32]                      
  0d43  03da             add bx, dx                               
  0d45  368b1f           mov bx, word ptr ss:[bx]                 
  0d48  6bdb1d           imul bx, bx, 0x1d                        
  0d4b  ba042c           mov dx, 0x2c04                           
  0d4e  8ec2             mov es, dx                               
  0d50  263a87fe0c       cmp al, byte ptr es:[bx + 0xcfe]         
  0d55  7d07             jge 0xd5e                                
  0d57  0bc9             or cx, cx                                
  0d59  7e03             jle 0xd5e                                
  0d5b  e926ff           jmp 0xc84                                
  0d5e  46               inc si                                   
  0d5f  3b76fc           cmp si, word ptr [bp - 4]                
  0d62  7d03             jge 0xd67                                
  0d64  e919ff           jmp 0xc80                                
  0d67  666800000300     push 0x30000                             
  0d6d  666801000f00     push 0xf0001                             
  0d73  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0d78  83c408           add sp, 8                                
  0d7b  6668a6000000     push 0xa6                                
  0d81  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0d86  83c404           add sp, 4                                
  0d89  52               push dx                                  
  0d8a  50               push ax                                  
  0d8b  666840013400     push 0x340140                            
  0d91  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0d96  83c408           add sp, 8                                
  0d99  666800000300     push 0x30000                             
  0d9f  666802000f00     push 0xf0002                             
  0da5  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0daa  83c408           add sp, 8                                
  0dad  6668a7000000     push 0xa7                                
  0db3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0db8  83c404           add sp, 4                                
  0dbb  52               push dx                                  
  0dbc  50               push ax                                  
  0dbd  666840017e01     push 0x17e0140                           
  0dc3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0dc8  83c408           add sp, 8                                
  0dcb  666800000300     push 0x30000                             
  0dd1  666802000700     push 0x70002                             
  0dd7  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0ddc  83c408           add sp, 8                                
  0ddf  33f6             xor si, si                               
  0de1  e91c01           jmp 0xf00                                
  0de4  8bde             mov bx, si                               
  0de6  d1e3             shl bx, 1                                
  0de8  8d46d0           lea ax, [bp - 0x30]                      
  0deb  03d8             add bx, ax                               
  0ded  368b07           mov ax, word ptr ss:[bx]                 
  0df0  6bc01d           imul ax, ax, 0x1d                        
  0df3  05e90c           add ax, 0xce9                            
  0df6  68042c           push 0x2c04                              
  0df9  50               push ax                                  
  0dfa  8bc6             mov ax, si                               
  0dfc  6bc014           imul ax, ax, 0x14                        
  0dff  055a00           add ax, 0x5a                             
  0e02  50               push ax                                  
  0e03  683001           push 0x130                               
  0e06  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0e0b  83c408           add sp, 8                                
  0e0e  8bde             mov bx, si                               
  0e10  d1e3             shl bx, 1                                
  0e12  8d46d0           lea ax, [bp - 0x30]                      
  0e15  03d8             add bx, ax                               
  0e17  368b1f           mov bx, word ptr ss:[bx]                 
  0e1a  6bdb1d           imul bx, bx, 0x1d                        
  0e1d  b8042c           mov ax, 0x2c04                           
  0e20  8ec0             mov es, ax                               
  0e22  2680bffd0c01     cmp byte ptr es:[bx + 0xcfd], 1          
  0e28  7506             jne 0xe30                                
  0e2a  bf0100           mov di, 1                                
  0e2d  e98200           jmp 0xeb2                                
  0e30  8bde             mov bx, si                               
  0e32  d1e3             shl bx, 1                                
  0e34  8d46d0           lea ax, [bp - 0x30]                      
  0e37  03d8             add bx, ax                               
  0e39  368b1f           mov bx, word ptr ss:[bx]                 
  0e3c  6bdb1d           imul bx, bx, 0x1d                        
  0e3f  b8042c           mov ax, 0x2c04                           
  0e42  8ec0             mov es, ax                               
  0e44  2680bffd0c02     cmp byte ptr es:[bx + 0xcfd], 2          
  0e4a  7505             jne 0xe51                                
  0e4c  bf0200           mov di, 2                                
  0e4f  eb61             jmp 0xeb2                                
  0e51  8bde             mov bx, si                               
  0e53  d1e3             shl bx, 1                                
  0e55  8d46d0           lea ax, [bp - 0x30]                      
  0e58  03d8             add bx, ax                               
  0e5a  368b1f           mov bx, word ptr ss:[bx]                 
  0e5d  6bdb1d           imul bx, bx, 0x1d                        
  0e60  b8042c           mov ax, 0x2c04                           
  0e63  8ec0             mov es, ax                               
  0e65  2680bffd0c05     cmp byte ptr es:[bx + 0xcfd], 5          
  0e6b  7505             jne 0xe72                                
  0e6d  bf0300           mov di, 3                                
  0e70  eb40             jmp 0xeb2                                
  0e72  8bde             mov bx, si                               
  0e74  d1e3             shl bx, 1                                
  0e76  8d46d0           lea ax, [bp - 0x30]                      
  0e79  03d8             add bx, ax                               
  0e7b  368b1f           mov bx, word ptr ss:[bx]                 
  0e7e  6bdb1d           imul bx, bx, 0x1d                        
  0e81  b8042c           mov ax, 0x2c04                           
  0e84  8ec0             mov es, ax                               
  0e86  2680bffd0c06     cmp byte ptr es:[bx + 0xcfd], 6          
  0e8c  7505             jne 0xe93                                
  0e8e  bf0400           mov di, 4                                
  0e91  eb1f             jmp 0xeb2                                
  0e93  8bde             mov bx, si                               
  0e95  d1e3             shl bx, 1                                
  0e97  8d46d0           lea ax, [bp - 0x30]                      
  0e9a  03d8             add bx, ax                               
  0e9c  368b1f           mov bx, word ptr ss:[bx]                 
  0e9f  6bdb1d           imul bx, bx, 0x1d                        
  0ea2  b8042c           mov ax, 0x2c04                           
  0ea5  8ec0             mov es, ax                               
  0ea7  2680bffd0c07     cmp byte ptr es:[bx + 0xcfd], 7          
  0ead  7503             jne 0xeb2                                
  0eaf  bf0500           mov di, 5                                
  0eb2  8bde             mov bx, si                               
  0eb4  d1e3             shl bx, 1                                
  0eb6  8d46d0           lea ax, [bp - 0x30]                      
  0eb9  03d8             add bx, ax                               
  0ebb  368b1f           mov bx, word ptr ss:[bx]                 
  0ebe  6bdb1d           imul bx, bx, 0x1d                        
  0ec1  b8042c           mov ax, 0x2c04                           
  0ec4  8ec0             mov es, ax                               
  0ec6  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  0ecb  98               cwde                                     
  0ecc  50               push ax                                  
  0ecd  57               push di                                  
  0ece  68a700           push 0xa7                                
  0ed1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0ed6  83c404           add sp, 4                                
  0ed9  52               push dx                                  
  0eda  50               push ax                                  
  0edb  1e               push ds                                  
  0edc  68885c           push 0x5c88                              
  0edf  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0ee4  83c40a           add sp, 0xa                              
  0ee7  1e               push ds                                  
  0ee8  68885c           push 0x5c88                              
  0eeb  8bc6             mov ax, si                               
  0eed  6bc014           imul ax, ax, 0x14                        
  0ef0  055a00           add ax, 0x5a                             
  0ef3  50               push ax                                  
  0ef4  685001           push 0x150                               
  0ef7  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0efc  83c408           add sp, 8                                
  0eff  46               inc si                                   
  0f00  3b76fc           cmp si, word ptr [bp - 4]                
  0f03  7d03             jge 0xf08                                
  0f05  e9dcfe           jmp 0xde4                                
  0f08  5f               pop di                                   
  0f09  5e               pop si                                   
  0f0a  c9               leave                                    
  0f0b  cb               retf                                     

ovl35_0f0c:  ; ENTRY
  0f0c  55               push bp                                  
  0f0d  8bec             mov bp, sp                               
  0f0f  6668f0010100     push 0x101f0                             
  0f15  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0f1a  83c404           add sp, 4                                
  0f1d  6668ef010100     push 0x101ef                             
  0f23  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0f28  83c404           add sp, 4                                
  0f2b  5d               pop bp                                   
  0f2c  cb               retf                                     

ovl35_0f2d:  ; ENTRY
  0f2d  55               push bp                                  
  0f2e  8bec             mov bp, sp                               
  0f30  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0f35  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0f3a  666a00           push 0                                   
  0f3d  6a00             push 0                                   
  0f3f  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  0f44  83c406           add sp, 6                                
  0f47  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0f4c  5d               pop bp                                   
  0f4d  cb               retf                                     

ovl35_0f4e:  ; ENTRY
  0f4e  55               push bp                                  
  0f4f  8bec             mov bp, sp                               
  0f51  666a45           push 0x45                                
  0f54  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0f59  83c404           add sp, 4                                
  0f5c  52               push dx                                  
  0f5d  50               push ax                                  
  0f5e  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  0f63  83c404           add sp, 4                                
  0f66  0e               push cs                                  
  0f67  e8a2ff           call 0xf0c                               
  0f6a  5d               pop bp                                   
  0f6b  cb               retf                                     
