; ovl06 stub 2f79 file_off 0x412f0 size 0xa6f

ovl06_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  33f6             xor si, si                               
  0006  eb0e             jmp 0x16                                 
  0008  666a01           push 1                                   
  000b  6a00             push 0                                   
  000d  90               nop                                      
  000e  0e               push cs                                  
  000f  e84b00           call 0x5d                                
  0012  83c406           add sp, 6                                
  0015  46               inc si                                   
  0016  c41e8a3f         les bx, ptr [0x3f8a]                     
  001a  2639773a         cmp word ptr es:[bx + 0x3a], si          
  001e  7fe8             jg 8                                     
  0020  33f6             xor si, si                               
  0022  eb0e             jmp 0x32                                 
  0024  666a01           push 1                                   
  0027  6a01             push 1                                   
  0029  90               nop                                      
  002a  0e               push cs                                  
  002b  e82f00           call 0x5d                                
  002e  83c406           add sp, 6                                
  0031  46               inc si                                   
  0032  c41e8a3f         les bx, ptr [0x3f8a]                     
  0036  26397738         cmp word ptr es:[bx + 0x38], si          
  003a  7fe8             jg 0x24                                  
  003c  90               nop                                      
  003d  0e               push cs                                  
  003e  e8cb05           call 0x60c                               
  0041  9a3e00672f       lcall 0x2f67, 0x3e                       -> ovl03:0ce7
  0046  9a2a006f2f       lcall 0x2f6f, 0x2a                       -> ovl04:002e
  004b  9a25006f2f       lcall 0x2f6f, 0x25                       -> ovl04:033a
  0050  90               nop                                      
  0051  0e               push cs                                  
  0052  e8b705           call 0x60c                               
  0055  9a3e00672f       lcall 0x2f67, 0x3e                       -> ovl03:0ce7
  005a  5e               pop si                                   
  005b  5d               pop bp                                   
  005c  cb               retf                                     

