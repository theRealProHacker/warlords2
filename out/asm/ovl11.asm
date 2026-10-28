; ovl11 stub 2f8d file_off 0x43cf0 size 0x1d29

ovl11_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  b8042c           mov ax, 0x2c04                           
  0007  8ec0             mov es, ax                               
  0009  26c7067b150000   mov word ptr es:[0x157b], 0              
  0010  90               nop                                      
  0011  0e               push cs                                  
  0012  e87702           call 0x28c                               
  0015  9a20007c30       lcall 0x307c, 0x20                       -> ovl48:0000
  001a  c41e8a3f         les bx, ptr [0x3f8a]                     
  001e  268bb7840a       mov si, word ptr es:[bx + 0xa84]         
  0023  eb08             jmp 0x2d                                 
  0025  56               push si                                  
  0026  90               nop                                      
  0027  0e               push cs                                  
  0028  e80603           call 0x331                               
  002b  59               pop cx                                   
  002c  46               inc si                                   
  002d  c41e8a3f         les bx, ptr [0x3f8a]                     
  0031  2639772a         cmp word ptr es:[bx + 0x2a], si          
  0035  7fee             jg 0x25                                  
  0037  5e               pop si                                   
  0038  5d               pop bp                                   
  0039  cb               retf                                     

ovl11_003a:  ; ENTRY
  003a  55               push bp                                  
  003b  8bec             mov bp, sp                               
  003d  81ec1001         sub sp, 0x110                            
  0041  56               push si                                  
  0042  57               push di                                  
  0043  33ff             xor di, di                               
  0045  b8042c           mov ax, 0x2c04                           
  0048  8ec0             mov es, ax                               
  004a  26c7060f082800   mov word ptr es:[0x80f], 0x28            
  0051  33f6             xor si, si                               
  0053  eb24             jmp 0x79                                 
  0055  8bde             mov bx, si                               
  0057  6bdb1f           imul bx, bx, 0x1f                        
  005a  b8042c           mov ax, 0x2c04                           
  005d  baffff           mov dx, 0xffff                           
  0060  8ec0             mov es, ax                               
  0062  2689971308       mov word ptr es:[bx + 0x813], dx         
  0067  8bc2             mov ax, dx                               
  0069  8bde             mov bx, si                               
  006b  6bdb1f           imul bx, bx, 0x1f                        
  006e  ba042c           mov dx, 0x2c04                           
  0071  8ec2             mov es, dx                               
  0073  2689871108       mov word ptr es:[bx + 0x811], ax         
  0078  46               inc si                                   
  0079  83fe28           cmp si, 0x28                             
  007c  7cd7             jl 0x55                                  
  007e  33f6             xor si, si                               
  0080  e9f601           jmp 0x279                                
  0083  8bc6             mov ax, si                               
  0085  6bc00a           imul ax, ax, 0xa                         
  0088  ba042c           mov dx, 0x2c04                           
  008b  52               push dx                                  
  008c  99               cdq                                      
  008d  07               pop es                                   
  008e  26f73e0f08       idiv word ptr es:[0x80f]                 
  0093  8bd0             mov dx, ax                               
  0095  3bfa             cmp di, dx                               
  0097  740e             je 0xa7                                  
  0099  8bfa             mov di, dx                               
  009b  8bc7             mov ax, di                               
  009d  054600           add ax, 0x46                             
  00a0  50               push ax                                  
  00a1  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  00a6  59               pop cx                                   
  00a7  16               push ss                                  
  00a8  8d46fc           lea ax, [bp - 4]                         
  00ab  50               push ax                                  
  00ac  16               push ss                                  
  00ad  8d46fe           lea ax, [bp - 2]                         
  00b0  50               push ax                                  
  00b1  6a07             push 7                                   
  00b3  90               nop                                      
  00b4  0e               push cs                                  
  00b5  e8bf09           call 0xa77                               
  00b8  83c40a           add sp, 0xa                              
  00bb  8bde             mov bx, si                               
  00bd  6bdb1f           imul bx, bx, 0x1f                        
  00c0  b8042c           mov ax, 0x2c04                           
  00c3  8b56fe           mov dx, word ptr [bp - 2]                
  00c6  8ec0             mov es, ax                               
  00c8  2689971108       mov word ptr es:[bx + 0x811], dx         
  00cd  8bde             mov bx, si                               
  00cf  6bdb1f           imul bx, bx, 0x1f                        
  00d2  b8042c           mov ax, 0x2c04                           
  00d5  8b56fc           mov dx, word ptr [bp - 4]                
  00d8  8ec0             mov es, ax                               
  00da  2689971308       mov word ptr es:[bx + 0x813], dx         
  00df  8b46fc           mov ax, word ptr [bp - 4]                
  00e2  6bc070           imul ax, ax, 0x70                        
  00e5  c41e8a3f         les bx, ptr [0x3f8a]                     
  00e9  03d8             add bx, ax                               
  00eb  035efe           add bx, word ptr [bp - 2]                
  00ee  26c68720610b     mov byte ptr es:[bx + 0x6120], 0xb       
  00f4  8bde             mov bx, si                               
  00f6  6bdb1f           imul bx, bx, 0x1f                        
  00f9  b8042c           mov ax, 0x2c04                           
  00fc  8ec0             mov es, ax                               
  00fe  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  0104  7503             jne 0x109                                
  0106  e9c200           jmp 0x1cb                                
  0109  6aff             push -1                                  
  010b  c41e8a3f         les bx, ptr [0x3f8a]                     
  010f  26ffb7d20e       push word ptr es:[bx + 0xed2]            
  0114  6a01             push 1                                   
  0116  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  011b  83c406           add sp, 6                                
  011e  8946fa           mov word ptr [bp - 6], ax                
  0121  66680a00ffff     push 0xffff000a                          
  0127  6a01             push 1                                   
  0129  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  012e  83c406           add sp, 6                                
  0131  6bc00a           imul ax, ax, 0xa                         
  0134  8b168a3f         mov dx, word ptr [0x3f8a]                
  0138  03d0             add dx, ax                               
  013a  81c29c0f         add dx, 0xf9c                            
  013e  ff368c3f         push word ptr [0x3f8c]                   
  0142  52               push dx                                  
  0143  66680a00ffff     push 0xffff000a                          
  0149  6a01             push 1                                   
  014b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0150  83c406           add sp, 6                                
  0153  6bc00a           imul ax, ax, 0xa                         
  0156  8b168a3f         mov dx, word ptr [0x3f8a]                
  015a  03d0             add dx, ax                               
  015c  81c2380f         add dx, 0xf38                            
  0160  ff368c3f         push word ptr [0x3f8c]                   
  0164  52               push dx                                  
  0165  1e               push ds                                  
  0166  68e002           push 0x2e0                                ; "%s%s"
  0169  16               push ss                                  
  016a  8d46f0           lea ax, [bp - 0x10]                      
  016d  50               push ax                                  
  016e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0173  83c410           add sp, 0x10                             
  0176  16               push ss                                  
  0177  8d46f0           lea ax, [bp - 0x10]                      
  017a  50               push ax                                  
  017b  8b46fa           mov ax, word ptr [bp - 6]                
  017e  6bc014           imul ax, ax, 0x14                        
  0181  8b168a3f         mov dx, word ptr [0x3f8a]                
  0185  03d0             add dx, ax                               
  0187  81c2d40e         add dx, 0xed4                            
  018b  ff368c3f         push word ptr [0x3f8c]                   
  018f  52               push dx                                  
  0190  16               push ss                                  
  0191  8d86f0fe         lea ax, [bp - 0x110]                     
  0195  50               push ax                                  
  0196  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  019b  83c40c           add sp, 0xc                              
  019e  16               push ss                                  
  019f  8d86f0fe         lea ax, [bp - 0x110]                     
  01a3  50               push ax                                  
  01a4  8bc6             mov ax, si                               
  01a6  6bc01f           imul ax, ax, 0x1f                        
  01a9  051508           add ax, 0x815                            
  01ac  68042c           push 0x2c04                              
  01af  50               push ax                                  
  01b0  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  01b5  83c408           add sp, 8                                
  01b8  8bc6             mov ax, si                               
  01ba  6bc01f           imul ax, ax, 0x1f                        
  01bd  051508           add ax, 0x815                            
  01c0  68042c           push 0x2c04                              
  01c3  50               push ax                                  
  01c4  56               push si                                  
  01c5  1e               push ds                                  
  01c6  68e502           push 0x2e5                                ; "#%03d|%s is|inhabited by monsters and|full of treasure!|"
  01c9  eb5f             jmp 0x22a                                
  01cb  66680a00ffff     push 0xffff000a                          
  01d1  6a01             push 1                                   
  01d3  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  01d8  83c406           add sp, 6                                
  01db  6bc00a           imul ax, ax, 0xa                         
  01de  8b168a3f         mov dx, word ptr [0x3f8a]                
  01e2  03d0             add dx, ax                               
  01e4  81c20010         add dx, 0x1000                           
  01e8  ff368c3f         push word ptr [0x3f8c]                   
  01ec  52               push dx                                  
  01ed  1e               push ds                                  
  01ee  681f03           push 0x31f                                ; "%s Temple"
  01f1  16               push ss                                  
  01f2  8d86f0fe         lea ax, [bp - 0x110]                     
  01f6  50               push ax                                  
  01f7  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  01fc  83c40c           add sp, 0xc                              
  01ff  16               push ss                                  
  0200  8d86f0fe         lea ax, [bp - 0x110]                     
  0204  50               push ax                                  
  0205  8bc6             mov ax, si                               
  0207  6bc01f           imul ax, ax, 0x1f                        
  020a  051508           add ax, 0x815                            
  020d  68042c           push 0x2c04                              
  0210  50               push ax                                  
  0211  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0216  83c408           add sp, 8                                
  0219  8bc6             mov ax, si                               
  021b  6bc01f           imul ax, ax, 0x1f                        
  021e  051508           add ax, 0x815                            
  0221  68042c           push 0x2c04                              
  0224  50               push ax                                  
  0225  56               push si                                  
  0226  1e               push ds                                  
  0227  682903           push 0x329                                ; "#%03d|The %s can bless your|armies or give you|quests|"
  022a  16               push ss                                  
  022b  8d86f0fe         lea ax, [bp - 0x110]                     
  022f  50               push ax                                  
  0230  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0235  83c40e           add sp, 0xe                              
  0238  16               push ss                                  
  0239  8d86f0fe         lea ax, [bp - 0x110]                     
  023d  50               push ax                                  
  023e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0242  a18a3f           mov ax, word ptr [0x3f8a]                
  0245  2603876610       add ax, word ptr es:[bx + 0x1066]        
  024a  05963e           add ax, 0x3e96                           
  024d  ff368c3f         push word ptr [0x3f8c]                   
  0251  50               push ax                                  
  0252  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0257  83c408           add sp, 8                                
  025a  16               push ss                                  
  025b  8d86f0fe         lea ax, [bp - 0x110]                     
  025f  50               push ax                                  
  0260  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0265  83c404           add sp, 4                                
  0268  c41e8a3f         les bx, ptr [0x3f8a]                     
  026c  268b976610       mov dx, word ptr es:[bx + 0x1066]        
  0271  03d0             add dx, ax                               
  0273  2689976610       mov word ptr es:[bx + 0x1066], dx        
  0278  46               inc si                                   
  0279  b8042c           mov ax, 0x2c04                           
  027c  8ec0             mov es, ax                               
  027e  2639360f08       cmp word ptr es:[0x80f], si              
  0283  7e03             jle 0x288                                
  0285  e9fbfd           jmp 0x83                                 
  0288  5f               pop di                                   
  0289  5e               pop si                                   
  028a  c9               leave                                    
  028b  cb               retf                                     

ovl11_028c:  ; ENTRY
  028c  55               push bp                                  
  028d  8bec             mov bp, sp                               
  028f  56               push si                                  
  0290  33c9             xor cx, cx                               
  0292  e99100           jmp 0x326                                
  0295  33f6             xor si, si                               
  0297  e98200           jmp 0x31c                                
  029a  8bc6             mov ax, si                               
  029c  6bc070           imul ax, ax, 0x70                        
  029f  c41e8a3f         les bx, ptr [0x3f8a]                     
  02a3  03d8             add bx, ax                               
  02a5  03d9             add bx, cx                               
  02a7  2680bf20610a     cmp byte ptr es:[bx + 0x6120], 0xa       
  02ad  756c             jne 0x31b                                
  02af  8bc6             mov ax, si                               
  02b1  48               dec ax                                   
  02b2  6bc070           imul ax, ax, 0x70                        
  02b5  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02b9  03d8             add bx, ax                               
  02bb  03d9             add bx, cx                               
  02bd  2680bf20610a     cmp byte ptr es:[bx + 0x6120], 0xa       
  02c3  7456             je 0x31b                                 
  02c5  8bc6             mov ax, si                               
  02c7  6bc070           imul ax, ax, 0x70                        
  02ca  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02ce  03d8             add bx, ax                               
  02d0  03d9             add bx, cx                               
  02d2  2680bf1f610a     cmp byte ptr es:[bx + 0x611f], 0xa       
  02d8  7441             je 0x31b                                 
  02da  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  02de  26ff87840a       inc word ptr es:[bx + 0xa84]             
  02e3  b8042c           mov ax, 0x2c04                           
  02e6  8ec0             mov es, ax                               
  02e8  268b1e7b15       mov bx, word ptr es:[0x157b]             
  02ed  6bdb41           imul bx, bx, 0x41                        
  02f0  b8042c           mov ax, 0x2c04                           
  02f3  8ec0             mov es, ax                               
  02f5  26898f7d15       mov word ptr es:[bx + 0x157d], cx        
  02fa  b8042c           mov ax, 0x2c04                           
  02fd  8ec0             mov es, ax                               
  02ff  268b1e7b15       mov bx, word ptr es:[0x157b]             
  0304  6bdb41           imul bx, bx, 0x41                        
  0307  b8042c           mov ax, 0x2c04                           
  030a  8ec0             mov es, ax                               
  030c  2689b77f15       mov word ptr es:[bx + 0x157f], si        
  0311  b8042c           mov ax, 0x2c04                           
  0314  8ec0             mov es, ax                               
  0316  26ff067b15       inc word ptr es:[0x157b]                 
  031b  46               inc si                                   
  031c  81fe9c00         cmp si, 0x9c                             
  0320  7d03             jge 0x325                                
  0322  e975ff           jmp 0x29a                                
  0325  41               inc cx                                   
  0326  83f970           cmp cx, 0x70                             
  0329  7d03             jge 0x32e                                
  032b  e967ff           jmp 0x295                                
  032e  5e               pop si                                   
  032f  5d               pop bp                                   
  0330  cb               retf                                     

