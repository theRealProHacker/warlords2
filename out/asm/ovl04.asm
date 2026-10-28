; ovl04 stub 2f6f file_off 0x3fe20 size 0xd43

ovl04_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  c41e8a3f         les bx, ptr [0x3f8a]                     
  0007  26c7871e610000   mov word ptr es:[bx + 0x611e], 0         
  000e  90               nop                                      
  000f  0e               push cs                                  
  0010  e88204           call 0x495                               
  0013  90               nop                                      
  0014  0e               push cs                                  
  0015  e89703           call 0x3af                               
  0018  90               nop                                      
  0019  0e               push cs                                  
  001a  e85e05           call 0x57b                               
  001d  90               nop                                      
  001e  0e               push cs                                  
  001f  e8b006           call 0x6d2                               
  0022  90               nop                                      
  0023  0e               push cs                                  
  0024  e80700           call 0x2e                                
  0027  90               nop                                      
  0028  0e               push cs                                  
  0029  e80e03           call 0x33a                               
  002c  5d               pop bp                                   
  002d  cb               retf                                     

ovl04_002e:  ; ENTRY
  002e  55               push bp                                  
  002f  8bec             mov bp, sp                               
  0031  56               push si                                  
  0032  57               push di                                  
  0033  33f6             xor si, si                               
  0035  e96f01           jmp 0x1a7                                
  0038  33ff             xor di, di                               
  003a  e96001           jmp 0x19d                                
  003d  0bf6             or si, si                                
  003f  7503             jne 0x44                                 
  0041  e91601           jmp 0x15a                                
  0044  0bff             or di, di                                
  0046  7503             jne 0x4b                                 
  0048  e90f01           jmp 0x15a                                
  004b  83fe6f           cmp si, 0x6f                             
  004e  7503             jne 0x53                                 
  0050  e90701           jmp 0x15a                                
  0053  81ff9b00         cmp di, 0x9b                             
  0057  7503             jne 0x5c                                 
  0059  e9fe00           jmp 0x15a                                
  005c  8bc7             mov ax, di                               
  005e  6bc070           imul ax, ax, 0x70                        
  0061  c41e8a3f         les bx, ptr [0x3f8a]                     
  0065  03d8             add bx, ax                               
  0067  03de             add bx, si                               
  0069  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  006f  7403             je 0x74                                  
  0071  e9e600           jmp 0x15a                                
  0074  8bc7             mov ax, di                               
  0076  40               inc ax                                   
  0077  6bc070           imul ax, ax, 0x70                        
  007a  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  007e  03d8             add bx, ax                               
  0080  03de             add bx, si                               
  0082  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  0088  755d             jne 0xe7                                 
  008a  8bc7             mov ax, di                               
  008c  6bc070           imul ax, ax, 0x70                        
  008f  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0093  03d8             add bx, ax                               
  0095  03de             add bx, si                               
  0097  2680bf216106     cmp byte ptr es:[bx + 0x6121], 6         
  009d  7548             jne 0xe7                                 
  009f  8bc7             mov ax, di                               
  00a1  6bc070           imul ax, ax, 0x70                        
  00a4  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00a8  03d8             add bx, ax                               
  00aa  03de             add bx, si                               
  00ac  2680bf1f6106     cmp byte ptr es:[bx + 0x611f], 6         
  00b2  7533             jne 0xe7                                 
  00b4  8bc7             mov ax, di                               
  00b6  48               dec ax                                   
  00b7  6bc070           imul ax, ax, 0x70                        
  00ba  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00be  03d8             add bx, ax                               
  00c0  03de             add bx, si                               
  00c2  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  00c8  751d             jne 0xe7                                 
  00ca  8bc7             mov ax, di                               
  00cc  6bc070           imul ax, ax, 0x70                        
  00cf  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00d3  03d8             add bx, ax                               
  00d5  03de             add bx, si                               
  00d7  26c687206106     mov byte ptr es:[bx + 0x6120], 6         
  00dd  57               push di                                  
  00de  56               push si                                  
  00df  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  00e4  83c404           add sp, 4                                
  00e7  8bc7             mov ax, di                               
  00e9  40               inc ax                                   
  00ea  6bc070           imul ax, ax, 0x70                        
  00ed  c41e8a3f         les bx, ptr [0x3f8a]                     
  00f1  03d8             add bx, ax                               
  00f3  03de             add bx, si                               
  00f5  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  00fb  755d             jne 0x15a                                
  00fd  8bc7             mov ax, di                               
  00ff  6bc070           imul ax, ax, 0x70                        
  0102  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0106  03d8             add bx, ax                               
  0108  03de             add bx, si                               
  010a  2680bf216105     cmp byte ptr es:[bx + 0x6121], 5         
  0110  7548             jne 0x15a                                
  0112  8bc7             mov ax, di                               
  0114  6bc070           imul ax, ax, 0x70                        
  0117  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  011b  03d8             add bx, ax                               
  011d  03de             add bx, si                               
  011f  2680bf1f6105     cmp byte ptr es:[bx + 0x611f], 5         
  0125  7533             jne 0x15a                                
  0127  8bc7             mov ax, di                               
  0129  48               dec ax                                   
  012a  6bc070           imul ax, ax, 0x70                        
  012d  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0131  03d8             add bx, ax                               
  0133  03de             add bx, si                               
  0135  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  013b  751d             jne 0x15a                                
  013d  8bc7             mov ax, di                               
  013f  6bc070           imul ax, ax, 0x70                        
  0142  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0146  03d8             add bx, ax                               
  0148  03de             add bx, si                               
  014a  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  0150  57               push di                                  
  0151  56               push si                                  
  0152  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0157  83c404           add sp, 4                                
  015a  8bc7             mov ax, di                               
  015c  6bc070           imul ax, ax, 0x70                        
  015f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0163  03d8             add bx, ax                               
  0165  03de             add bx, si                               
  0167  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  016d  752d             jne 0x19c                                
  016f  6a03             push 3                                   
  0171  57               push di                                  
  0172  56               push si                                  
  0173  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0178  83c406           add sp, 6                                
  017b  0bc0             or ax, ax                                
  017d  741d             je 0x19c                                 
  017f  8bc7             mov ax, di                               
  0181  6bc070           imul ax, ax, 0x70                        
  0184  c41e8a3f         les bx, ptr [0x3f8a]                     
  0188  03d8             add bx, ax                               
  018a  03de             add bx, si                               
  018c  26c687206107     mov byte ptr es:[bx + 0x6120], 7         
  0192  57               push di                                  
  0193  56               push si                                  
  0194  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0199  83c404           add sp, 4                                
  019c  47               inc di                                   
  019d  81ff9c00         cmp di, 0x9c                             
  01a1  7d03             jge 0x1a6                                
  01a3  e997fe           jmp 0x3d                                 
  01a6  46               inc si                                   
  01a7  83fe70           cmp si, 0x70                             
  01aa  7d03             jge 0x1af                                
  01ac  e989fe           jmp 0x38                                 
  01af  be0100           mov si, 1                                
  01b2  e97901           jmp 0x32e                                
  01b5  bf0100           mov di, 1                                
  01b8  e96901           jmp 0x324                                
  01bb  8bc7             mov ax, di                               
  01bd  6bc070           imul ax, ax, 0x70                        
  01c0  c41e8a3f         les bx, ptr [0x3f8a]                     
  01c4  03d8             add bx, ax                               
  01c6  03de             add bx, si                               
  01c8  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  01ce  7403             je 0x1d3                                 
  01d0  e95001           jmp 0x323                                
  01d3  8bc7             mov ax, di                               
  01d5  40               inc ax                                   
  01d6  6bc070           imul ax, ax, 0x70                        
  01d9  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  01dd  03d8             add bx, ax                               
  01df  03de             add bx, si                               
  01e1  2680bf216106     cmp byte ptr es:[bx + 0x6121], 6         
  01e7  7403             je 0x1ec                                 
  01e9  e98c00           jmp 0x278                                
  01ec  8bc7             mov ax, di                               
  01ee  48               dec ax                                   
  01ef  6bc070           imul ax, ax, 0x70                        
  01f2  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  01f6  03d8             add bx, ax                               
  01f8  03de             add bx, si                               
  01fa  2680bf1f6106     cmp byte ptr es:[bx + 0x611f], 6         
  0200  7576             jne 0x278                                
  0202  8bc7             mov ax, di                               
  0204  48               dec ax                                   
  0205  6bc070           imul ax, ax, 0x70                        
  0208  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  020c  03d8             add bx, ax                               
  020e  03de             add bx, si                               
  0210  2680bf216106     cmp byte ptr es:[bx + 0x6121], 6         
  0216  7460             je 0x278                                 
  0218  8bc7             mov ax, di                               
  021a  40               inc ax                                   
  021b  6bc070           imul ax, ax, 0x70                        
  021e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0222  03d8             add bx, ax                               
  0224  03de             add bx, si                               
  0226  2680bf1f6106     cmp byte ptr es:[bx + 0x611f], 6         
  022c  744a             je 0x278                                 
  022e  666a0a           push 0xa                                 
  0231  6a01             push 1                                   
  0233  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0238  83c406           add sp, 6                                
  023b  3d0500           cmp ax, 5                                
  023e  7f1a             jg 0x25a                                 
  0240  8bc7             mov ax, di                               
  0242  48               dec ax                                   
  0243  6bc070           imul ax, ax, 0x70                        
  0246  c41e8a3f         les bx, ptr [0x3f8a]                     
  024a  03d8             add bx, ax                               
  024c  03de             add bx, si                               
  024e  26c687216106     mov byte ptr es:[bx + 0x6121], 6         
  0254  8bc7             mov ax, di                               
  0256  48               dec ax                                   
  0257  e9bc00           jmp 0x316                                
  025a  8bc7             mov ax, di                               
  025c  40               inc ax                                   
  025d  6bc070           imul ax, ax, 0x70                        
  0260  c41e8a3f         les bx, ptr [0x3f8a]                     
  0264  03d8             add bx, ax                               
  0266  03de             add bx, si                               
  0268  26c6871f6106     mov byte ptr es:[bx + 0x611f], 6         
  026e  8bc7             mov ax, di                               
  0270  40               inc ax                                   
  0271  50               push ax                                  
  0272  8bc6             mov ax, si                               
  0274  48               dec ax                                   
  0275  e9a200           jmp 0x31a                                
  0278  8bc7             mov ax, di                               
  027a  40               inc ax                                   
  027b  6bc070           imul ax, ax, 0x70                        
  027e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0282  03d8             add bx, ax                               
  0284  03de             add bx, si                               
  0286  2680bf1f6106     cmp byte ptr es:[bx + 0x611f], 6         
  028c  7403             je 0x291                                 
  028e  e99200           jmp 0x323                                
  0291  8bc7             mov ax, di                               
  0293  48               dec ax                                   
  0294  6bc070           imul ax, ax, 0x70                        
  0297  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  029b  03d8             add bx, ax                               
  029d  03de             add bx, si                               
  029f  2680bf216106     cmp byte ptr es:[bx + 0x6121], 6         
  02a5  757c             jne 0x323                                
  02a7  8bc7             mov ax, di                               
  02a9  48               dec ax                                   
  02aa  6bc070           imul ax, ax, 0x70                        
  02ad  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02b1  03d8             add bx, ax                               
  02b3  03de             add bx, si                               
  02b5  2680bf1f6106     cmp byte ptr es:[bx + 0x611f], 6         
  02bb  7466             je 0x323                                 
  02bd  8bc7             mov ax, di                               
  02bf  40               inc ax                                   
  02c0  6bc070           imul ax, ax, 0x70                        
  02c3  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02c7  03d8             add bx, ax                               
  02c9  03de             add bx, si                               
  02cb  2680bf216106     cmp byte ptr es:[bx + 0x6121], 6         
  02d1  7450             je 0x323                                 
  02d3  666a0a           push 0xa                                 
  02d6  6a01             push 1                                   
  02d8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  02dd  83c406           add sp, 6                                
  02e0  3d0500           cmp ax, 5                                
  02e3  7f1a             jg 0x2ff                                 
  02e5  8bc7             mov ax, di                               
  02e7  48               dec ax                                   
  02e8  6bc070           imul ax, ax, 0x70                        
  02eb  c41e8a3f         les bx, ptr [0x3f8a]                     
  02ef  03d8             add bx, ax                               
  02f1  03de             add bx, si                               
  02f3  26c6871f6106     mov byte ptr es:[bx + 0x611f], 6         
  02f9  8bc7             mov ax, di                               
  02fb  48               dec ax                                   
  02fc  e972ff           jmp 0x271                                
  02ff  8bc7             mov ax, di                               
  0301  40               inc ax                                   
  0302  6bc070           imul ax, ax, 0x70                        
  0305  c41e8a3f         les bx, ptr [0x3f8a]                     
  0309  03d8             add bx, ax                               
  030b  03de             add bx, si                               
  030d  26c687216106     mov byte ptr es:[bx + 0x6121], 6         
  0313  8bc7             mov ax, di                               
  0315  40               inc ax                                   
  0316  50               push ax                                  
  0317  8bc6             mov ax, si                               
  0319  40               inc ax                                   
  031a  50               push ax                                  
  031b  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0320  83c404           add sp, 4                                
  0323  47               inc di                                   
  0324  81ff9b00         cmp di, 0x9b                             
  0328  7d03             jge 0x32d                                
  032a  e98efe           jmp 0x1bb                                
  032d  46               inc si                                   
  032e  83fe6f           cmp si, 0x6f                             
  0331  7d03             jge 0x336                                
  0333  e97ffe           jmp 0x1b5                                
  0336  5f               pop di                                   
  0337  5e               pop si                                   
  0338  5d               pop bp                                   
  0339  cb               retf                                     