ovl06_005d:  ; ENTRY
  005d  55               push bp                                  
  005e  8bec             mov bp, sp                               
  0060  83ec1c           sub sp, 0x1c                             
  0063  56               push si                                  
  0064  57               push di                                  
  0065  c746e40000       mov word ptr [bp - 0x1c], 0              
  006a  837e0a00         cmp word ptr [bp + 0xa], 0               
  006e  7433             je 0xa3                                  
  0070  c746fc0000       mov word ptr [bp - 4], 0                 
  0075  66689c00ffff     push 0xffff009c                          
  007b  6a01             push 1                                   
  007d  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0082  83c406           add sp, 6                                
  0085  8946fe           mov word ptr [bp - 2], ax                
  0088  c746f86f00       mov word ptr [bp - 8], 0x6f              
  008d  66689c00ffff     push 0xffff009c                          
  0093  6a01             push 1                                   
  0095  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  009a  83c406           add sp, 6                                
  009d  8946fa           mov word ptr [bp - 6], ax                
  00a0  e9b800           jmp 0x15b                                
  00a3  33f6             xor si, si                               
  00a5  eb52             jmp 0xf9                                 
  00a7  66687000ffff     push 0xffff0070                          
  00ad  6a01             push 1                                   
  00af  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  00b4  83c406           add sp, 6                                
  00b7  8946fc           mov word ptr [bp - 4], ax                
  00ba  66689c00ffff     push 0xffff009c                          
  00c0  6a01             push 1                                   
  00c2  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  00c7  83c406           add sp, 6                                
  00ca  8946fe           mov word ptr [bp - 2], ax                
  00cd  6bc070           imul ax, ax, 0x70                        
  00d0  c41e8a3f         les bx, ptr [0x3f8a]                     
  00d4  03d8             add bx, ax                               
  00d6  035efc           add bx, word ptr [bp - 4]                
  00d9  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  00df  741e             je 0xff                                  
  00e1  8b46fe           mov ax, word ptr [bp - 2]                
  00e4  6bc070           imul ax, ax, 0x70                        
  00e7  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00eb  03d8             add bx, ax                               
  00ed  035efc           add bx, word ptr [bp - 4]                
  00f0  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  00f6  7407             je 0xff                                  
  00f8  46               inc si                                   
  00f9  81fec800         cmp si, 0xc8                              ; "Quest"
  00fd  7ca8             jl 0xa7                                  
  00ff  33f6             xor si, si                               
  0101  eb52             jmp 0x155                                
  0103  66687000ffff     push 0xffff0070                          
  0109  6a01             push 1                                   
  010b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0110  83c406           add sp, 6                                
  0113  8946f8           mov word ptr [bp - 8], ax                
  0116  66689c00ffff     push 0xffff009c                          
  011c  6a01             push 1                                   
  011e  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0123  83c406           add sp, 6                                
  0126  8946fa           mov word ptr [bp - 6], ax                
  0129  6bc070           imul ax, ax, 0x70                        
  012c  c41e8a3f         les bx, ptr [0x3f8a]                     
  0130  03d8             add bx, ax                               
  0132  035ef8           add bx, word ptr [bp - 8]                
  0135  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  013b  741e             je 0x15b                                 
  013d  8b46fa           mov ax, word ptr [bp - 6]                
  0140  6bc070           imul ax, ax, 0x70                        
  0143  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0147  03d8             add bx, ax                               
  0149  035ef8           add bx, word ptr [bp - 8]                
  014c  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  0152  7407             je 0x15b                                 
  0154  46               inc si                                   
  0155  81fec800         cmp si, 0xc8                              ; "Quest"
  0159  7ca8             jl 0x103                                 
  015b  668b46fc         mov eax, dword ptr [bp - 4]              
  015f  668946f4         mov dword ptr [bp - 0xc], eax            
  0163  8b46fc           mov ax, word ptr [bp - 4]                
  0166  3b46f8           cmp ax, word ptr [bp - 8]                
  0169  750d             jne 0x178                                
  016b  8b46fe           mov ax, word ptr [bp - 2]                
  016e  3b46fa           cmp ax, word ptr [bp - 6]                
  0171  7505             jne 0x178                                
  0173  b80100           mov ax, 1                                
  0176  eb02             jmp 0x17a                                
  0178  33c0             xor ax, ax                               
  017a  8946ea           mov word ptr [bp - 0x16], ax             
  017d  e97f04           jmp 0x5ff                                
  0180  16               push ss                                  
  0181  8d46f0           lea ax, [bp - 0x10]                      
  0184  50               push ax                                  
  0185  66ff76f8         push dword ptr [bp - 8]                  
  0189  66ff76f4         push dword ptr [bp - 0xc]                
  018d  9a2a00672f       lcall 0x2f67, 0x2a                       -> ovl03:0dd0
  0192  83c40c           add sp, 0xc                              
  0195  33f6             xor si, si                               
  0197  b9ffff           mov cx, 0xffff                           
  019a  eb22             jmp 0x1be                                
  019c  8bc6             mov ax, si                               
  019e  c1e002           shl ax, 2                                
  01a1  c41e8a3f         les bx, ptr [0x3f8a]                     
  01a5  03d8             add bx, ax                               
  01a7  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  01ac  3b46f0           cmp ax, word ptr [bp - 0x10]             
  01af  750c             jne 0x1bd                                
  01b1  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  01b6  3b46f2           cmp ax, word ptr [bp - 0xe]              
  01b9  7502             jne 0x1bd                                
  01bb  8bce             mov cx, si                               
  01bd  46               inc si                                   
  01be  83fe08           cmp si, 8                                
  01c1  7cd9             jl 0x19c                                 
  01c3  8bc1             mov ax, cx                               
  01c5  40               inc ax                                   
  01c6  bb0800           mov bx, 8                                
  01c9  99               cdq                                      
  01ca  f7fb             idiv bx                                  
  01cc  8bf2             mov si, dx                               
  01ce  8bc1             mov ax, cx                               
  01d0  050700           add ax, 7                                
  01d3  99               cdq                                      
  01d4  f7fb             idiv bx                                  
  01d6  8bfa             mov di, dx                               
  01d8  8bc1             mov ax, cx                               
  01da  050200           add ax, 2                                
  01dd  99               cdq                                      
  01de  f7fb             idiv bx                                  
  01e0  8956e8           mov word ptr [bp - 0x18], dx             
  01e3  8bc1             mov ax, cx                               
  01e5  050600           add ax, 6                                
  01e8  99               cdq                                      
  01e9  f7fb             idiv bx                                  
  01eb  8956e6           mov word ptr [bp - 0x1a], dx             
  01ee  837e0800         cmp word ptr [bp + 8], 0                 
  01f2  7474             je 0x268                                 
  01f4  8bc1             mov ax, cx                               
  01f6  c1e002           shl ax, 2                                
  01f9  c41e8a3f         les bx, ptr [0x3f8a]                     
  01fd  03d8             add bx, ax                               
  01ff  8b46f6           mov ax, word ptr [bp - 0xa]              
  0202  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0207  6bc070           imul ax, ax, 0x70                        
  020a  8b168a3f         mov dx, word ptr [0x3f8a]                
  020e  03d0             add dx, ax                               
  0210  0356f4           add dx, word ptr [bp - 0xc]              
  0213  06               push es                                  
  0214  260397bc00       add dx, word ptr es:[bx + 0xbc]          
  0219  8bda             mov bx, dx                               
  021b  07               pop es                                   
  021c  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  0222  750b             jne 0x22f                                
  0224  837ee401         cmp word ptr [bp - 0x1c], 1              
  0228  7505             jne 0x22f                                
  022a  c746ea0100       mov word ptr [bp - 0x16], 1              
  022f  8bc1             mov ax, cx                               
  0231  c1e002           shl ax, 2                                
  0234  c41e8a3f         les bx, ptr [0x3f8a]                     
  0238  03d8             add bx, ax                               
  023a  8b46f6           mov ax, word ptr [bp - 0xa]              
  023d  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0242  6bc070           imul ax, ax, 0x70                        
  0245  8b168a3f         mov dx, word ptr [0x3f8a]                
  0249  03d0             add dx, ax                               
  024b  0356f4           add dx, word ptr [bp - 0xc]              
  024e  06               push es                                  
  024f  260397bc00       add dx, word ptr es:[bx + 0xbc]          
  0254  8bda             mov bx, dx                               
  0256  07               pop es                                   
  0257  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  025d  7509             jne 0x268                                
  025f  837ee400         cmp word ptr [bp - 0x1c], 0              
  0263  7503             jne 0x268                                
  0265  ff46e4           inc word ptr [bp - 0x1c]                 
  0268  837e0600         cmp word ptr [bp + 6], 0                 
  026c  7503             jne 0x271                                
  026e  e93002           jmp 0x4a1                                
  0271  668b46f4         mov eax, dword ptr [bp - 0xc]            
  0275  668946ec         mov dword ptr [bp - 0x14], eax           
  0279  16               push ss                                  
  027a  8d46ee           lea ax, [bp - 0x12]                      
  027d  50               push ax                                  
  027e  16               push ss                                  
  027f  8d46ec           lea ax, [bp - 0x14]                      
  0282  50               push ax                                  
  0283  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0288  83c408           add sp, 8                                
  028b  8b46ee           mov ax, word ptr [bp - 0x12]             
  028e  6bc070           imul ax, ax, 0x70                        
  0291  c41e8a3f         les bx, ptr [0x3f8a]                     
  0295  03d8             add bx, ax                               
  0297  035eec           add bx, word ptr [bp - 0x14]             
  029a  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  02a0  66ff76ec         push dword ptr [bp - 0x14]               
  02a4  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  02a9  83c404           add sp, 4                                
  02ac  8bc6             mov ax, si                               
  02ae  c1e002           shl ax, 2                                
  02b1  c41e8a3f         les bx, ptr [0x3f8a]                     
  02b5  03d8             add bx, ax                               
  02b7  8b46f4           mov ax, word ptr [bp - 0xc]              
  02ba  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  02bf  8946ec           mov word ptr [bp - 0x14], ax             
  02c2  8b46f6           mov ax, word ptr [bp - 0xa]              
  02c5  260387be00       add ax, word ptr es:[bx + 0xbe]          
  02ca  8946ee           mov word ptr [bp - 0x12], ax             
  02cd  16               push ss                                  
  02ce  8d46ee           lea ax, [bp - 0x12]                      
  02d1  50               push ax                                  
  02d2  16               push ss                                  
  02d3  8d46ec           lea ax, [bp - 0x14]                      
  02d6  50               push ax                                  
  02d7  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  02dc  83c408           add sp, 8                                
  02df  8b46ee           mov ax, word ptr [bp - 0x12]             
  02e2  6bc070           imul ax, ax, 0x70                        
  02e5  c41e8a3f         les bx, ptr [0x3f8a]                     
  02e9  03d8             add bx, ax                               
  02eb  035eec           add bx, word ptr [bp - 0x14]             
  02ee  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  02f4  66ff76ec         push dword ptr [bp - 0x14]               
  02f8  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  02fd  83c404           add sp, 4                                
  0300  8bc7             mov ax, di                               
  0302  c1e002           shl ax, 2                                
  0305  c41e8a3f         les bx, ptr [0x3f8a]                     
  0309  03d8             add bx, ax                               
  030b  8b46f4           mov ax, word ptr [bp - 0xc]              
  030e  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  0313  8946ec           mov word ptr [bp - 0x14], ax             
  0316  8b46f6           mov ax, word ptr [bp - 0xa]              
  0319  260387be00       add ax, word ptr es:[bx + 0xbe]          
  031e  8946ee           mov word ptr [bp - 0x12], ax             
  0321  16               push ss                                  
  0322  8d46ee           lea ax, [bp - 0x12]                      
  0325  50               push ax                                  
  0326  16               push ss                                  
  0327  8d46ec           lea ax, [bp - 0x14]                      
  032a  50               push ax                                  
  032b  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0330  83c408           add sp, 8                                
  0333  8b46ee           mov ax, word ptr [bp - 0x12]             
  0336  6bc070           imul ax, ax, 0x70                        
  0339  c41e8a3f         les bx, ptr [0x3f8a]                     
  033d  03d8             add bx, ax                               
  033f  035eec           add bx, word ptr [bp - 0x14]             
  0342  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0348  66ff76ec         push dword ptr [bp - 0x14]               
  034c  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0351  83c404           add sp, 4                                
  0354  8bc6             mov ax, si                               
  0356  c1e002           shl ax, 2                                
  0359  c41e8a3f         les bx, ptr [0x3f8a]                     
  035d  03d8             add bx, ax                               
  035f  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  0364  d1e0             shl ax, 1                                
  0366  8b56f4           mov dx, word ptr [bp - 0xc]              
  0369  03d0             add dx, ax                               
  036b  8956ec           mov word ptr [bp - 0x14], dx             
  036e  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  0373  d1e0             shl ax, 1                                
  0375  8b56f6           mov dx, word ptr [bp - 0xa]              
  0378  03d0             add dx, ax                               
  037a  8956ee           mov word ptr [bp - 0x12], dx             
  037d  16               push ss                                  
  037e  8d46ee           lea ax, [bp - 0x12]                      
  0381  50               push ax                                  
  0382  16               push ss                                  
  0383  8d46ec           lea ax, [bp - 0x14]                      
  0386  50               push ax                                  
  0387  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  038c  83c408           add sp, 8                                
  038f  8b46ee           mov ax, word ptr [bp - 0x12]             
  0392  6bc070           imul ax, ax, 0x70                        
  0395  c41e8a3f         les bx, ptr [0x3f8a]                     
  0399  03d8             add bx, ax                               
  039b  035eec           add bx, word ptr [bp - 0x14]             
  039e  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  03a4  66ff76ec         push dword ptr [bp - 0x14]               
  03a8  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  03ad  83c404           add sp, 4                                
  03b0  8bc7             mov ax, di                               
  03b2  c1e002           shl ax, 2                                
  03b5  c41e8a3f         les bx, ptr [0x3f8a]                     
  03b9  03d8             add bx, ax                               
  03bb  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  03c0  d1e0             shl ax, 1                                
  03c2  8b56f4           mov dx, word ptr [bp - 0xc]              
  03c5  03d0             add dx, ax                               
  03c7  8956ec           mov word ptr [bp - 0x14], dx             
  03ca  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  03cf  d1e0             shl ax, 1                                
  03d1  8b56f6           mov dx, word ptr [bp - 0xa]              
  03d4  03d0             add dx, ax                               
  03d6  8956ee           mov word ptr [bp - 0x12], dx             
  03d9  16               push ss                                  
  03da  8d46ee           lea ax, [bp - 0x12]                      
  03dd  50               push ax                                  
  03de  16               push ss                                  
  03df  8d46ec           lea ax, [bp - 0x14]                      
  03e2  50               push ax                                  
  03e3  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  03e8  83c408           add sp, 8                                
  03eb  8b46ee           mov ax, word ptr [bp - 0x12]             
  03ee  6bc070           imul ax, ax, 0x70                        
  03f1  c41e8a3f         les bx, ptr [0x3f8a]                     
  03f5  03d8             add bx, ax                               
  03f7  035eec           add bx, word ptr [bp - 0x14]             
  03fa  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0400  66ff76ec         push dword ptr [bp - 0x14]               
  0404  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0409  83c404           add sp, 4                                
  040c  837e0a00         cmp word ptr [bp + 0xa], 0               
  0410  7503             jne 0x415                                
  0412  e96f01           jmp 0x584                                
  0415  8bc6             mov ax, si                               
  0417  c1e002           shl ax, 2                                
  041a  c41e8a3f         les bx, ptr [0x3f8a]                     
  041e  03d8             add bx, ax                               
  0420  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  0425  6bc003           imul ax, ax, 3                           
  0428  8b56f4           mov dx, word ptr [bp - 0xc]              
  042b  03d0             add dx, ax                               
  042d  8956ec           mov word ptr [bp - 0x14], dx             
  0430  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  0435  6bc003           imul ax, ax, 3                           
  0438  8b56f6           mov dx, word ptr [bp - 0xa]              
  043b  03d0             add dx, ax                               
  043d  8956ee           mov word ptr [bp - 0x12], dx             
  0440  16               push ss                                  
  0441  8d46ee           lea ax, [bp - 0x12]                      
  0444  50               push ax                                  
  0445  16               push ss                                  
  0446  8d46ec           lea ax, [bp - 0x14]                      
  0449  50               push ax                                  
  044a  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  044f  83c408           add sp, 8                                
  0452  8b46ee           mov ax, word ptr [bp - 0x12]             
  0455  6bc070           imul ax, ax, 0x70                        
  0458  c41e8a3f         les bx, ptr [0x3f8a]                     
  045c  03d8             add bx, ax                               
  045e  035eec           add bx, word ptr [bp - 0x14]             
  0461  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0467  66ff76ec         push dword ptr [bp - 0x14]               
  046b  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0470  83c404           add sp, 4                                
  0473  8bc7             mov ax, di                               
  0475  c1e002           shl ax, 2                                
  0478  c41e8a3f         les bx, ptr [0x3f8a]                     
  047c  03d8             add bx, ax                               
  047e  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  0483  6bc003           imul ax, ax, 3                           
  0486  8b56f4           mov dx, word ptr [bp - 0xc]              
  0489  03d0             add dx, ax                               
  048b  8956ec           mov word ptr [bp - 0x14], dx             
  048e  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  0493  6bc003           imul ax, ax, 3                           
  0496  8b56f6           mov dx, word ptr [bp - 0xa]              
  0499  03d0             add dx, ax                               
  049b  8956ee           mov word ptr [bp - 0x12], dx             
  049e  e9b000           jmp 0x551                                
  04a1  668b46f4         mov eax, dword ptr [bp - 0xc]            
  04a5  668946ec         mov dword ptr [bp - 0x14], eax           
  04a9  16               push ss                                  
  04aa  8d46ee           lea ax, [bp - 0x12]                      
  04ad  50               push ax                                  
  04ae  16               push ss                                  
  04af  8d46ec           lea ax, [bp - 0x14]                      
  04b2  50               push ax                                  
  04b3  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  04b8  83c408           add sp, 8                                
  04bb  8b46ee           mov ax, word ptr [bp - 0x12]             
  04be  6bc070           imul ax, ax, 0x70                        
  04c1  c41e8a3f         les bx, ptr [0x3f8a]                     
  04c5  03d8             add bx, ax                               
  04c7  035eec           add bx, word ptr [bp - 0x14]             
  04ca  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  04d0  66ff76ec         push dword ptr [bp - 0x14]               
  04d4  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  04d9  83c404           add sp, 4                                
  04dc  8bc6             mov ax, si                               
  04de  c1e002           shl ax, 2                                
  04e1  c41e8a3f         les bx, ptr [0x3f8a]                     
  04e5  03d8             add bx, ax                               
  04e7  8b46f4           mov ax, word ptr [bp - 0xc]              
  04ea  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  04ef  8946ec           mov word ptr [bp - 0x14], ax             
  04f2  8b46f6           mov ax, word ptr [bp - 0xa]              
  04f5  260387be00       add ax, word ptr es:[bx + 0xbe]          
  04fa  8946ee           mov word ptr [bp - 0x12], ax             
  04fd  16               push ss                                  
  04fe  8d46ee           lea ax, [bp - 0x12]                      
  0501  50               push ax                                  
  0502  16               push ss                                  
  0503  8d46ec           lea ax, [bp - 0x14]                      
  0506  50               push ax                                  
  0507  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  050c  83c408           add sp, 8                                
  050f  8b46ee           mov ax, word ptr [bp - 0x12]             
  0512  6bc070           imul ax, ax, 0x70                        
  0515  c41e8a3f         les bx, ptr [0x3f8a]                     
  0519  03d8             add bx, ax                               
  051b  035eec           add bx, word ptr [bp - 0x14]             
  051e  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0524  66ff76ec         push dword ptr [bp - 0x14]               
  0528  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  052d  83c404           add sp, 4                                
  0530  8bc7             mov ax, di                               
  0532  c1e002           shl ax, 2                                
  0535  c41e8a3f         les bx, ptr [0x3f8a]                     
  0539  03d8             add bx, ax                               
  053b  8b46f4           mov ax, word ptr [bp - 0xc]              
  053e  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  0543  8946ec           mov word ptr [bp - 0x14], ax             
  0546  8b46f6           mov ax, word ptr [bp - 0xa]              
  0549  260387be00       add ax, word ptr es:[bx + 0xbe]          
  054e  8946ee           mov word ptr [bp - 0x12], ax             
  0551  16               push ss                                  
  0552  8d46ee           lea ax, [bp - 0x12]                      
  0555  50               push ax                                  
  0556  16               push ss                                  
  0557  8d46ec           lea ax, [bp - 0x14]                      
  055a  50               push ax                                  
  055b  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0560  83c408           add sp, 8                                
  0563  8b46ee           mov ax, word ptr [bp - 0x12]             
  0566  6bc070           imul ax, ax, 0x70                        
  0569  c41e8a3f         les bx, ptr [0x3f8a]                     
  056d  03d8             add bx, ax                               
  056f  035eec           add bx, word ptr [bp - 0x14]             
  0572  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0578  66ff76ec         push dword ptr [bp - 0x14]               
  057c  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0581  83c404           add sp, 4                                
  0584  8b46f0           mov ax, word ptr [bp - 0x10]             
  0587  0146f4           add word ptr [bp - 0xc], ax              
  058a  8b46f2           mov ax, word ptr [bp - 0xe]              
  058d  0146f6           add word ptr [bp - 0xa], ax              
  0590  8b46f4           mov ax, word ptr [bp - 0xc]              
  0593  3b46f8           cmp ax, word ptr [bp - 8]                
  0596  750d             jne 0x5a5                                
  0598  8b46f6           mov ax, word ptr [bp - 0xa]              
  059b  3b46fa           cmp ax, word ptr [bp - 6]                
  059e  7505             jne 0x5a5                                
  05a0  c746ea0100       mov word ptr [bp - 0x16], 1              
  05a5  666a04           push 4                                   
  05a8  6a01             push 1                                   
  05aa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  05af  83c406           add sp, 6                                
  05b2  3d0200           cmp ax, 2                                
  05b5  7407             je 0x5be                                 
  05b7  3d0300           cmp ax, 3                                
  05ba  741b             je 0x5d7                                 
  05bc  eb41             jmp 0x5ff                                
  05be  8b46e8           mov ax, word ptr [bp - 0x18]             
  05c1  c1e002           shl ax, 2                                
  05c4  c41e8a3f         les bx, ptr [0x3f8a]                     
  05c8  03d8             add bx, ax                               
  05ca  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  05cf  0146f4           add word ptr [bp - 0xc], ax              
  05d2  8b46e8           mov ax, word ptr [bp - 0x18]             
  05d5  eb17             jmp 0x5ee                                
  05d7  8b46e6           mov ax, word ptr [bp - 0x1a]             
  05da  c1e002           shl ax, 2                                
  05dd  c41e8a3f         les bx, ptr [0x3f8a]                     
  05e1  03d8             add bx, ax                               
  05e3  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  05e8  0146f4           add word ptr [bp - 0xc], ax              
  05eb  8b46e6           mov ax, word ptr [bp - 0x1a]             
  05ee  c1e002           shl ax, 2                                
  05f1  c41e8a3f         les bx, ptr [0x3f8a]                     
  05f5  03d8             add bx, ax                               
  05f7  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  05fc  0146f6           add word ptr [bp - 0xa], ax              
  05ff  837eea00         cmp word ptr [bp - 0x16], 0              
  0603  7503             jne 0x608                                
  0605  e978fb           jmp 0x180                                
  0608  5f               pop di                                   
  0609  5e               pop si                                   
  060a  c9               leave                                    
  060b  cb               retf                                     