ovl11_0331:  ; ENTRY
  0331  55               push bp                                  
  0332  8bec             mov bp, sp                               
  0334  83ec08           sub sp, 8                                
  0337  56               push si                                  
  0338  57               push di                                  
  0339  c746fc0000       mov word ptr [bp - 4], 0                 
  033e  c746fa0000       mov word ptr [bp - 6], 0                 
  0343  e90602           jmp 0x54c                                
  0346  666866000500     push 0x50066                             
  034c  6a01             push 1                                   
  034e  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0353  83c406           add sp, 6                                
  0356  8bf8             mov di, ax                               
  0358  666892000500     push 0x50092                             
  035e  6a01             push 1                                   
  0360  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0365  83c406           add sp, 6                                
  0368  8946fe           mov word ptr [bp - 2], ax                
  036b  c746f80100       mov word ptr [bp - 8], 1                 
  0370  33f6             xor si, si                               
  0372  e95301           jmp 0x4c8                                
  0375  8bde             mov bx, si                               
  0377  d1e3             shl bx, 1                                
  0379  8b46fe           mov ax, word ptr [bp - 2]                
  037c  0387cc02         add ax, word ptr [bx + 0x2cc]            
  0380  6bc070           imul ax, ax, 0x70                        
  0383  c4168a3f         les dx, ptr [0x3f8a]                     
  0387  03d0             add dx, ax                               
  0389  03d7             add dx, di                               
  038b  8bde             mov bx, si                               
  038d  d1e3             shl bx, 1                                
  038f  0397c402         add dx, word ptr [bx + 0x2c4]            
  0393  8bda             mov bx, dx                               
  0395  2680bf206103     cmp byte ptr es:[bx + 0x6120], 3         
  039b  7503             jne 0x3a0                                
  039d  e9a000           jmp 0x440                                
  03a0  8bde             mov bx, si                               
  03a2  d1e3             shl bx, 1                                
  03a4  8b46fe           mov ax, word ptr [bp - 2]                
  03a7  0387cc02         add ax, word ptr [bx + 0x2cc]            
  03ab  6bc070           imul ax, ax, 0x70                        
  03ae  8b168a3f         mov dx, word ptr [0x3f8a]                
  03b2  03d0             add dx, ax                               
  03b4  03d7             add dx, di                               
  03b6  8bde             mov bx, si                               
  03b8  d1e3             shl bx, 1                                
  03ba  0397c402         add dx, word ptr [bx + 0x2c4]            
  03be  8bda             mov bx, dx                               
  03c0  2680bf206102     cmp byte ptr es:[bx + 0x6120], 2         
  03c6  7478             je 0x440                                 
  03c8  8bde             mov bx, si                               
  03ca  d1e3             shl bx, 1                                
  03cc  8b46fe           mov ax, word ptr [bp - 2]                
  03cf  0387cc02         add ax, word ptr [bx + 0x2cc]            
  03d3  6bc070           imul ax, ax, 0x70                        
  03d6  8b168a3f         mov dx, word ptr [0x3f8a]                
  03da  03d0             add dx, ax                               
  03dc  03d7             add dx, di                               
  03de  8bde             mov bx, si                               
  03e0  d1e3             shl bx, 1                                
  03e2  0397c402         add dx, word ptr [bx + 0x2c4]            
  03e6  8bda             mov bx, dx                               
  03e8  2680bf20610a     cmp byte ptr es:[bx + 0x6120], 0xa       
  03ee  7450             je 0x440                                 
  03f0  8bde             mov bx, si                               
  03f2  d1e3             shl bx, 1                                
  03f4  8b46fe           mov ax, word ptr [bp - 2]                
  03f7  0387cc02         add ax, word ptr [bx + 0x2cc]            
  03fb  6bc070           imul ax, ax, 0x70                        
  03fe  8b168a3f         mov dx, word ptr [0x3f8a]                
  0402  03d0             add dx, ax                               
  0404  03d7             add dx, di                               
  0406  8bde             mov bx, si                               
  0408  d1e3             shl bx, 1                                
  040a  0397c402         add dx, word ptr [bx + 0x2c4]            
  040e  8bda             mov bx, dx                               
  0410  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  0416  7428             je 0x440                                 
  0418  8bde             mov bx, si                               
  041a  d1e3             shl bx, 1                                
  041c  8b46fe           mov ax, word ptr [bp - 2]                
  041f  0387cc02         add ax, word ptr [bx + 0x2cc]            
  0423  6bc070           imul ax, ax, 0x70                        
  0426  8b168a3f         mov dx, word ptr [0x3f8a]                
  042a  03d0             add dx, ax                               
  042c  03d7             add dx, di                               
  042e  8bde             mov bx, si                               
  0430  d1e3             shl bx, 1                                
  0432  0397c402         add dx, word ptr [bx + 0x2c4]            
  0436  8bda             mov bx, dx                               
  0438  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  043e  7505             jne 0x445                                
  0440  c746f80000       mov word ptr [bp - 8], 0                 
  0445  6a0a             push 0xa                                 
  0447  8bde             mov bx, si                               
  0449  d1e3             shl bx, 1                                
  044b  8b46fe           mov ax, word ptr [bp - 2]                
  044e  0387cc02         add ax, word ptr [bx + 0x2cc]            
  0452  50               push ax                                  
  0453  8bde             mov bx, si                               
  0455  d1e3             shl bx, 1                                
  0457  8bc7             mov ax, di                               
  0459  0387c402         add ax, word ptr [bx + 0x2c4]            
  045d  50               push ax                                  
  045e  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0463  83c406           add sp, 6                                
  0466  0bc0             or ax, ax                                
  0468  7405             je 0x46f                                 
  046a  c746f80000       mov word ptr [bp - 8], 0                 
  046f  6a0a             push 0xa                                 
  0471  8bde             mov bx, si                               
  0473  d1e3             shl bx, 1                                
  0475  8b46fe           mov ax, word ptr [bp - 2]                
  0478  0387cc02         add ax, word ptr [bx + 0x2cc]            
  047c  40               inc ax                                   
  047d  50               push ax                                  
  047e  8bde             mov bx, si                               
  0480  d1e3             shl bx, 1                                
  0482  8bc7             mov ax, di                               
  0484  0387c402         add ax, word ptr [bx + 0x2c4]            
  0488  40               inc ax                                   
  0489  50               push ax                                  
  048a  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  048f  83c406           add sp, 6                                
  0492  0bc0             or ax, ax                                
  0494  7405             je 0x49b                                 
  0496  c746f80000       mov word ptr [bp - 8], 0                 
  049b  6a0a             push 0xa                                 
  049d  8bde             mov bx, si                               
  049f  d1e3             shl bx, 1                                
  04a1  8b46fe           mov ax, word ptr [bp - 2]                
  04a4  0387cc02         add ax, word ptr [bx + 0x2cc]            
  04a8  48               dec ax                                   
  04a9  50               push ax                                  
  04aa  8bde             mov bx, si                               
  04ac  d1e3             shl bx, 1                                
  04ae  8bc7             mov ax, di                               
  04b0  0387c402         add ax, word ptr [bx + 0x2c4]            
  04b4  48               dec ax                                   
  04b5  50               push ax                                  
  04b6  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  04bb  83c406           add sp, 6                                
  04be  0bc0             or ax, ax                                
  04c0  7405             je 0x4c7                                 
  04c2  c746f80000       mov word ptr [bp - 8], 0                 
  04c7  46               inc si                                   
  04c8  83fe04           cmp si, 4                                
  04cb  7d03             jge 0x4d0                                
  04cd  e9a5fe           jmp 0x375                                
  04d0  837ef800         cmp word ptr [bp - 8], 0                 
  04d4  7476             je 0x54c                                 
  04d6  837efc04         cmp word ptr [bp - 4], 4                 
  04da  7d6b             jge 0x547                                
  04dc  6a03             push 3                                   
  04de  ff76fe           push word ptr [bp - 2]                   
  04e1  57               push di                                  
  04e2  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  04e7  83c406           add sp, 6                                
  04ea  0bc0             or ax, ax                                
  04ec  7405             je 0x4f3                                 
  04ee  c746fa0100       mov word ptr [bp - 6], 1                 
  04f3  6a03             push 3                                   
  04f5  ff76fe           push word ptr [bp - 2]                   
  04f8  8bc7             mov ax, di                               
  04fa  40               inc ax                                   
  04fb  50               push ax                                  
  04fc  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0501  83c406           add sp, 6                                
  0504  0bc0             or ax, ax                                
  0506  7405             je 0x50d                                 
  0508  c746fa0100       mov word ptr [bp - 6], 1                 
  050d  6a03             push 3                                   
  050f  8b46fe           mov ax, word ptr [bp - 2]                
  0512  40               inc ax                                   
  0513  50               push ax                                  
  0514  57               push di                                  
  0515  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  051a  83c406           add sp, 6                                
  051d  0bc0             or ax, ax                                
  051f  7405             je 0x526                                 
  0521  c746fa0100       mov word ptr [bp - 6], 1                 
  0526  6a03             push 3                                   
  0528  8b46fe           mov ax, word ptr [bp - 2]                
  052b  40               inc ax                                   
  052c  50               push ax                                  
  052d  8bc7             mov ax, di                               
  052f  40               inc ax                                   
  0530  50               push ax                                  
  0531  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0536  83c406           add sp, 6                                
  0539  0bc0             or ax, ax                                
  053b  7405             je 0x542                                 
  053d  c746fa0100       mov word ptr [bp - 6], 1                 
  0542  ff46fc           inc word ptr [bp - 4]                    
  0545  eb05             jmp 0x54c                                
  0547  c746fa0100       mov word ptr [bp - 6], 1                 
  054c  837efa00         cmp word ptr [bp - 6], 0                 
  0550  7503             jne 0x555                                
  0552  e9f1fd           jmp 0x346                                
  0555  b8042c           mov ax, 0x2c04                           
  0558  8ec0             mov es, ax                               
  055a  268b1e7b15       mov bx, word ptr es:[0x157b]             
  055f  6bdb41           imul bx, bx, 0x41                        
  0562  b8042c           mov ax, 0x2c04                           
  0565  8ec0             mov es, ax                               
  0567  2689bf7d15       mov word ptr es:[bx + 0x157d], di        
  056c  b8042c           mov ax, 0x2c04                           
  056f  8ec0             mov es, ax                               
  0571  268b1e7b15       mov bx, word ptr es:[0x157b]             
  0576  6bdb41           imul bx, bx, 0x41                        
  0579  b8042c           mov ax, 0x2c04                           
  057c  8b56fe           mov dx, word ptr [bp - 2]                
  057f  8ec0             mov es, ax                               
  0581  2689977f15       mov word ptr es:[bx + 0x157f], dx        
  0586  b8042c           mov ax, 0x2c04                           
  0589  8ec0             mov es, ax                               
  058b  26ff067b15       inc word ptr es:[0x157b]                 
  0590  33f6             xor si, si                               
  0592  eb46             jmp 0x5da                                
  0594  8bde             mov bx, si                               
  0596  d1e3             shl bx, 1                                
  0598  8b46fe           mov ax, word ptr [bp - 2]                
  059b  0387cc02         add ax, word ptr [bx + 0x2cc]            
  059f  6bc070           imul ax, ax, 0x70                        
  05a2  c4168a3f         les dx, ptr [0x3f8a]                     
  05a6  03d0             add dx, ax                               
  05a8  03d7             add dx, di                               
  05aa  8bde             mov bx, si                               
  05ac  d1e3             shl bx, 1                                
  05ae  0397c402         add dx, word ptr [bx + 0x2c4]            
  05b2  8bda             mov bx, dx                               
  05b4  26c68720610a     mov byte ptr es:[bx + 0x6120], 0xa       
  05ba  8bde             mov bx, si                               
  05bc  d1e3             shl bx, 1                                
  05be  8b46fe           mov ax, word ptr [bp - 2]                
  05c1  0387cc02         add ax, word ptr [bx + 0x2cc]            
  05c5  50               push ax                                  
  05c6  8bde             mov bx, si                               
  05c8  d1e3             shl bx, 1                                
  05ca  8bc7             mov ax, di                               
  05cc  0387c402         add ax, word ptr [bx + 0x2c4]            
  05d0  50               push ax                                  
  05d1  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  05d6  83c404           add sp, 4                                
  05d9  46               inc si                                   
  05da  83fe04           cmp si, 4                                
  05dd  7cb5             jl 0x594                                 
  05df  5f               pop di                                   
  05e0  5e               pop si                                   
  05e1  c9               leave                                    
  05e2  cb               retf                                     

ovl11_05e3:  ; ENTRY
  05e3  55               push bp                                  
  05e4  8bec             mov bp, sp                               
  05e6  83ec02           sub sp, 2                                
  05e9  56               push si                                  
  05ea  57               push di                                  
  05eb  33f6             xor si, si                               
  05ed  c746fe0000       mov word ptr [bp - 2], 0                 
  05f2  eb7d             jmp 0x671                                
  05f4  33ff             xor di, di                               
  05f6  eb71             jmp 0x669                                
  05f8  8b5efe           mov bx, word ptr [bp - 2]                
  05fb  69dbe000         imul bx, bx, 0xe0                        
  05ff  8bc7             mov ax, di                               
  0601  d1e0             shl ax, 1                                
  0603  03d8             add bx, ax                               
  0605  b81d1e           mov ax, 0x1e1d                           
  0608  8ec0             mov es, ax                               
  060a  268a870000       mov al, byte ptr es:[bx]                 
  060f  25ff00           and ax, 0xff                             
  0612  3d6000           cmp ax, 0x60                             
  0615  7551             jne 0x668                                
  0617  8bde             mov bx, si                               
  0619  6bdb41           imul bx, bx, 0x41                        
  061c  b8042c           mov ax, 0x2c04                           
  061f  8ec0             mov es, ax                               
  0621  2689bf7d15       mov word ptr es:[bx + 0x157d], di        
  0626  8bde             mov bx, si                               
  0628  6bdb41           imul bx, bx, 0x41                        
  062b  b8042c           mov ax, 0x2c04                           
  062e  8b56fe           mov dx, word ptr [bp - 2]                
  0631  8ec0             mov es, ax                               
  0633  2689977f15       mov word ptr es:[bx + 0x157f], dx        
  0638  8bde             mov bx, si                               
  063a  6bdb41           imul bx, bx, 0x41                        
  063d  b8042c           mov ax, 0x2c04                           
  0640  8ec0             mov es, ax                               
  0642  26c68792150f     mov byte ptr es:[bx + 0x1592], 0xf       
  0648  666803000200     push 0x20003                             
  064e  6a01             push 1                                   
  0650  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0655  83c406           add sp, 6                                
  0658  8bde             mov bx, si                               
  065a  6bdb41           imul bx, bx, 0x41                        
  065d  ba042c           mov dx, 0x2c04                           
  0660  8ec2             mov es, dx                               
  0662  2688879115       mov byte ptr es:[bx + 0x1591], al        
  0667  46               inc si                                   
  0668  47               inc di                                   
  0669  83ff70           cmp di, 0x70                             
  066c  7c8a             jl 0x5f8                                 
  066e  ff46fe           inc word ptr [bp - 2]                    
  0671  817efe9c00       cmp word ptr [bp - 2], 0x9c              
  0676  7d03             jge 0x67b                                
  0678  e979ff           jmp 0x5f4                                
  067b  b8042c           mov ax, 0x2c04                           
  067e  8ec0             mov es, ax                               
  0680  2689367b15       mov word ptr es:[0x157b], si             
  0685  5f               pop di                                   
  0686  5e               pop si                                   
  0687  c9               leave                                    
  0688  cb               retf                                     