ovl04_033a:  ; ENTRY
  033a  55               push bp                                  
  033b  8bec             mov bp, sp                               
  033d  56               push si                                  
  033e  57               push di                                  
  033f  33f6             xor si, si                               
  0341  eb63             jmp 0x3a6                                
  0343  33ff             xor di, di                               
  0345  eb58             jmp 0x39f                                
  0347  8bc7             mov ax, di                               
  0349  6bc070           imul ax, ax, 0x70                        
  034c  c41e8a3f         les bx, ptr [0x3f8a]                     
  0350  03d8             add bx, ax                               
  0352  03de             add bx, si                               
  0354  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  035a  7442             je 0x39e                                 
  035c  8bc7             mov ax, di                               
  035e  6bc070           imul ax, ax, 0x70                        
  0361  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0365  03d8             add bx, ax                               
  0367  03de             add bx, si                               
  0369  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  036f  742d             je 0x39e                                 
  0371  6a06             push 6                                   
  0373  57               push di                                  
  0374  56               push si                                  
  0375  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  037a  83c406           add sp, 6                                
  037d  0bc0             or ax, ax                                
  037f  741d             je 0x39e                                 
  0381  8bc7             mov ax, di                               
  0383  6bc070           imul ax, ax, 0x70                        
  0386  c41e8a3f         les bx, ptr [0x3f8a]                     
  038a  03d8             add bx, ax                               
  038c  03de             add bx, si                               
  038e  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  0394  57               push di                                  
  0395  56               push si                                  
  0396  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  039b  83c404           add sp, 4                                
  039e  47               inc di                                   
  039f  81ff9c00         cmp di, 0x9c                             
  03a3  7ca2             jl 0x347                                 
  03a5  46               inc si                                   
  03a6  83fe70           cmp si, 0x70                             
  03a9  7c98             jl 0x343                                 
  03ab  5f               pop di                                   
  03ac  5e               pop si                                   
  03ad  5d               pop bp                                   
  03ae  cb               retf                                     

