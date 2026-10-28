; ovl07 stub 2f7c file_off 0x41dc0 size 0x686

ovl07_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  33f6             xor si, si                               
  0006  eb09             jmp 0x11                                 
  0008  6a00             push 0                                   
  000a  90               nop                                      
  000b  0e               push cs                                  
  000c  e83500           call 0x44                                
  000f  59               pop cx                                   
  0010  46               inc si                                   
  0011  c41e8a3f         les bx, ptr [0x3f8a]                     
  0015  26397740         cmp word ptr es:[bx + 0x40], si          
  0019  7fed             jg 8                                     
  001b  33f6             xor si, si                               
  001d  eb09             jmp 0x28                                 
  001f  6a01             push 1                                   
  0021  90               nop                                      
  0022  0e               push cs                                  
  0023  e81e00           call 0x44                                
  0026  59               pop cx                                   
  0027  46               inc si                                   
  0028  c41e8a3f         les bx, ptr [0x3f8a]                     
  002c  2639773e         cmp word ptr es:[bx + 0x3e], si          
  0030  7fed             jg 0x1f                                  
  0032  90               nop                                      
  0033  0e               push cs                                  
  0034  e89f04           call 0x4d6                               
  0037  90               nop                                      
  0038  0e               push cs                                  
  0039  e87205           call 0x5ae                               
  003c  9a25006f2f       lcall 0x2f6f, 0x25                       -> ovl04:033a
  0041  5e               pop si                                   
  0042  5d               pop bp                                   
  0043  cb               retf                                     