ovl11_0689:  ; ENTRY
  0689  55               push bp                                  
  068a  8bec             mov bp, sp                               
  068c  83ec1c           sub sp, 0x1c                             
  068f  56               push si                                  
  0690  57               push di                                  
  0691  c746f40000       mov word ptr [bp - 0xc], 0               
  0696  ff46f4           inc word ptr [bp - 0xc]                  
  0699  c746fe0000       mov word ptr [bp - 2], 0                 
  069e  eb36             jmp 0x6d6                                
  06a0  8b5efe           mov bx, word ptr [bp - 2]                
  06a3  d1e3             shl bx, 1                                
  06a5  8d46e4           lea ax, [bp - 0x1c]                      
  06a8  03d8             add bx, ax                               
  06aa  36c7070000       mov word ptr ss:[bx], 0                  
  06af  8b5efe           mov bx, word ptr [bp - 2]                
  06b2  6bdb14           imul bx, bx, 0x14                        
  06b5  b8042c           mov ax, 0x2c04                           
  06b8  8ec0             mov es, ax                               
  06ba  26c78789019cff   mov word ptr es:[bx + 0x189], 0xff9c     
  06c1  8b5efe           mov bx, word ptr [bp - 2]                
  06c4  6bdb14           imul bx, bx, 0x14                        
  06c7  b8042c           mov ax, 0x2c04                           
  06ca  8ec0             mov es, ax                               
  06cc  26c7878b019cff   mov word ptr es:[bx + 0x18b], 0xff9c     
  06d3  ff46fe           inc word ptr [bp - 2]                    
  06d6  837efe08         cmp word ptr [bp - 2], 8                 
  06da  7cc4             jl 0x6a0                                 
  06dc  c746fe0000       mov word ptr [bp - 2], 0                 
  06e1  e99c01           jmp 0x880                                
  06e4  c746fc0000       mov word ptr [bp - 4], 0                 
  06e9  eb34             jmp 0x71f                                
  06eb  66680800ffff     push 0xffff0008                          
  06f1  6a01             push 1                                   
  06f3  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  06f8  83c406           add sp, 6                                
  06fb  8946f8           mov word ptr [bp - 8], ax                
  06fe  8b5ef8           mov bx, word ptr [bp - 8]                
  0701  d1e3             shl bx, 1                                
  0703  8d46e4           lea ax, [bp - 0x1c]                      
  0706  03d8             add bx, ax                               
  0708  36833f00         cmp word ptr ss:[bx], 0                  
  070c  7511             jne 0x71f                                
  070e  c746fc0100       mov word ptr [bp - 4], 1                 
  0713  8b5ef8           mov bx, word ptr [bp - 8]                
  0716  d1e3             shl bx, 1                                
  0718  03d8             add bx, ax                               
  071a  36c7070100       mov word ptr ss:[bx], 1                  
  071f  837efc00         cmp word ptr [bp - 4], 0                 
  0723  74c6             je 0x6eb                                 
  0725  c746fc0000       mov word ptr [bp - 4], 0                 
  072a  c746fa0000       mov word ptr [bp - 6], 0                 
  072f  e9cf00           jmp 0x801                                
  0732  ff76f8           push word ptr [bp - 8]                   
  0735  90               nop                                      
  0736  0e               push cs                                  
  0737  e8b601           call 0x8f0                               
  073a  59               pop cx                                   
  073b  8bf8             mov di, ax                               
  073d  8bdf             mov bx, di                               
  073f  6bdb41           imul bx, bx, 0x41                        
  0742  b8042c           mov ax, 0x2c04                           
  0745  8ec0             mov es, ax                               
  0747  2683bf7d150c     cmp word ptr es:[bx + 0x157d], 0xc       
  074d  7d03             jge 0x752                                
  074f  e9ac00           jmp 0x7fe                                
  0752  8bdf             mov bx, di                               
  0754  6bdb41           imul bx, bx, 0x41                        
  0757  8ec0             mov es, ax                               
  0759  2683bf7d1564     cmp word ptr es:[bx + 0x157d], 0x64      
  075f  7e03             jle 0x764                                
  0761  e99a00           jmp 0x7fe                                
  0764  8bdf             mov bx, di                               
  0766  6bdb41           imul bx, bx, 0x41                        
  0769  b8042c           mov ax, 0x2c04                           
  076c  8ec0             mov es, ax                               
  076e  2683bf7f150c     cmp word ptr es:[bx + 0x157f], 0xc       
  0774  7d03             jge 0x779                                
  0776  e98500           jmp 0x7fe                                
  0779  8bdf             mov bx, di                               
  077b  6bdb41           imul bx, bx, 0x41                        
  077e  8ec0             mov es, ax                               
  0780  2681bf7f159000   cmp word ptr es:[bx + 0x157f], 0x90      
  0787  7f75             jg 0x7fe                                 
  0789  33c9             xor cx, cx                               
  078b  c746f60100       mov word ptr [bp - 0xa], 1               
  0790  eb5c             jmp 0x7ee                                
  0792  8bd9             mov bx, cx                               
  0794  6bdb14           imul bx, bx, 0x14                        
  0797  b8042c           mov ax, 0x2c04                           
  079a  8bf7             mov si, di                               
  079c  6bf641           imul si, si, 0x41                        
  079f  ba042c           mov dx, 0x2c04                           
  07a2  8ec2             mov es, dx                               
  07a4  53               push bx                                  
  07a5  50               push ax                                  
  07a6  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  07ab  07               pop es                                   
  07ac  5b               pop bx                                   
  07ad  262b878901       sub ax, word ptr es:[bx + 0x189]         
  07b2  99               cdq                                      
  07b3  33c2             xor ax, dx                               
  07b5  2bc2             sub ax, dx                               
  07b7  3d1400           cmp ax, 0x14                             
  07ba  7c2a             jl 0x7e6                                 
  07bc  8bd9             mov bx, cx                               
  07be  6bdb14           imul bx, bx, 0x14                        
  07c1  b8042c           mov ax, 0x2c04                           
  07c4  8bf7             mov si, di                               
  07c6  6bf641           imul si, si, 0x41                        
  07c9  ba042c           mov dx, 0x2c04                           
  07cc  8ec2             mov es, dx                               
  07ce  53               push bx                                  
  07cf  50               push ax                                  
  07d0  268b847f15       mov ax, word ptr es:[si + 0x157f]        
  07d5  07               pop es                                   
  07d6  5b               pop bx                                   
  07d7  262b878b01       sub ax, word ptr es:[bx + 0x18b]         
  07dc  99               cdq                                      
  07dd  33c2             xor ax, dx                               
  07df  2bc2             sub ax, dx                               
  07e1  3d1400           cmp ax, 0x14                             
  07e4  7d07             jge 0x7ed                                
  07e6  c746f60000       mov word ptr [bp - 0xa], 0               
  07eb  eb06             jmp 0x7f3                                
  07ed  41               inc cx                                   
  07ee  83f908           cmp cx, 8                                
  07f1  7c9f             jl 0x792                                 
  07f3  837ef600         cmp word ptr [bp - 0xa], 0               
  07f7  7405             je 0x7fe                                 
  07f9  c746fc0100       mov word ptr [bp - 4], 1                 
  07fe  ff46fa           inc word ptr [bp - 6]                    
  0801  837efc00         cmp word ptr [bp - 4], 0                 
  0805  7509             jne 0x810                                
  0807  837efa64         cmp word ptr [bp - 6], 0x64              
  080b  7d03             jge 0x810                                
  080d  e922ff           jmp 0x732                                
  0810  837efa64         cmp word ptr [bp - 6], 0x64              
  0814  7c09             jl 0x81f                                 
  0816  837ef40a         cmp word ptr [bp - 0xc], 0xa             
  081a  7d03             jge 0x81f                                
  081c  e977fe           jmp 0x696                                
  081f  8b46fe           mov ax, word ptr [bp - 2]                
  0822  d1e0             shl ax, 1                                
  0824  c41e8a3f         les bx, ptr [0x3f8a]                     
  0828  03d8             add bx, ax                               
  082a  268b87621d       mov ax, word ptr es:[bx + 0x1d62]        
  082f  8b56f8           mov dx, word ptr [bp - 8]                
  0832  d1e2             shl dx, 1                                
  0834  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0838  03da             add bx, dx                               
  083a  268987721d       mov word ptr es:[bx + 0x1d72], ax        
  083f  8bdf             mov bx, di                               
  0841  6bdb41           imul bx, bx, 0x41                        
  0844  b8042c           mov ax, 0x2c04                           
  0847  8ec0             mov es, ax                               
  0849  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  084e  8b5efe           mov bx, word ptr [bp - 2]                
  0851  6bdb14           imul bx, bx, 0x14                        
  0854  ba042c           mov dx, 0x2c04                           
  0857  8ec2             mov es, dx                               
  0859  2689878901       mov word ptr es:[bx + 0x189], ax         
  085e  8bdf             mov bx, di                               
  0860  6bdb41           imul bx, bx, 0x41                        
  0863  b8042c           mov ax, 0x2c04                           
  0866  8ec0             mov es, ax                               
  0868  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  086d  8b5efe           mov bx, word ptr [bp - 2]                
  0870  6bdb14           imul bx, bx, 0x14                        
  0873  ba042c           mov dx, 0x2c04                           
  0876  8ec2             mov es, dx                               
  0878  2689878b01       mov word ptr es:[bx + 0x18b], ax         
  087d  ff46fe           inc word ptr [bp - 2]                    
  0880  837efe08         cmp word ptr [bp - 2], 8                 
  0884  7d03             jge 0x889                                
  0886  e95bfe           jmp 0x6e4                                
  0889  c746fe0000       mov word ptr [bp - 2], 0                 
  088e  eb56             jmp 0x8e6                                
  0890  8b5efe           mov bx, word ptr [bp - 2]                
  0893  6bdb14           imul bx, bx, 0x14                        
  0896  b8042c           mov ax, 0x2c04                           
  0899  8ec0             mov es, ax                               
  089b  26ffb78b01       push word ptr es:[bx + 0x18b]            
  08a0  8b5efe           mov bx, word ptr [bp - 2]                
  08a3  6bdb14           imul bx, bx, 0x14                        
  08a6  b8042c           mov ax, 0x2c04                           
  08a9  8ec0             mov es, ax                               
  08ab  26ffb78901       push word ptr es:[bx + 0x189]            
  08b0  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  08b5  83c404           add sp, 4                                
  08b8  8bf8             mov di, ax                               
  08ba  8bdf             mov bx, di                               
  08bc  6bdb41           imul bx, bx, 0x41                        
  08bf  b8042c           mov ax, 0x2c04                           
  08c2  8a56fe           mov dl, byte ptr [bp - 2]                
  08c5  8ec0             mov es, ax                               
  08c7  2688979215       mov byte ptr es:[bx + 0x1592], dl        
  08cc  ff76fe           push word ptr [bp - 2]                   
  08cf  8bc7             mov ax, di                               
  08d1  6bc041           imul ax, ax, 0x41                        
  08d4  057d15           add ax, 0x157d                           
  08d7  68042c           push 0x2c04                              
  08da  50               push ax                                  
  08db  90               nop                                      
  08dc  0e               push cs                                  
  08dd  e8d300           call 0x9b3                               
  08e0  83c406           add sp, 6                                
  08e3  ff46fe           inc word ptr [bp - 2]                    
  08e6  837efe08         cmp word ptr [bp - 2], 8                 
  08ea  7ca4             jl 0x890                                 
  08ec  5f               pop di                                   
  08ed  5e               pop si                                   
  08ee  c9               leave                                    
  08ef  cb               retf                                     

ovl11_08f0:  ; ENTRY
  08f0  55               push bp                                  
  08f1  8bec             mov bp, sp                               
  08f3  83ec0e           sub sp, 0xe                              
  08f6  56               push si                                  
  08f7  57               push di                                  
  08f8  8b4e06           mov cx, word ptr [bp + 6]                
  08fb  33ff             xor di, di                               
  08fd  33f6             xor si, si                               
  08ff  c746f60000       mov word ptr [bp - 0xa], 0               
  0904  8bc1             mov ax, cx                               
  0906  bb0400           mov bx, 4                                
  0909  99               cdq                                      
  090a  f7fb             idiv bx                                  
  090c  6bd21c           imul dx, dx, 0x1c                        
  090f  8956f8           mov word ptr [bp - 8], dx                
  0912  8bc1             mov ax, cx                               
  0914  99               cdq                                      
  0915  f7fb             idiv bx                                  
  0917  6bc04e           imul ax, ax, 0x4e                        
  091a  8946fa           mov word ptr [bp - 6], ax                
  091d  c746fc1c00       mov word ptr [bp - 4], 0x1c              
  0922  c746fe4e00       mov word ptr [bp - 2], 0x4e              
  0927  eb7d             jmp 0x9a6                                
  0929  6aff             push -1                                  
  092b  b8042c           mov ax, 0x2c04                           
  092e  8ec0             mov es, ax                               
  0930  26ff367b15       push word ptr es:[0x157b]                
  0935  6a01             push 1                                   
  0937  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  093c  83c406           add sp, 6                                
  093f  8bf0             mov si, ax                               
  0941  8bde             mov bx, si                               
  0943  6bdb41           imul bx, bx, 0x41                        
  0946  b8042c           mov ax, 0x2c04                           
  0949  8ec0             mov es, ax                               
  094b  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0950  8bde             mov bx, si                               
  0952  6bdb41           imul bx, bx, 0x41                        
  0955  b8042c           mov ax, 0x2c04                           
  0958  8ec0             mov es, ax                               
  095a  26ffb77d15       push word ptr es:[bx + 0x157d]           
  095f  16               push ss                                  
  0960  8d46f2           lea ax, [bp - 0xe]                       
  0963  50               push ax                                  
  0964  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0969  83c408           add sp, 8                                
  096c  8b46f2           mov ax, word ptr [bp - 0xe]              
  096f  3b46f8           cmp ax, word ptr [bp - 8]                
  0972  7c23             jl 0x997                                 
  0974  8b46f8           mov ax, word ptr [bp - 8]                
  0977  0346fc           add ax, word ptr [bp - 4]                
  097a  3b46f2           cmp ax, word ptr [bp - 0xe]              
  097d  7e18             jle 0x997                                
  097f  8b46f4           mov ax, word ptr [bp - 0xc]              
  0982  3b46fa           cmp ax, word ptr [bp - 6]                
  0985  7c10             jl 0x997                                 
  0987  8b46fa           mov ax, word ptr [bp - 6]                
  098a  0346fe           add ax, word ptr [bp - 2]                
  098d  3b46f4           cmp ax, word ptr [bp - 0xc]              
  0990  7e05             jle 0x997                                
  0992  b80100           mov ax, 1                                
  0995  eb02             jmp 0x999                                
  0997  33c0             xor ax, ax                               
  0999  8bf8             mov di, ax                               
  099b  8b46f6           mov ax, word ptr [bp - 0xa]              
  099e  ff46f6           inc word ptr [bp - 0xa]                  
  09a1  3dc800           cmp ax, 0xc8                              ; "Quest"
  09a4  7f07             jg 0x9ad                                 
  09a6  0bff             or di, di                                
  09a8  7503             jne 0x9ad                                
  09aa  e97cff           jmp 0x929                                
  09ad  8bc6             mov ax, si                               
  09af  5f               pop di                                   
  09b0  5e               pop si                                   
  09b1  c9               leave                                    
  09b2  cb               retf                                     

ovl11_09b3:  ; ENTRY
  09b3  55               push bp                                  
  09b4  8bec             mov bp, sp                               
  09b6  56               push si                                  
  09b7  57               push di                                  
  09b8  8b560a           mov dx, word ptr [bp + 0xa]              
  09bb  c45e06           les bx, ptr [bp + 6]                     
  09be  268b37           mov si, word ptr es:[bx]                 
  09c1  268b7f02         mov di, word ptr es:[bx + 2]             
  09c5  83fa06           cmp dx, 6                                
  09c8  7c05             jl 0x9cf                                 
  09ca  b88000           mov ax, 0x80                             
  09cd  eb03             jmp 0x9d2                                
  09cf  b86200           mov ax, 0x62                             
  09d2  8bc8             mov cx, ax                               
  09d4  83fa06           cmp dx, 6                                
  09d7  7c09             jl 0x9e2                                 
  09d9  8bc2             mov ax, dx                               
  09db  05faff           add ax, 0xfffa                           
  09de  d1e0             shl ax, 1                                
  09e0  eb04             jmp 0x9e6                                
  09e2  8bc2             mov ax, dx                               
  09e4  d1e0             shl ax, 1                                
  09e6  03c8             add cx, ax                               
  09e8  8bc1             mov ax, cx                               
  09ea  25ff00           and ax, 0xff                             
  09ed  8bdf             mov bx, di                               
  09ef  69dbe000         imul bx, bx, 0xe0                        
  09f3  8bd6             mov dx, si                               
  09f5  d1e2             shl dx, 1                                
  09f7  03da             add bx, dx                               
  09f9  ba1d1e           mov dx, 0x1e1d                           
  09fc  8ec2             mov es, dx                               
  09fe  2680a7000000     and byte ptr es:[bx], 0                  
  0a04  2608870000       or byte ptr es:[bx], al                  
  0a09  8bc1             mov ax, cx                               
  0a0b  40               inc ax                                   
  0a0c  25ff00           and ax, 0xff                             
  0a0f  8bdf             mov bx, di                               
  0a11  69dbe000         imul bx, bx, 0xe0                        
  0a15  8bd6             mov dx, si                               
  0a17  d1e2             shl dx, 1                                
  0a19  03da             add bx, dx                               
  0a1b  ba1d1e           mov dx, 0x1e1d                           
  0a1e  8ec2             mov es, dx                               
  0a20  2680a7020000     and byte ptr es:[bx + 2], 0              
  0a26  2608870200       or byte ptr es:[bx + 2], al              
  0a2b  8bc1             mov ax, cx                               
  0a2d  051000           add ax, 0x10                             
  0a30  25ff00           and ax, 0xff                             
  0a33  8bdf             mov bx, di                               
  0a35  69dbe000         imul bx, bx, 0xe0                        
  0a39  8bd6             mov dx, si                               
  0a3b  d1e2             shl dx, 1                                
  0a3d  03da             add bx, dx                               
  0a3f  ba1d1e           mov dx, 0x1e1d                           
  0a42  8ec2             mov es, dx                               
  0a44  2680a7e00000     and byte ptr es:[bx + 0xe0], 0           
  0a4a  260887e000       or byte ptr es:[bx + 0xe0], al           
  0a4f  8bc1             mov ax, cx                               
  0a51  051100           add ax, 0x11                             
  0a54  25ff00           and ax, 0xff                             
  0a57  8bdf             mov bx, di                               
  0a59  69dbe000         imul bx, bx, 0xe0                        
  0a5d  8bd6             mov dx, si                               
  0a5f  d1e2             shl dx, 1                                
  0a61  03da             add bx, dx                               
  0a63  ba1d1e           mov dx, 0x1e1d                           
  0a66  8ec2             mov es, dx                               
  0a68  2680a7e20000     and byte ptr es:[bx + 0xe2], 0           
  0a6e  260887e200       or byte ptr es:[bx + 0xe2], al           
  0a73  5f               pop di                                   
  0a74  5e               pop si                                   
  0a75  5d               pop bp                                   
  0a76  cb               retf                                     