ovl04_03af:  ; ENTRY
  03af  55               push bp                                  
  03b0  8bec             mov bp, sp                               
  03b2  83ec04           sub sp, 4                                
  03b5  56               push si                                  
  03b6  57               push di                                  
  03b7  c746fe0000       mov word ptr [bp - 2], 0                 
  03bc  e9c200           jmp 0x481                                
  03bf  c746fc0000       mov word ptr [bp - 4], 0                 
  03c4  eb3c             jmp 0x402                                
  03c6  66687000ffff     push 0xffff0070                          
  03cc  6a01             push 1                                   
  03ce  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  03d3  83c406           add sp, 6                                
  03d6  8bf0             mov si, ax                               
  03d8  66689c00ffff     push 0xffff009c                          
  03de  6a01             push 1                                   
  03e0  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  03e5  83c406           add sp, 6                                
  03e8  8bf8             mov di, ax                               
  03ea  6bc070           imul ax, ax, 0x70                        
  03ed  c41e8a3f         les bx, ptr [0x3f8a]                     
  03f1  03d8             add bx, ax                               
  03f3  03de             add bx, si                               
  03f5  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  03fb  7505             jne 0x402                                
  03fd  c746fc0100       mov word ptr [bp - 4], 1                 
  0402  837efc00         cmp word ptr [bp - 4], 0                 
  0406  74be             je 0x3c6                                 
  0408  8bc7             mov ax, di                               
  040a  6bc070           imul ax, ax, 0x70                        
  040d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0411  03d8             add bx, ax                               
  0413  03de             add bx, si                               
  0415  26c687206105     mov byte ptr es:[bx + 0x6120], 5         
  041b  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  041f  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  0424  6bc00e           imul ax, ax, 0xe                         
  0427  03d8             add bx, ax                               
  0429  2689b7d65d       mov word ptr es:[bx + 0x5dd6], si        
  042e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0432  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  0437  6bc00e           imul ax, ax, 0xe                         
  043a  03d8             add bx, ax                               
  043c  2689bfd85d       mov word ptr es:[bx + 0x5dd8], di        
  0441  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0445  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  044a  6bc00e           imul ax, ax, 0xe                         
  044d  03d8             add bx, ax                               
  044f  26c787da5d0100   mov word ptr es:[bx + 0x5dda], 1         
  0456  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  045a  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  045f  6bc00e           imul ax, ax, 0xe                         
  0462  03d8             add bx, ax                               
  0464  26c787dc5d0000   mov word ptr es:[bx + 0x5ddc], 0         
  046b  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  046f  26ff871e61       inc word ptr es:[bx + 0x611e]            
  0474  57               push di                                  
  0475  56               push si                                  
  0476  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  047b  83c404           add sp, 4                                
  047e  ff46fe           inc word ptr [bp - 2]                    
  0481  c41e8a3f         les bx, ptr [0x3f8a]                     
  0485  268b4736         mov ax, word ptr es:[bx + 0x36]          
  0489  3b46fe           cmp ax, word ptr [bp - 2]                
  048c  7e03             jle 0x491                                
  048e  e92eff           jmp 0x3bf                                
  0491  5f               pop di                                   
  0492  5e               pop si                                   
  0493  c9               leave                                    
  0494  cb               retf                                     

ovl04_0495:  ; ENTRY
  0495  55               push bp                                  
  0496  8bec             mov bp, sp                               
  0498  83ec04           sub sp, 4                                
  049b  56               push si                                  
  049c  57               push di                                  
  049d  c746fe0000       mov word ptr [bp - 2], 0                 
  04a2  e9c200           jmp 0x567                                
  04a5  c746fc0000       mov word ptr [bp - 4], 0                 
  04aa  eb3c             jmp 0x4e8                                
  04ac  66687000ffff     push 0xffff0070                          
  04b2  6a01             push 1                                   
  04b4  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04b9  83c406           add sp, 6                                
  04bc  8bf0             mov si, ax                               
  04be  66689c00ffff     push 0xffff009c                          
  04c4  6a01             push 1                                   
  04c6  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  04cb  83c406           add sp, 6                                
  04ce  8bf8             mov di, ax                               
  04d0  6bc070           imul ax, ax, 0x70                        
  04d3  c41e8a3f         les bx, ptr [0x3f8a]                     
  04d7  03d8             add bx, ax                               
  04d9  03de             add bx, si                               
  04db  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  04e1  7505             jne 0x4e8                                
  04e3  c746fc0100       mov word ptr [bp - 4], 1                 
  04e8  837efc00         cmp word ptr [bp - 4], 0                 
  04ec  74be             je 0x4ac                                 
  04ee  8bc7             mov ax, di                               
  04f0  6bc070           imul ax, ax, 0x70                        
  04f3  c41e8a3f         les bx, ptr [0x3f8a]                     
  04f7  03d8             add bx, ax                               
  04f9  03de             add bx, si                               
  04fb  26c687206106     mov byte ptr es:[bx + 0x6120], 6         
  0501  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0505  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  050a  6bc00e           imul ax, ax, 0xe                         
  050d  03d8             add bx, ax                               
  050f  2689b7d65d       mov word ptr es:[bx + 0x5dd6], si        
  0514  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0518  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  051d  6bc00e           imul ax, ax, 0xe                         
  0520  03d8             add bx, ax                               
  0522  2689bfd85d       mov word ptr es:[bx + 0x5dd8], di        
  0527  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  052b  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  0530  6bc00e           imul ax, ax, 0xe                         
  0533  03d8             add bx, ax                               
  0535  26c787da5d0200   mov word ptr es:[bx + 0x5dda], 2         
  053c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0540  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  0545  6bc00e           imul ax, ax, 0xe                         
  0548  03d8             add bx, ax                               
  054a  26c787dc5d0000   mov word ptr es:[bx + 0x5ddc], 0         
  0551  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0555  26ff871e61       inc word ptr es:[bx + 0x611e]            
  055a  57               push di                                  
  055b  56               push si                                  
  055c  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0561  83c404           add sp, 4                                
  0564  ff46fe           inc word ptr [bp - 2]                    
  0567  c41e8a3f         les bx, ptr [0x3f8a]                     
  056b  268b4734         mov ax, word ptr es:[bx + 0x34]          
  056f  3b46fe           cmp ax, word ptr [bp - 2]                
  0572  7e03             jle 0x577                                
  0574  e92eff           jmp 0x4a5                                
  0577  5f               pop di                                   
  0578  5e               pop si                                   
  0579  c9               leave                                    
  057a  cb               retf                                     