ovl07_0044:  ; ENTRY
  0044  55               push bp                                  
  0045  8bec             mov bp, sp                               
  0047  83ec16           sub sp, 0x16                             
  004a  56               push si                                  
  004b  57               push di                                  
  004c  66687000ffff     push 0xffff0070                          
  0052  6a01             push 1                                   
  0054  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0059  83c406           add sp, 6                                
  005c  8946fc           mov word ptr [bp - 4], ax                
  005f  66689c00ffff     push 0xffff009c                          
  0065  6a01             push 1                                   
  0067  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  006c  83c406           add sp, 6                                
  006f  8946fe           mov word ptr [bp - 2], ax                
  0072  66687000ffff     push 0xffff0070                          
  0078  6a01             push 1                                   
  007a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  007f  83c406           add sp, 6                                
  0082  8946f8           mov word ptr [bp - 8], ax                
  0085  66689c00ffff     push 0xffff009c                          
  008b  6a01             push 1                                   
  008d  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0092  83c406           add sp, 6                                
  0095  8946fa           mov word ptr [bp - 6], ax                
  0098  668b46fc         mov eax, dword ptr [bp - 4]              
  009c  668946f4         mov dword ptr [bp - 0xc], eax            
  00a0  8b46fc           mov ax, word ptr [bp - 4]                
  00a3  3b46f8           cmp ax, word ptr [bp - 8]                
  00a6  750d             jne 0xb5                                 
  00a8  8b46fe           mov ax, word ptr [bp - 2]                
  00ab  3b46fa           cmp ax, word ptr [bp - 6]                
  00ae  7505             jne 0xb5                                 
  00b0  b80100           mov ax, 1                                
  00b3  eb02             jmp 0xb7                                 
  00b5  33c0             xor ax, ax                               
  00b7  8946ea           mov word ptr [bp - 0x16], ax             
  00ba  e90c04           jmp 0x4c9                                
  00bd  16               push ss                                  
  00be  8d46f0           lea ax, [bp - 0x10]                      
  00c1  50               push ax                                  
  00c2  66ff76f8         push dword ptr [bp - 8]                  
  00c6  66ff76f4         push dword ptr [bp - 0xc]                
  00ca  9a2a00672f       lcall 0x2f67, 0x2a                       -> ovl03:0dd0
  00cf  83c40c           add sp, 0xc                              
  00d2  33d2             xor dx, dx                               
  00d4  b9ffff           mov cx, 0xffff                           
  00d7  eb22             jmp 0xfb                                 
  00d9  8bc2             mov ax, dx                               
  00db  c1e002           shl ax, 2                                
  00de  c41e8a3f         les bx, ptr [0x3f8a]                     
  00e2  03d8             add bx, ax                               
  00e4  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  00e9  3b46f0           cmp ax, word ptr [bp - 0x10]             
  00ec  750c             jne 0xfa                                 
  00ee  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  00f3  3b46f2           cmp ax, word ptr [bp - 0xe]              
  00f6  7502             jne 0xfa                                 
  00f8  8bca             mov cx, dx                               
  00fa  42               inc dx                                   
  00fb  83fa08           cmp dx, 8                                
  00fe  7cd9             jl 0xd9                                  
  0100  8bc1             mov ax, cx                               
  0102  40               inc ax                                   
  0103  bb0800           mov bx, 8                                
  0106  99               cdq                                      
  0107  f7fb             idiv bx                                  
  0109  8bf2             mov si, dx                               
  010b  8bc1             mov ax, cx                               
  010d  050700           add ax, 7                                
  0110  99               cdq                                      
  0111  f7fb             idiv bx                                  
  0113  8bfa             mov di, dx                               
  0115  837e0600         cmp word ptr [bp + 6], 0                 
  0119  7503             jne 0x11e                                
  011b  e9cc01           jmp 0x2ea                                
  011e  8b46f6           mov ax, word ptr [bp - 0xa]              
  0121  6bc070           imul ax, ax, 0x70                        
  0124  c41e8a3f         les bx, ptr [0x3f8a]                     
  0128  03d8             add bx, ax                               
  012a  035ef4           add bx, word ptr [bp - 0xc]              
  012d  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  0133  741a             je 0x14f                                 
  0135  8b46f6           mov ax, word ptr [bp - 0xa]              
  0138  6bc070           imul ax, ax, 0x70                        
  013b  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  013f  03d8             add bx, ax                               
  0141  035ef4           add bx, word ptr [bp - 0xc]              
  0144  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  014a  7403             je 0x14f                                 
  014c  e99b01           jmp 0x2ea                                
  014f  668b46f4         mov eax, dword ptr [bp - 0xc]            
  0153  668946ec         mov dword ptr [bp - 0x14], eax           
  0157  16               push ss                                  
  0158  8d46ee           lea ax, [bp - 0x12]                      
  015b  50               push ax                                  
  015c  16               push ss                                  
  015d  8d46ec           lea ax, [bp - 0x14]                      
  0160  50               push ax                                  
  0161  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0166  83c408           add sp, 8                                
  0169  8b46ee           mov ax, word ptr [bp - 0x12]             
  016c  6bc070           imul ax, ax, 0x70                        
  016f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0173  03d8             add bx, ax                               
  0175  035eec           add bx, word ptr [bp - 0x14]             
  0178  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  017e  66ff76ec         push dword ptr [bp - 0x14]               
  0182  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0187  83c404           add sp, 4                                
  018a  8bc6             mov ax, si                               
  018c  c1e002           shl ax, 2                                
  018f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0193  03d8             add bx, ax                               
  0195  8b46f4           mov ax, word ptr [bp - 0xc]              
  0198  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  019d  8946ec           mov word ptr [bp - 0x14], ax             
  01a0  8b46f6           mov ax, word ptr [bp - 0xa]              
  01a3  260387be00       add ax, word ptr es:[bx + 0xbe]          
  01a8  8946ee           mov word ptr [bp - 0x12], ax             
  01ab  16               push ss                                  
  01ac  8d46ee           lea ax, [bp - 0x12]                      
  01af  50               push ax                                  
  01b0  16               push ss                                  
  01b1  8d46ec           lea ax, [bp - 0x14]                      
  01b4  50               push ax                                  
  01b5  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  01ba  83c408           add sp, 8                                
  01bd  8b46ee           mov ax, word ptr [bp - 0x12]             
  01c0  6bc070           imul ax, ax, 0x70                        
  01c3  c41e8a3f         les bx, ptr [0x3f8a]                     
  01c7  03d8             add bx, ax                               
  01c9  035eec           add bx, word ptr [bp - 0x14]             
  01cc  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  01d2  66ff76ec         push dword ptr [bp - 0x14]               
  01d6  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  01db  83c404           add sp, 4                                
  01de  8bc7             mov ax, di                               
  01e0  c1e002           shl ax, 2                                
  01e3  c41e8a3f         les bx, ptr [0x3f8a]                     
  01e7  03d8             add bx, ax                               
  01e9  8b46f4           mov ax, word ptr [bp - 0xc]              
  01ec  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  01f1  8946ec           mov word ptr [bp - 0x14], ax             
  01f4  8b46f6           mov ax, word ptr [bp - 0xa]              
  01f7  260387be00       add ax, word ptr es:[bx + 0xbe]          
  01fc  8946ee           mov word ptr [bp - 0x12], ax             
  01ff  16               push ss                                  
  0200  8d46ee           lea ax, [bp - 0x12]                      
  0203  50               push ax                                  
  0204  16               push ss                                  
  0205  8d46ec           lea ax, [bp - 0x14]                      
  0208  50               push ax                                  
  0209  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  020e  83c408           add sp, 8                                
  0211  8b46ee           mov ax, word ptr [bp - 0x12]             
  0214  6bc070           imul ax, ax, 0x70                        
  0217  c41e8a3f         les bx, ptr [0x3f8a]                     
  021b  03d8             add bx, ax                               
  021d  035eec           add bx, word ptr [bp - 0x14]             
  0220  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  0226  66ff76ec         push dword ptr [bp - 0x14]               
  022a  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  022f  83c404           add sp, 4                                
  0232  8bc6             mov ax, si                               
  0234  c1e002           shl ax, 2                                
  0237  c41e8a3f         les bx, ptr [0x3f8a]                     
  023b  03d8             add bx, ax                               
  023d  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  0242  d1e0             shl ax, 1                                
  0244  8b56f4           mov dx, word ptr [bp - 0xc]              
  0247  03d0             add dx, ax                               
  0249  8956ec           mov word ptr [bp - 0x14], dx             
  024c  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  0251  d1e0             shl ax, 1                                
  0253  8b56f6           mov dx, word ptr [bp - 0xa]              
  0256  03d0             add dx, ax                               
  0258  8956ee           mov word ptr [bp - 0x12], dx             
  025b  16               push ss                                  
  025c  8d46ee           lea ax, [bp - 0x12]                      
  025f  50               push ax                                  
  0260  16               push ss                                  
  0261  8d46ec           lea ax, [bp - 0x14]                      
  0264  50               push ax                                  
  0265  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  026a  83c408           add sp, 8                                
  026d  8b46ee           mov ax, word ptr [bp - 0x12]             
  0270  6bc070           imul ax, ax, 0x70                        
  0273  c41e8a3f         les bx, ptr [0x3f8a]                     
  0277  03d8             add bx, ax                               
  0279  035eec           add bx, word ptr [bp - 0x14]             
  027c  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  0282  66ff76ec         push dword ptr [bp - 0x14]               
  0286  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  028b  83c404           add sp, 4                                
  028e  8bc7             mov ax, di                               
  0290  c1e002           shl ax, 2                                
  0293  c41e8a3f         les bx, ptr [0x3f8a]                     
  0297  03d8             add bx, ax                               
  0299  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  029e  d1e0             shl ax, 1                                
  02a0  8b56f4           mov dx, word ptr [bp - 0xc]              
  02a3  03d0             add dx, ax                               
  02a5  8956ec           mov word ptr [bp - 0x14], dx             
  02a8  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  02ad  d1e0             shl ax, 1                                
  02af  8b56f6           mov dx, word ptr [bp - 0xa]              
  02b2  03d0             add dx, ax                               
  02b4  8956ee           mov word ptr [bp - 0x12], dx             
  02b7  16               push ss                                  
  02b8  8d46ee           lea ax, [bp - 0x12]                      
  02bb  50               push ax                                  
  02bc  16               push ss                                  
  02bd  8d46ec           lea ax, [bp - 0x14]                      
  02c0  50               push ax                                  
  02c1  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  02c6  83c408           add sp, 8                                
  02c9  8b46ee           mov ax, word ptr [bp - 0x12]             
  02cc  6bc070           imul ax, ax, 0x70                        
  02cf  c41e8a3f         les bx, ptr [0x3f8a]                     
  02d3  03d8             add bx, ax                               
  02d5  035eec           add bx, word ptr [bp - 0x14]             
  02d8  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  02de  66ff76ec         push dword ptr [bp - 0x14]               
  02e2  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  02e7  83c404           add sp, 4                                
  02ea  837e0600         cmp word ptr [bp + 6], 0                 
  02ee  7403             je 0x2f3                                 
  02f0  e9b501           jmp 0x4a8                                
  02f3  8b46f6           mov ax, word ptr [bp - 0xa]              
  02f6  6bc070           imul ax, ax, 0x70                        
  02f9  c41e8a3f         les bx, ptr [0x3f8a]                     
  02fd  03d8             add bx, ax                               
  02ff  035ef4           add bx, word ptr [bp - 0xc]              
  0302  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  0308  7403             je 0x30d                                 
  030a  e99b01           jmp 0x4a8                                
  030d  668b46f4         mov eax, dword ptr [bp - 0xc]            
  0311  668946ec         mov dword ptr [bp - 0x14], eax           
  0315  16               push ss                                  
  0316  8d46ee           lea ax, [bp - 0x12]                      
  0319  50               push ax                                  
  031a  16               push ss                                  
  031b  8d46ec           lea ax, [bp - 0x14]                      
  031e  50               push ax                                  
  031f  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0324  83c408           add sp, 8                                
  0327  8b46ee           mov ax, word ptr [bp - 0x12]             
  032a  6bc070           imul ax, ax, 0x70                        
  032d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0331  03d8             add bx, ax                               
  0333  035eec           add bx, word ptr [bp - 0x14]             
  0336  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  033c  66ff76ec         push dword ptr [bp - 0x14]               
  0340  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0345  83c404           add sp, 4                                
  0348  8bc6             mov ax, si                               
  034a  c1e002           shl ax, 2                                
  034d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0351  03d8             add bx, ax                               
  0353  8b46f4           mov ax, word ptr [bp - 0xc]              
  0356  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  035b  8946ec           mov word ptr [bp - 0x14], ax             
  035e  8b46f6           mov ax, word ptr [bp - 0xa]              
  0361  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0366  8946ee           mov word ptr [bp - 0x12], ax             
  0369  16               push ss                                  
  036a  8d46ee           lea ax, [bp - 0x12]                      
  036d  50               push ax                                  
  036e  16               push ss                                  
  036f  8d46ec           lea ax, [bp - 0x14]                      
  0372  50               push ax                                  
  0373  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0378  83c408           add sp, 8                                
  037b  8b46ee           mov ax, word ptr [bp - 0x12]             
  037e  6bc070           imul ax, ax, 0x70                        
  0381  c41e8a3f         les bx, ptr [0x3f8a]                     
  0385  03d8             add bx, ax                               
  0387  035eec           add bx, word ptr [bp - 0x14]             
  038a  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  0390  66ff76ec         push dword ptr [bp - 0x14]               
  0394  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0399  83c404           add sp, 4                                
  039c  8bc7             mov ax, di                               
  039e  c1e002           shl ax, 2                                
  03a1  c41e8a3f         les bx, ptr [0x3f8a]                     
  03a5  03d8             add bx, ax                               
  03a7  8b46f4           mov ax, word ptr [bp - 0xc]              
  03aa  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  03af  8946ec           mov word ptr [bp - 0x14], ax             
  03b2  8b46f6           mov ax, word ptr [bp - 0xa]              
  03b5  260387be00       add ax, word ptr es:[bx + 0xbe]          
  03ba  8946ee           mov word ptr [bp - 0x12], ax             
  03bd  16               push ss                                  
  03be  8d46ee           lea ax, [bp - 0x12]                      
  03c1  50               push ax                                  
  03c2  16               push ss                                  
  03c3  8d46ec           lea ax, [bp - 0x14]                      
  03c6  50               push ax                                  
  03c7  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  03cc  83c408           add sp, 8                                
  03cf  8b46ee           mov ax, word ptr [bp - 0x12]             
  03d2  6bc070           imul ax, ax, 0x70                        
  03d5  c41e8a3f         les bx, ptr [0x3f8a]                     
  03d9  03d8             add bx, ax                               
  03db  035eec           add bx, word ptr [bp - 0x14]             
  03de  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  03e4  66ff76ec         push dword ptr [bp - 0x14]               
  03e8  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  03ed  83c404           add sp, 4                                
  03f0  8bc6             mov ax, si                               
  03f2  c1e002           shl ax, 2                                
  03f5  c41e8a3f         les bx, ptr [0x3f8a]                     
  03f9  03d8             add bx, ax                               
  03fb  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  0400  d1e0             shl ax, 1                                
  0402  8b56f4           mov dx, word ptr [bp - 0xc]              
  0405  03d0             add dx, ax                               
  0407  8956ec           mov word ptr [bp - 0x14], dx             
  040a  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  040f  d1e0             shl ax, 1                                
  0411  8b56f6           mov dx, word ptr [bp - 0xa]              
  0414  03d0             add dx, ax                               
  0416  8956ee           mov word ptr [bp - 0x12], dx             
  0419  16               push ss                                  
  041a  8d46ee           lea ax, [bp - 0x12]                      
  041d  50               push ax                                  
  041e  16               push ss                                  
  041f  8d46ec           lea ax, [bp - 0x14]                      
  0422  50               push ax                                  
  0423  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0428  83c408           add sp, 8                                
  042b  8b46ee           mov ax, word ptr [bp - 0x12]             
  042e  6bc070           imul ax, ax, 0x70                        
  0431  c41e8a3f         les bx, ptr [0x3f8a]                     
  0435  03d8             add bx, ax                               
  0437  035eec           add bx, word ptr [bp - 0x14]             
  043a  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  0440  66ff76ec         push dword ptr [bp - 0x14]               
  0444  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0449  83c404           add sp, 4                                
  044c  8bc7             mov ax, di                               
  044e  c1e002           shl ax, 2                                
  0451  c41e8a3f         les bx, ptr [0x3f8a]                     
  0455  03d8             add bx, ax                               
  0457  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  045c  d1e0             shl ax, 1                                
  045e  8b56f4           mov dx, word ptr [bp - 0xc]              
  0461  03d0             add dx, ax                               
  0463  8956ec           mov word ptr [bp - 0x14], dx             
  0466  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  046b  d1e0             shl ax, 1                                
  046d  8b56f6           mov dx, word ptr [bp - 0xa]              
  0470  03d0             add dx, ax                               
  0472  8956ee           mov word ptr [bp - 0x12], dx             
  0475  16               push ss                                  
  0476  8d46ee           lea ax, [bp - 0x12]                      
  0479  50               push ax                                  
  047a  16               push ss                                  
  047b  8d46ec           lea ax, [bp - 0x14]                      
  047e  50               push ax                                  
  047f  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0484  83c408           add sp, 8                                
  0487  8b46ee           mov ax, word ptr [bp - 0x12]             
  048a  6bc070           imul ax, ax, 0x70                        
  048d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0491  03d8             add bx, ax                               
  0493  035eec           add bx, word ptr [bp - 0x14]             
  0496  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  049c  66ff76ec         push dword ptr [bp - 0x14]               
  04a0  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  04a5  83c404           add sp, 4                                
  04a8  8b46f0           mov ax, word ptr [bp - 0x10]             
  04ab  0146f4           add word ptr [bp - 0xc], ax              
  04ae  8b46f2           mov ax, word ptr [bp - 0xe]              
  04b1  0146f6           add word ptr [bp - 0xa], ax              
  04b4  8b46f4           mov ax, word ptr [bp - 0xc]              
  04b7  3b46f8           cmp ax, word ptr [bp - 8]                
  04ba  750d             jne 0x4c9                                
  04bc  8b46f6           mov ax, word ptr [bp - 0xa]              
  04bf  3b46fa           cmp ax, word ptr [bp - 6]                
  04c2  7505             jne 0x4c9                                
  04c4  c746ea0100       mov word ptr [bp - 0x16], 1              
  04c9  837eea00         cmp word ptr [bp - 0x16], 0              
  04cd  7503             jne 0x4d2                                
  04cf  e9ebfb           jmp 0xbd                                 
  04d2  5f               pop di                                   
  04d3  5e               pop si                                   
  04d4  c9               leave                                    
  04d5  cb               retf                                     