ovl11_0a77:  ; ENTRY
  0a77  55               push bp                                  
  0a78  8bec             mov bp, sp                               
  0a7a  83ec0c           sub sp, 0xc                              
  0a7d  56               push si                                  
  0a7e  57               push di                                  
  0a7f  c746f40000       mov word ptr [bp - 0xc], 0               
  0a84  833ed402ff       cmp word ptr [0x2d4], -1                 
  0a89  7513             jne 0xa9e                                
  0a8b  66681000ffff     push 0xffff0010                          
  0a91  6a01             push 1                                   
  0a93  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0a98  83c406           add sp, 6                                
  0a9b  a3d402           mov word ptr [0x2d4], ax                 
  0a9e  a1d402           mov ax, word ptr [0x2d4]                 
  0aa1  bb0400           mov bx, 4                                
  0aa4  99               cdq                                      
  0aa5  f7fb             idiv bx                                  
  0aa7  6bd270           imul dx, dx, 0x70                        
  0aaa  8bc2             mov ax, dx                               
  0aac  99               cdq                                      
  0aad  f7fb             idiv bx                                  
  0aaf  050400           add ax, 4                                
  0ab2  8946fe           mov word ptr [bp - 2], ax                
  0ab5  051400           add ax, 0x14                             
  0ab8  8946fc           mov word ptr [bp - 4], ax                
  0abb  a1d402           mov ax, word ptr [0x2d4]                 
  0abe  99               cdq                                      
  0abf  f7fb             idiv bx                                  
  0ac1  69c09c00         imul ax, ax, 0x9c                        
  0ac5  99               cdq                                      
  0ac6  f7fb             idiv bx                                  
  0ac8  050400           add ax, 4                                
  0acb  8946fa           mov word ptr [bp - 6], ax                
  0ace  051f00           add ax, 0x1f                             
  0ad1  8946f8           mov word ptr [bp - 8], ax                
  0ad4  c746f60000       mov word ptr [bp - 0xa], 0               
  0ad9  e9bf00           jmp 0xb9b                                
  0adc  8b46fe           mov ax, word ptr [bp - 2]                
  0adf  48               dec ax                                   
  0ae0  50               push ax                                  
  0ae1  8b46fc           mov ax, word ptr [bp - 4]                
  0ae4  2b46fe           sub ax, word ptr [bp - 2]                
  0ae7  50               push ax                                  
  0ae8  6a01             push 1                                   
  0aea  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0aef  83c406           add sp, 6                                
  0af2  8bf8             mov di, ax                               
  0af4  8b46fa           mov ax, word ptr [bp - 6]                
  0af7  48               dec ax                                   
  0af8  50               push ax                                  
  0af9  8b46f8           mov ax, word ptr [bp - 8]                
  0afc  2b46fa           sub ax, word ptr [bp - 6]                
  0aff  50               push ax                                  
  0b00  6a01             push 1                                   
  0b02  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0b07  83c406           add sp, 6                                
  0b0a  8bf0             mov si, ax                               
  0b0c  6bc070           imul ax, ax, 0x70                        
  0b0f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0b13  03d8             add bx, ax                               
  0b15  03df             add bx, di                               
  0b17  268a872061       mov al, byte ptr es:[bx + 0x6120]        
  0b1c  98               cwde                                     
  0b1d  3b4606           cmp ax, word ptr [bp + 6]                
  0b20  7579             jne 0xb9b                                
  0b22  6a0a             push 0xa                                 
  0b24  56               push si                                  
  0b25  57               push di                                  
  0b26  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0b2b  83c406           add sp, 6                                
  0b2e  0bc0             or ax, ax                                
  0b30  7569             jne 0xb9b                                
  0b32  6a0b             push 0xb                                 
  0b34  56               push si                                  
  0b35  57               push di                                  
  0b36  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0b3b  83c406           add sp, 6                                
  0b3e  0bc0             or ax, ax                                
  0b40  7559             jne 0xb9b                                
  0b42  6a0b             push 0xb                                 
  0b44  56               push si                                  
  0b45  8bc7             mov ax, di                               
  0b47  05fdff           add ax, 0xfffd                           
  0b4a  50               push ax                                  
  0b4b  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0b50  83c406           add sp, 6                                
  0b53  0bc0             or ax, ax                                
  0b55  7544             jne 0xb9b                                
  0b57  6a0b             push 0xb                                 
  0b59  56               push si                                  
  0b5a  8bc7             mov ax, di                               
  0b5c  050300           add ax, 3                                
  0b5f  50               push ax                                  
  0b60  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0b65  83c406           add sp, 6                                
  0b68  0bc0             or ax, ax                                
  0b6a  752f             jne 0xb9b                                
  0b6c  6a0b             push 0xb                                 
  0b6e  8bc6             mov ax, si                               
  0b70  05fdff           add ax, 0xfffd                           
  0b73  50               push ax                                  
  0b74  57               push di                                  
  0b75  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0b7a  83c406           add sp, 6                                
  0b7d  0bc0             or ax, ax                                
  0b7f  751a             jne 0xb9b                                
  0b81  6a0b             push 0xb                                 
  0b83  8bc6             mov ax, si                               
  0b85  050300           add ax, 3                                
  0b88  50               push ax                                  
  0b89  57               push di                                  
  0b8a  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0b8f  83c406           add sp, 6                                
  0b92  0bc0             or ax, ax                                
  0b94  7505             jne 0xb9b                                
  0b96  c746f40100       mov word ptr [bp - 0xc], 1               
  0b9b  837ef400         cmp word ptr [bp - 0xc], 0               
  0b9f  750e             jne 0xbaf                                
  0ba1  8b46f6           mov ax, word ptr [bp - 0xa]              
  0ba4  ff46f6           inc word ptr [bp - 0xa]                  
  0ba7  3d3200           cmp ax, 0x32                             
  0baa  7d03             jge 0xbaf                                
  0bac  e92dff           jmp 0xadc                                
  0baf  837ef400         cmp word ptr [bp - 0xc], 0               
  0bb3  7577             jne 0xc2c                                
  0bb5  c746f60000       mov word ptr [bp - 0xa], 0               
  0bba  eb5f             jmp 0xc1b                                
  0bbc  666866000500     push 0x50066                             
  0bc2  6a01             push 1                                   
  0bc4  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0bc9  83c406           add sp, 6                                
  0bcc  8bf8             mov di, ax                               
  0bce  666892000500     push 0x50092                             
  0bd4  6a01             push 1                                   
  0bd6  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0bdb  83c406           add sp, 6                                
  0bde  8bf0             mov si, ax                               
  0be0  6bc070           imul ax, ax, 0x70                        
  0be3  c41e8a3f         les bx, ptr [0x3f8a]                     
  0be7  03d8             add bx, ax                               
  0be9  03df             add bx, di                               
  0beb  268a872061       mov al, byte ptr es:[bx + 0x6120]        
  0bf0  98               cwde                                     
  0bf1  3b4606           cmp ax, word ptr [bp + 6]                
  0bf4  7525             jne 0xc1b                                
  0bf6  6a0a             push 0xa                                 
  0bf8  56               push si                                  
  0bf9  57               push di                                  
  0bfa  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0bff  83c406           add sp, 6                                
  0c02  0bc0             or ax, ax                                
  0c04  7515             jne 0xc1b                                
  0c06  6a0b             push 0xb                                 
  0c08  56               push si                                  
  0c09  57               push di                                  
  0c0a  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0c0f  83c406           add sp, 6                                
  0c12  0bc0             or ax, ax                                
  0c14  7505             jne 0xc1b                                
  0c16  c746f40100       mov word ptr [bp - 0xc], 1               
  0c1b  837ef400         cmp word ptr [bp - 0xc], 0               
  0c1f  750b             jne 0xc2c                                
  0c21  8b46f6           mov ax, word ptr [bp - 0xa]              
  0c24  ff46f6           inc word ptr [bp - 0xa]                  
  0c27  3d3200           cmp ax, 0x32                             
  0c2a  7c90             jl 0xbbc                                 
  0c2c  837ef400         cmp word ptr [bp - 0xc], 0               
  0c30  7403             je 0xc35                                 
  0c32  e98d00           jmp 0xcc2                                
  0c35  666866000500     push 0x50066                             
  0c3b  6a01             push 1                                   
  0c3d  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c42  83c406           add sp, 6                                
  0c45  8bf8             mov di, ax                               
  0c47  666892000500     push 0x50092                             
  0c4d  6a01             push 1                                   
  0c4f  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c54  83c406           add sp, 6                                
  0c57  8bf0             mov si, ax                               
  0c59  c746f60000       mov word ptr [bp - 0xa], 0               
  0c5e  eb51             jmp 0xcb1                                
  0c60  666866000500     push 0x50066                             
  0c66  6a01             push 1                                   
  0c68  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c6d  83c406           add sp, 6                                
  0c70  8bf8             mov di, ax                               
  0c72  666892000500     push 0x50092                             
  0c78  6a01             push 1                                   
  0c7a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0c7f  83c406           add sp, 6                                
  0c82  8bf0             mov si, ax                               
  0c84  6bc070           imul ax, ax, 0x70                        
  0c87  c41e8a3f         les bx, ptr [0x3f8a]                     
  0c8b  03d8             add bx, ax                               
  0c8d  03df             add bx, di                               
  0c8f  2680bf20610a     cmp byte ptr es:[bx + 0x6120], 0xa       
  0c95  741a             je 0xcb1                                 
  0c97  8bc6             mov ax, si                               
  0c99  6bc070           imul ax, ax, 0x70                        
  0c9c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0ca0  03d8             add bx, ax                               
  0ca2  03df             add bx, di                               
  0ca4  2680bf20610b     cmp byte ptr es:[bx + 0x6120], 0xb       
  0caa  7405             je 0xcb1                                 
  0cac  c746f40100       mov word ptr [bp - 0xc], 1               
  0cb1  837ef400         cmp word ptr [bp - 0xc], 0               
  0cb5  750b             jne 0xcc2                                
  0cb7  8b46f6           mov ax, word ptr [bp - 0xa]              
  0cba  ff46f6           inc word ptr [bp - 0xa]                  
  0cbd  3d3200           cmp ax, 0x32                             
  0cc0  7c9e             jl 0xc60                                 
  0cc2  c45e08           les bx, ptr [bp + 8]                     
  0cc5  26893f           mov word ptr es:[bx], di                 
  0cc8  c45e0c           les bx, ptr [bp + 0xc]                   
  0ccb  268937           mov word ptr es:[bx], si                 
  0cce  a1d402           mov ax, word ptr [0x2d4]                 
  0cd1  40               inc ax                                   
  0cd2  bb1000           mov bx, 0x10                             
  0cd5  99               cdq                                      
  0cd6  f7fb             idiv bx                                  
  0cd8  8916d402         mov word ptr [0x2d4], dx                 
  0cdc  5f               pop di                                   
  0cdd  5e               pop si                                   
  0cde  c9               leave                                    
  0cdf  cb               retf                                     