ovl04_057b:  ; ENTRY
  057b  55               push bp                                  
  057c  8bec             mov bp, sp                               
  057e  83ec06           sub sp, 6                                
  0581  56               push si                                  
  0582  57               push di                                  
  0583  c41e8a3f         les bx, ptr [0x3f8a]                     
  0587  2683bf1e6101     cmp word ptr es:[bx + 0x611e], 1         
  058d  7f03             jg 0x592                                 
  058f  e93c01           jmp 0x6ce                                
  0592  33f6             xor si, si                               
  0594  e92901           jmp 0x6c0                                
  0597  8bc6             mov ax, si                               
  0599  6bc00e           imul ax, ax, 0xe                         
  059c  c41e8a3f         les bx, ptr [0x3f8a]                     
  05a0  03d8             add bx, ax                               
  05a2  2683bfda5d01     cmp word ptr es:[bx + 0x5dda], 1         
  05a8  7526             jne 0x5d0                                
  05aa  66680200ffff     push 0xffff0002                          
  05b0  6a01             push 1                                   
  05b2  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  05b7  83c406           add sp, 6                                
  05ba  8bd0             mov dx, ax                               
  05bc  c41e8a3f         les bx, ptr [0x3f8a]                     
  05c0  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  05c5  48               dec ax                                   
  05c6  3bc2             cmp ax, dx                               
  05c8  7e26             jle 0x5f0                                
  05ca  8bc2             mov ax, dx                               
  05cc  eb2c             jmp 0x5fa                                
  05ce  eb20             jmp 0x5f0                                
  05d0  66680400ffff     push 0xffff0004                          
  05d6  6a01             push 1                                   
  05d8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  05dd  83c406           add sp, 6                                
  05e0  8bd0             mov dx, ax                               
  05e2  c41e8a3f         les bx, ptr [0x3f8a]                     
  05e6  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  05eb  48               dec ax                                   
  05ec  3bc2             cmp ax, dx                               
  05ee  7fda             jg 0x5ca                                 
  05f0  c41e8a3f         les bx, ptr [0x3f8a]                     
  05f4  268b871e61       mov ax, word ptr es:[bx + 0x611e]        
  05f9  48               dec ax                                   
  05fa  8bd6             mov dx, si                               
  05fc  6bd20e           imul dx, dx, 0xe                         
  05ff  c41e8a3f         les bx, ptr [0x3f8a]                     
  0603  03da             add bx, dx                               
  0605  268987dc5d       mov word ptr es:[bx + 0x5ddc], ax        
  060a  c746fe0000       mov word ptr [bp - 2], 0                 
  060f  e99500           jmp 0x6a7                                
  0612  c746fc1027       mov word ptr [bp - 4], 0x2710            
  0617  c746faffff       mov word ptr [bp - 6], 0xffff            
  061c  33ff             xor di, di                               
  061e  eb63             jmp 0x683                                
  0620  3bfe             cmp di, si                               
  0622  745e             je 0x682                                 
  0624  33d2             xor dx, dx                               
  0626  eb19             jmp 0x641                                
  0628  8bc6             mov ax, si                               
  062a  6bc00e           imul ax, ax, 0xe                         
  062d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0631  03d8             add bx, ax                               
  0633  8bc2             mov ax, dx                               
  0635  d1e0             shl ax, 1                                
  0637  03d8             add bx, ax                               
  0639  2639bfde5d       cmp word ptr es:[bx + 0x5dde], di        
  063e  7406             je 0x646                                 
  0640  42               inc dx                                   
  0641  3b56fe           cmp dx, word ptr [bp - 2]                
  0644  7ce2             jl 0x628                                 
  0646  3b56fe           cmp dx, word ptr [bp - 2]                
  0649  7537             jne 0x682                                
  064b  8bc6             mov ax, si                               
  064d  6bc00e           imul ax, ax, 0xe                         
  0650  c41e8a3f         les bx, ptr [0x3f8a]                     
  0654  03d8             add bx, ax                               
  0656  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  065c  8bc7             mov ax, di                               
  065e  6bc00e           imul ax, ax, 0xe                         
  0661  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0665  03d8             add bx, ax                               
  0667  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  066d  9a2500672f       lcall 0x2f67, 0x25                       -> ovl03:0fed
  0672  83c408           add sp, 8                                
  0675  8bd0             mov dx, ax                               
  0677  3b56fc           cmp dx, word ptr [bp - 4]                
  067a  7d06             jge 0x682                                
  067c  8956fc           mov word ptr [bp - 4], dx                
  067f  897efa           mov word ptr [bp - 6], di                
  0682  47               inc di                                   
  0683  c41e8a3f         les bx, ptr [0x3f8a]                     
  0687  2639bf1e61       cmp word ptr es:[bx + 0x611e], di        
  068c  7f92             jg 0x620                                 
  068e  8bc6             mov ax, si                               
  0690  6bc00e           imul ax, ax, 0xe                         
  0693  03d8             add bx, ax                               
  0695  8b46fe           mov ax, word ptr [bp - 2]                
  0698  d1e0             shl ax, 1                                
  069a  03d8             add bx, ax                               
  069c  8b46fa           mov ax, word ptr [bp - 6]                
  069f  268987de5d       mov word ptr es:[bx + 0x5dde], ax        
  06a4  ff46fe           inc word ptr [bp - 2]                    
  06a7  8bc6             mov ax, si                               
  06a9  6bc00e           imul ax, ax, 0xe                         
  06ac  c41e8a3f         les bx, ptr [0x3f8a]                     
  06b0  03d8             add bx, ax                               
  06b2  268b87dc5d       mov ax, word ptr es:[bx + 0x5ddc]        
  06b7  3b46fe           cmp ax, word ptr [bp - 2]                
  06ba  7e03             jle 0x6bf                                
  06bc  e953ff           jmp 0x612                                
  06bf  46               inc si                                   
  06c0  c41e8a3f         les bx, ptr [0x3f8a]                     
  06c4  2639b71e61       cmp word ptr es:[bx + 0x611e], si        
  06c9  7e03             jle 0x6ce                                
  06cb  e9c9fe           jmp 0x597                                
  06ce  5f               pop di                                   
  06cf  5e               pop si                                   
  06d0  c9               leave                                    
  06d1  cb               retf                                     