ovl07_04d6:  ; ENTRY
  04d6  55               push bp                                  
  04d7  8bec             mov bp, sp                               
  04d9  56               push si                                  
  04da  57               push di                                  
  04db  33f6             xor si, si                               
  04dd  e9c200           jmp 0x5a2                                
  04e0  33ff             xor di, di                               
  04e2  e9b300           jmp 0x598                                
  04e5  33d2             xor dx, dx                               
  04e7  0bf6             or si, si                                
  04e9  7503             jne 0x4ee                                
  04eb  e9a900           jmp 0x597                                
  04ee  0bff             or di, di                                
  04f0  7503             jne 0x4f5                                
  04f2  e9a200           jmp 0x597                                
  04f5  83fe6f           cmp si, 0x6f                             
  04f8  7503             jne 0x4fd                                
  04fa  e99a00           jmp 0x597                                
  04fd  81ff9b00         cmp di, 0x9b                             
  0501  7503             jne 0x506                                
  0503  e99100           jmp 0x597                                
  0506  8bc7             mov ax, di                               
  0508  6bc070           imul ax, ax, 0x70                        
  050b  c41e8a3f         les bx, ptr [0x3f8a]                     
  050f  03d8             add bx, ax                               
  0511  03de             add bx, si                               
  0513  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0519  757c             jne 0x597                                
  051b  8bc7             mov ax, di                               
  051d  40               inc ax                                   
  051e  6bc070           imul ax, ax, 0x70                        
  0521  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0525  03d8             add bx, ax                               
  0527  03de             add bx, si                               
  0529  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  052f  7501             jne 0x532                                
  0531  42               inc dx                                   
  0532  8bc7             mov ax, di                               
  0534  48               dec ax                                   
  0535  6bc070           imul ax, ax, 0x70                        
  0538  c41e8a3f         les bx, ptr [0x3f8a]                     
  053c  03d8             add bx, ax                               
  053e  03de             add bx, si                               
  0540  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  0546  7501             jne 0x549                                
  0548  42               inc dx                                   
  0549  8bc7             mov ax, di                               
  054b  6bc070           imul ax, ax, 0x70                        
  054e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0552  03d8             add bx, ax                               
  0554  03de             add bx, si                               
  0556  2680bf216106     cmp byte ptr es:[bx + 0x6121], 6         
  055c  7501             jne 0x55f                                
  055e  42               inc dx                                   
  055f  8bc7             mov ax, di                               
  0561  6bc070           imul ax, ax, 0x70                        
  0564  c41e8a3f         les bx, ptr [0x3f8a]                     
  0568  03d8             add bx, ax                               
  056a  03de             add bx, si                               
  056c  2680bf1f6106     cmp byte ptr es:[bx + 0x611f], 6         
  0572  7501             jne 0x575                                
  0574  42               inc dx                                   
  0575  83fa03           cmp dx, 3                                
  0578  7c1d             jl 0x597                                 
  057a  8bc7             mov ax, di                               
  057c  6bc070           imul ax, ax, 0x70                        
  057f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0583  03d8             add bx, ax                               
  0585  03de             add bx, si                               
  0587  26c687206106     mov byte ptr es:[bx + 0x6120], 6         
  058d  57               push di                                  
  058e  56               push si                                  
  058f  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0594  83c404           add sp, 4                                
  0597  47               inc di                                   
  0598  81ff9c00         cmp di, 0x9c                             
  059c  7d03             jge 0x5a1                                
  059e  e944ff           jmp 0x4e5                                
  05a1  46               inc si                                   
  05a2  83fe70           cmp si, 0x70                             
  05a5  7d03             jge 0x5aa                                
  05a7  e936ff           jmp 0x4e0                                
  05aa  5f               pop di                                   
  05ab  5e               pop si                                   
  05ac  5d               pop bp                                   
  05ad  cb               retf                                     