ovl11_0ce0:  ; ENTRY
  0ce0  55               push bp                                  
  0ce1  8bec             mov bp, sp                               
  0ce3  56               push si                                  
  0ce4  57               push di                                  
  0ce5  33ff             xor di, di                               
  0ce7  e9f603           jmp 0x10e0                               
  0cea  33c0             xor ax, ax                               
  0cec  a3de02           mov word ptr [0x2de], ax                 
  0cef  a3dc02           mov word ptr [0x2dc], ax                 
  0cf2  a3da02           mov word ptr [0x2da], ax                 
  0cf5  a3d802           mov word ptr [0x2d8], ax                 
  0cf8  a3d602           mov word ptr [0x2d6], ax                 
  0cfb  8bf7             mov si, di                               
  0cfd  6a03             push 3                                   
  0cff  8bde             mov bx, si                               
  0d01  6bdb41           imul bx, bx, 0x41                        
  0d04  b8042c           mov ax, 0x2c04                           
  0d07  8ec0             mov es, ax                               
  0d09  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0d0e  8bde             mov bx, si                               
  0d10  6bdb41           imul bx, bx, 0x41                        
  0d13  b8042c           mov ax, 0x2c04                           
  0d16  8ec0             mov es, ax                               
  0d18  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0d1d  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0d22  83c406           add sp, 6                                
  0d25  0bc0             or ax, ax                                
  0d27  7403             je 0xd2c                                 
  0d29  e98c00           jmp 0xdb8                                
  0d2c  6a03             push 3                                   
  0d2e  8bde             mov bx, si                               
  0d30  6bdb41           imul bx, bx, 0x41                        
  0d33  b8042c           mov ax, 0x2c04                           
  0d36  8ec0             mov es, ax                               
  0d38  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0d3d  8bde             mov bx, si                               
  0d3f  6bdb41           imul bx, bx, 0x41                        
  0d42  b8042c           mov ax, 0x2c04                           
  0d45  8ec0             mov es, ax                               
  0d47  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0d4c  40               inc ax                                   
  0d4d  50               push ax                                  
  0d4e  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0d53  83c406           add sp, 6                                
  0d56  0bc0             or ax, ax                                
  0d58  755e             jne 0xdb8                                
  0d5a  6a03             push 3                                   
  0d5c  8bde             mov bx, si                               
  0d5e  6bdb41           imul bx, bx, 0x41                        
  0d61  b8042c           mov ax, 0x2c04                           
  0d64  8ec0             mov es, ax                               
  0d66  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0d6b  40               inc ax                                   
  0d6c  50               push ax                                  
  0d6d  8bde             mov bx, si                               
  0d6f  6bdb41           imul bx, bx, 0x41                        
  0d72  b8042c           mov ax, 0x2c04                           
  0d75  8ec0             mov es, ax                               
  0d77  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0d7c  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0d81  83c406           add sp, 6                                
  0d84  0bc0             or ax, ax                                
  0d86  7530             jne 0xdb8                                
  0d88  6a03             push 3                                   
  0d8a  8bde             mov bx, si                               
  0d8c  6bdb41           imul bx, bx, 0x41                        
  0d8f  b8042c           mov ax, 0x2c04                           
  0d92  8ec0             mov es, ax                               
  0d94  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0d99  40               inc ax                                   
  0d9a  50               push ax                                  
  0d9b  8bde             mov bx, si                               
  0d9d  6bdb41           imul bx, bx, 0x41                        
  0da0  b8042c           mov ax, 0x2c04                           
  0da3  8ec0             mov es, ax                               
  0da5  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0daa  40               inc ax                                   
  0dab  50               push ax                                  
  0dac  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0db1  83c406           add sp, 6                                
  0db4  0bc0             or ax, ax                                
  0db6  7406             je 0xdbe                                 
  0db8  c706d6020100     mov word ptr [0x2d6], 1                  
  0dbe  6a04             push 4                                   
  0dc0  8bde             mov bx, si                               
  0dc2  6bdb41           imul bx, bx, 0x41                        
  0dc5  b8042c           mov ax, 0x2c04                           
  0dc8  8ec0             mov es, ax                               
  0dca  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0dcf  8bde             mov bx, si                               
  0dd1  6bdb41           imul bx, bx, 0x41                        
  0dd4  b8042c           mov ax, 0x2c04                           
  0dd7  8ec0             mov es, ax                               
  0dd9  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0dde  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0de3  83c406           add sp, 6                                
  0de6  0bc0             or ax, ax                                
  0de8  7403             je 0xded                                 
  0dea  e98c00           jmp 0xe79                                
  0ded  6a04             push 4                                   
  0def  8bde             mov bx, si                               
  0df1  6bdb41           imul bx, bx, 0x41                        
  0df4  b8042c           mov ax, 0x2c04                           
  0df7  8ec0             mov es, ax                               
  0df9  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0dfe  8bde             mov bx, si                               
  0e00  6bdb41           imul bx, bx, 0x41                        
  0e03  b8042c           mov ax, 0x2c04                           
  0e06  8ec0             mov es, ax                               
  0e08  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0e0d  40               inc ax                                   
  0e0e  50               push ax                                  
  0e0f  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0e14  83c406           add sp, 6                                
  0e17  0bc0             or ax, ax                                
  0e19  755e             jne 0xe79                                
  0e1b  6a04             push 4                                   
  0e1d  8bde             mov bx, si                               
  0e1f  6bdb41           imul bx, bx, 0x41                        
  0e22  b8042c           mov ax, 0x2c04                           
  0e25  8ec0             mov es, ax                               
  0e27  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0e2c  40               inc ax                                   
  0e2d  50               push ax                                  
  0e2e  8bde             mov bx, si                               
  0e30  6bdb41           imul bx, bx, 0x41                        
  0e33  b8042c           mov ax, 0x2c04                           
  0e36  8ec0             mov es, ax                               
  0e38  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0e3d  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0e42  83c406           add sp, 6                                
  0e45  0bc0             or ax, ax                                
  0e47  7530             jne 0xe79                                
  0e49  6a04             push 4                                   
  0e4b  8bde             mov bx, si                               
  0e4d  6bdb41           imul bx, bx, 0x41                        
  0e50  b8042c           mov ax, 0x2c04                           
  0e53  8ec0             mov es, ax                               
  0e55  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0e5a  40               inc ax                                   
  0e5b  50               push ax                                  
  0e5c  8bde             mov bx, si                               
  0e5e  6bdb41           imul bx, bx, 0x41                        
  0e61  b8042c           mov ax, 0x2c04                           
  0e64  8ec0             mov es, ax                               
  0e66  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0e6b  40               inc ax                                   
  0e6c  50               push ax                                  
  0e6d  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0e72  83c406           add sp, 6                                
  0e75  0bc0             or ax, ax                                
  0e77  7406             je 0xe7f                                 
  0e79  c706d8020100     mov word ptr [0x2d8], 1                  
  0e7f  6a00             push 0                                   
  0e81  8bde             mov bx, si                               
  0e83  6bdb41           imul bx, bx, 0x41                        
  0e86  b8042c           mov ax, 0x2c04                           
  0e89  8ec0             mov es, ax                               
  0e8b  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0e90  8bde             mov bx, si                               
  0e92  6bdb41           imul bx, bx, 0x41                        
  0e95  b8042c           mov ax, 0x2c04                           
  0e98  8ec0             mov es, ax                               
  0e9a  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0e9f  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0ea4  83c406           add sp, 6                                
  0ea7  0bc0             or ax, ax                                
  0ea9  7403             je 0xeae                                 
  0eab  e98c00           jmp 0xf3a                                
  0eae  6a00             push 0                                   
  0eb0  8bde             mov bx, si                               
  0eb2  6bdb41           imul bx, bx, 0x41                        
  0eb5  b8042c           mov ax, 0x2c04                           
  0eb8  8ec0             mov es, ax                               
  0eba  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0ebf  8bde             mov bx, si                               
  0ec1  6bdb41           imul bx, bx, 0x41                        
  0ec4  b8042c           mov ax, 0x2c04                           
  0ec7  8ec0             mov es, ax                               
  0ec9  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0ece  40               inc ax                                   
  0ecf  50               push ax                                  
  0ed0  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0ed5  83c406           add sp, 6                                
  0ed8  0bc0             or ax, ax                                
  0eda  755e             jne 0xf3a                                
  0edc  6a00             push 0                                   
  0ede  8bde             mov bx, si                               
  0ee0  6bdb41           imul bx, bx, 0x41                        
  0ee3  b8042c           mov ax, 0x2c04                           
  0ee6  8ec0             mov es, ax                               
  0ee8  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0eed  40               inc ax                                   
  0eee  50               push ax                                  
  0eef  8bde             mov bx, si                               
  0ef1  6bdb41           imul bx, bx, 0x41                        
  0ef4  b8042c           mov ax, 0x2c04                           
  0ef7  8ec0             mov es, ax                               
  0ef9  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0efe  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0f03  83c406           add sp, 6                                
  0f06  0bc0             or ax, ax                                
  0f08  7530             jne 0xf3a                                
  0f0a  6a00             push 0                                   
  0f0c  8bde             mov bx, si                               
  0f0e  6bdb41           imul bx, bx, 0x41                        
  0f11  b8042c           mov ax, 0x2c04                           
  0f14  8ec0             mov es, ax                               
  0f16  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0f1b  40               inc ax                                   
  0f1c  50               push ax                                  
  0f1d  8bde             mov bx, si                               
  0f1f  6bdb41           imul bx, bx, 0x41                        
  0f22  b8042c           mov ax, 0x2c04                           
  0f25  8ec0             mov es, ax                               
  0f27  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0f2c  40               inc ax                                   
  0f2d  50               push ax                                  
  0f2e  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0f33  83c406           add sp, 6                                
  0f36  0bc0             or ax, ax                                
  0f38  7406             je 0xf40                                 
  0f3a  c706da020100     mov word ptr [0x2da], 1                  
  0f40  6a05             push 5                                   
  0f42  8bde             mov bx, si                               
  0f44  6bdb41           imul bx, bx, 0x41                        
  0f47  b8042c           mov ax, 0x2c04                           
  0f4a  8ec0             mov es, ax                               
  0f4c  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0f51  8bde             mov bx, si                               
  0f53  6bdb41           imul bx, bx, 0x41                        
  0f56  b8042c           mov ax, 0x2c04                           
  0f59  8ec0             mov es, ax                               
  0f5b  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0f60  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0f65  83c406           add sp, 6                                
  0f68  0bc0             or ax, ax                                
  0f6a  7403             je 0xf6f                                 
  0f6c  e98c00           jmp 0xffb                                
  0f6f  6a05             push 5                                   
  0f71  8bde             mov bx, si                               
  0f73  6bdb41           imul bx, bx, 0x41                        
  0f76  b8042c           mov ax, 0x2c04                           
  0f79  8ec0             mov es, ax                               
  0f7b  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0f80  8bde             mov bx, si                               
  0f82  6bdb41           imul bx, bx, 0x41                        
  0f85  b8042c           mov ax, 0x2c04                           
  0f88  8ec0             mov es, ax                               
  0f8a  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0f8f  40               inc ax                                   
  0f90  50               push ax                                  
  0f91  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0f96  83c406           add sp, 6                                
  0f99  0bc0             or ax, ax                                
  0f9b  755e             jne 0xffb                                
  0f9d  6a05             push 5                                   
  0f9f  8bde             mov bx, si                               
  0fa1  6bdb41           imul bx, bx, 0x41                        
  0fa4  b8042c           mov ax, 0x2c04                           
  0fa7  8ec0             mov es, ax                               
  0fa9  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0fae  40               inc ax                                   
  0faf  50               push ax                                  
  0fb0  8bde             mov bx, si                               
  0fb2  6bdb41           imul bx, bx, 0x41                        
  0fb5  b8042c           mov ax, 0x2c04                           
  0fb8  8ec0             mov es, ax                               
  0fba  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0fbf  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0fc4  83c406           add sp, 6                                
  0fc7  0bc0             or ax, ax                                
  0fc9  7530             jne 0xffb                                
  0fcb  6a05             push 5                                   
  0fcd  8bde             mov bx, si                               
  0fcf  6bdb41           imul bx, bx, 0x41                        
  0fd2  b8042c           mov ax, 0x2c04                           
  0fd5  8ec0             mov es, ax                               
  0fd7  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0fdc  40               inc ax                                   
  0fdd  50               push ax                                  
  0fde  8bde             mov bx, si                               
  0fe0  6bdb41           imul bx, bx, 0x41                        
  0fe3  b8042c           mov ax, 0x2c04                           
  0fe6  8ec0             mov es, ax                               
  0fe8  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0fed  40               inc ax                                   
  0fee  50               push ax                                  
  0fef  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0ff4  83c406           add sp, 6                                
  0ff7  0bc0             or ax, ax                                
  0ff9  7406             je 0x1001                                
  0ffb  c706dc020100     mov word ptr [0x2dc], 1                  
  1001  6a08             push 8                                   
  1003  8bde             mov bx, si                               
  1005  6bdb41           imul bx, bx, 0x41                        
  1008  b8042c           mov ax, 0x2c04                           
  100b  8ec0             mov es, ax                               
  100d  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1012  8bde             mov bx, si                               
  1014  6bdb41           imul bx, bx, 0x41                        
  1017  b8042c           mov ax, 0x2c04                           
  101a  8ec0             mov es, ax                               
  101c  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1021  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  1026  83c406           add sp, 6                                
  1029  0bc0             or ax, ax                                
  102b  7403             je 0x1030                                
  102d  e98c00           jmp 0x10bc                               
  1030  6a08             push 8                                   
  1032  8bde             mov bx, si                               
  1034  6bdb41           imul bx, bx, 0x41                        
  1037  b8042c           mov ax, 0x2c04                           
  103a  8ec0             mov es, ax                               
  103c  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1041  8bde             mov bx, si                               
  1043  6bdb41           imul bx, bx, 0x41                        
  1046  b8042c           mov ax, 0x2c04                           
  1049  8ec0             mov es, ax                               
  104b  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  1050  40               inc ax                                   
  1051  50               push ax                                  
  1052  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  1057  83c406           add sp, 6                                
  105a  0bc0             or ax, ax                                
  105c  755e             jne 0x10bc                               
  105e  6a08             push 8                                   
  1060  8bde             mov bx, si                               
  1062  6bdb41           imul bx, bx, 0x41                        
  1065  b8042c           mov ax, 0x2c04                           
  1068  8ec0             mov es, ax                               
  106a  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  106f  40               inc ax                                   
  1070  50               push ax                                  
  1071  8bde             mov bx, si                               
  1073  6bdb41           imul bx, bx, 0x41                        
  1076  b8042c           mov ax, 0x2c04                           
  1079  8ec0             mov es, ax                               
  107b  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1080  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  1085  83c406           add sp, 6                                
  1088  0bc0             or ax, ax                                
  108a  7530             jne 0x10bc                               
  108c  6a08             push 8                                   
  108e  8bde             mov bx, si                               
  1090  6bdb41           imul bx, bx, 0x41                        
  1093  b8042c           mov ax, 0x2c04                           
  1096  8ec0             mov es, ax                               
  1098  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  109d  40               inc ax                                   
  109e  50               push ax                                  
  109f  8bde             mov bx, si                               
  10a1  6bdb41           imul bx, bx, 0x41                        
  10a4  b8042c           mov ax, 0x2c04                           
  10a7  8ec0             mov es, ax                               
  10a9  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  10ae  40               inc ax                                   
  10af  50               push ax                                  
  10b0  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  10b5  83c406           add sp, 6                                
  10b8  0bc0             or ax, ax                                
  10ba  7406             je 0x10c2                                
  10bc  c706de020100     mov word ptr [0x2de], 1                  
  10c2  57               push di                                  
  10c3  90               nop                                      
  10c4  0e               push cs                                  
  10c5  e83c00           call 0x1104                              
  10c8  59               pop cx                                   
  10c9  8bf0             mov si, ax                               
  10cb  50               push ax                                  
  10cc  57               push di                                  
  10cd  90               nop                                      
  10ce  0e               push cs                                  
  10cf  e89f00           call 0x1171                              
  10d2  83c404           add sp, 4                                
  10d5  56               push si                                  
  10d6  57               push di                                  
  10d7  90               nop                                      
  10d8  0e               push cs                                  
  10d9  e84105           call 0x161d                              
  10dc  83c404           add sp, 4                                
  10df  47               inc di                                   
  10e0  b8042c           mov ax, 0x2c04                           
  10e3  8ec0             mov es, ax                               
  10e5  26393e7b15       cmp word ptr es:[0x157b], di             
  10ea  7e03             jle 0x10ef                               
  10ec  e9fbfb           jmp 0xcea                                
  10ef  833ecc2800       cmp word ptr [0x28cc], 0                 
  10f4  7405             je 0x10fb                                
  10f6  90               nop                                      
  10f7  0e               push cs                                  
  10f8  e8440a           call 0x1b3f                              
  10fb  90               nop                                      
  10fc  0e               push cs                                  
  10fd  e81d0b           call 0x1c1d                              
  1100  5f               pop di                                   
  1101  5e               pop si                                   
  1102  5d               pop bp                                   
  1103  cb               retf                                     

ovl11_1104:  ; ENTRY
  1104  55               push bp                                  
  1105  8bec             mov bp, sp                               
  1107  8b5e06           mov bx, word ptr [bp + 6]                
  110a  6bdb41           imul bx, bx, 0x41                        
  110d  b8042c           mov ax, 0x2c04                           
  1110  8ec0             mov es, ax                               
  1112  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  1118  7405             je 0x111f                                
  111a  b80900           mov ax, 9                                
  111d  eb50             jmp 0x116f                               
  111f  66680400ffff     push 0xffff0004                          
  1125  6a01             push 1                                   
  1127  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  112c  83c406           add sp, 6                                
  112f  8bd0             mov dx, ax                               
  1131  833ed60200       cmp word ptr [0x2d6], 0                  
  1136  7403             je 0x113b                                
  1138  83c204           add dx, 4                                
  113b  833eda0200       cmp word ptr [0x2da], 0                  
  1140  7403             je 0x1145                                
  1142  83c202           add dx, 2                                
  1145  833ed80200       cmp word ptr [0x2d8], 0                  
  114a  7401             je 0x114d                                
  114c  4a               dec dx                                   
  114d  833ede0200       cmp word ptr [0x2de], 0                  
  1152  7403             je 0x1157                                
  1154  83ea02           sub dx, 2                                
  1157  83fa09           cmp dx, 9                                
  115a  7d04             jge 0x1160                               
  115c  8bc2             mov ax, dx                               
  115e  eb03             jmp 0x1163                               
  1160  b80900           mov ax, 9                                
  1163  8bd0             mov dx, ax                               
  1165  0bd2             or dx, dx                                
  1167  7e02             jle 0x116b                               
  1169  eb02             jmp 0x116d                               
  116b  33c0             xor ax, ax                               
  116d  8bd0             mov dx, ax                               
  116f  5d               pop bp                                   
  1170  cb               retf                                     