ovl04_06d2:  ; ENTRY
  06d2  55               push bp                                  
  06d3  8bec             mov bp, sp                               
  06d5  56               push si                                  
  06d6  57               push di                                  
  06d7  c41e8a3f         les bx, ptr [0x3f8a]                     
  06db  2683bf1e6101     cmp word ptr es:[bx + 0x611e], 1         
  06e1  7f03             jg 0x6e6                                 
  06e3  e99a01           jmp 0x880                                
  06e6  33f6             xor si, si                               
  06e8  e98701           jmp 0x872                                
  06eb  8bc6             mov ax, si                               
  06ed  6bc00e           imul ax, ax, 0xe                         
  06f0  c41e8a3f         les bx, ptr [0x3f8a]                     
  06f4  03d8             add bx, ax                               
  06f6  2683bfda5d01     cmp word ptr es:[bx + 0x5dda], 1         
  06fc  7403             je 0x701                                 
  06fe  e9ef00           jmp 0x7f0                                
  0701  8bc6             mov ax, si                               
  0703  6bc00e           imul ax, ax, 0xe                         
  0706  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  070a  03d8             add bx, ax                               
  070c  2683bfdc5d00     cmp word ptr es:[bx + 0x5ddc], 0         
  0712  751c             jne 0x730                                
  0714  8bc6             mov ax, si                               
  0716  6bc00e           imul ax, ax, 0xe                         
  0719  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  071d  03d8             add bx, ax                               
  071f  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  0725  90               nop                                      
  0726  0e               push cs                                  
  0727  e8c901           call 0x8f3                               
  072a  83c404           add sp, 4                                
  072d  e94101           jmp 0x871                                
  0730  33ff             xor di, di                               
  0732  e9a300           jmp 0x7d8                                
  0735  8bc6             mov ax, si                               
  0737  6bc00e           imul ax, ax, 0xe                         
  073a  c41e8a3f         les bx, ptr [0x3f8a]                     
  073e  03d8             add bx, ax                               
  0740  8bc7             mov ax, di                               
  0742  d1e0             shl ax, 1                                
  0744  03d8             add bx, ax                               
  0746  268b87de5d       mov ax, word ptr es:[bx + 0x5dde]        
  074b  6bc00e           imul ax, ax, 0xe                         
  074e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0752  03d8             add bx, ax                               
  0754  2683bfda5d01     cmp word ptr es:[bx + 0x5dda], 1         
  075a  753d             jne 0x799                                
  075c  8bc6             mov ax, si                               
  075e  6bc00e           imul ax, ax, 0xe                         
  0761  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0765  03d8             add bx, ax                               
  0767  8bc7             mov ax, di                               
  0769  d1e0             shl ax, 1                                
  076b  03d8             add bx, ax                               
  076d  268b87de5d       mov ax, word ptr es:[bx + 0x5dde]        
  0772  6bc00e           imul ax, ax, 0xe                         
  0775  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0779  03d8             add bx, ax                               
  077b  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  0781  8bc6             mov ax, si                               
  0783  6bc00e           imul ax, ax, 0xe                         
  0786  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  078a  03d8             add bx, ax                               
  078c  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  0792  90               nop                                      
  0793  0e               push cs                                  
  0794  e8f501           call 0x98c                               
  0797  eb3b             jmp 0x7d4                                
  0799  8bc6             mov ax, si                               
  079b  6bc00e           imul ax, ax, 0xe                         
  079e  c41e8a3f         les bx, ptr [0x3f8a]                     
  07a2  03d8             add bx, ax                               
  07a4  8bc7             mov ax, di                               
  07a6  d1e0             shl ax, 1                                
  07a8  03d8             add bx, ax                               
  07aa  268b87de5d       mov ax, word ptr es:[bx + 0x5dde]        
  07af  6bc00e           imul ax, ax, 0xe                         
  07b2  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  07b6  03d8             add bx, ax                               
  07b8  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  07be  8bc6             mov ax, si                               
  07c0  6bc00e           imul ax, ax, 0xe                         
  07c3  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  07c7  03d8             add bx, ax                               
  07c9  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  07cf  90               nop                                      
  07d0  0e               push cs                                  
  07d1  e88e01           call 0x962                               
  07d4  83c408           add sp, 8                                
  07d7  47               inc di                                   
  07d8  8bc6             mov ax, si                               
  07da  6bc00e           imul ax, ax, 0xe                         
  07dd  c41e8a3f         les bx, ptr [0x3f8a]                     
  07e1  03d8             add bx, ax                               
  07e3  2639bfdc5d       cmp word ptr es:[bx + 0x5ddc], di        
  07e8  7e03             jle 0x7ed                                
  07ea  e948ff           jmp 0x735                                
  07ed  e98100           jmp 0x871                                
  07f0  8bc6             mov ax, si                               
  07f2  6bc00e           imul ax, ax, 0xe                         
  07f5  c41e8a3f         les bx, ptr [0x3f8a]                     
  07f9  03d8             add bx, ax                               
  07fb  2683bfdc5d00     cmp word ptr es:[bx + 0x5ddc], 0         
  0801  7519             jne 0x81c                                
  0803  8bc6             mov ax, si                               
  0805  6bc00e           imul ax, ax, 0xe                         
  0808  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  080c  03d8             add bx, ax                               
  080e  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  0814  90               nop                                      
  0815  0e               push cs                                  
  0816  e86b00           call 0x884                               
  0819  e90eff           jmp 0x72a                                
  081c  33ff             xor di, di                               
  081e  eb3f             jmp 0x85f                                
  0820  8bc6             mov ax, si                               
  0822  6bc00e           imul ax, ax, 0xe                         
  0825  c41e8a3f         les bx, ptr [0x3f8a]                     
  0829  03d8             add bx, ax                               
  082b  8bc7             mov ax, di                               
  082d  d1e0             shl ax, 1                                
  082f  03d8             add bx, ax                               
  0831  268b87de5d       mov ax, word ptr es:[bx + 0x5dde]        
  0836  6bc00e           imul ax, ax, 0xe                         
  0839  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  083d  03d8             add bx, ax                               
  083f  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  0845  8bc6             mov ax, si                               
  0847  6bc00e           imul ax, ax, 0xe                         
  084a  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  084e  03d8             add bx, ax                               
  0850  6626ffb7d65d     push dword ptr es:[bx + 0x5dd6]          
  0856  90               nop                                      
  0857  0e               push cs                                  
  0858  e80701           call 0x962                               
  085b  83c408           add sp, 8                                
  085e  47               inc di                                   
  085f  8bc6             mov ax, si                               
  0861  6bc00e           imul ax, ax, 0xe                         
  0864  c41e8a3f         les bx, ptr [0x3f8a]                     
  0868  03d8             add bx, ax                               
  086a  2639bfdc5d       cmp word ptr es:[bx + 0x5ddc], di        
  086f  7faf             jg 0x820                                 
  0871  46               inc si                                   
  0872  c41e8a3f         les bx, ptr [0x3f8a]                     
  0876  2639b71e61       cmp word ptr es:[bx + 0x611e], si        
  087b  7e03             jle 0x880                                
  087d  e96bfe           jmp 0x6eb                                
  0880  5f               pop di                                   
  0881  5e               pop si                                   
  0882  5d               pop bp                                   
  0883  cb               retf                                     