ovl07_05ae:  ; ENTRY
  05ae  55               push bp                                  
  05af  8bec             mov bp, sp                               
  05b1  56               push si                                  
  05b2  57               push di                                  
  05b3  33f6             xor si, si                               
  05b5  e9c200           jmp 0x67a                                
  05b8  33ff             xor di, di                               
  05ba  e9b300           jmp 0x670                                
  05bd  33d2             xor dx, dx                               
  05bf  0bf6             or si, si                                
  05c1  7503             jne 0x5c6                                
  05c3  e9a900           jmp 0x66f                                
  05c6  0bff             or di, di                                
  05c8  7503             jne 0x5cd                                
  05ca  e9a200           jmp 0x66f                                
  05cd  83fe6f           cmp si, 0x6f                             
  05d0  7503             jne 0x5d5                                
  05d2  e99a00           jmp 0x66f                                
  05d5  81ff9b00         cmp di, 0x9b                             
  05d9  7503             jne 0x5de                                
  05db  e99100           jmp 0x66f                                
  05de  8bc7             mov ax, di                               
  05e0  6bc070           imul ax, ax, 0x70                        
  05e3  c41e8a3f         les bx, ptr [0x3f8a]                     
  05e7  03d8             add bx, ax                               
  05e9  03de             add bx, si                               
  05eb  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  05f1  757c             jne 0x66f                                
  05f3  8bc7             mov ax, di                               
  05f5  40               inc ax                                   
  05f6  6bc070           imul ax, ax, 0x70                        
  05f9  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  05fd  03d8             add bx, ax                               
  05ff  03de             add bx, si                               
  0601  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0607  7501             jne 0x60a                                
  0609  42               inc dx                                   
  060a  8bc7             mov ax, di                               
  060c  48               dec ax                                   
  060d  6bc070           imul ax, ax, 0x70                        
  0610  c41e8a3f         les bx, ptr [0x3f8a]                     
  0614  03d8             add bx, ax                               
  0616  03de             add bx, si                               
  0618  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  061e  7501             jne 0x621                                
  0620  42               inc dx                                   
  0621  8bc7             mov ax, di                               
  0623  6bc070           imul ax, ax, 0x70                        
  0626  c41e8a3f         les bx, ptr [0x3f8a]                     
  062a  03d8             add bx, ax                               
  062c  03de             add bx, si                               
  062e  2680bf216105     cmp byte ptr es:[bx + 0x6121], 5         
  0634  7501             jne 0x637                                
  0636  42               inc dx                                   
  0637  8bc7             mov ax, di                               
  0639  6bc070           imul ax, ax, 0x70                        
  063c  c41e8a3f         les bx, ptr [0x3f8a]                     
  0640  03d8             add bx, ax                               
  0642  03de             add bx, si                               
  0644  2680bf1f6105     cmp byte ptr es:[bx + 0x611f], 5         
  064a  7501             jne 0x64d                                
  064c  42               inc dx                                   
  064d  83fa03           cmp dx, 3                                
  0650  7c1d             jl 0x66f                                 
  0652  8bc7             mov ax, di                               
  0654  6bc070           imul ax, ax, 0x70                        
  0657  c41e8a3f         les bx, ptr [0x3f8a]                     
  065b  03d8             add bx, ax                               
  065d  03de             add bx, si                               
  065f  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  0665  57               push di                                  
  0666  56               push si                                  
  0667  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  066c  83c404           add sp, 4                                
  066f  47               inc di                                   
  0670  81ff9c00         cmp di, 0x9c                             
  0674  7d03             jge 0x679                                
  0676  e944ff           jmp 0x5bd                                
  0679  46               inc si                                   
  067a  83fe70           cmp si, 0x70                             
  067d  7d03             jge 0x682                                
  067f  e936ff           jmp 0x5b8                                
  0682  5f               pop di                                   
  0683  5e               pop si                                   
  0684  5d               pop bp                                   
  0685  cb               retf                                     