ovl11_1171:  ; ENTRY
  1171  55               push bp                                  
  1172  8bec             mov bp, sp                               
  1174  81ec0e01         sub sp, 0x10e                            
  1178  56               push si                                  
  1179  57               push di                                  
  117a  8b7e08           mov di, word ptr [bp + 8]                
  117d  ff7606           push word ptr [bp + 6]                   
  1180  90               nop                                      
  1181  0e               push cs                                  
  1182  e8e302           call 0x1468                              
  1185  59               pop cx                                   
  1186  666a08           push 8                                   
  1189  6a01             push 1                                   
  118b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1190  83c406           add sp, 6                                
  1193  8bd7             mov dx, di                               
  1195  d1e2             shl dx, 1                                
  1197  03d0             add dx, ax                               
  1199  83c20e           add dx, 0xe                              
  119c  8b5e06           mov bx, word ptr [bp + 6]                
  119f  6bdb41           imul bx, bx, 0x41                        
  11a2  b8042c           mov ax, 0x2c04                           
  11a5  8ec0             mov es, ax                               
  11a7  268997a715       mov word ptr es:[bx + 0x15a7], dx        
  11ac  8bc7             mov ax, di                               
  11ae  05feff           add ax, 0xfffe                           
  11b1  50               push ax                                  
  11b2  666801000300     push 0x30001                             
  11b8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  11bd  83c406           add sp, 6                                
  11c0  8bf0             mov si, ax                               
  11c2  8bc7             mov ax, di                               
  11c4  05feff           add ax, 0xfffe                           
  11c7  50               push ax                                  
  11c8  666801000300     push 0x30001                             
  11ce  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  11d3  83c406           add sp, 6                                
  11d6  8bf8             mov di, ax                               
  11d8  0bf6             or si, si                                
  11da  7e04             jle 0x11e0                               
  11dc  8bc6             mov ax, si                               
  11de  eb02             jmp 0x11e2                               
  11e0  33c0             xor ax, ax                               
  11e2  8bf0             mov si, ax                               
  11e4  83fe09           cmp si, 9                                
  11e7  7d02             jge 0x11eb                               
  11e9  eb03             jmp 0x11ee                               
  11eb  b80900           mov ax, 9                                
  11ee  8bf0             mov si, ax                               
  11f0  0bff             or di, di                                
  11f2  7e04             jle 0x11f8                               
  11f4  8bc7             mov ax, di                               
  11f6  eb02             jmp 0x11fa                               
  11f8  33c0             xor ax, ax                               
  11fa  8bf8             mov di, ax                               
  11fc  83ff09           cmp di, 9                                
  11ff  7d02             jge 0x1203                               
  1201  eb03             jmp 0x1206                               
  1203  b80900           mov ax, 9                                
  1206  8bf8             mov di, ax                               
  1208  833ed80200       cmp word ptr [0x2d8], 0                  
  120d  7511             jne 0x1220                               
  120f  833ede0200       cmp word ptr [0x2de], 0                  
  1214  750a             jne 0x1220                               
  1216  833edc0200       cmp word ptr [0x2dc], 0                  
  121b  7503             jne 0x1220                               
  121d  e9a100           jmp 0x12c1                               
  1220  666a64           push 0x64                                
  1223  6a01             push 1                                   
  1225  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  122a  83c406           add sp, 6                                
  122d  3d5000           cmp ax, 0x50                             
  1230  7c03             jl 0x1235                                
  1232  e98c00           jmp 0x12c1                               
  1235  833ede0200       cmp word ptr [0x2de], 0                  
  123a  7408             je 0x1244                                
  123c  666802000700     push 0x70002                             
  1242  eb0f             jmp 0x1253                               
  1244  833edc0200       cmp word ptr [0x2dc], 0                  
  1249  7404             je 0x124f                                
  124b  6a03             push 3                                   
  124d  eb02             jmp 0x1251                               
  124f  6aff             push -1                                  
  1251  6a04             push 4                                   
  1253  6a01             push 1                                   
  1255  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  125a  83c406           add sp, 6                                
  125d  8946fe           mov word ptr [bp - 2], ax                
  1260  66680a00ffff     push 0xffff000a                          
  1266  6a01             push 1                                   
  1268  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  126d  83c406           add sp, 6                                
  1270  c1e004           shl ax, 4                                
  1273  8b168c3f         mov dx, word ptr [0x3f8c]                
  1277  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  127b  03d8             add bx, ax                               
  127d  81c3e812         add bx, 0x12e8                           
  1281  8956fc           mov word ptr [bp - 4], dx                
  1284  895efa           mov word ptr [bp - 6], bx                
  1287  66680a00ffff     push 0xffff000a                          
  128d  6a01             push 1                                   
  128f  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1294  83c406           add sp, 6                                
  1297  c1e004           shl ax, 4                                
  129a  8b168c3f         mov dx, word ptr [0x3f8c]                
  129e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  12a2  03d8             add bx, ax                               
  12a4  81c38813         add bx, 0x1388                           
  12a8  8956f8           mov word ptr [bp - 8], dx                
  12ab  895ef6           mov word ptr [bp - 0xa], bx              
  12ae  8b46fe           mov ax, word ptr [bp - 2]                
  12b1  c1e004           shl ax, 4                                
  12b4  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  12b8  03d8             add bx, ax                               
  12ba  81c32814         add bx, 0x1428                           
  12be  e9f200           jmp 0x13b3                               
  12c1  666a64           push 0x64                                
  12c4  6a01             push 1                                   
  12c6  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  12cb  83c406           add sp, 6                                
  12ce  3d3200           cmp ax, 0x32                             
  12d1  7d71             jge 0x1344                               
  12d3  66680a00ffff     push 0xffff000a                          
  12d9  6a01             push 1                                   
  12db  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  12e0  83c406           add sp, 6                                
  12e3  c1e004           shl ax, 4                                
  12e6  8b168c3f         mov dx, word ptr [0x3f8c]                
  12ea  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  12ee  03d8             add bx, ax                               
  12f0  81c3a816         add bx, 0x16a8                            ; "DATA\AREA.DAT"
  12f4  8956fc           mov word ptr [bp - 4], dx                
  12f7  895efa           mov word ptr [bp - 6], bx                
  12fa  66680a00ffff     push 0xffff000a                          
  1300  6a01             push 1                                   
  1302  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1307  83c406           add sp, 6                                
  130a  c1e004           shl ax, 4                                
  130d  8b168c3f         mov dx, word ptr [0x3f8c]                
  1311  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  1315  03d8             add bx, ax                               
  1317  81c34817         add bx, 0x1748                           
  131b  8956f8           mov word ptr [bp - 8], dx                
  131e  895ef6           mov word ptr [bp - 0xa], bx              
  1321  66680a00ffff     push 0xffff000a                          
  1327  6a01             push 1                                   
  1329  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  132e  83c406           add sp, 6                                
  1331  c1e004           shl ax, 4                                
  1334  8b168c3f         mov dx, word ptr [0x3f8c]                
  1338  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  133c  03d8             add bx, ax                               
  133e  81c3e817         add bx, 0x17e8                           
  1342  eb6f             jmp 0x13b3                               
  1344  66680a00ffff     push 0xffff000a                          
  134a  6a01             push 1                                   
  134c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1351  83c406           add sp, 6                                
  1354  c1e004           shl ax, 4                                
  1357  8b168c3f         mov dx, word ptr [0x3f8c]                
  135b  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  135f  03d8             add bx, ax                               
  1361  81c3c814         add bx, 0x14c8                           
  1365  8956fc           mov word ptr [bp - 4], dx                
  1368  895efa           mov word ptr [bp - 6], bx                
  136b  66680a00ffff     push 0xffff000a                          
  1371  6a01             push 1                                   
  1373  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1378  83c406           add sp, 6                                
  137b  c1e004           shl ax, 4                                
  137e  8b168c3f         mov dx, word ptr [0x3f8c]                
  1382  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  1386  03d8             add bx, ax                               
  1388  81c36815         add bx, 0x1568                           
  138c  8956f8           mov word ptr [bp - 8], dx                
  138f  895ef6           mov word ptr [bp - 0xa], bx              
  1392  66680a00ffff     push 0xffff000a                          
  1398  6a01             push 1                                   
  139a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  139f  83c406           add sp, 6                                
  13a2  c1e004           shl ax, 4                                
  13a5  8b168c3f         mov dx, word ptr [0x3f8c]                
  13a9  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  13ad  03d8             add bx, ax                               
  13af  81c30816         add bx, 0x1608                           
  13b3  8956f4           mov word ptr [bp - 0xc], dx              
  13b6  895ef2           mov word ptr [bp - 0xe], bx              
  13b9  66ff76f2         push dword ptr [bp - 0xe]                
  13bd  66ff76f6         push dword ptr [bp - 0xa]                
  13c1  66ff76fa         push dword ptr [bp - 6]                  
  13c5  8bc7             mov ax, di                               
  13c7  c1e004           shl ax, 4                                
  13ca  8b168a3f         mov dx, word ptr [0x3f8a]                
  13ce  03d0             add dx, ax                               
  13d0  81c24812         add dx, 0x1248                           
  13d4  ff368c3f         push word ptr [0x3f8c]                   
  13d8  52               push dx                                  
  13d9  66680300ffff     push 0xffff0003                          
  13df  6a01             push 1                                   
  13e1  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  13e6  83c406           add sp, 6                                
  13e9  c1e004           shl ax, 4                                
  13ec  8bd6             mov dx, si                               
  13ee  6bd230           imul dx, dx, 0x30                        
  13f1  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  13f5  03da             add bx, dx                               
  13f7  03d8             add bx, ax                               
  13f9  81c36810         add bx, 0x1068                           
  13fd  ff368c3f         push word ptr [0x3f8c]                   
  1401  53               push bx                                  
  1402  8b4606           mov ax, word ptr [bp + 6]                
  1405  6bc041           imul ax, ax, 0x41                        
  1408  058115           add ax, 0x1581                           
  140b  68042c           push 0x2c04                              
  140e  50               push ax                                  
  140f  ff7606           push word ptr [bp + 6]                   
  1412  1e               push ds                                  
  1413  686103           push 0x361                                ; "#%03d|%s is a %s|%s, %s|%s %s|"
  1416  16               push ss                                  
  1417  8d86f2fe         lea ax, [bp - 0x10e]                     
  141b  50               push ax                                  
  141c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1421  83c422           add sp, 0x22                             
  1424  16               push ss                                  
  1425  8d86f2fe         lea ax, [bp - 0x10e]                     
  1429  50               push ax                                  
  142a  c41e8a3f         les bx, ptr [0x3f8a]                     
  142e  a18a3f           mov ax, word ptr [0x3f8a]                
  1431  2603876410       add ax, word ptr es:[bx + 0x1064]        
  1436  05561f           add ax, 0x1f56                           
  1439  ff368c3f         push word ptr [0x3f8c]                   
  143d  50               push ax                                  
  143e  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1443  83c408           add sp, 8                                
  1446  16               push ss                                  
  1447  8d86f2fe         lea ax, [bp - 0x10e]                     
  144b  50               push ax                                  
  144c  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  1451  83c404           add sp, 4                                
  1454  c41e8a3f         les bx, ptr [0x3f8a]                     
  1458  268b976410       mov dx, word ptr es:[bx + 0x1064]        
  145d  03d0             add dx, ax                               
  145f  2689976410       mov word ptr es:[bx + 0x1064], dx        
  1464  5f               pop di                                   
  1465  5e               pop si                                   
  1466  c9               leave                                    
  1467  cb               retf                                     

ovl11_1468:  ; ENTRY
  1468  55               push bp                                  
  1469  8bec             mov bp, sp                               
  146b  83ec16           sub sp, 0x16                             
  146e  56               push si                                  
  146f  57               push di                                  
  1470  bf1400           mov di, 0x14                             
  1473  be0a00           mov si, 0xa                              
  1476  666a0a           push 0xa                                 
  1479  6a01             push 1                                   
  147b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1480  83c406           add sp, 6                                
  1483  3d0700           cmp ax, 7                                
  1486  7d05             jge 0x148d                               
  1488  b80300           mov ax, 3                                
  148b  eb03             jmp 0x1490                               
  148d  b80200           mov ax, 2                                
  1490  8946fe           mov word ptr [bp - 2], ax                
  1493  1e               push ds                                  
  1494  688103           push 0x381                               
  1497  16               push ss                                  
  1498  8d46ea           lea ax, [bp - 0x16]                      
  149b  50               push ax                                  
  149c  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  14a1  83c408           add sp, 8                                
  14a4  6aff             push -1                                  
  14a6  57               push di                                  
  14a7  6a01             push 1                                   
  14a9  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  14ae  83c406           add sp, 6                                
  14b1  6bc00a           imul ax, ax, 0xa                         
  14b4  8b168a3f         mov dx, word ptr [0x3f8a]                
  14b8  03d0             add dx, ax                               
  14ba  81c2860a         add dx, 0xa86                            
  14be  ff368c3f         push word ptr [0x3f8c]                   
  14c2  52               push dx                                  
  14c3  16               push ss                                  
  14c4  8d46ea           lea ax, [bp - 0x16]                      
  14c7  50               push ax                                  
  14c8  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  14cd  83c408           add sp, 8                                
  14d0  837efe03         cmp word ptr [bp - 2], 3                 
  14d4  752c             jne 0x1502                               
  14d6  6aff             push -1                                  
  14d8  57               push di                                  
  14d9  6a01             push 1                                   
  14db  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  14e0  83c406           add sp, 6                                
  14e3  6bc00a           imul ax, ax, 0xa                         
  14e6  8b168a3f         mov dx, word ptr [0x3f8a]                
  14ea  03d0             add dx, ax                               
  14ec  81c24e0b         add dx, 0xb4e                            
  14f0  ff368c3f         push word ptr [0x3f8c]                   
  14f4  52               push dx                                  
  14f5  16               push ss                                  
  14f6  8d46ea           lea ax, [bp - 0x16]                      
  14f9  50               push ax                                  
  14fa  9a014a0000       lcall 0, 0x4a01                          -> 0000:4a01
  14ff  83c408           add sp, 8                                
  1502  666a0a           push 0xa                                 
  1505  6a01             push 1                                   
  1507  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  150c  83c406           add sp, 6                                
  150f  3d0700           cmp ax, 7                                
  1512  7c03             jl 0x1517                                
  1514  e9bc00           jmp 0x15d3                               
  1517  833ede0200       cmp word ptr [0x2de], 0                  
  151c  741d             je 0x153b                                
  151e  6aff             push -1                                  
  1520  56               push si                                  
  1521  6a01             push 1                                   
  1523  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1528  83c406           add sp, 6                                
  152b  6bc00a           imul ax, ax, 0xa                         
  152e  8b168a3f         mov dx, word ptr [0x3f8a]                
  1532  03d0             add dx, ax                               
  1534  81c2a60d         add dx, 0xda6                            
  1538  e9b200           jmp 0x15ed                               
  153b  833ed80200       cmp word ptr [0x2d8], 0                  
  1540  741d             je 0x155f                                
  1542  6aff             push -1                                  
  1544  56               push si                                  
  1545  6a01             push 1                                   
  1547  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  154c  83c406           add sp, 6                                
  154f  6bc00a           imul ax, ax, 0xa                         
  1552  8b168a3f         mov dx, word ptr [0x3f8a]                
  1556  03d0             add dx, ax                               
  1558  81c2de0c         add dx, 0xcde                            
  155c  e98e00           jmp 0x15ed                               
  155f  833ed60200       cmp word ptr [0x2d6], 0                  
  1564  741c             je 0x1582                                
  1566  6aff             push -1                                  
  1568  56               push si                                  
  1569  6a01             push 1                                   
  156b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1570  83c406           add sp, 6                                
  1573  6bc00a           imul ax, ax, 0xa                         
  1576  8b168a3f         mov dx, word ptr [0x3f8a]                
  157a  03d0             add dx, ax                               
  157c  81c2420d         add dx, 0xd42                            
  1580  eb6b             jmp 0x15ed                               
  1582  833edc0200       cmp word ptr [0x2dc], 0                  
  1587  741c             je 0x15a5                                
  1589  6aff             push -1                                  
  158b  56               push si                                  
  158c  6a01             push 1                                   
  158e  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1593  83c406           add sp, 6                                
  1596  6bc00a           imul ax, ax, 0xa                         
  1599  8b168a3f         mov dx, word ptr [0x3f8a]                
  159d  03d0             add dx, ax                               
  159f  81c20a0e         add dx, 0xe0a                            
  15a3  eb48             jmp 0x15ed                               
  15a5  666a0a           push 0xa                                 
  15a8  6a01             push 1                                   
  15aa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  15af  83c406           add sp, 6                                
  15b2  3d0500           cmp ax, 5                                
  15b5  7d1c             jge 0x15d3                               
  15b7  6aff             push -1                                  
  15b9  56               push si                                  
  15ba  6a01             push 1                                   
  15bc  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  15c1  83c406           add sp, 6                                
  15c4  6bc00a           imul ax, ax, 0xa                         
  15c7  8b168a3f         mov dx, word ptr [0x3f8a]                
  15cb  03d0             add dx, ax                               
  15cd  81c26e0e         add dx, 0xe6e                             ; "Standard"
  15d1  eb1a             jmp 0x15ed                               
  15d3  6aff             push -1                                  
  15d5  57               push di                                  
  15d6  6a01             push 1                                   
  15d8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  15dd  83c406           add sp, 6                                
  15e0  6bc00a           imul ax, ax, 0xa                         
  15e3  8b168a3f         mov dx, word ptr [0x3f8a]                
  15e7  03d0             add dx, ax                               
  15e9  81c2160c         add dx, 0xc16                            
  15ed  ff368c3f         push word ptr [0x3f8c]                   
  15f1  52               push dx                                  
  15f2  16               push ss                                  
  15f3  8d46ea           lea ax, [bp - 0x16]                      
  15f6  50               push ax                                  
  15f7  9a014a0000       lcall 0, 0x4a01                          -> 0000:4a01
  15fc  83c408           add sp, 8                                
  15ff  16               push ss                                  
  1600  8d46ea           lea ax, [bp - 0x16]                      
  1603  50               push ax                                  
  1604  8b4606           mov ax, word ptr [bp + 6]                
  1607  6bc041           imul ax, ax, 0x41                        
  160a  058115           add ax, 0x1581                           
  160d  68042c           push 0x2c04                              
  1610  50               push ax                                  
  1611  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1616  83c408           add sp, 8                                
  1619  5f               pop di                                   
  161a  5e               pop si                                   
  161b  c9               leave                                    
  161c  cb               retf                                     