ovl04_0884:  ; ENTRY
  0884  55               push bp                                  
  0885  8bec             mov bp, sp                               
  0887  83ec04           sub sp, 4                                
  088a  66680500f6ff     push 0xfff60005                          
  0890  6a01             push 1                                   
  0892  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0897  83c406           add sp, 6                                
  089a  8b5606           mov dx, word ptr [bp + 6]                
  089d  03d0             add dx, ax                               
  089f  8956fc           mov word ptr [bp - 4], dx                
  08a2  66680500f6ff     push 0xfff60005                          
  08a8  6a01             push 1                                   
  08aa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  08af  83c406           add sp, 6                                
  08b2  8b5608           mov dx, word ptr [bp + 8]                
  08b5  03d0             add dx, ax                               
  08b7  8956fe           mov word ptr [bp - 2], dx                
  08ba  16               push ss                                  
  08bb  8d46fe           lea ax, [bp - 2]                         
  08be  50               push ax                                  
  08bf  16               push ss                                  
  08c0  8d46fc           lea ax, [bp - 4]                         
  08c3  50               push ax                                  
  08c4  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  08c9  83c408           add sp, 8                                
  08cc  666801000600     push 0x60001                             
  08d2  666801000200     push 0x20001                             
  08d8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  08dd  83c406           add sp, 6                                
  08e0  50               push ax                                  
  08e1  66ff76fc         push dword ptr [bp - 4]                  
  08e5  66ff7606         push dword ptr [bp + 6]                  
  08e9  90               nop                                      
  08ea  0e               push cs                                  
  08eb  e8b900           call 0x9a7                               
  08ee  83c40c           add sp, 0xc                              
  08f1  c9               leave                                    
  08f2  cb               retf                                     

ovl04_08f3:  ; ENTRY
  08f3  55               push bp                                  
  08f4  8bec             mov bp, sp                               
  08f6  83ec04           sub sp, 4                                
  08f9  66680500f6ff     push 0xfff60005                          
  08ff  6a01             push 1                                   
  0901  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0906  83c406           add sp, 6                                
  0909  8b5606           mov dx, word ptr [bp + 6]                
  090c  03d0             add dx, ax                               
  090e  8956fc           mov word ptr [bp - 4], dx                
  0911  66680500f6ff     push 0xfff60005                          
  0917  6a01             push 1                                   
  0919  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  091e  83c406           add sp, 6                                
  0921  8b5608           mov dx, word ptr [bp + 8]                
  0924  03d0             add dx, ax                               
  0926  8956fe           mov word ptr [bp - 2], dx                
  0929  16               push ss                                  
  092a  8d46fe           lea ax, [bp - 2]                         
  092d  50               push ax                                  
  092e  16               push ss                                  
  092f  8d46fc           lea ax, [bp - 4]                         
  0932  50               push ax                                  
  0933  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0938  83c408           add sp, 8                                
  093b  666801000500     push 0x50001                             
  0941  666801000200     push 0x20001                             
  0947  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  094c  83c406           add sp, 6                                
  094f  50               push ax                                  
  0950  66ff76fc         push dword ptr [bp - 4]                  
  0954  66ff7606         push dword ptr [bp + 6]                  
  0958  90               nop                                      
  0959  0e               push cs                                  
  095a  e84a00           call 0x9a7                               
  095d  83c40c           add sp, 0xc                              
  0960  c9               leave                                    
  0961  cb               retf                                     

ovl04_0962:  ; ENTRY
  0962  55               push bp                                  
  0963  8bec             mov bp, sp                               
  0965  666801000600     push 0x60001                             
  096b  666801000200     push 0x20001                             
  0971  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0976  83c406           add sp, 6                                
  0979  50               push ax                                  
  097a  66ff760a         push dword ptr [bp + 0xa]                
  097e  66ff7606         push dword ptr [bp + 6]                  
  0982  90               nop                                      
  0983  0e               push cs                                  
  0984  e82000           call 0x9a7                               
  0987  83c40c           add sp, 0xc                              
  098a  5d               pop bp                                   
  098b  cb               retf                                     

ovl04_098c:  ; ENTRY
  098c  55               push bp                                  
  098d  8bec             mov bp, sp                               
  098f  666803000500     push 0x50003                             
  0995  66ff760a         push dword ptr [bp + 0xa]                
  0999  66ff7606         push dword ptr [bp + 6]                  
  099d  90               nop                                      
  099e  0e               push cs                                  
  099f  e80500           call 0x9a7                               
  09a2  83c40c           add sp, 0xc                              
  09a5  5d               pop bp                                   
  09a6  cb               retf                                     