ovl06_060c:  ; ENTRY
  060c  55               push bp                                  
  060d  8bec             mov bp, sp                               
  060f  56               push si                                  
  0610  57               push di                                  
  0611  33f6             xor si, si                               
  0613  e92601           jmp 0x73c                                
  0616  33ff             xor di, di                               
  0618  e91701           jmp 0x732                                
  061b  33d2             xor dx, dx                               
  061d  8bc7             mov ax, di                               
  061f  6bc070           imul ax, ax, 0x70                        
  0622  c41e8a3f         les bx, ptr [0x3f8a]                     
  0626  03d8             add bx, ax                               
  0628  03de             add bx, si                               
  062a  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0630  742d             je 0x65f                                 
  0632  8bc7             mov ax, di                               
  0634  6bc070           imul ax, ax, 0x70                        
  0637  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  063b  03d8             add bx, ax                               
  063d  03de             add bx, si                               
  063f  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0645  7418             je 0x65f                                 
  0647  8bc7             mov ax, di                               
  0649  6bc070           imul ax, ax, 0x70                        
  064c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0650  03d8             add bx, ax                               
  0652  03de             add bx, si                               
  0654  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  065a  7403             je 0x65f                                 
  065c  e9d200           jmp 0x731                                
  065f  8bc7             mov ax, di                               
  0661  40               inc ax                                   
  0662  6bc070           imul ax, ax, 0x70                        
  0665  c41e8a3f         les bx, ptr [0x3f8a]                     
  0669  03d8             add bx, ax                               
  066b  03de             add bx, si                               
  066d  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  0673  7416             je 0x68b                                 
  0675  8bc7             mov ax, di                               
  0677  40               inc ax                                   
  0678  6bc070           imul ax, ax, 0x70                        
  067b  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  067f  03d8             add bx, ax                               
  0681  03de             add bx, si                               
  0683  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  0689  7501             jne 0x68c                                
  068b  42               inc dx                                   
  068c  8bc7             mov ax, di                               
  068e  48               dec ax                                   
  068f  6bc070           imul ax, ax, 0x70                        
  0692  c41e8a3f         les bx, ptr [0x3f8a]                     
  0696  03d8             add bx, ax                               
  0698  03de             add bx, si                               
  069a  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  06a0  7416             je 0x6b8                                 
  06a2  8bc7             mov ax, di                               
  06a4  48               dec ax                                   
  06a5  6bc070           imul ax, ax, 0x70                        
  06a8  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  06ac  03d8             add bx, ax                               
  06ae  03de             add bx, si                               
  06b0  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  06b6  7501             jne 0x6b9                                
  06b8  42               inc dx                                   
  06b9  8bc7             mov ax, di                               
  06bb  6bc070           imul ax, ax, 0x70                        
  06be  c41e8a3f         les bx, ptr [0x3f8a]                     
  06c2  03d8             add bx, ax                               
  06c4  03de             add bx, si                               
  06c6  2680bf216103     cmp byte ptr es:[bx + 0x6121], 3         
  06cc  7415             je 0x6e3                                 
  06ce  8bc7             mov ax, di                               
  06d0  6bc070           imul ax, ax, 0x70                        
  06d3  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  06d7  03d8             add bx, ax                               
  06d9  03de             add bx, si                               
  06db  2680bf216102     cmp byte ptr es:[bx + 0x6121], 2         
  06e1  7501             jne 0x6e4                                
  06e3  42               inc dx                                   
  06e4  8bc7             mov ax, di                               
  06e6  6bc070           imul ax, ax, 0x70                        
  06e9  c41e8a3f         les bx, ptr [0x3f8a]                     
  06ed  03d8             add bx, ax                               
  06ef  03de             add bx, si                               
  06f1  2680bf1f6103     cmp byte ptr es:[bx + 0x611f], 3         
  06f7  7415             je 0x70e                                 
  06f9  8bc7             mov ax, di                               
  06fb  6bc070           imul ax, ax, 0x70                        
  06fe  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0702  03d8             add bx, ax                               
  0704  03de             add bx, si                               
  0706  2680bf1f6102     cmp byte ptr es:[bx + 0x611f], 2         
  070c  7501             jne 0x70f                                
  070e  42               inc dx                                   
  070f  83fa03           cmp dx, 3                                
  0712  7c1d             jl 0x731                                 
  0714  8bc7             mov ax, di                               
  0716  6bc070           imul ax, ax, 0x70                        
  0719  c41e8a3f         les bx, ptr [0x3f8a]                     
  071d  03d8             add bx, ax                               
  071f  03de             add bx, si                               
  0721  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  0727  57               push di                                  
  0728  56               push si                                  
  0729  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  072e  83c404           add sp, 4                                
  0731  47               inc di                                   
  0732  81ff9c00         cmp di, 0x9c                             
  0736  7d03             jge 0x73b                                
  0738  e9e0fe           jmp 0x61b                                
  073b  46               inc si                                   
  073c  83fe70           cmp si, 0x70                             
  073f  7d03             jge 0x744                                
  0741  e9d2fe           jmp 0x616                                
  0744  33f6             xor si, si                               
  0746  eb6e             jmp 0x7b6                                
  0748  33ff             xor di, di                               
  074a  eb63             jmp 0x7af                                
  074c  8bc7             mov ax, di                               
  074e  6bc070           imul ax, ax, 0x70                        
  0751  c41e8a3f         les bx, ptr [0x3f8a]                     
  0755  03d8             add bx, ax                               
  0757  03de             add bx, si                               
  0759  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  075f  754d             jne 0x7ae                                
  0761  6a07             push 7                                   
  0763  57               push di                                  
  0764  56               push si                                  
  0765  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  076a  83c406           add sp, 6                                
  076d  0bc0             or ax, ax                                
  076f  753d             jne 0x7ae                                
  0771  6a05             push 5                                   
  0773  57               push di                                  
  0774  56               push si                                  
  0775  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  077a  83c406           add sp, 6                                
  077d  0bc0             or ax, ax                                
  077f  752d             jne 0x7ae                                
  0781  6a06             push 6                                   
  0783  57               push di                                  
  0784  56               push si                                  
  0785  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  078a  83c406           add sp, 6                                
  078d  0bc0             or ax, ax                                
  078f  751d             jne 0x7ae                                
  0791  8bc7             mov ax, di                               
  0793  6bc070           imul ax, ax, 0x70                        
  0796  c41e8a3f         les bx, ptr [0x3f8a]                     
  079a  03d8             add bx, ax                               
  079c  03de             add bx, si                               
  079e  26c687206102     mov byte ptr es:[bx + 0x6120], 2         
  07a4  57               push di                                  
  07a5  56               push si                                  
  07a6  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  07ab  83c404           add sp, 4                                
  07ae  47               inc di                                   
  07af  81ff9c00         cmp di, 0x9c                             
  07b3  7c97             jl 0x74c                                 
  07b5  46               inc si                                   
  07b6  83fe70           cmp si, 0x70                             
  07b9  7c8d             jl 0x748                                 
  07bb  be0100           mov si, 1                                
  07be  e9a202           jmp 0xa63                                
  07c1  bf0100           mov di, 1                                
  07c4  e99202           jmp 0xa59                                
  07c7  8bc7             mov ax, di                               
  07c9  6bc070           imul ax, ax, 0x70                        
  07cc  c41e8a3f         les bx, ptr [0x3f8a]                     
  07d0  03d8             add bx, ax                               
  07d2  03de             add bx, si                               
  07d4  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  07da  7418             je 0x7f4                                 
  07dc  8bc7             mov ax, di                               
  07de  6bc070           imul ax, ax, 0x70                        
  07e1  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  07e5  03d8             add bx, ax                               
  07e7  03de             add bx, si                               
  07e9  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  07ef  7403             je 0x7f4                                 
  07f1  e96402           jmp 0xa58                                
  07f4  8bc7             mov ax, di                               
  07f6  40               inc ax                                   
  07f7  6bc070           imul ax, ax, 0x70                        
  07fa  c41e8a3f         les bx, ptr [0x3f8a]                     
  07fe  03d8             add bx, ax                               
  0800  03de             add bx, si                               
  0802  2680bf216102     cmp byte ptr es:[bx + 0x6121], 2         
  0808  7419             je 0x823                                 
  080a  8bc7             mov ax, di                               
  080c  40               inc ax                                   
  080d  6bc070           imul ax, ax, 0x70                        
  0810  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0814  03d8             add bx, ax                               
  0816  03de             add bx, si                               
  0818  2680bf216103     cmp byte ptr es:[bx + 0x6121], 3         
  081e  7403             je 0x823                                 
  0820  e90001           jmp 0x923                                
  0823  8bc7             mov ax, di                               
  0825  48               dec ax                                   
  0826  6bc070           imul ax, ax, 0x70                        
  0829  c41e8a3f         les bx, ptr [0x3f8a]                     
  082d  03d8             add bx, ax                               
  082f  03de             add bx, si                               
  0831  2680bf1f6102     cmp byte ptr es:[bx + 0x611f], 2         
  0837  7419             je 0x852                                 
  0839  8bc7             mov ax, di                               
  083b  48               dec ax                                   
  083c  6bc070           imul ax, ax, 0x70                        
  083f  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0843  03d8             add bx, ax                               
  0845  03de             add bx, si                               
  0847  2680bf1f6103     cmp byte ptr es:[bx + 0x611f], 3         
  084d  7403             je 0x852                                 
  084f  e9d100           jmp 0x923                                
  0852  8bc7             mov ax, di                               
  0854  48               dec ax                                   
  0855  6bc070           imul ax, ax, 0x70                        
  0858  c41e8a3f         les bx, ptr [0x3f8a]                     
  085c  03d8             add bx, ax                               
  085e  03de             add bx, si                               
  0860  2680bf216105     cmp byte ptr es:[bx + 0x6121], 5         
  0866  742f             je 0x897                                 
  0868  8bc7             mov ax, di                               
  086a  48               dec ax                                   
  086b  6bc070           imul ax, ax, 0x70                        
  086e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0872  03d8             add bx, ax                               
  0874  03de             add bx, si                               
  0876  2680bf216104     cmp byte ptr es:[bx + 0x6121], 4         
  087c  7419             je 0x897                                 
  087e  8bc7             mov ax, di                               
  0880  48               dec ax                                   
  0881  6bc070           imul ax, ax, 0x70                        
  0884  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0888  03d8             add bx, ax                               
  088a  03de             add bx, si                               
  088c  2680bf216107     cmp byte ptr es:[bx + 0x6121], 7         
  0892  7403             je 0x897                                 
  0894  e98c00           jmp 0x923                                
  0897  8bc7             mov ax, di                               
  0899  40               inc ax                                   
  089a  6bc070           imul ax, ax, 0x70                        
  089d  c41e8a3f         les bx, ptr [0x3f8a]                     
  08a1  03d8             add bx, ax                               
  08a3  03de             add bx, si                               
  08a5  2680bf1f6105     cmp byte ptr es:[bx + 0x611f], 5         
  08ab  742c             je 0x8d9                                 
  08ad  8bc7             mov ax, di                               
  08af  40               inc ax                                   
  08b0  6bc070           imul ax, ax, 0x70                        
  08b3  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  08b7  03d8             add bx, ax                               
  08b9  03de             add bx, si                               
  08bb  2680bf1f6104     cmp byte ptr es:[bx + 0x611f], 4         
  08c1  7416             je 0x8d9                                 
  08c3  8bc7             mov ax, di                               
  08c5  40               inc ax                                   
  08c6  6bc070           imul ax, ax, 0x70                        
  08c9  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  08cd  03d8             add bx, ax                               
  08cf  03de             add bx, si                               
  08d1  2680bf1f6107     cmp byte ptr es:[bx + 0x611f], 7         
  08d7  754a             jne 0x923                                
  08d9  666a0a           push 0xa                                 
  08dc  6a01             push 1                                   
  08de  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  08e3  83c406           add sp, 6                                
  08e6  3d0500           cmp ax, 5                                
  08e9  7d1a             jge 0x905                                
  08eb  8bc7             mov ax, di                               
  08ed  48               dec ax                                   
  08ee  6bc070           imul ax, ax, 0x70                        
  08f1  c41e8a3f         les bx, ptr [0x3f8a]                     
  08f5  03d8             add bx, ax                               
  08f7  03de             add bx, si                               
  08f9  26c687216103     mov byte ptr es:[bx + 0x6121], 3         
  08ff  8bc7             mov ax, di                               
  0901  48               dec ax                                   
  0902  e94601           jmp 0xa4b                                
  0905  8bc7             mov ax, di                               
  0907  40               inc ax                                   
  0908  6bc070           imul ax, ax, 0x70                        
  090b  c41e8a3f         les bx, ptr [0x3f8a]                     
  090f  03d8             add bx, ax                               
  0911  03de             add bx, si                               
  0913  26c6871f6103     mov byte ptr es:[bx + 0x611f], 3         
  0919  8bc7             mov ax, di                               
  091b  40               inc ax                                   
  091c  50               push ax                                  
  091d  8bc6             mov ax, si                               
  091f  48               dec ax                                   
  0920  e92c01           jmp 0xa4f                                
  0923  8bc7             mov ax, di                               
  0925  40               inc ax                                   
  0926  6bc070           imul ax, ax, 0x70                        
  0929  c41e8a3f         les bx, ptr [0x3f8a]                     
  092d  03d8             add bx, ax                               
  092f  03de             add bx, si                               
  0931  2680bf1f6102     cmp byte ptr es:[bx + 0x611f], 2         
  0937  7419             je 0x952                                 
  0939  8bc7             mov ax, di                               
  093b  40               inc ax                                   
  093c  6bc070           imul ax, ax, 0x70                        
  093f  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0943  03d8             add bx, ax                               
  0945  03de             add bx, si                               
  0947  2680bf1f6103     cmp byte ptr es:[bx + 0x611f], 3         
  094d  7403             je 0x952                                 
  094f  e90601           jmp 0xa58                                
  0952  8bc7             mov ax, di                               
  0954  48               dec ax                                   
  0955  6bc070           imul ax, ax, 0x70                        
  0958  c41e8a3f         les bx, ptr [0x3f8a]                     
  095c  03d8             add bx, ax                               
  095e  03de             add bx, si                               
  0960  2680bf216102     cmp byte ptr es:[bx + 0x6121], 2         
  0966  7419             je 0x981                                 
  0968  8bc7             mov ax, di                               
  096a  48               dec ax                                   
  096b  6bc070           imul ax, ax, 0x70                        
  096e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0972  03d8             add bx, ax                               
  0974  03de             add bx, si                               
  0976  2680bf216103     cmp byte ptr es:[bx + 0x6121], 3         
  097c  7403             je 0x981                                 
  097e  e9d700           jmp 0xa58                                
  0981  8bc7             mov ax, di                               
  0983  48               dec ax                                   
  0984  6bc070           imul ax, ax, 0x70                        
  0987  c41e8a3f         les bx, ptr [0x3f8a]                     
  098b  03d8             add bx, ax                               
  098d  03de             add bx, si                               
  098f  2680bf1f6105     cmp byte ptr es:[bx + 0x611f], 5         
  0995  742f             je 0x9c6                                 
  0997  8bc7             mov ax, di                               
  0999  48               dec ax                                   
  099a  6bc070           imul ax, ax, 0x70                        
  099d  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  09a1  03d8             add bx, ax                               
  09a3  03de             add bx, si                               
  09a5  2680bf1f6104     cmp byte ptr es:[bx + 0x611f], 4         
  09ab  7419             je 0x9c6                                 
  09ad  8bc7             mov ax, di                               
  09af  48               dec ax                                   
  09b0  6bc070           imul ax, ax, 0x70                        
  09b3  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  09b7  03d8             add bx, ax                               
  09b9  03de             add bx, si                               
  09bb  2680bf1f6107     cmp byte ptr es:[bx + 0x611f], 7         
  09c1  7403             je 0x9c6                                 
  09c3  e99200           jmp 0xa58                                
  09c6  8bc7             mov ax, di                               
  09c8  40               inc ax                                   
  09c9  6bc070           imul ax, ax, 0x70                        
  09cc  c41e8a3f         les bx, ptr [0x3f8a]                     
  09d0  03d8             add bx, ax                               
  09d2  03de             add bx, si                               
  09d4  2680bf216105     cmp byte ptr es:[bx + 0x6121], 5         
  09da  742c             je 0xa08                                 
  09dc  8bc7             mov ax, di                               
  09de  40               inc ax                                   
  09df  6bc070           imul ax, ax, 0x70                        
  09e2  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  09e6  03d8             add bx, ax                               
  09e8  03de             add bx, si                               
  09ea  2680bf216104     cmp byte ptr es:[bx + 0x6121], 4         
  09f0  7416             je 0xa08                                 
  09f2  8bc7             mov ax, di                               
  09f4  40               inc ax                                   
  09f5  6bc070           imul ax, ax, 0x70                        
  09f8  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  09fc  03d8             add bx, ax                               
  09fe  03de             add bx, si                               
  0a00  2680bf216107     cmp byte ptr es:[bx + 0x6121], 7         
  0a06  7550             jne 0xa58                                
  0a08  666a0a           push 0xa                                 
  0a0b  6a01             push 1                                   
  0a0d  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0a12  83c406           add sp, 6                                
  0a15  3d0500           cmp ax, 5                                
  0a18  7d1a             jge 0xa34                                
  0a1a  8bc7             mov ax, di                               
  0a1c  48               dec ax                                   
  0a1d  6bc070           imul ax, ax, 0x70                        
  0a20  c41e8a3f         les bx, ptr [0x3f8a]                     
  0a24  03d8             add bx, ax                               
  0a26  03de             add bx, si                               
  0a28  26c6871f6103     mov byte ptr es:[bx + 0x611f], 3         
  0a2e  8bc7             mov ax, di                               
  0a30  48               dec ax                                   
  0a31  e9e8fe           jmp 0x91c                                
  0a34  8bc7             mov ax, di                               
  0a36  40               inc ax                                   
  0a37  6bc070           imul ax, ax, 0x70                        
  0a3a  c41e8a3f         les bx, ptr [0x3f8a]                     
  0a3e  03d8             add bx, ax                               
  0a40  03de             add bx, si                               
  0a42  26c687216103     mov byte ptr es:[bx + 0x6121], 3         
  0a48  8bc7             mov ax, di                               
  0a4a  40               inc ax                                   
  0a4b  50               push ax                                  
  0a4c  8bc6             mov ax, si                               
  0a4e  40               inc ax                                   
  0a4f  50               push ax                                  
  0a50  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0a55  83c404           add sp, 4                                
  0a58  47               inc di                                   
  0a59  81ff9b00         cmp di, 0x9b                             
  0a5d  7d03             jge 0xa62                                
  0a5f  e965fd           jmp 0x7c7                                
  0a62  46               inc si                                   
  0a63  83fe6f           cmp si, 0x6f                             
  0a66  7d03             jge 0xa6b                                
  0a68  e956fd           jmp 0x7c1                                
  0a6b  5f               pop di                                   
  0a6c  5e               pop si                                   
  0a6d  5d               pop bp                                   
  0a6e  cb               retf                                     