ovl11_161d:  ; ENTRY
  161d  55               push bp                                  
  161e  8bec             mov bp, sp                               
  1620  83ec08           sub sp, 8                                
  1623  56               push si                                  
  1624  57               push di                                  
  1625  33ff             xor di, di                               
  1627  8b5e06           mov bx, word ptr [bp + 6]                
  162a  6bdb41           imul bx, bx, 0x41                        
  162d  b8042c           mov ax, 0x2c04                           
  1630  8ec0             mov es, ax                               
  1632  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  1637  c1e002           shl ax, 2                                
  163a  bb7000           mov bx, 0x70                             
  163d  99               cdq                                      
  163e  f7fb             idiv bx                                  
  1640  8b5e06           mov bx, word ptr [bp + 6]                
  1643  6bdb41           imul bx, bx, 0x41                        
  1646  ba042c           mov dx, 0x2c04                           
  1649  8ec2             mov es, dx                               
  164b  50               push ax                                  
  164c  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1651  d1e0             shl ax, 1                                
  1653  bb9c00           mov bx, 0x9c                             
  1656  99               cdq                                      
  1657  f7fb             idiv bx                                  
  1659  c1e002           shl ax, 2                                
  165c  5a               pop dx                                   
  165d  03d0             add dx, ax                               
  165f  8956fa           mov word ptr [bp - 6], dx                
  1662  66680400ffff     push 0xffff0004                          
  1668  6a01             push 1                                   
  166a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  166f  83c406           add sp, 6                                
  1672  50               push ax                                  
  1673  8b4608           mov ax, word ptr [bp + 8]                
  1676  99               cdq                                      
  1677  2bc2             sub ax, dx                               
  1679  d1f8             sar ax, 1                                
  167b  5a               pop dx                                   
  167c  03c2             add ax, dx                               
  167e  8946fe           mov word ptr [bp - 2], ax                
  1681  833ed80200       cmp word ptr [0x2d8], 0                  
  1686  7403             je 0x168b                                
  1688  ff46fe           inc word ptr [bp - 2]                    
  168b  833edc0200       cmp word ptr [0x2dc], 0                  
  1690  7403             je 0x1695                                
  1692  ff46fe           inc word ptr [bp - 2]                    
  1695  837efe04         cmp word ptr [bp - 2], 4                 
  1699  7d05             jge 0x16a0                               
  169b  8b46fe           mov ax, word ptr [bp - 2]                
  169e  eb03             jmp 0x16a3                               
  16a0  b80400           mov ax, 4                                
  16a3  8946fe           mov word ptr [bp - 2], ax                
  16a6  837efe00         cmp word ptr [bp - 2], 0                 
  16aa  7e02             jle 0x16ae                               
  16ac  eb02             jmp 0x16b0                               
  16ae  33c0             xor ax, ax                               
  16b0  8946fe           mov word ptr [bp - 2], ax                
  16b3  9a70005830       lcall 0x3058, 0x70                       -> ovl44:1128
  16b8  33f6             xor si, si                               
  16ba  eb69             jmp 0x1725                               
  16bc  8bc6             mov ax, si                               
  16be  c1e004           shl ax, 4                                
  16c1  8b168a3f         mov dx, word ptr [0x3f8a]                
  16c5  03d0             add dx, ax                               
  16c7  81c2901d         add dx, 0x1d90                            ; "Resign"
  16cb  ff368c3f         push word ptr [0x3f8c]                   
  16cf  52               push dx                                  
  16d0  8bc6             mov ax, si                               
  16d2  c1e004           shl ax, 4                                
  16d5  8b168a3f         mov dx, word ptr [0x3f8a]                
  16d9  03d0             add dx, ax                               
  16db  81c28e1d         add dx, 0x1d8e                           
  16df  ff368c3f         push word ptr [0x3f8c]                   
  16e3  52               push dx                                  
  16e4  8bc6             mov ax, si                               
  16e6  c1e004           shl ax, 4                                
  16e9  8b168a3f         mov dx, word ptr [0x3f8a]                
  16ed  03d0             add dx, ax                               
  16ef  81c28a1d         add dx, 0x1d8a                           
  16f3  ff368c3f         push word ptr [0x3f8c]                   
  16f7  52               push dx                                  
  16f8  8bc6             mov ax, si                               
  16fa  c1e004           shl ax, 4                                
  16fd  8b168a3f         mov dx, word ptr [0x3f8a]                
  1701  03d0             add dx, ax                               
  1703  81c28c1d         add dx, 0x1d8c                           
  1707  ff368c3f         push word ptr [0x3f8c]                   
  170b  52               push dx                                  
  170c  8bc6             mov ax, si                               
  170e  c1e004           shl ax, 4                                
  1711  c41e8a3f         les bx, ptr [0x3f8a]                     
  1715  03d8             add bx, ax                               
  1717  26ffb7821d       push word ptr es:[bx + 0x1d82]           
  171c  9a7a005830       lcall 0x3058, 0x7a                       -> ovl44:142c
  1721  83c412           add sp, 0x12                             
  1724  46               inc si                                   
  1725  83fe1d           cmp si, 0x1d                             
  1728  7c92             jl 0x16bc                                
  172a  9a75005830       lcall 0x3058, 0x75                       -> ovl44:11e2
  172f  33f6             xor si, si                               
  1731  e99f01           jmp 0x18d3                               
  1734  c746f80000       mov word ptr [bp - 8], 0                 
  1739  8bc6             mov ax, si                               
  173b  c1e004           shl ax, 4                                
  173e  c41e8a3f         les bx, ptr [0x3f8a]                     
  1742  03d8             add bx, ax                               
  1744  268b87821d       mov ax, word ptr es:[bx + 0x1d82]        
  1749  8946fc           mov word ptr [bp - 4], ax                
  174c  833ecc2800       cmp word ptr [0x28cc], 0                 
  1751  7510             jne 0x1763                               
  1753  8b5efc           mov bx, word ptr [bp - 4]                
  1756  6bdb06           imul bx, bx, 6                           
  1759  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  175e  7403             je 0x1763                                
  1760  e96f01           jmp 0x18d2                               
  1763  66680a00ffff     push 0xffff000a                          
  1769  6a01             push 1                                   
  176b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1770  83c406           add sp, 6                                
  1773  8bd6             mov dx, si                               
  1775  c1e204           shl dx, 4                                
  1778  c41e8a3f         les bx, ptr [0x3f8a]                     
  177c  03da             add bx, dx                               
  177e  263b87841d       cmp ax, word ptr es:[bx + 0x1d84]        
  1783  7c03             jl 0x1788                                
  1785  e94a01           jmp 0x18d2                               
  1788  2683bf881d07     cmp word ptr es:[bx + 0x1d88], 7         
  178e  7505             jne 0x1795                               
  1790  c746f80100       mov word ptr [bp - 8], 1                 
  1795  8bc6             mov ax, si                               
  1797  c1e004           shl ax, 4                                
  179a  c41e8a3f         les bx, ptr [0x3f8a]                     
  179e  03d8             add bx, ax                               
  17a0  2683bf881d04     cmp word ptr es:[bx + 0x1d88], 4         
  17a6  750c             jne 0x17b4                               
  17a8  833ed80200       cmp word ptr [0x2d8], 0                  
  17ad  7405             je 0x17b4                                
  17af  c746f80100       mov word ptr [bp - 8], 1                 
  17b4  8bc6             mov ax, si                               
  17b6  c1e004           shl ax, 4                                
  17b9  c41e8a3f         les bx, ptr [0x3f8a]                     
  17bd  03d8             add bx, ax                               
  17bf  2683bf881d05     cmp word ptr es:[bx + 0x1d88], 5         
  17c5  750c             jne 0x17d3                               
  17c7  833edc0200       cmp word ptr [0x2dc], 0                  
  17cc  7405             je 0x17d3                                
  17ce  c746f80100       mov word ptr [bp - 8], 1                 
  17d3  8bc6             mov ax, si                               
  17d5  c1e004           shl ax, 4                                
  17d8  c41e8a3f         les bx, ptr [0x3f8a]                     
  17dc  03d8             add bx, ax                               
  17de  2683bf881d03     cmp word ptr es:[bx + 0x1d88], 3         
  17e4  750c             jne 0x17f2                               
  17e6  833ed60200       cmp word ptr [0x2d6], 0                  
  17eb  7405             je 0x17f2                                
  17ed  c746f80100       mov word ptr [bp - 8], 1                 
  17f2  8bc6             mov ax, si                               
  17f4  c1e004           shl ax, 4                                
  17f7  c41e8a3f         les bx, ptr [0x3f8a]                     
  17fb  03d8             add bx, ax                               
  17fd  268b87861d       mov ax, word ptr es:[bx + 0x1d86]        
  1802  8b56fa           mov dx, word ptr [bp - 6]                
  1805  d1e2             shl dx, 1                                
  1807  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  180b  03da             add bx, dx                               
  180d  263b87721d       cmp ax, word ptr es:[bx + 0x1d72]        
  1812  7505             jne 0x1819                               
  1814  c746f80100       mov word ptr [bp - 8], 1                 
  1819  837efc05         cmp word ptr [bp - 4], 5                 
  181d  750c             jne 0x182b                               
  181f  833ed60200       cmp word ptr [0x2d6], 0                  
  1824  7505             jne 0x182b                               
  1826  c746f80000       mov word ptr [bp - 8], 0                 
  182b  837ef800         cmp word ptr [bp - 8], 0                 
  182f  7503             jne 0x1834                               
  1831  e99e00           jmp 0x18d2                               
  1834  8b5e06           mov bx, word ptr [bp + 6]                
  1837  6bdb41           imul bx, bx, 0x41                        
  183a  03df             add bx, di                               
  183c  b8042c           mov ax, 0x2c04                           
  183f  8a56fc           mov dl, byte ptr [bp - 4]                
  1842  8ec0             mov es, ax                               
  1844  2688979315       mov byte ptr es:[bx + 0x1593], dl        
  1849  8bc6             mov ax, si                               
  184b  c1e004           shl ax, 4                                
  184e  c41e8a3f         les bx, ptr [0x3f8a]                     
  1852  03d8             add bx, ax                               
  1854  268a878c1d       mov al, byte ptr es:[bx + 0x1d8c]        
  1859  8b5e06           mov bx, word ptr [bp + 6]                
  185c  6bdb41           imul bx, bx, 0x41                        
  185f  03df             add bx, di                               
  1861  ba042c           mov dx, 0x2c04                           
  1864  8ec2             mov es, dx                               
  1866  2688879715       mov byte ptr es:[bx + 0x1597], al        
  186b  8bc6             mov ax, si                               
  186d  c1e004           shl ax, 4                                
  1870  c41e8a3f         les bx, ptr [0x3f8a]                     
  1874  03d8             add bx, ax                               
  1876  268a878e1d       mov al, byte ptr es:[bx + 0x1d8e]        
  187b  8b5e06           mov bx, word ptr [bp + 6]                
  187e  6bdb41           imul bx, bx, 0x41                        
  1881  03df             add bx, di                               
  1883  ba042c           mov dx, 0x2c04                           
  1886  8ec2             mov es, dx                               
  1888  268887a315       mov byte ptr es:[bx + 0x15a3], al        
  188d  8bc6             mov ax, si                               
  188f  c1e004           shl ax, 4                                
  1892  c41e8a3f         les bx, ptr [0x3f8a]                     
  1896  03d8             add bx, ax                               
  1898  268a878a1d       mov al, byte ptr es:[bx + 0x1d8a]        
  189d  8b5e06           mov bx, word ptr [bp + 6]                
  18a0  6bdb41           imul bx, bx, 0x41                        
  18a3  03df             add bx, di                               
  18a5  ba042c           mov dx, 0x2c04                           
  18a8  8ec2             mov es, dx                               
  18aa  2688879b15       mov byte ptr es:[bx + 0x159b], al        
  18af  8bc6             mov ax, si                               
  18b1  c1e004           shl ax, 4                                
  18b4  c41e8a3f         les bx, ptr [0x3f8a]                     
  18b8  03d8             add bx, ax                               
  18ba  268a87901d       mov al, byte ptr es:[bx + 0x1d90]        
  18bf  8b5e06           mov bx, word ptr [bp + 6]                
  18c2  6bdb41           imul bx, bx, 0x41                        
  18c5  03df             add bx, di                               
  18c7  ba042c           mov dx, 0x2c04                           
  18ca  8ec2             mov es, dx                               
  18cc  2688879f15       mov byte ptr es:[bx + 0x159f], al        
  18d1  47               inc di                                   
  18d2  46               inc si                                   
  18d3  83fe1d           cmp si, 0x1d                             
  18d6  7d08             jge 0x18e0                               
  18d8  3b7efe           cmp di, word ptr [bp - 2]                
  18db  7d03             jge 0x18e0                               
  18dd  e954fe           jmp 0x1734                               
  18e0  0bff             or di, di                                
  18e2  7403             je 0x18e7                                
  18e4  e98800           jmp 0x196f                               
  18e7  c41e8a3f         les bx, ptr [0x3f8a]                     
  18eb  268a87821d       mov al, byte ptr es:[bx + 0x1d82]        
  18f0  8b5e06           mov bx, word ptr [bp + 6]                
  18f3  6bdb41           imul bx, bx, 0x41                        
  18f6  03df             add bx, di                               
  18f8  ba042c           mov dx, 0x2c04                           
  18fb  8ec2             mov es, dx                               
  18fd  2688879315       mov byte ptr es:[bx + 0x1593], al        
  1902  c41e8a3f         les bx, ptr [0x3f8a]                     
  1906  268a878c1d       mov al, byte ptr es:[bx + 0x1d8c]        
  190b  8b5e06           mov bx, word ptr [bp + 6]                
  190e  6bdb41           imul bx, bx, 0x41                        
  1911  03df             add bx, di                               
  1913  ba042c           mov dx, 0x2c04                           
  1916  8ec2             mov es, dx                               
  1918  2688879715       mov byte ptr es:[bx + 0x1597], al        
  191d  c41e8a3f         les bx, ptr [0x3f8a]                     
  1921  268a878e1d       mov al, byte ptr es:[bx + 0x1d8e]        
  1926  8b5e06           mov bx, word ptr [bp + 6]                
  1929  6bdb41           imul bx, bx, 0x41                        
  192c  03df             add bx, di                               
  192e  ba042c           mov dx, 0x2c04                           
  1931  8ec2             mov es, dx                               
  1933  268887a315       mov byte ptr es:[bx + 0x15a3], al        
  1938  c41e8a3f         les bx, ptr [0x3f8a]                     
  193c  268a878a1d       mov al, byte ptr es:[bx + 0x1d8a]        
  1941  8b5e06           mov bx, word ptr [bp + 6]                
  1944  6bdb41           imul bx, bx, 0x41                        
  1947  03df             add bx, di                               
  1949  ba042c           mov dx, 0x2c04                           
  194c  8ec2             mov es, dx                               
  194e  2688879b15       mov byte ptr es:[bx + 0x159b], al        
  1953  c41e8a3f         les bx, ptr [0x3f8a]                     
  1957  268a87901d       mov al, byte ptr es:[bx + 0x1d90]        
  195c  8b5e06           mov bx, word ptr [bp + 6]                
  195f  6bdb41           imul bx, bx, 0x41                        
  1962  03df             add bx, di                               
  1964  ba042c           mov dx, 0x2c04                           
  1967  8ec2             mov es, dx                               
  1969  2688879f15       mov byte ptr es:[bx + 0x159f], al        
  196e  47               inc di                                   
  196f  837e0806         cmp word ptr [bp + 8], 6                 
  1973  7f03             jg 0x1978                                
  1975  e9a601           jmp 0x1b1e                               
  1978  66680a00ffff     push 0xffff000a                          
  197e  6a01             push 1                                   
  1980  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1985  83c406           add sp, 6                                
  1988  3d0500           cmp ax, 5                                
  198b  7c03             jl 0x1990                                
  198d  e98e01           jmp 0x1b1e                               
  1990  83ff03           cmp di, 3                                
  1993  7e03             jle 0x1998                               
  1995  e98601           jmp 0x1b1e                               
  1998  33f6             xor si, si                               
  199a  eb25             jmp 0x19c1                               
  199c  8b5e06           mov bx, word ptr [bp + 6]                
  199f  6bdb41           imul bx, bx, 0x41                        
  19a2  03de             add bx, si                               
  19a4  b8042c           mov ax, 0x2c04                           
  19a7  8ec0             mov es, ax                               
  19a9  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  19ae  98               cwde                                     
  19af  6bc006           imul ax, ax, 6                           
  19b2  8bd8             mov bx, ax                               
  19b4  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  19b9  7405             je 0x19c0                                
  19bb  897efe           mov word ptr [bp - 2], di                
  19be  eb05             jmp 0x19c5                               
  19c0  46               inc si                                   
  19c1  3bf7             cmp si, di                               
  19c3  7cd7             jl 0x199c                                
  19c5  33f6             xor si, si                               
  19c7  e94701           jmp 0x1b11                               
  19ca  8bc6             mov ax, si                               
  19cc  c1e004           shl ax, 4                                
  19cf  c41e8a3f         les bx, ptr [0x3f8a]                     
  19d3  03d8             add bx, ax                               
  19d5  268b87821d       mov ax, word ptr es:[bx + 0x1d82]        
  19da  8946fc           mov word ptr [bp - 4], ax                
  19dd  8b5efc           mov bx, word ptr [bp - 4]                
  19e0  6bdb06           imul bx, bx, 6                           
  19e3  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  19e8  7503             jne 0x19ed                               
  19ea  e92301           jmp 0x1b10                               
  19ed  8b5efc           mov bx, word ptr [bp - 4]                
  19f0  6bdb06           imul bx, bx, 6                           
  19f3  8a87c845         mov al, byte ptr [bx + 0x45c8]           
  19f7  98               cwde                                     
  19f8  0bc0             or ax, ax                                
  19fa  7403             je 0x19ff                                
  19fc  e91101           jmp 0x1b10                               
  19ff  8bc6             mov ax, si                               
  1a01  c1e004           shl ax, 4                                
  1a04  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  1a08  03d8             add bx, ax                               
  1a0a  268b87861d       mov ax, word ptr es:[bx + 0x1d86]        
  1a0f  8b56fa           mov dx, word ptr [bp - 6]                
  1a12  d1e2             shl dx, 1                                
  1a14  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  1a18  03da             add bx, dx                               
  1a1a  263b87721d       cmp ax, word ptr es:[bx + 0x1d72]        
  1a1f  7442             je 0x1a63                                
  1a21  8bc6             mov ax, si                               
  1a23  c1e004           shl ax, 4                                
  1a26  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  1a2a  03d8             add bx, ax                               
  1a2c  2683bf881d07     cmp word ptr es:[bx + 0x1d88], 7         
  1a32  742f             je 0x1a63                                
  1a34  2683bf881d04     cmp word ptr es:[bx + 0x1d88], 4         
  1a3a  7507             jne 0x1a43                               
  1a3c  833ed80200       cmp word ptr [0x2d8], 0                  
  1a41  7520             jne 0x1a63                               
  1a43  8bc6             mov ax, si                               
  1a45  c1e004           shl ax, 4                                
  1a48  c41e8a3f         les bx, ptr [0x3f8a]                     
  1a4c  03d8             add bx, ax                               
  1a4e  2683bf881d05     cmp word ptr es:[bx + 0x1d88], 5         
  1a54  7403             je 0x1a59                                
  1a56  e9b700           jmp 0x1b10                               
  1a59  833edc0200       cmp word ptr [0x2dc], 0                  
  1a5e  7503             jne 0x1a63                               
  1a60  e9ad00           jmp 0x1b10                               
  1a63  8bc6             mov ax, si                               
  1a65  c1e004           shl ax, 4                                
  1a68  c41e8a3f         les bx, ptr [0x3f8a]                     
  1a6c  03d8             add bx, ax                               
  1a6e  268a87821d       mov al, byte ptr es:[bx + 0x1d82]        
  1a73  8b5e06           mov bx, word ptr [bp + 6]                
  1a76  6bdb41           imul bx, bx, 0x41                        
  1a79  03df             add bx, di                               
  1a7b  ba042c           mov dx, 0x2c04                           
  1a7e  8ec2             mov es, dx                               
  1a80  2688879315       mov byte ptr es:[bx + 0x1593], al        
  1a85  8bc6             mov ax, si                               
  1a87  c1e004           shl ax, 4                                
  1a8a  c41e8a3f         les bx, ptr [0x3f8a]                     
  1a8e  03d8             add bx, ax                               
  1a90  268a878c1d       mov al, byte ptr es:[bx + 0x1d8c]        
  1a95  8b5e06           mov bx, word ptr [bp + 6]                
  1a98  6bdb41           imul bx, bx, 0x41                        
  1a9b  03df             add bx, di                               
  1a9d  ba042c           mov dx, 0x2c04                           
  1aa0  8ec2             mov es, dx                               
  1aa2  2688879715       mov byte ptr es:[bx + 0x1597], al        
  1aa7  8bc6             mov ax, si                               
  1aa9  c1e004           shl ax, 4                                
  1aac  c41e8a3f         les bx, ptr [0x3f8a]                     
  1ab0  03d8             add bx, ax                               
  1ab2  268a878e1d       mov al, byte ptr es:[bx + 0x1d8e]        
  1ab7  8b5e06           mov bx, word ptr [bp + 6]                
  1aba  6bdb41           imul bx, bx, 0x41                        
  1abd  03df             add bx, di                               
  1abf  ba042c           mov dx, 0x2c04                           
  1ac2  8ec2             mov es, dx                               
  1ac4  268887a315       mov byte ptr es:[bx + 0x15a3], al        
  1ac9  8bc6             mov ax, si                               
  1acb  c1e004           shl ax, 4                                
  1ace  c41e8a3f         les bx, ptr [0x3f8a]                     
  1ad2  03d8             add bx, ax                               
  1ad4  268a878a1d       mov al, byte ptr es:[bx + 0x1d8a]        
  1ad9  8b5e06           mov bx, word ptr [bp + 6]                
  1adc  6bdb41           imul bx, bx, 0x41                        
  1adf  03df             add bx, di                               
  1ae1  ba042c           mov dx, 0x2c04                           
  1ae4  8ec2             mov es, dx                               
  1ae6  2688879b15       mov byte ptr es:[bx + 0x159b], al        
  1aeb  8bc6             mov ax, si                               
  1aed  c1e004           shl ax, 4                                
  1af0  c41e8a3f         les bx, ptr [0x3f8a]                     
  1af4  03d8             add bx, ax                               
  1af6  268a87901d       mov al, byte ptr es:[bx + 0x1d90]        
  1afb  8b5e06           mov bx, word ptr [bp + 6]                
  1afe  6bdb41           imul bx, bx, 0x41                        
  1b01  03df             add bx, di                               
  1b03  ba042c           mov dx, 0x2c04                           
  1b06  8ec2             mov es, dx                               
  1b08  2688879f15       mov byte ptr es:[bx + 0x159f], al        
  1b0d  47               inc di                                   
  1b0e  eb0e             jmp 0x1b1e                               
  1b10  46               inc si                                   
  1b11  83fe1d           cmp si, 0x1d                             
  1b14  7d08             jge 0x1b1e                               
  1b16  3b7efe           cmp di, word ptr [bp - 2]                
  1b19  7d03             jge 0x1b1e                               
  1b1b  e9acfe           jmp 0x19ca                               
  1b1e  8bf7             mov si, di                               
  1b20  eb14             jmp 0x1b36                               
  1b22  8b5e06           mov bx, word ptr [bp + 6]                
  1b25  6bdb41           imul bx, bx, 0x41                        
  1b28  03de             add bx, si                               
  1b2a  b8042c           mov ax, 0x2c04                           
  1b2d  8ec0             mov es, ax                               
  1b2f  26c6879315ff     mov byte ptr es:[bx + 0x1593], 0xff      
  1b35  46               inc si                                   
  1b36  83fe04           cmp si, 4                                
  1b39  7ce7             jl 0x1b22                                
  1b3b  5f               pop di                                   
  1b3c  5e               pop si                                   
  1b3d  c9               leave                                    
  1b3e  cb               retf                                     