ovl04_09a7:  ; ENTRY
  09a7  55               push bp                                  
  09a8  8bec             mov bp, sp                               
  09aa  83ec26           sub sp, 0x26                             
  09ad  56               push si                                  
  09ae  57               push di                                  
  09af  8b7e0e           mov di, word ptr [bp + 0xe]              
  09b2  c746fe0000       mov word ptr [bp - 2], 0                 
  09b7  668b4606         mov eax, dword ptr [bp + 6]              
  09bb  668946fa         mov dword ptr [bp - 6], eax              
  09bf  16               push ss                                  
  09c0  8d46f6           lea ax, [bp - 0xa]                       
  09c3  50               push ax                                  
  09c4  66ff760a         push dword ptr [bp + 0xa]                
  09c8  66ff7606         push dword ptr [bp + 6]                  
  09cc  9a2a00672f       lcall 0x2f67, 0x2a                       -> ovl03:0dd0
  09d1  83c40c           add sp, 0xc                              
  09d4  e95f03           jmp 0xd36                                
  09d7  16               push ss                                  
  09d8  8d46f2           lea ax, [bp - 0xe]                       
  09db  50               push ax                                  
  09dc  66ff760a         push dword ptr [bp + 0xa]                
  09e0  66ff76fa         push dword ptr [bp - 6]                  
  09e4  9a2a00672f       lcall 0x2f67, 0x2a                       -> ovl03:0dd0
  09e9  83c40c           add sp, 0xc                              
  09ec  66ff760a         push dword ptr [bp + 0xa]                
  09f0  66ff76fa         push dword ptr [bp - 6]                  
  09f4  9a2500672f       lcall 0x2f67, 0x25                       -> ovl03:0fed
  09f9  83c408           add sp, 8                                
  09fc  3d0300           cmp ax, 3                                
  09ff  7d0e             jge 0xa0f                                
  0a01  8b46f2           mov ax, word ptr [bp - 0xe]              
  0a04  0146fa           add word ptr [bp - 6], ax                
  0a07  8b46f4           mov ax, word ptr [bp - 0xc]              
  0a0a  0146fc           add word ptr [bp - 4], ax                
  0a0d  eb56             jmp 0xa65                                
  0a0f  666a03           push 3                                   
  0a12  6a01             push 1                                   
  0a14  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0a19  83c406           add sp, 6                                
  0a1c  8946dc           mov word ptr [bp - 0x24], ax             
  0a1f  3d0100           cmp ax, 1                                
  0a22  74dd             je 0xa01                                 
  0a24  3d0200           cmp ax, 2                                
  0a27  7409             je 0xa32                                 
  0a29  3d0300           cmp ax, 3                                
  0a2c  7416             je 0xa44                                 
  0a2e  eb3d             jmp 0xa6d                                
  0a30  ebcf             jmp 0xa01                                
  0a32  8b46f6           mov ax, word ptr [bp - 0xa]              
  0a35  0146fa           add word ptr [bp - 6], ax                
  0a38  8b46f8           mov ax, word ptr [bp - 8]                
  0a3b  0146fc           add word ptr [bp - 4], ax                
  0a3e  668b46f6         mov eax, dword ptr [bp - 0xa]            
  0a42  eb25             jmp 0xa69                                
  0a44  16               push ss                                  
  0a45  8d46f2           lea ax, [bp - 0xe]                       
  0a48  50               push ax                                  
  0a49  9a3900672f       lcall 0x2f67, 0x39                       -> ovl03:104a
  0a4e  83c404           add sp, 4                                
  0a51  8b46f2           mov ax, word ptr [bp - 0xe]              
  0a54  0146fa           add word ptr [bp - 6], ax                
  0a57  8b46f4           mov ax, word ptr [bp - 0xc]              
  0a5a  0146fc           add word ptr [bp - 4], ax                
  0a5d  668b46f2         mov eax, dword ptr [bp - 0xe]            
  0a61  668946f6         mov dword ptr [bp - 0xa], eax            
  0a65  668b46f2         mov eax, dword ptr [bp - 0xe]            
  0a69  668946ee         mov dword ptr [bp - 0x12], eax           
  0a6d  33d2             xor dx, dx                               
  0a6f  eb23             jmp 0xa94                                
  0a71  8bc2             mov ax, dx                               
  0a73  c1e002           shl ax, 2                                
  0a76  c41e8a3f         les bx, ptr [0x3f8a]                     
  0a7a  03d8             add bx, ax                               
  0a7c  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  0a81  3b46ee           cmp ax, word ptr [bp - 0x12]             
  0a84  750d             jne 0xa93                                
  0a86  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  0a8b  3b46f0           cmp ax, word ptr [bp - 0x10]             
  0a8e  7503             jne 0xa93                                
  0a90  8956da           mov word ptr [bp - 0x26], dx             
  0a93  42               inc dx                                   
  0a94  83fa08           cmp dx, 8                                
  0a97  7cd8             jl 0xa71                                 
  0a99  8b46da           mov ax, word ptr [bp - 0x26]             
  0a9c  050200           add ax, 2                                
  0a9f  bb0800           mov bx, 8                                
  0aa2  99               cdq                                      
  0aa3  f7fb             idiv bx                                  
  0aa5  8bca             mov cx, dx                               
  0aa7  8b46da           mov ax, word ptr [bp - 0x26]             
  0aaa  050600           add ax, 6                                
  0aad  99               cdq                                      
  0aae  f7fb             idiv bx                                  
  0ab0  8bf2             mov si, dx                               
  0ab2  8bc1             mov ax, cx                               
  0ab4  c1e002           shl ax, 2                                
  0ab7  c41e8a3f         les bx, ptr [0x3f8a]                     
  0abb  03d8             add bx, ax                               
  0abd  8b46fa           mov ax, word ptr [bp - 6]                
  0ac0  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  0ac5  8946ea           mov word ptr [bp - 0x16], ax             
  0ac8  8b46fc           mov ax, word ptr [bp - 4]                
  0acb  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0ad0  8946ec           mov word ptr [bp - 0x14], ax             
  0ad3  8bc6             mov ax, si                               
  0ad5  c1e002           shl ax, 2                                
  0ad8  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0adc  03d8             add bx, ax                               
  0ade  8b46fa           mov ax, word ptr [bp - 6]                
  0ae1  260387bc00       add ax, word ptr es:[bx + 0xbc]          
  0ae6  8946e6           mov word ptr [bp - 0x1a], ax             
  0ae9  8b46fc           mov ax, word ptr [bp - 4]                
  0aec  260387be00       add ax, word ptr es:[bx + 0xbe]          
  0af1  8946e8           mov word ptr [bp - 0x18], ax             
  0af4  8bc1             mov ax, cx                               
  0af6  c1e002           shl ax, 2                                
  0af9  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0afd  03d8             add bx, ax                               
  0aff  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  0b04  d1e0             shl ax, 1                                
  0b06  8b56fa           mov dx, word ptr [bp - 6]                
  0b09  03d0             add dx, ax                               
  0b0b  8956e2           mov word ptr [bp - 0x1e], dx             
  0b0e  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  0b13  d1e0             shl ax, 1                                
  0b15  8b56fc           mov dx, word ptr [bp - 4]                
  0b18  03d0             add dx, ax                               
  0b1a  8956e4           mov word ptr [bp - 0x1c], dx             
  0b1d  8bc6             mov ax, si                               
  0b1f  c1e002           shl ax, 2                                
  0b22  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0b26  03d8             add bx, ax                               
  0b28  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  0b2d  d1e0             shl ax, 1                                
  0b2f  8b56fa           mov dx, word ptr [bp - 6]                
  0b32  03d0             add dx, ax                               
  0b34  8956de           mov word ptr [bp - 0x22], dx             
  0b37  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  0b3c  d1e0             shl ax, 1                                
  0b3e  8b56fc           mov dx, word ptr [bp - 4]                
  0b41  03d0             add dx, ax                               
  0b43  8956e0           mov word ptr [bp - 0x20], dx             
  0b46  16               push ss                                  
  0b47  8d46fc           lea ax, [bp - 4]                         
  0b4a  50               push ax                                  
  0b4b  16               push ss                                  
  0b4c  8d46fa           lea ax, [bp - 6]                         
  0b4f  50               push ax                                  
  0b50  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0b55  83c408           add sp, 8                                
  0b58  8b46fc           mov ax, word ptr [bp - 4]                
  0b5b  6bc070           imul ax, ax, 0x70                        
  0b5e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0b62  03d8             add bx, ax                               
  0b64  035efa           add bx, word ptr [bp - 6]                
  0b67  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0b6d  7417             je 0xb86                                 
  0b6f  8b46fc           mov ax, word ptr [bp - 4]                
  0b72  6bc070           imul ax, ax, 0x70                        
  0b75  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0b79  03d8             add bx, ax                               
  0b7b  035efa           add bx, word ptr [bp - 6]                
  0b7e  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0b84  7523             jne 0xba9                                
  0b86  8b46fc           mov ax, word ptr [bp - 4]                
  0b89  6bc070           imul ax, ax, 0x70                        
  0b8c  c41e8a3f         les bx, ptr [0x3f8a]                     
  0b90  03d8             add bx, ax                               
  0b92  035efa           add bx, word ptr [bp - 6]                
  0b95  8a4610           mov al, byte ptr [bp + 0x10]             
  0b98  2688872061       mov byte ptr es:[bx + 0x6120], al        
  0b9d  66ff76fa         push dword ptr [bp - 6]                  
  0ba1  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0ba6  83c404           add sp, 4                                
  0ba9  8b46fa           mov ax, word ptr [bp - 6]                
  0bac  3b460a           cmp ax, word ptr [bp + 0xa]              
  0baf  750d             jne 0xbbe                                
  0bb1  8b46fc           mov ax, word ptr [bp - 4]                
  0bb4  3b460c           cmp ax, word ptr [bp + 0xc]              
  0bb7  7505             jne 0xbbe                                
  0bb9  c746fe0100       mov word ptr [bp - 2], 1                 
  0bbe  83ff02           cmp di, 2                                
  0bc1  7403             je 0xbc6                                 
  0bc3  e9b400           jmp 0xc7a                                
  0bc6  16               push ss                                  
  0bc7  8d46ec           lea ax, [bp - 0x14]                      
  0bca  50               push ax                                  
  0bcb  16               push ss                                  
  0bcc  8d46ea           lea ax, [bp - 0x16]                      
  0bcf  50               push ax                                  
  0bd0  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0bd5  83c408           add sp, 8                                
  0bd8  8b46ec           mov ax, word ptr [bp - 0x14]             
  0bdb  6bc070           imul ax, ax, 0x70                        
  0bde  c41e8a3f         les bx, ptr [0x3f8a]                     
  0be2  03d8             add bx, ax                               
  0be4  035eea           add bx, word ptr [bp - 0x16]             
  0be7  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0bed  7417             je 0xc06                                 
  0bef  8b46ec           mov ax, word ptr [bp - 0x14]             
  0bf2  6bc070           imul ax, ax, 0x70                        
  0bf5  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0bf9  03d8             add bx, ax                               
  0bfb  035eea           add bx, word ptr [bp - 0x16]             
  0bfe  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0c04  7523             jne 0xc29                                
  0c06  8b46ec           mov ax, word ptr [bp - 0x14]             
  0c09  6bc070           imul ax, ax, 0x70                        
  0c0c  c41e8a3f         les bx, ptr [0x3f8a]                     
  0c10  03d8             add bx, ax                               
  0c12  035eea           add bx, word ptr [bp - 0x16]             
  0c15  8a4610           mov al, byte ptr [bp + 0x10]             
  0c18  2688872061       mov byte ptr es:[bx + 0x6120], al        
  0c1d  66ff76ea         push dword ptr [bp - 0x16]               
  0c21  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0c26  83c404           add sp, 4                                
  0c29  8b46e8           mov ax, word ptr [bp - 0x18]             
  0c2c  6bc070           imul ax, ax, 0x70                        
  0c2f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0c33  03d8             add bx, ax                               
  0c35  035ee6           add bx, word ptr [bp - 0x1a]             
  0c38  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0c3e  7417             je 0xc57                                 
  0c40  8b46e8           mov ax, word ptr [bp - 0x18]             
  0c43  6bc070           imul ax, ax, 0x70                        
  0c46  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0c4a  03d8             add bx, ax                               
  0c4c  035ee6           add bx, word ptr [bp - 0x1a]             
  0c4f  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0c55  7523             jne 0xc7a                                
  0c57  8b46e8           mov ax, word ptr [bp - 0x18]             
  0c5a  6bc070           imul ax, ax, 0x70                        
  0c5d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0c61  03d8             add bx, ax                               
  0c63  035ee6           add bx, word ptr [bp - 0x1a]             
  0c66  8a4610           mov al, byte ptr [bp + 0x10]             
  0c69  2688872061       mov byte ptr es:[bx + 0x6120], al        
  0c6e  66ff76e6         push dword ptr [bp - 0x1a]               
  0c72  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0c77  83c404           add sp, 4                                
  0c7a  83ff03           cmp di, 3                                
  0c7d  7403             je 0xc82                                 
  0c7f  e9b400           jmp 0xd36                                
  0c82  16               push ss                                  
  0c83  8d46e4           lea ax, [bp - 0x1c]                      
  0c86  50               push ax                                  
  0c87  16               push ss                                  
  0c88  8d46e2           lea ax, [bp - 0x1e]                      
  0c8b  50               push ax                                  
  0c8c  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0c91  83c408           add sp, 8                                
  0c94  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0c97  6bc070           imul ax, ax, 0x70                        
  0c9a  c41e8a3f         les bx, ptr [0x3f8a]                     
  0c9e  03d8             add bx, ax                               
  0ca0  035ee2           add bx, word ptr [bp - 0x1e]             
  0ca3  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0ca9  7417             je 0xcc2                                 
  0cab  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0cae  6bc070           imul ax, ax, 0x70                        
  0cb1  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0cb5  03d8             add bx, ax                               
  0cb7  035ee2           add bx, word ptr [bp - 0x1e]             
  0cba  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0cc0  7523             jne 0xce5                                
  0cc2  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0cc5  6bc070           imul ax, ax, 0x70                        
  0cc8  c41e8a3f         les bx, ptr [0x3f8a]                     
  0ccc  03d8             add bx, ax                               
  0cce  035ee2           add bx, word ptr [bp - 0x1e]             
  0cd1  8a4610           mov al, byte ptr [bp + 0x10]             
  0cd4  2688872061       mov byte ptr es:[bx + 0x6120], al        
  0cd9  66ff76e2         push dword ptr [bp - 0x1e]               
  0cdd  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0ce2  83c404           add sp, 4                                
  0ce5  8b46e0           mov ax, word ptr [bp - 0x20]             
  0ce8  6bc070           imul ax, ax, 0x70                        
  0ceb  c41e8a3f         les bx, ptr [0x3f8a]                     
  0cef  03d8             add bx, ax                               
  0cf1  035ede           add bx, word ptr [bp - 0x22]             
  0cf4  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0cfa  7417             je 0xd13                                 
  0cfc  8b46e0           mov ax, word ptr [bp - 0x20]             
  0cff  6bc070           imul ax, ax, 0x70                        
  0d02  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0d06  03d8             add bx, ax                               
  0d08  035ede           add bx, word ptr [bp - 0x22]             
  0d0b  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0d11  7523             jne 0xd36                                
  0d13  8b46e0           mov ax, word ptr [bp - 0x20]             
  0d16  6bc070           imul ax, ax, 0x70                        
  0d19  c41e8a3f         les bx, ptr [0x3f8a]                     
  0d1d  03d8             add bx, ax                               
  0d1f  035ede           add bx, word ptr [bp - 0x22]             
  0d22  8a4610           mov al, byte ptr [bp + 0x10]             
  0d25  2688872061       mov byte ptr es:[bx + 0x6120], al        
  0d2a  66ff76de         push dword ptr [bp - 0x22]               
  0d2e  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0d33  83c404           add sp, 4                                
  0d36  837efe00         cmp word ptr [bp - 2], 0                 
  0d3a  7503             jne 0xd3f                                
  0d3c  e998fc           jmp 0x9d7                                
  0d3f  5f               pop di                                   
  0d40  5e               pop si                                   
  0d41  c9               leave                                    
  0d42  cb               retf                                     