ovl11_1b3f:  ; ENTRY
  1b3f  55               push bp                                  
  1b40  8bec             mov bp, sp                               
  1b42  83ec44           sub sp, 0x44                             
  1b45  56               push si                                  
  1b46  57               push di                                  
  1b47  666a03           push 3                                   
  1b4a  6a02             push 2                                   
  1b4c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1b51  83c406           add sp, 6                                
  1b54  8946fe           mov word ptr [bp - 2], ax                
  1b57  c746fc0000       mov word ptr [bp - 4], 0                 
  1b5c  e9ab00           jmp 0x1c0a                               
  1b5f  ff46fc           inc word ptr [bp - 4]                    
  1b62  6aff             push -1                                  
  1b64  b8042c           mov ax, 0x2c04                           
  1b67  8ec0             mov es, ax                               
  1b69  26ff367b15       push word ptr es:[0x157b]                
  1b6e  6a01             push 1                                   
  1b70  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1b75  83c406           add sp, 6                                
  1b78  8bf0             mov si, ax                               
  1b7a  50               push ax                                  
  1b7b  9a9d005830       lcall 0x3058, 0x9d                       -> ovl44:094f
  1b80  59               pop cx                                   
  1b81  8bf8             mov di, ax                               
  1b83  83ff04           cmp di, 4                                
  1b86  7c03             jl 0x1b8b                                
  1b88  e97f00           jmp 0x1c0a                               
  1b8b  9a75007330       lcall 0x3073, 0x75                       -> ovl47:1a9b
  1b90  8946fa           mov word ptr [bp - 6], ax                
  1b93  16               push ss                                  
  1b94  8d46bc           lea ax, [bp - 0x44]                      
  1b97  50               push ax                                  
  1b98  ff76fa           push word ptr [bp - 6]                   
  1b9b  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  1ba0  83c406           add sp, 6                                
  1ba3  8bde             mov bx, si                               
  1ba5  6bdb41           imul bx, bx, 0x41                        
  1ba8  03df             add bx, di                               
  1baa  b8042c           mov ax, 0x2c04                           
  1bad  8a56fa           mov dl, byte ptr [bp - 6]                
  1bb0  8ec0             mov es, ax                               
  1bb2  2688979315       mov byte ptr es:[bx + 0x1593], dl        
  1bb7  8bde             mov bx, si                               
  1bb9  6bdb41           imul bx, bx, 0x41                        
  1bbc  03df             add bx, di                               
  1bbe  b8042c           mov ax, 0x2c04                           
  1bc1  8a56d4           mov dl, byte ptr [bp - 0x2c]             
  1bc4  8ec0             mov es, ax                               
  1bc6  2688979715       mov byte ptr es:[bx + 0x1597], dl        
  1bcb  8bde             mov bx, si                               
  1bcd  6bdb41           imul bx, bx, 0x41                        
  1bd0  03df             add bx, di                               
  1bd2  b8042c           mov ax, 0x2c04                           
  1bd5  8a56d6           mov dl, byte ptr [bp - 0x2a]             
  1bd8  8ec0             mov es, ax                               
  1bda  268897a315       mov byte ptr es:[bx + 0x15a3], dl        
  1bdf  8bde             mov bx, si                               
  1be1  6bdb41           imul bx, bx, 0x41                        
  1be4  03df             add bx, di                               
  1be6  b8042c           mov ax, 0x2c04                           
  1be9  8a56d2           mov dl, byte ptr [bp - 0x2e]             
  1bec  8ec0             mov es, ax                               
  1bee  2688979b15       mov byte ptr es:[bx + 0x159b], dl        
  1bf3  8bde             mov bx, si                               
  1bf5  6bdb41           imul bx, bx, 0x41                        
  1bf8  03df             add bx, di                               
  1bfa  b8042c           mov ax, 0x2c04                           
  1bfd  8a56d8           mov dl, byte ptr [bp - 0x28]             
  1c00  8ec0             mov es, ax                               
  1c02  2688979f15       mov byte ptr es:[bx + 0x159f], dl        
  1c07  ff4efe           dec word ptr [bp - 2]                    
  1c0a  837efe00         cmp word ptr [bp - 2], 0                 
  1c0e  7e09             jle 0x1c19                               
  1c10  837efc64         cmp word ptr [bp - 4], 0x64              
  1c14  7d03             jge 0x1c19                               
  1c16  e946ff           jmp 0x1b5f                               
  1c19  5f               pop di                                   
  1c1a  5e               pop si                                   
  1c1b  c9               leave                                    
  1c1c  cb               retf                                     

ovl11_1c1d:  ; ENTRY
  1c1d  55               push bp                                  
  1c1e  8bec             mov bp, sp                               
  1c20  83ec48           sub sp, 0x48                             
  1c23  56               push si                                  
  1c24  57               push di                                  
  1c25  33ff             xor di, di                               
  1c27  e9f300           jmp 0x1d1d                               
  1c2a  8bdf             mov bx, di                               
  1c2c  6bdb14           imul bx, bx, 0x14                        
  1c2f  b8042c           mov ax, 0x2c04                           
  1c32  8ec0             mov es, ax                               
  1c34  268b878901       mov ax, word ptr es:[bx + 0x189]         
  1c39  8946fe           mov word ptr [bp - 2], ax                
  1c3c  8bdf             mov bx, di                               
  1c3e  6bdb14           imul bx, bx, 0x14                        
  1c41  b8042c           mov ax, 0x2c04                           
  1c44  8ec0             mov es, ax                               
  1c46  268b878b01       mov ax, word ptr es:[bx + 0x18b]         
  1c4b  8946fc           mov word ptr [bp - 4], ax                
  1c4e  50               push ax                                  
  1c4f  ff76fe           push word ptr [bp - 2]                   
  1c52  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  1c57  83c404           add sp, 4                                
  1c5a  8946fa           mov word ptr [bp - 6], ax                
  1c5d  837efa00         cmp word ptr [bp - 6], 0                 
  1c61  7d03             jge 0x1c66                               
  1c63  e9b600           jmp 0x1d1c                               
  1c66  be0400           mov si, 4                                
  1c69  eb15             jmp 0x1c80                               
  1c6b  8b5efa           mov bx, word ptr [bp - 6]                
  1c6e  6bdb41           imul bx, bx, 0x41                        
  1c71  03de             add bx, si                               
  1c73  b8042c           mov ax, 0x2c04                           
  1c76  8ec0             mov es, ax                               
  1c78  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  1c7e  7c07             jl 0x1c87                                
  1c80  8bc6             mov ax, si                               
  1c82  4e               dec si                                   
  1c83  0bc0             or ax, ax                                
  1c85  75e4             jne 0x1c6b                               
  1c87  0bf6             or si, si                                
  1c89  7d03             jge 0x1c8e                               
  1c8b  be0300           mov si, 3                                
  1c8e  c746f80000       mov word ptr [bp - 8], 0                 
  1c93  eb66             jmp 0x1cfb                               
  1c95  66681c00ffff     push 0xffff001c                          
  1c9b  6a01             push 1                                   
  1c9d  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1ca2  83c406           add sp, 6                                
  1ca5  8946f6           mov word ptr [bp - 0xa], ax              
  1ca8  837ef605         cmp word ptr [bp - 0xa], 5               
  1cac  744d             je 0x1cfb                                
  1cae  8b5ef6           mov bx, word ptr [bp - 0xa]              
  1cb1  6bdb06           imul bx, bx, 6                           
  1cb4  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  1cb9  7540             jne 0x1cfb                               
  1cbb  ff46f8           inc word ptr [bp - 8]                    
  1cbe  33d2             xor dx, dx                               
  1cc0  eb19             jmp 0x1cdb                               
  1cc2  8b5efa           mov bx, word ptr [bp - 6]                
  1cc5  6bdb41           imul bx, bx, 0x41                        
  1cc8  03da             add bx, dx                               
  1cca  b8042c           mov ax, 0x2c04                           
  1ccd  8ec0             mov es, ax                               
  1ccf  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  1cd4  98               cwde                                     
  1cd5  3b46f6           cmp ax, word ptr [bp - 0xa]              
  1cd8  7406             je 0x1ce0                                
  1cda  42               inc dx                                   
  1cdb  83fa04           cmp dx, 4                                
  1cde  7ce2             jl 0x1cc2                                
  1ce0  83fa04           cmp dx, 4                                
  1ce3  7c16             jl 0x1cfb                                
  1ce5  16               push ss                                  
  1ce6  8d46b8           lea ax, [bp - 0x48]                      
  1ce9  50               push ax                                  
  1cea  ff76f6           push word ptr [bp - 0xa]                 
  1ced  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  1cf2  83c406           add sp, 6                                
  1cf5  837ece05         cmp word ptr [bp - 0x32], 5              
  1cf9  7d06             jge 0x1d01                               
  1cfb  837ef828         cmp word ptr [bp - 8], 0x28              
  1cff  7c94             jl 0x1c95                                
  1d01  837ef828         cmp word ptr [bp - 8], 0x28              
  1d05  7d15             jge 0x1d1c                               
  1d07  8b5efa           mov bx, word ptr [bp - 6]                
  1d0a  6bdb41           imul bx, bx, 0x41                        
  1d0d  03de             add bx, si                               
  1d0f  b8042c           mov ax, 0x2c04                           
  1d12  8a56f6           mov dl, byte ptr [bp - 0xa]              
  1d15  8ec0             mov es, ax                               
  1d17  2688979315       mov byte ptr es:[bx + 0x1593], dl        
  1d1c  47               inc di                                   
  1d1d  83ff08           cmp di, 8                                
  1d20  7d03             jge 0x1d25                               
  1d22  e905ff           jmp 0x1c2a                               
  1d25  5f               pop di                                   
  1d26  5e               pop si                                   
  1d27  c9               leave                                    
  1d28  cb               retf                                     
