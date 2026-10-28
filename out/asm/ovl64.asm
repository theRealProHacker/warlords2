; ovl64 stub 30f9 file_off 0x7c8e0 size 0x34ed

ovl64_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  80266964fe       and byte ptr [0x6469], 0xfe              
  0008  8026c361fe       and byte ptr [0x61c3], 0xfe              
  000d  1e               push ds                                  
  000e  689567           push 0x6795                              
  0011  9acf091210       lcall 0x1012, 0x9cf                      -> 1012:09cf
  0016  83c404           add sp, 4                                
  0019  666868016801     push 0x1680168                           
  001f  1e               push ds                                  
  0020  689567           push 0x6795                              
  0023  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0028  83c408           add sp, 8                                
  002b  0bc0             or ax, ax                                
  002d  750c             jne 0x3b                                 
  002f  1e               push ds                                  
  0030  681c2f           push 0x2f1c                               ; "Can't allocate OS bitmap"
  0033  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  0038  83c404           add sp, 4                                
  003b  9a25009630       lcall 0x3096, 0x25                       -> ovl52:0054
  0040  5d               pop bp                                   
  0041  cb               retf                                     

ovl64_0042:  ; ENTRY
  0042  55               push bp                                  
  0043  8bec             mov bp, sp                               
  0045  1e               push ds                                  
  0046  689567           push 0x6795                              
  0049  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  004e  83c404           add sp, 4                                
  0051  5d               pop bp                                   
  0052  cb               retf                                     

ovl64_0053:  ; ENTRY
  0053  55               push bp                                  
  0054  8bec             mov bp, sp                               
  0056  90               nop                                      
  0057  0e               push cs                                  
  0058  e83825           call 0x2593                              
  005b  90               nop                                      
  005c  0e               push cs                                  
  005d  e81219           call 0x1972                              
  0060  90               nop                                      
  0061  0e               push cs                                  
  0062  e8141a           call 0x1a79                              
  0065  90               nop                                      
  0066  0e               push cs                                  
  0067  e87e18           call 0x18e8                              
  006a  5d               pop bp                                   
  006b  cb               retf                                     

ovl64_006c:  ; ENTRY
  006c  55               push bp                                  
  006d  8bec             mov bp, sp                               
  006f  83ec08           sub sp, 8                                
  0072  b8042c           mov ax, 0x2c04                           
  0075  8ec0             mov es, ax                               
  0077  268b1e1001       mov bx, word ptr es:[0x110]              
  007c  d1e3             shl bx, 1                                
  007e  b8042c           mov ax, 0x2c04                           
  0081  8ec0             mov es, ax                               
  0083  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  0089  7510             jne 0x9b                                 
  008b  b8042c           mov ax, 0x2c04                           
  008e  8ec0             mov es, ax                               
  0090  26833e590100     cmp word ptr es:[0x159], 0               
  0096  7503             jne 0x9b                                 
  0098  e99b01           jmp 0x236                                
  009b  833e543200       cmp word ptr [0x3254], 0                 
  00a0  745d             je 0xff                                  
  00a2  66833e625e00     cmp dword ptr [0x5e62], 0                
  00a8  7455             je 0xff                                  
  00aa  6a01             push 1                                   
  00ac  c41e625e         les bx, ptr [0x5e62]                     
  00b0  26ff7702         push word ptr es:[bx + 2]                
  00b4  26ff37           push word ptr es:[bx]                    
  00b7  90               nop                                      
  00b8  0e               push cs                                  
  00b9  e8990f           call 0x1055                              
  00bc  83c406           add sp, 6                                
  00bf  8bd8             mov bx, ax                               
  00c1  80bf562d0e       cmp byte ptr [bx + 0x2d56], 0xe          
  00c6  7537             jne 0xff                                 
  00c8  833eac2e00       cmp word ptr [0x2eac], 0                 
  00cd  7427             je 0xf6                                  
  00cf  c41e625e         les bx, ptr [0x5e62]                     
  00d3  268b07           mov ax, word ptr es:[bx]                 
  00d6  2b06ae2e         sub ax, word ptr [0x2eae]                
  00da  99               cdq                                      
  00db  33c2             xor ax, dx                               
  00dd  2bc2             sub ax, dx                               
  00df  3d0100           cmp ax, 1                                
  00e2  7f12             jg 0xf6                                  
  00e4  268b4702         mov ax, word ptr es:[bx + 2]             
  00e8  2b06b02e         sub ax, word ptr [0x2eb0]                
  00ec  99               cdq                                      
  00ed  33c2             xor ax, dx                               
  00ef  2bc2             sub ax, dx                               
  00f1  3d0100           cmp ax, 1                                
  00f4  7e09             jle 0xff                                 
  00f6  c706ac2e0000     mov word ptr [0x2eac], 0                 
  00fc  e93701           jmp 0x236                                
  00ff  833e543200       cmp word ptr [0x3254], 0                 
  0104  7463             je 0x169                                 
  0106  6a01             push 1                                   
  0108  b8042c           mov ax, 0x2c04                           
  010b  8ec0             mov es, ax                               
  010d  26ff367f01       push word ptr es:[0x17f]                 
  0112  8ec0             mov es, ax                               
  0114  26ff367d01       push word ptr es:[0x17d]                 
  0119  90               nop                                      
  011a  0e               push cs                                  
  011b  e8370f           call 0x1055                              
  011e  83c406           add sp, 6                                
  0121  8bd8             mov bx, ax                               
  0123  80bf562d0e       cmp byte ptr [bx + 0x2d56], 0xe          
  0128  753f             jne 0x169                                
  012a  833eac2e00       cmp word ptr [0x2eac], 0                 
  012f  74c5             je 0xf6                                  
  0131  b8042c           mov ax, 0x2c04                           
  0134  8ec0             mov es, ax                               
  0136  26a17d01         mov ax, word ptr es:[0x17d]              
  013a  2b06ae2e         sub ax, word ptr [0x2eae]                
  013e  99               cdq                                      
  013f  33c2             xor ax, dx                               
  0141  2bc2             sub ax, dx                               
  0143  3d0100           cmp ax, 1                                
  0146  7fae             jg 0xf6                                  
  0148  b8042c           mov ax, 0x2c04                           
  014b  8ec0             mov es, ax                               
  014d  26a17f01         mov ax, word ptr es:[0x17f]              
  0151  2b06b02e         sub ax, word ptr [0x2eb0]                
  0155  99               cdq                                      
  0156  33c2             xor ax, dx                               
  0158  2bc2             sub ax, dx                               
  015a  3d0100           cmp ax, 1                                
  015d  7f97             jg 0xf6                                  
  015f  c706ac2e0000     mov word ptr [0x2eac], 0                 
  0165  eb08             jmp 0x16f                                
  0167  eb8d             jmp 0xf6                                 
  0169  c706ac2e0100     mov word ptr [0x2eac], 1                 
  016f  b8042c           mov ax, 0x2c04                           
  0172  8ec0             mov es, ax                               
  0174  26a17d01         mov ax, word ptr es:[0x17d]              
  0178  a3ae2e           mov word ptr [0x2eae], ax                
  017b  b8042c           mov ax, 0x2c04                           
  017e  8ec0             mov es, ax                               
  0180  26a17f01         mov ax, word ptr es:[0x17f]              
  0184  a3b02e           mov word ptr [0x2eb0], ax                
  0187  b8042c           mov ax, 0x2c04                           
  018a  8ec0             mov es, ax                               
  018c  26ff367f01       push word ptr es:[0x17f]                 
  0191  8ec0             mov es, ax                               
  0193  26ff367d01       push word ptr es:[0x17d]                 
  0198  9a25000831       lcall 0x3108, 0x25                       -> ovl65:0227
  019d  83c404           add sp, 4                                
  01a0  0e               push cs                                  
  01a1  e8affe           call 0x53                                
  01a4  666868016801     push 0x1680168                           
  01aa  666a00           push 0                                   
  01ad  16               push ss                                  
  01ae  8d46f8           lea ax, [bp - 8]                         
  01b1  50               push ax                                  
  01b2  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  01b7  83c40c           add sp, 0xc                              
  01ba  666810001e00     push 0x1e0010                            
  01c0  16               push ss                                  
  01c1  8d46f8           lea ax, [bp - 8]                         
  01c4  50               push ax                                  
  01c5  1e               push ds                                  
  01c6  689567           push 0x6795                              
  01c9  9a9d00d014       lcall 0x14d0, 0x9d                       -> 14d0:009d
  01ce  83c40c           add sp, 0xc                              
  01d1  66833e625e00     cmp dword ptr [0x5e62], 0                
  01d7  745d             je 0x236                                 
  01d9  c41e625e         les bx, ptr [0x5e62]                     
  01dd  268b07           mov ax, word ptr es:[bx]                 
  01e0  ba042c           mov dx, 0x2c04                           
  01e3  8ec2             mov es, dx                               
  01e5  262b067701       sub ax, word ptr es:[0x177]              
  01ea  6bc009           imul ax, ax, 9                           
  01ed  8e06645e         mov es, word ptr [0x5e64]                
  01f1  268b5702         mov dx, word ptr es:[bx + 2]             
  01f5  bb042c           mov bx, 0x2c04                           
  01f8  8ec3             mov es, bx                               
  01fa  262b167501       sub dx, word ptr es:[0x175]              
  01ff  03c2             add ax, dx                               
  0201  8bd8             mov bx, ax                               
  0203  80bfd45e0e       cmp byte ptr [bx + 0x5ed4], 0xe          
  0208  742c             je 0x236                                 
  020a  833eda2b00       cmp word ptr [0x2bda], 0                 
  020f  7412             je 0x223                                 
  0211  c41e625e         les bx, ptr [0x5e62]                     
  0215  26ff7702         push word ptr es:[bx + 2]                
  0219  26ff37           push word ptr es:[bx]                    
  021c  9a8e00e830       lcall 0x30e8, 0x8e                       -> ovl62:0b27
  0221  eb10             jmp 0x233                                
  0223  c41e625e         les bx, ptr [0x5e62]                     
  0227  26ff7702         push word ptr es:[bx + 2]                
  022b  26ff37           push word ptr es:[bx]                    
  022e  9a8900e830       lcall 0x30e8, 0x89                       -> ovl62:0afd
  0233  83c404           add sp, 4                                
  0236  c9               leave                                    
  0237  cb               retf                                     

ovl64_0238:  ; ENTRY
  0238  55               push bp                                  
  0239  8bec             mov bp, sp                               
  023b  83ec08           sub sp, 8                                
  023e  56               push si                                  
  023f  57               push di                                  
  0240  8b7606           mov si, word ptr [bp + 6]                
  0243  8b7e08           mov di, word ptr [bp + 8]                
  0246  b8042c           mov ax, 0x2c04                           
  0249  8ec0             mov es, ax                               
  024b  2639367701       cmp word ptr es:[0x177], si              
  0250  7e03             jle 0x255                                
  0252  e9dc00           jmp 0x331                                
  0255  8ec0             mov es, ax                               
  0257  2639367b01       cmp word ptr es:[0x17b], si              
  025c  7d03             jge 0x261                                
  025e  e9d000           jmp 0x331                                
  0261  8ec0             mov es, ax                               
  0263  26393e7501       cmp word ptr es:[0x175], di              
  0268  7e03             jle 0x26d                                
  026a  e9c400           jmp 0x331                                
  026d  8ec0             mov es, ax                               
  026f  26393e7901       cmp word ptr es:[0x179], di              
  0274  7d03             jge 0x279                                
  0276  e9b800           jmp 0x331                                
  0279  b8042c           mov ax, 0x2c04                           
  027c  8ec0             mov es, ax                               
  027e  26833e590100     cmp word ptr es:[0x159], 0               
  0284  7503             jne 0x289                                
  0286  e9a800           jmp 0x331                                
  0289  833e543200       cmp word ptr [0x3254], 0                 
  028e  7424             je 0x2b4                                 
  0290  6a00             push 0                                   
  0292  b8042c           mov ax, 0x2c04                           
  0295  8ec0             mov es, ax                               
  0297  26ff367f01       push word ptr es:[0x17f]                 
  029c  8ec0             mov es, ax                               
  029e  26ff367d01       push word ptr es:[0x17d]                 
  02a3  90               nop                                      
  02a4  0e               push cs                                  
  02a5  e8ad0d           call 0x1055                              
  02a8  83c406           add sp, 6                                
  02ab  8bd8             mov bx, ax                               
  02ad  80bf562d0e       cmp byte ptr [bx + 0x2d56], 0xe          
  02b2  747d             je 0x331                                 
  02b4  0e               push cs                                  
  02b5  e89bfd           call 0x53                                
  02b8  666828002800     push 0x280028                            
  02be  b8042c           mov ax, 0x2c04                           
  02c1  8bd7             mov dx, di                               
  02c3  8ec0             mov es, ax                               
  02c5  262b167501       sub dx, word ptr es:[0x175]              
  02ca  d1e2             shl dx, 1                                
  02cc  8bda             mov bx, dx                               
  02ce  ffb73c2d         push word ptr [bx + 0x2d3c]              
  02d2  8bd6             mov dx, si                               
  02d4  8ec0             mov es, ax                               
  02d6  262b167701       sub dx, word ptr es:[0x177]              
  02db  d1e2             shl dx, 1                                
  02dd  8bda             mov bx, dx                               
  02df  ffb72a2d         push word ptr [bx + 0x2d2a]              
  02e3  16               push ss                                  
  02e4  8d46f8           lea ax, [bp - 8]                         
  02e7  50               push ax                                  
  02e8  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  02ed  83c40c           add sp, 0xc                              
  02f0  b8042c           mov ax, 0x2c04                           
  02f3  8bd7             mov dx, di                               
  02f5  8ec0             mov es, ax                               
  02f7  262b167501       sub dx, word ptr es:[0x175]              
  02fc  d1e2             shl dx, 1                                
  02fe  8bda             mov bx, dx                               
  0300  8b873c2d         mov ax, word ptr [bx + 0x2d3c]           
  0304  051e00           add ax, 0x1e                             
  0307  50               push ax                                  
  0308  b8042c           mov ax, 0x2c04                           
  030b  8bd6             mov dx, si                               
  030d  8ec0             mov es, ax                               
  030f  262b167701       sub dx, word ptr es:[0x177]              
  0314  d1e2             shl dx, 1                                
  0316  8bda             mov bx, dx                               
  0318  8b872a2d         mov ax, word ptr [bx + 0x2d2a]           
  031c  051000           add ax, 0x10                             
  031f  50               push ax                                  
  0320  16               push ss                                  
  0321  8d46f8           lea ax, [bp - 8]                         
  0324  50               push ax                                  
  0325  1e               push ds                                  
  0326  689567           push 0x6795                              
  0329  9a9d00d014       lcall 0x14d0, 0x9d                       -> 14d0:009d
  032e  83c40c           add sp, 0xc                              
  0331  5f               pop di                                   
  0332  5e               pop si                                   
  0333  c9               leave                                    
  0334  cb               retf                                     

ovl64_0335:  ; ENTRY
  0335  55               push bp                                  
  0336  8bec             mov bp, sp                               
  0338  83ec14           sub sp, 0x14                             
  033b  56               push si                                  
  033c  57               push di                                  
  033d  8b760a           mov si, word ptr [bp + 0xa]              
  0340  8b4e0c           mov cx, word ptr [bp + 0xc]              
  0343  8b7e0e           mov di, word ptr [bp + 0xe]              
  0346  83fe0f           cmp si, 0xf                              
  0349  7503             jne 0x34e                                
  034b  be0800           mov si, 8                                
  034e  8bc1             mov ax, cx                               
  0350  bb1000           mov bx, 0x10                             
  0353  99               cdq                                      
  0354  f7fb             idiv bx                                  
  0356  c1e205           shl dx, 5                                
  0359  8956fe           mov word ptr [bp - 2], dx                
  035c  8bc1             mov ax, cx                               
  035e  99               cdq                                      
  035f  f7fb             idiv bx                                  
  0361  6bc01e           imul ax, ax, 0x1e                        
  0364  8946fc           mov word ptr [bp - 4], ax                
  0367  8b5e10           mov bx, word ptr [bp + 0x10]             
  036a  d1e3             shl bx, 1                                
  036c  8b872a2d         mov ax, word ptr [bx + 0x2d2a]           
  0370  8946fa           mov word ptr [bp - 6], ax                
  0373  8b5e12           mov bx, word ptr [bp + 0x12]             
  0376  d1e3             shl bx, 1                                
  0378  8b873c2d         mov ax, word ptr [bx + 0x2d3c]           
  037c  8946f8           mov word ptr [bp - 8], ax                
  037f  8bc6             mov ax, si                               
  0381  051000           add ax, 0x10                             
  0384  50               push ax                                  
  0385  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  038a  59               pop cx                                   
  038b  8bc6             mov ax, si                               
  038d  051000           add ax, 0x10                             
  0390  50               push ax                                  
  0391  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  0396  59               pop cx                                   
  0397  ff76fc           push word ptr [bp - 4]                   
  039a  ff76fe           push word ptr [bp - 2]                   
  039d  1e               push ds                                  
  039e  68e54e           push 0x4ee5                              
  03a1  8b46f8           mov ax, word ptr [bp - 8]                
  03a4  050700           add ax, 7                                
  03a7  50               push ax                                  
  03a8  8b46fa           mov ax, word ptr [bp - 6]                
  03ab  050800           add ax, 8                                
  03ae  50               push ax                                  
  03af  66ff7606         push dword ptr [bp + 6]                  
  03b3  666820001d00     push 0x1d0020                            
  03b9  ff76fc           push word ptr [bp - 4]                   
  03bc  ff76fe           push word ptr [bp - 2]                   
  03bf  8bc6             mov ax, si                               
  03c1  6bc03b           imul ax, ax, 0x3b                        
  03c4  05204f           add ax, 0x4f20                           
  03c7  1e               push ds                                  
  03c8  50               push ax                                  
  03c9  ff1ec869         lcall [0x69c8]                           
  03cd  83c41c           add sp, 0x1c                             
  03d0  8bc6             mov ax, si                               
  03d2  051000           add ax, 0x10                             
  03d5  50               push ax                                  
  03d6  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  03db  59               pop cx                                   
  03dc  666828000e00     push 0xe0028                             
  03e2  ff76f8           push word ptr [bp - 8]                   
  03e5  8b46fa           mov ax, word ptr [bp - 6]                
  03e8  050200           add ax, 2                                
  03eb  50               push ax                                  
  03ec  66ff7606         push dword ptr [bp + 6]                  
  03f0  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  03f5  83c40c           add sp, 0xc                              
  03f8  666828000d00     push 0xd0028                             
  03fe  ff76f8           push word ptr [bp - 8]                   
  0401  8b46fa           mov ax, word ptr [bp - 6]                
  0404  050300           add ax, 3                                
  0407  50               push ax                                  
  0408  66ff7606         push dword ptr [bp + 6]                  
  040c  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  0411  83c40c           add sp, 0xc                              
  0414  666828000e00     push 0xe0028                             
  041a  ff76f8           push word ptr [bp - 8]                   
  041d  8b46fa           mov ax, word ptr [bp - 6]                
  0420  050400           add ax, 4                                
  0423  50               push ax                                  
  0424  66ff7606         push dword ptr [bp + 6]                  
  0428  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  042d  83c40c           add sp, 0xc                              
  0430  83ff04           cmp di, 4                                
  0433  7e52             jle 0x487                                
  0435  8bc6             mov ax, si                               
  0437  051000           add ax, 0x10                             
  043a  50               push ax                                  
  043b  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  0440  59               pop cx                                   
  0441  ff364e2d         push word ptr [0x2d4e]                   
  0445  68d001           push 0x1d0                               
  0448  1e               push ds                                  
  0449  68e54e           push 0x4ee5                              
  044c  8b46f8           mov ax, word ptr [bp - 8]                
  044f  050800           add ax, 8                                
  0452  50               push ax                                  
  0453  ff76fa           push word ptr [bp - 6]                   
  0456  66ff7606         push dword ptr [bp + 6]                  
  045a  666830000800     push 0x80030                             
  0460  ff364e2d         push word ptr [0x2d4e]                   
  0464  68d001           push 0x1d0                               
  0467  8bc6             mov ax, si                               
  0469  6bc03b           imul ax, ax, 0x3b                        
  046c  05204f           add ax, 0x4f20                           
  046f  1e               push ds                                  
  0470  50               push ax                                  
  0471  ff1ec869         lcall [0x69c8]                           
  0475  83c41c           add sp, 0x1c                             
  0478  83ef04           sub di, 4                                
  047b  8bc6             mov ax, si                               
  047d  051000           add ax, 0x10                             
  0480  50               push ax                                  
  0481  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  0486  59               pop cx                                   
  0487  83ff04           cmp di, 4                                
  048a  7d04             jge 0x490                                
  048c  8bc7             mov ax, di                               
  048e  eb03             jmp 0x493                                
  0490  b80400           mov ax, 4                                
  0493  48               dec ax                                   
  0494  8bf8             mov di, ax                               
  0496  8bc6             mov ax, si                               
  0498  051000           add ax, 0x10                             
  049b  50               push ax                                  
  049c  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  04a1  59               pop cx                                   
  04a2  8bdf             mov bx, di                               
  04a4  d1e3             shl bx, 1                                
  04a6  ffb74e2d         push word ptr [bx + 0x2d4e]              
  04aa  68d001           push 0x1d0                               
  04ad  1e               push ds                                  
  04ae  68e54e           push 0x4ee5                              
  04b1  ff76f8           push word ptr [bp - 8]                   
  04b4  ff76fa           push word ptr [bp - 6]                   
  04b7  66ff7606         push dword ptr [bp + 6]                  
  04bb  666830000800     push 0x80030                             
  04c1  8bdf             mov bx, di                               
  04c3  d1e3             shl bx, 1                                
  04c5  ffb74e2d         push word ptr [bx + 0x2d4e]              
  04c9  68d001           push 0x1d0                               
  04cc  8bc6             mov ax, si                               
  04ce  6bc03b           imul ax, ax, 0x3b                        
  04d1  05204f           add ax, 0x4f20                           
  04d4  1e               push ds                                  
  04d5  50               push ax                                  
  04d6  ff1ec869         lcall [0x69c8]                           
  04da  83c41c           add sp, 0x1c                             
  04dd  8bc6             mov ax, si                               
  04df  051000           add ax, 0x10                             
  04e2  50               push ax                                  
  04e3  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  04e8  59               pop cx                                   
  04e9  833ec62600       cmp word ptr [0x26c6], 0                 
  04ee  7471             je 0x561                                 
  04f0  83fe08           cmp si, 8                                
  04f3  7d6c             jge 0x561                                
  04f5  6a09             push 9                                   
  04f7  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  04fc  59               pop cx                                   
  04fd  ff76f8           push word ptr [bp - 8]                   
  0500  ff76fa           push word ptr [bp - 6]                   
  0503  16               push ss                                  
  0504  8d46ec           lea ax, [bp - 0x14]                      
  0507  50               push ax                                  
  0508  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  050d  83c408           add sp, 8                                
  0510  666810000e00     push 0xe0010                             
  0516  8bc6             mov ax, si                               
  0518  bb0400           mov bx, 4                                
  051b  99               cdq                                      
  051c  f7fb             idiv bx                                  
  051e  6bd20e           imul dx, dx, 0xe                         
  0521  83c25e           add dx, 0x5e                             
  0524  52               push dx                                  
  0525  8bc6             mov ax, si                               
  0527  99               cdq                                      
  0528  f7fb             idiv bx                                  
  052a  c1e004           shl ax, 4                                
  052d  057000           add ax, 0x70                             
  0530  50               push ax                                  
  0531  16               push ss                                  
  0532  8d46f0           lea ax, [bp - 0x10]                      
  0535  50               push ax                                  
  0536  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  053b  83c40c           add sp, 0xc                              
  053e  66ff76f0         push dword ptr [bp - 0x10]               
  0542  1e               push ds                                  
  0543  686c57           push 0x576c                              
  0546  66ff76ec         push dword ptr [bp - 0x14]               
  054a  66ff7606         push dword ptr [bp + 6]                  
  054e  66ff76f4         push dword ptr [bp - 0xc]                
  0552  66ff76f0         push dword ptr [bp - 0x10]               
  0556  1e               push ds                                  
  0557  68a757           push 0x57a7                              
  055a  ff1ec869         lcall [0x69c8]                           
  055e  83c41c           add sp, 0x1c                             
  0561  5f               pop di                                   
  0562  5e               pop si                                   
  0563  c9               leave                                    
  0564  cb               retf                                     

ovl64_0565:  ; ENTRY
  0565  55               push bp                                  
  0566  8bec             mov bp, sp                               
  0568  83ec04           sub sp, 4                                
  056b  66833e625e00     cmp dword ptr [0x5e62], 0                
  0571  7409             je 0x57c                                 
  0573  c41e625e         les bx, ptr [0x5e62]                     
  0577  268b07           mov ax, word ptr es:[bx]                 
  057a  eb09             jmp 0x585                                
  057c  b8042c           mov ax, 0x2c04                           
  057f  8ec0             mov es, ax                               
  0581  26a17d01         mov ax, word ptr es:[0x17d]              
  0585  8946fe           mov word ptr [bp - 2], ax                
  0588  66833e625e00     cmp dword ptr [0x5e62], 0                
  058e  740a             je 0x59a                                 
  0590  c41e625e         les bx, ptr [0x5e62]                     
  0594  268b4702         mov ax, word ptr es:[bx + 2]             
  0598  eb09             jmp 0x5a3                                
  059a  b8042c           mov ax, 0x2c04                           
  059d  8ec0             mov es, ax                               
  059f  26a17f01         mov ax, word ptr es:[0x17f]              
  05a3  8946fc           mov word ptr [bp - 4], ax                
  05a6  50               push ax                                  
  05a7  ff76fe           push word ptr [bp - 2]                   
  05aa  90               nop                                      
  05ab  0e               push cs                                  
  05ac  e87a00           call 0x629                               
  05af  83c404           add sp, 4                                
  05b2  c9               leave                                    
  05b3  cb               retf                                     

ovl64_05b4:  ; ENTRY
  05b4  55               push bp                                  
  05b5  8bec             mov bp, sp                               
  05b7  66833e625e00     cmp dword ptr [0x5e62], 0                
  05bd  7409             je 0x5c8                                 
  05bf  c41e625e         les bx, ptr [0x5e62]                     
  05c3  268b07           mov ax, word ptr es:[bx]                 
  05c6  eb09             jmp 0x5d1                                
  05c8  b8042c           mov ax, 0x2c04                           
  05cb  8ec0             mov es, ax                               
  05cd  26a17d01         mov ax, word ptr es:[0x17d]              
  05d1  8bd0             mov dx, ax                               
  05d3  66833e625e00     cmp dword ptr [0x5e62], 0                
  05d9  740a             je 0x5e5                                 
  05db  c41e625e         les bx, ptr [0x5e62]                     
  05df  268b4702         mov ax, word ptr es:[bx + 2]             
  05e3  eb09             jmp 0x5ee                                
  05e5  b8042c           mov ax, 0x2c04                           
  05e8  8ec0             mov es, ax                               
  05ea  26a17f01         mov ax, word ptr es:[0x17f]              
  05ee  8bd8             mov bx, ax                               
  05f0  b8042c           mov ax, 0x2c04                           
  05f3  8ec0             mov es, ax                               
  05f5  2639167701       cmp word ptr es:[0x177], dx              
  05fa  7f21             jg 0x61d                                 
  05fc  8ec0             mov es, ax                               
  05fe  2639167b01       cmp word ptr es:[0x17b], dx              
  0603  7c18             jl 0x61d                                 
  0605  8ec0             mov es, ax                               
  0607  26391e7501       cmp word ptr es:[0x175], bx              
  060c  7f0f             jg 0x61d                                 
  060e  8ec0             mov es, ax                               
  0610  26391e7901       cmp word ptr es:[0x179], bx              
  0615  7c06             jl 0x61d                                 
  0617  0e               push cs                                  
  0618  e851fa           call 0x6c                                
  061b  eb0a             jmp 0x627                                
  061d  53               push bx                                  
  061e  52               push dx                                  
  061f  90               nop                                      
  0620  0e               push cs                                  
  0621  e80500           call 0x629                               
  0624  83c404           add sp, 4                                
  0627  5d               pop bp                                   
  0628  cb               retf                                     

ovl64_0629:  ; ENTRY
  0629  55               push bp                                  
  062a  8bec             mov bp, sp                               
  062c  8b5e06           mov bx, word ptr [bp + 6]                
  062f  8b4e08           mov cx, word ptr [bp + 8]                
  0632  83fb04           cmp bx, 4                                
  0635  7e04             jle 0x63b                                
  0637  8bc3             mov ax, bx                               
  0639  eb03             jmp 0x63e                                
  063b  b80400           mov ax, 4                                
  063e  8bd8             mov bx, ax                               
  0640  83f904           cmp cx, 4                                
  0643  7e04             jle 0x649                                
  0645  8bc1             mov ax, cx                               
  0647  eb03             jmp 0x64c                                
  0649  b80400           mov ax, 4                                
  064c  8bc8             mov cx, ax                               
  064e  83fb6b           cmp bx, 0x6b                             
  0651  7d04             jge 0x657                                
  0653  8bc3             mov ax, bx                               
  0655  eb03             jmp 0x65a                                
  0657  b86b00           mov ax, 0x6b                             
  065a  8bd8             mov bx, ax                               
  065c  81f99700         cmp cx, 0x97                             
  0660  7d04             jge 0x666                                
  0662  8bc1             mov ax, cx                               
  0664  eb03             jmp 0x669                                
  0666  b89700           mov ax, 0x97                             
  0669  8bc8             mov cx, ax                               
  066b  b8042c           mov ax, 0x2c04                           
  066e  8ec0             mov es, ax                               
  0670  26891e7d01       mov word ptr es:[0x17d], bx              
  0675  8ec0             mov es, ax                               
  0677  26890e7f01       mov word ptr es:[0x17f], cx              
  067c  8ec0             mov es, ax                               
  067e  26a17f01         mov ax, word ptr es:[0x17f]              
  0682  05fcff           add ax, 0xfffc                           
  0685  7d04             jge 0x68b                                
  0687  33c0             xor ax, ax                               
  0689  eb0c             jmp 0x697                                
  068b  b8042c           mov ax, 0x2c04                           
  068e  8ec0             mov es, ax                               
  0690  26a17f01         mov ax, word ptr es:[0x17f]              
  0694  05fcff           add ax, 0xfffc                           
  0697  ba042c           mov dx, 0x2c04                           
  069a  8ec2             mov es, dx                               
  069c  26a37501         mov word ptr es:[0x175], ax              
  06a0  b8042c           mov ax, 0x2c04                           
  06a3  8ec0             mov es, ax                               
  06a5  26a17d01         mov ax, word ptr es:[0x17d]              
  06a9  05fcff           add ax, 0xfffc                           
  06ac  7d04             jge 0x6b2                                
  06ae  33c0             xor ax, ax                               
  06b0  eb0c             jmp 0x6be                                
  06b2  b8042c           mov ax, 0x2c04                           
  06b5  8ec0             mov es, ax                               
  06b7  26a17d01         mov ax, word ptr es:[0x17d]              
  06bb  05fcff           add ax, 0xfffc                           
  06be  ba042c           mov dx, 0x2c04                           
  06c1  8ec2             mov es, dx                               
  06c3  26a37701         mov word ptr es:[0x177], ax              
  06c7  b8042c           mov ax, 0x2c04                           
  06ca  8ec0             mov es, ax                               
  06cc  26a17d01         mov ax, word ptr es:[0x17d]              
  06d0  050400           add ax, 4                                
  06d3  3d6f00           cmp ax, 0x6f                             
  06d6  7e05             jle 0x6dd                                
  06d8  b86f00           mov ax, 0x6f                             
  06db  eb0c             jmp 0x6e9                                
  06dd  b8042c           mov ax, 0x2c04                           
  06e0  8ec0             mov es, ax                               
  06e2  26a17d01         mov ax, word ptr es:[0x17d]              
  06e6  050400           add ax, 4                                
  06e9  ba042c           mov dx, 0x2c04                           
  06ec  8ec2             mov es, dx                               
  06ee  26a37b01         mov word ptr es:[0x17b], ax              
  06f2  b8042c           mov ax, 0x2c04                           
  06f5  8ec0             mov es, ax                               
  06f7  26a17f01         mov ax, word ptr es:[0x17f]              
  06fb  050400           add ax, 4                                
  06fe  3d9b00           cmp ax, 0x9b                             
  0701  7e05             jle 0x708                                
  0703  b89b00           mov ax, 0x9b                             
  0706  eb0c             jmp 0x714                                
  0708  b8042c           mov ax, 0x2c04                           
  070b  8ec0             mov es, ax                               
  070d  26a17f01         mov ax, word ptr es:[0x17f]              
  0711  050400           add ax, 4                                
  0714  ba042c           mov dx, 0x2c04                           
  0717  8ec2             mov es, dx                               
  0719  26a37901         mov word ptr es:[0x179], ax              
  071d  0e               push cs                                  
  071e  e84bf9           call 0x6c                                
  0721  5d               pop bp                                   
  0722  cb               retf                                     

ovl64_0723:  ; ENTRY
  0723  55               push bp                                  
  0724  8bec             mov bp, sp                               
  0726  833e862a00       cmp word ptr [0x2a86], 0                 
  072b  7503             jne 0x730                                
  072d  e9b200           jmp 0x7e2                                
  0730  833e6a1600       cmp word ptr [0x166a], 0                 
  0735  7403             je 0x73a                                 
  0737  e9a800           jmp 0x7e2                                
  073a  833e741100       cmp word ptr [0x1174], 0                 
  073f  7403             je 0x744                                 
  0741  e99e00           jmp 0x7e2                                
  0744  833e721100       cmp word ptr [0x1172], 0                 
  0749  7403             je 0x74e                                 
  074b  e99400           jmp 0x7e2                                
  074e  833e761100       cmp word ptr [0x1176], 0                 
  0753  7403             je 0x758                                 
  0755  e98a00           jmp 0x7e2                                
  0758  8b5e06           mov bx, word ptr [bp + 6]                
  075b  83fb07           cmp bx, 7                                
  075e  7765             ja 0x7c5                                 
  0760  d1e3             shl bx, 1                                
  0762  2effa7e407       jmp word ptr cs:[bx + 0x7e4]             
ovl64_0767:  ; case
  0767  b8042c           mov ax, 0x2c04                           
  076a  8ec0             mov es, ax                               
  076c  26ff0e7f01       dec word ptr es:[0x17f]                  
  0771  eb52             jmp 0x7c5                                
ovl64_0773:  ; case
  0773  b8042c           mov ax, 0x2c04                           
  0776  8ec0             mov es, ax                               
  0778  26ff067f01       inc word ptr es:[0x17f]                  
  077d  eb46             jmp 0x7c5                                
ovl64_077f:  ; case
  077f  eb24             jmp 0x7a5                                
ovl64_0781:  ; case
  0781  eb38             jmp 0x7bb                                
ovl64_0783:  ; case
  0783  b8042c           mov ax, 0x2c04                           
  0786  8ec0             mov es, ax                               
  0788  26ff0e7f01       dec word ptr es:[0x17f]                  
  078d  eb16             jmp 0x7a5                                
ovl64_078f:  ; case
  078f  b8042c           mov ax, 0x2c04                           
  0792  8ec0             mov es, ax                               
  0794  26ff0e7f01       dec word ptr es:[0x17f]                  
  0799  eb20             jmp 0x7bb                                
ovl64_079b:  ; case
  079b  b8042c           mov ax, 0x2c04                           
  079e  8ec0             mov es, ax                               
  07a0  26ff067f01       inc word ptr es:[0x17f]                  
  07a5  b8042c           mov ax, 0x2c04                           
  07a8  8ec0             mov es, ax                               
  07aa  26ff0e7d01       dec word ptr es:[0x17d]                  
  07af  eb14             jmp 0x7c5                                
ovl64_07b1:  ; case
  07b1  b8042c           mov ax, 0x2c04                           
  07b4  8ec0             mov es, ax                               
  07b6  26ff067f01       inc word ptr es:[0x17f]                  
  07bb  b8042c           mov ax, 0x2c04                           
  07be  8ec0             mov es, ax                               
  07c0  26ff067d01       inc word ptr es:[0x17d]                  
  07c5  b8042c           mov ax, 0x2c04                           
  07c8  8ec0             mov es, ax                               
  07ca  26ff367f01       push word ptr es:[0x17f]                 
  07cf  8ec0             mov es, ax                               
  07d1  26ff367d01       push word ptr es:[0x17d]                 
  07d6  0e               push cs                                  
  07d7  e84ffe           call 0x629                               
  07da  83c404           add sp, 4                                
  07dd  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  07e2  5d               pop bp                                   
  07e3  cb               retf                                     
  07e4  67078f078107b107 dw 0767,078f,0781,07b1,0773,079b,077f,0783 jump table

ovl64_07f4:  ; ENTRY
  07f4  55               push bp                                  
  07f5  8bec             mov bp, sp                               
  07f7  8b5e06           mov bx, word ptr [bp + 6]                
  07fa  83fb06           cmp bx, 6                                
  07fd  7739             ja 0x838                                 
  07ff  d1e3             shl bx, 1                                
  0801  2effa75208       jmp word ptr cs:[bx + 0x852]             
ovl64_0806:  ; case
  0806  b8042c           mov ax, 0x2c04                           
  0809  8ec0             mov es, ax                               
  080b  26832e7f0109     sub word ptr es:[0x17f], 9               
  0811  eb25             jmp 0x838                                
ovl64_0813:  ; case
  0813  b8042c           mov ax, 0x2c04                           
  0816  8ec0             mov es, ax                               
  0818  2683067f0109     add word ptr es:[0x17f], 9               
  081e  eb18             jmp 0x838                                
ovl64_0820:  ; case
  0820  b8042c           mov ax, 0x2c04                           
  0823  8ec0             mov es, ax                               
  0825  26832e7d0109     sub word ptr es:[0x17d], 9               
  082b  eb0b             jmp 0x838                                
ovl64_082d:  ; case
  082d  b8042c           mov ax, 0x2c04                           
  0830  8ec0             mov es, ax                               
  0832  2683067d0109     add word ptr es:[0x17d], 9               
ovl64_0838:  ; case
  0838  b8042c           mov ax, 0x2c04                           
  083b  8ec0             mov es, ax                               
  083d  26ff367f01       push word ptr es:[0x17f]                 
  0842  8ec0             mov es, ax                               
  0844  26ff367d01       push word ptr es:[0x17d]                 
  0849  0e               push cs                                  
  084a  e8dcfd           call 0x629                               
  084d  83c404           add sp, 4                                
  0850  5d               pop bp                                   
  0851  cb               retf                                     
  0852  060838082d083808 dw 0806,0838,082d,0838,0813,0838,0820    jump table

ovl64_0860:  ; ENTRY
  0860  55               push bp                                  
  0861  8bec             mov bp, sp                               
  0863  56               push si                                  
  0864  57               push di                                  
  0865  8b7606           mov si, word ptr [bp + 6]                
  0868  8bc6             mov ax, si                               
  086a  bb6000           mov bx, 0x60                             
  086d  99               cdq                                      
  086e  f7fb             idiv bx                                  
  0870  8bf8             mov di, ax                               
  0872  051a00           add ax, 0x1a                             
  0875  50               push ax                                  
  0876  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  087b  59               pop cx                                   
  087c  ff760e           push word ptr [bp + 0xe]                 
  087f  ff760c           push word ptr [bp + 0xc]                 
  0882  66ff7608         push dword ptr [bp + 8]                  
  0886  666828002800     push 0x280028                            
  088c  8bc6             mov ax, si                               
  088e  bb6000           mov bx, 0x60                             
  0891  99               cdq                                      
  0892  f7fb             idiv bx                                  
  0894  bb1000           mov bx, 0x10                             
  0897  8bc2             mov ax, dx                               
  0899  99               cdq                                      
  089a  f7fb             idiv bx                                  
  089c  6bc028           imul ax, ax, 0x28                        
  089f  50               push ax                                  
  08a0  8bc6             mov ax, si                               
  08a2  99               cdq                                      
  08a3  f7fb             idiv bx                                  
  08a5  6bd228           imul dx, dx, 0x28                        
  08a8  52               push dx                                  
  08a9  8bc7             mov ax, di                               
  08ab  6bc03b           imul ax, ax, 0x3b                        
  08ae  053351           add ax, 0x5133                           
  08b1  1e               push ds                                  
  08b2  50               push ax                                  
  08b3  ff1ed469         lcall [0x69d4]                           
  08b7  83c414           add sp, 0x14                             
  08ba  5f               pop di                                   
  08bb  5e               pop si                                   
  08bc  5d               pop bp                                   
  08bd  cb               retf                                     

ovl64_08be:  ; ENTRY
  08be  55               push bp                                  
  08bf  8bec             mov bp, sp                               
  08c1  83ec42           sub sp, 0x42                             
  08c4  56               push si                                  
  08c5  57               push di                                  
  08c6  837e080f         cmp word ptr [bp + 8], 0xf               
  08ca  7505             jne 0x8d1                                
  08cc  c746080800       mov word ptr [bp + 8], 8                 
  08d1  6a08             push 8                                   
  08d3  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  08d8  59               pop cx                                   
  08d9  33ff             xor di, di                               
  08db  eb4e             jmp 0x92b                                
  08dd  8bdf             mov bx, di                               
  08df  c1e302           shl bx, 2                                
  08e2  8d46e6           lea ax, [bp - 0x1a]                      
  08e5  03d8             add bx, ax                               
  08e7  8b460e           mov ax, word ptr [bp + 0xe]              
  08ea  368907           mov word ptr ss:[bx], ax                 
  08ed  8bdf             mov bx, di                               
  08ef  c1e302           shl bx, 2                                
  08f2  8d46e8           lea ax, [bp - 0x18]                      
  08f5  03d8             add bx, ax                               
  08f7  8bc7             mov ax, di                               
  08f9  6bc00a           imul ax, ax, 0xa                         
  08fc  8b5610           mov dx, word ptr [bp + 0x10]             
  08ff  03d0             add dx, ax                               
  0901  53               push bx                                  
  0902  52               push dx                                  
  0903  83ff02           cmp di, 2                                
  0906  7d04             jge 0x90c                                
  0908  33c0             xor ax, ax                               
  090a  eb03             jmp 0x90f                                
  090c  b82400           mov ax, 0x24                             
  090f  5a               pop dx                                   
  0910  03d0             add dx, ax                               
  0912  5b               pop bx                                   
  0913  368917           mov word ptr ss:[bx], dx                 
  0916  837e1c02         cmp word ptr [bp + 0x1c], 2              
  091a  750e             jne 0x92a                                
  091c  8bdf             mov bx, di                               
  091e  c1e302           shl bx, 2                                
  0921  8d46e8           lea ax, [bp - 0x18]                      
  0924  03d8             add bx, ax                               
  0926  36832f14         sub word ptr ss:[bx], 0x14               
  092a  47               inc di                                   
  092b  83ff04           cmp di, 4                                
  092e  7cad             jl 0x8dd                                 
  0930  837e1c00         cmp word ptr [bp + 0x1c], 0              
  0934  7503             jne 0x939                                
  0936  e9bc01           jmp 0xaf5                                
  0939  ff7612           push word ptr [bp + 0x12]                
  093c  1e               push ds                                  
  093d  68352f           push 0x2f35                               ; "%02d"
  0940  16               push ss                                  
  0941  8d46be           lea ax, [bp - 0x42]                      
  0944  50               push ax                                  
  0945  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  094a  83c40a           add sp, 0xa                              
  094d  ff7614           push word ptr [bp + 0x14]                
  0950  1e               push ds                                  
  0951  683a2f           push 0x2f3a                               ; "%02d"
  0954  16               push ss                                  
  0955  8d46c8           lea ax, [bp - 0x38]                      
  0958  50               push ax                                  
  0959  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  095e  83c40a           add sp, 0xa                              
  0961  ff7618           push word ptr [bp + 0x18]                
  0964  1e               push ds                                  
  0965  683f2f           push 0x2f3f                               ; "%02d"
  0968  16               push ss                                  
  0969  8d46d2           lea ax, [bp - 0x2e]                      
  096c  50               push ax                                  
  096d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0972  83c40a           add sp, 0xa                              
  0975  ff7616           push word ptr [bp + 0x16]                
  0978  1e               push ds                                  
  0979  68442f           push 0x2f44                               ; "%02d"
  097c  16               push ss                                  
  097d  8d46dc           lea ax, [bp - 0x24]                      
  0980  50               push ax                                  
  0981  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0986  83c40a           add sp, 0xa                              
  0989  33f6             xor si, si                               
  098b  e95f01           jmp 0xaed                                
  098e  837e1c02         cmp word ptr [bp + 0x1c], 2              
  0992  7403             je 0x997                                 
  0994  e98a00           jmp 0xa21                                
  0997  83fe03           cmp si, 3                                
  099a  7d03             jge 0x99f                                
  099c  e94d01           jmp 0xaec                                
  099f  8bde             mov bx, si                               
  09a1  c1e302           shl bx, 2                                
  09a4  8d46e6           lea ax, [bp - 0x1a]                      
  09a7  03d8             add bx, ax                               
  09a9  36830708         add word ptr ss:[bx], 8                  
  09ad  8bde             mov bx, si                               
  09af  c1e302           shl bx, 2                                
  09b2  8d46e8           lea ax, [bp - 0x18]                      
  09b5  03d8             add bx, ax                               
  09b7  36832f0f         sub word ptr ss:[bx], 0xf                
  09bb  33ff             xor di, di                               
  09bd  eb47             jmp 0xa06                                
  09bf  8bde             mov bx, si                               
  09c1  c1e302           shl bx, 2                                
  09c4  8d46e6           lea ax, [bp - 0x1a]                      
  09c7  03d8             add bx, ax                               
  09c9  6636ff37         push dword ptr ss:[bx]                   
  09cd  8bde             mov bx, si                               
  09cf  6bdb0a           imul bx, bx, 0xa                         
  09d2  03df             add bx, di                               
  09d4  8d46be           lea ax, [bp - 0x42]                      
  09d7  03d8             add bx, ax                               
  09d9  368a07           mov al, byte ptr ss:[bx]                 
  09dc  98               cwde                                     
  09dd  c1e003           shl ax, 3                                
  09e0  8cda             mov dx, ds                               
  09e2  05d62c           add ax, 0x2cd6                           
  09e5  b90800           mov cx, 8                                
  09e8  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  09ed  6a08             push 8                                   
  09ef  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  09f4  83c40e           add sp, 0xe                              
  09f7  8bde             mov bx, si                               
  09f9  c1e302           shl bx, 2                                
  09fc  8d46e6           lea ax, [bp - 0x1a]                      
  09ff  03d8             add bx, ax                               
  0a01  36830708         add word ptr ss:[bx], 8                  
  0a05  47               inc di                                   
  0a06  16               push ss                                  
  0a07  8bc6             mov ax, si                               
  0a09  6bc00a           imul ax, ax, 0xa                         
  0a0c  8d56be           lea dx, [bp - 0x42]                      
  0a0f  03c2             add ax, dx                               
  0a11  50               push ax                                  
  0a12  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0a17  83c404           add sp, 4                                
  0a1a  3bc7             cmp ax, di                               
  0a1c  7fa1             jg 0x9bf                                 
  0a1e  e9cb00           jmp 0xaec                                
  0a21  8bde             mov bx, si                               
  0a23  c1e302           shl bx, 2                                
  0a26  8d46e6           lea ax, [bp - 0x1a]                      
  0a29  03d8             add bx, ax                               
  0a2b  6636ff37         push dword ptr ss:[bx]                   
  0a2f  8bc6             mov ax, si                               
  0a31  c1e003           shl ax, 3                                
  0a34  8cda             mov dx, ds                               
  0a36  05b22e           add ax, 0x2eb2                           
  0a39  b90800           mov cx, 8                                
  0a3c  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0a41  6a08             push 8                                   
  0a43  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0a48  83c40e           add sp, 0xe                              
  0a4b  8bde             mov bx, si                               
  0a4d  c1e302           shl bx, 2                                
  0a50  8d46e6           lea ax, [bp - 0x1a]                      
  0a53  03d8             add bx, ax                               
  0a55  36830708         add word ptr ss:[bx], 8                  
  0a59  8bde             mov bx, si                               
  0a5b  c1e302           shl bx, 2                                
  0a5e  03d8             add bx, ax                               
  0a60  6636ff37         push dword ptr ss:[bx]                   
  0a64  b8d22e           mov ax, 0x2ed2                           
  0a67  8cda             mov dx, ds                               
  0a69  b90800           mov cx, 8                                
  0a6c  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0a71  6a08             push 8                                   
  0a73  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0a78  83c40e           add sp, 0xe                              
  0a7b  8bde             mov bx, si                               
  0a7d  c1e302           shl bx, 2                                
  0a80  8d46e6           lea ax, [bp - 0x1a]                      
  0a83  03d8             add bx, ax                               
  0a85  36830708         add word ptr ss:[bx], 8                  
  0a89  33ff             xor di, di                               
  0a8b  eb47             jmp 0xad4                                
  0a8d  8bde             mov bx, si                               
  0a8f  c1e302           shl bx, 2                                
  0a92  8d46e6           lea ax, [bp - 0x1a]                      
  0a95  03d8             add bx, ax                               
  0a97  6636ff37         push dword ptr ss:[bx]                   
  0a9b  8bde             mov bx, si                               
  0a9d  6bdb0a           imul bx, bx, 0xa                         
  0aa0  03df             add bx, di                               
  0aa2  8d46be           lea ax, [bp - 0x42]                      
  0aa5  03d8             add bx, ax                               
  0aa7  368a07           mov al, byte ptr ss:[bx]                 
  0aaa  98               cwde                                     
  0aab  c1e003           shl ax, 3                                
  0aae  8cda             mov dx, ds                               
  0ab0  05d62c           add ax, 0x2cd6                           
  0ab3  b90800           mov cx, 8                                
  0ab6  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0abb  6a08             push 8                                   
  0abd  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0ac2  83c40e           add sp, 0xe                              
  0ac5  8bde             mov bx, si                               
  0ac7  c1e302           shl bx, 2                                
  0aca  8d46e6           lea ax, [bp - 0x1a]                      
  0acd  03d8             add bx, ax                               
  0acf  36830708         add word ptr ss:[bx], 8                  
  0ad3  47               inc di                                   
  0ad4  16               push ss                                  
  0ad5  8bc6             mov ax, si                               
  0ad7  6bc00a           imul ax, ax, 0xa                         
  0ada  8d56be           lea dx, [bp - 0x42]                      
  0add  03c2             add ax, dx                               
  0adf  50               push ax                                  
  0ae0  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0ae5  83c404           add sp, 4                                
  0ae8  3bc7             cmp ax, di                               
  0aea  7fa1             jg 0xa8d                                 
  0aec  46               inc si                                   
  0aed  83fe04           cmp si, 4                                
  0af0  7d03             jge 0xaf5                                
  0af2  e999fe           jmp 0x98e                                
  0af5  837e1a00         cmp word ptr [bp + 0x1a], 0              
  0af9  743e             je 0xb39                                 
  0afb  6a08             push 8                                   
  0afd  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0b02  59               pop cx                                   
  0b03  8b761a           mov si, word ptr [bp + 0x1a]             
  0b06  4e               dec si                                   
  0b07  c1e605           shl si, 5                                
  0b0a  33ff             xor di, di                               
  0b0c  837e1c01         cmp word ptr [bp + 0x1c], 1              
  0b10  7505             jne 0xb17                                
  0b12  b81400           mov ax, 0x14                             
  0b15  eb02             jmp 0xb19                                
  0b17  33c0             xor ax, ax                               
  0b19  8b5610           mov dx, word ptr [bp + 0x10]             
  0b1c  03d0             add dx, ax                               
  0b1e  52               push dx                                  
  0b1f  ff760e           push word ptr [bp + 0xe]                 
  0b22  66ff760a         push dword ptr [bp + 0xa]                
  0b26  666820001e00     push 0x1e0020                            
  0b2c  57               push di                                  
  0b2d  56               push si                                  
  0b2e  1e               push ds                                  
  0b2f  68e257           push 0x57e2                              
  0b32  ff1ed469         lcall [0x69d4]                           
  0b36  83c414           add sp, 0x14                             
  0b39  837e0600         cmp word ptr [bp + 6], 0                 
  0b3d  7d03             jge 0xb42                                
  0b3f  e9b100           jmp 0xbf3                                
  0b42  837e1e00         cmp word ptr [bp + 0x1e], 0              
  0b46  7405             je 0xb4d                                 
  0b48  b82a00           mov ax, 0x2a                             
  0b4b  eb06             jmp 0xb53                                
  0b4d  8b4608           mov ax, word ptr [bp + 8]                
  0b50  051000           add ax, 0x10                             
  0b53  8946fe           mov word ptr [bp - 2], ax                
  0b56  837e1e00         cmp word ptr [bp + 0x1e], 0              
  0b5a  7407             je 0xb63                                 
  0b5c  8cda             mov dx, ds                               
  0b5e  b85a52           mov ax, 0x525a                           
  0b61  eb0b             jmp 0xb6e                                
  0b63  8b4608           mov ax, word ptr [bp + 8]                
  0b66  6bc03b           imul ax, ax, 0x3b                        
  0b69  8cda             mov dx, ds                               
  0b6b  05204f           add ax, 0x4f20                           
  0b6e  8956fc           mov word ptr [bp - 4], dx                
  0b71  8946fa           mov word ptr [bp - 6], ax                
  0b74  837e1e00         cmp word ptr [bp + 0x1e], 0              
  0b78  7407             je 0xb81                                 
  0b7a  8cda             mov dx, ds                               
  0b7c  b81f52           mov ax, 0x521f                           
  0b7f  eb05             jmp 0xb86                                
  0b81  8cda             mov dx, ds                               
  0b83  b8e54e           mov ax, 0x4ee5                           
  0b86  8956f8           mov word ptr [bp - 8], dx                
  0b89  8946f6           mov word ptr [bp - 0xa], ax              
  0b8c  ff76fe           push word ptr [bp - 2]                   
  0b8f  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0b94  59               pop cx                                   
  0b95  8b4606           mov ax, word ptr [bp + 6]                
  0b98  bb1000           mov bx, 0x10                             
  0b9b  99               cdq                                      
  0b9c  f7fb             idiv bx                                  
  0b9e  c1e205           shl dx, 5                                
  0ba1  8bf2             mov si, dx                               
  0ba3  8b4606           mov ax, word ptr [bp + 6]                
  0ba6  99               cdq                                      
  0ba7  f7fb             idiv bx                                  
  0ba9  6bc01e           imul ax, ax, 0x1e                        
  0bac  8bf8             mov di, ax                               
  0bae  ff76fe           push word ptr [bp - 2]                   
  0bb1  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  0bb6  59               pop cx                                   
  0bb7  57               push di                                  
  0bb8  56               push si                                  
  0bb9  66ff76f6         push dword ptr [bp - 0xa]                
  0bbd  837e1c01         cmp word ptr [bp + 0x1c], 1              
  0bc1  7505             jne 0xbc8                                
  0bc3  b81400           mov ax, 0x14                             
  0bc6  eb02             jmp 0xbca                                
  0bc8  33c0             xor ax, ax                               
  0bca  8b5610           mov dx, word ptr [bp + 0x10]             
  0bcd  03d0             add dx, ax                               
  0bcf  52               push dx                                  
  0bd0  ff760e           push word ptr [bp + 0xe]                 
  0bd3  66ff760a         push dword ptr [bp + 0xa]                
  0bd7  666820001d00     push 0x1d0020                            
  0bdd  57               push di                                  
  0bde  56               push si                                  
  0bdf  66ff76fa         push dword ptr [bp - 6]                  
  0be3  ff1ec869         lcall [0x69c8]                           
  0be7  83c41c           add sp, 0x1c                             
  0bea  ff76fe           push word ptr [bp - 2]                   
  0bed  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  0bf2  59               pop cx                                   
  0bf3  5f               pop di                                   
  0bf4  5e               pop si                                   
  0bf5  c9               leave                                    
  0bf6  cb               retf                                     

ovl64_0bf7:  ; ENTRY
  0bf7  55               push bp                                  
  0bf8  8bec             mov bp, sp                               
  0bfa  56               push si                                  
  0bfb  57               push di                                  
  0bfc  8b7606           mov si, word ptr [bp + 6]                
  0bff  8b7e08           mov di, word ptr [bp + 8]                
  0c02  83fe0f           cmp si, 0xf                              
  0c05  7503             jne 0xc0a                                
  0c07  be0800           mov si, 8                                
  0c0a  6a05             push 5                                   
  0c0c  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0c11  59               pop cx                                   
  0c12  6a26             push 0x26                                
  0c14  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0c19  59               pop cx                                   
  0c1a  0bff             or di, di                                
  0c1c  7526             jne 0xc44                                
  0c1e  ff7610           push word ptr [bp + 0x10]                
  0c21  ff760e           push word ptr [bp + 0xe]                 
  0c24  66ff760a         push dword ptr [bp + 0xa]                
  0c28  666828002800     push 0x280028                            
  0c2e  6a00             push 0                                   
  0c30  8bc6             mov ax, si                               
  0c32  6bc028           imul ax, ax, 0x28                        
  0c35  50               push ax                                  
  0c36  1e               push ds                                  
  0c37  68cf55           push 0x55cf                              
  0c3a  ff1ed469         lcall [0x69d4]                           
  0c3e  83c414           add sp, 0x14                             
  0c41  e98700           jmp 0xccb                                
  0c44  83ff01           cmp di, 1                                
  0c47  7514             jne 0xc5d                                
  0c49  ff7610           push word ptr [bp + 0x10]                
  0c4c  ff760e           push word ptr [bp + 0xe]                 
  0c4f  66ff760a         push dword ptr [bp + 0xa]                
  0c53  666828002800     push 0x280028                            
  0c59  6a41             push 0x41                                
  0c5b  ebd3             jmp 0xc30                                
  0c5d  83ff02           cmp di, 2                                
  0c60  7514             jne 0xc76                                
  0c62  ff7610           push word ptr [bp + 0x10]                
  0c65  ff760e           push word ptr [bp + 0xe]                 
  0c68  66ff760a         push dword ptr [bp + 0xa]                
  0c6c  666828001900     push 0x190028                            
  0c72  6a28             push 0x28                                
  0c74  ebba             jmp 0xc30                                
  0c76  83ff03           cmp di, 3                                
  0c79  751c             jne 0xc97                                
  0c7b  ff7610           push word ptr [bp + 0x10]                
  0c7e  ff760e           push word ptr [bp + 0xe]                 
  0c81  66ff760a         push dword ptr [bp + 0xa]                
  0c85  666810001000     push 0x100010                            
  0c8b  6a2e             push 0x2e                                
  0c8d  8bc6             mov ax, si                               
  0c8f  6bc028           imul ax, ax, 0x28                        
  0c92  051800           add ax, 0x18                             
  0c95  eb9e             jmp 0xc35                                
  0c97  83ff04           cmp di, 4                                
  0c9a  752f             jne 0xccb                                
  0c9c  6a24             push 0x24                                
  0c9e  8bc6             mov ax, si                               
  0ca0  c1e005           shl ax, 5                                
  0ca3  50               push ax                                  
  0ca4  1e               push ds                                  
  0ca5  688153           push 0x5381                              
  0ca8  ff7610           push word ptr [bp + 0x10]                
  0cab  ff760e           push word ptr [bp + 0xe]                 
  0cae  66ff760a         push dword ptr [bp + 0xa]                
  0cb2  666820001700     push 0x170020                            
  0cb8  6a24             push 0x24                                
  0cba  8bc6             mov ax, si                               
  0cbc  c1e005           shl ax, 5                                
  0cbf  50               push ax                                  
  0cc0  1e               push ds                                  
  0cc1  68bc53           push 0x53bc                              
  0cc4  ff1ec869         lcall [0x69c8]                           
  0cc8  83c41c           add sp, 0x1c                             
  0ccb  5f               pop di                                   
  0ccc  5e               pop si                                   
  0ccd  5d               pop bp                                   
  0cce  cb               retf                                     

ovl64_0ccf:  ; ENTRY
  0ccf  55               push bp                                  
  0cd0  8bec             mov bp, sp                               
  0cd2  83ec04           sub sp, 4                                
  0cd5  66689a020000     push 0x29a                               
  0cdb  6a00             push 0                                   
  0cdd  666840440000     push 0x4440                              
  0ce3  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0ce8  83c40a           add sp, 0xa                              
  0ceb  89167212         mov word ptr [0x1272], dx                
  0cef  a37012           mov word ptr [0x1270], ax                
  0cf2  52               push dx                                  
  0cf3  50               push ax                                  
  0cf4  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0cf9  83c404           add sp, 4                                
  0cfc  89166e12         mov word ptr [0x126e], dx                
  0d00  a36c12           mov word ptr [0x126c], ax                
  0d03  66a16c12         mov eax, dword ptr [0x126c]              
  0d07  668946fc         mov dword ptr [bp - 4], eax              
  0d0b  33d2             xor dx, dx                               
  0d0d  eb15             jmp 0xd24                                
  0d0f  33c0             xor ax, ax                               
  0d11  eb0b             jmp 0xd1e                                
  0d13  c45efc           les bx, ptr [bp - 4]                     
  0d16  26c60700         mov byte ptr es:[bx], 0                  
  0d1a  ff46fc           inc word ptr [bp - 4]                    
  0d1d  40               inc ax                                   
  0d1e  3d7000           cmp ax, 0x70                             
  0d21  7cf0             jl 0xd13                                 
  0d23  42               inc dx                                   
  0d24  81fa9c00         cmp dx, 0x9c                             
  0d28  7ce5             jl 0xd0f                                 
  0d2a  66ff367012       push dword ptr [0x1270]                  
  0d2f  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0d34  83c404           add sp, 4                                
  0d37  c9               leave                                    
  0d38  cb               retf                                     

ovl64_0d39:  ; ENTRY
  0d39  55               push bp                                  
  0d3a  8bec             mov bp, sp                               
  0d3c  83ec06           sub sp, 6                                
  0d3f  56               push si                                  
  0d40  66ff367012       push dword ptr [0x1270]                  
  0d45  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0d4a  83c404           add sp, 4                                
  0d4d  89166e12         mov word ptr [0x126e], dx                
  0d51  a36c12           mov word ptr [0x126c], ax                
  0d54  66a16c12         mov eax, dword ptr [0x126c]              
  0d58  668946fa         mov dword ptr [bp - 6], eax              
  0d5c  b8042c           mov ax, 0x2c04                           
  0d5f  8ec0             mov es, ax                               
  0d61  268a0e1001       mov cl, byte ptr es:[0x110]              
  0d66  b80100           mov ax, 1                                
  0d69  d3e0             shl ax, cl                               
  0d6b  8946fe           mov word ptr [bp - 2], ax                
  0d6e  33f6             xor si, si                               
  0d70  eb3f             jmp 0xdb1                                
  0d72  33c9             xor cx, cx                               
  0d74  eb35             jmp 0xdab                                
  0d76  c45efa           les bx, ptr [bp - 6]                     
  0d79  ff46fa           inc word ptr [bp - 6]                    
  0d7c  268a07           mov al, byte ptr es:[bx]                 
  0d7f  b400             mov ah, 0                                
  0d81  8546fe           test word ptr [bp - 2], ax               
  0d84  7405             je 0xd8b                                 
  0d86  b80100           mov ax, 1                                
  0d89  eb02             jmp 0xd8d                                
  0d8b  33c0             xor ax, ax                               
  0d8d  250100           and ax, 1                                
  0d90  8bde             mov bx, si                               
  0d92  6bdb70           imul bx, bx, 0x70                        
  0d95  03d9             add bx, cx                               
  0d97  bad919           mov dx, 0x19d9                           
  0d9a  8ec2             mov es, dx                               
  0d9c  2680a70000df     and byte ptr es:[bx], 0xdf               
  0da2  c0e005           shl al, 5                                
  0da5  2608870000       or byte ptr es:[bx], al                  
  0daa  41               inc cx                                   
  0dab  83f970           cmp cx, 0x70                             
  0dae  7cc6             jl 0xd76                                 
  0db0  46               inc si                                   
  0db1  81fe9c00         cmp si, 0x9c                             
  0db5  7cbb             jl 0xd72                                 
  0db7  66ff367012       push dword ptr [0x1270]                  
  0dbc  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0dc1  83c404           add sp, 4                                
  0dc4  5e               pop si                                   
  0dc5  c9               leave                                    
  0dc6  cb               retf                                     

ovl64_0dc7:  ; ENTRY
  0dc7  55               push bp                                  
  0dc8  8bec             mov bp, sp                               
  0dca  83ec06           sub sp, 6                                
  0dcd  56               push si                                  
  0dce  90               nop                                      
  0dcf  0e               push cs                                  
  0dd0  e89500           call 0xe68                               
  0dd3  66ff367012       push dword ptr [0x1270]                  
  0dd8  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0ddd  83c404           add sp, 4                                
  0de0  89166e12         mov word ptr [0x126e], dx                
  0de4  a36c12           mov word ptr [0x126c], ax                
  0de7  66a16c12         mov eax, dword ptr [0x126c]              
  0deb  668946fa         mov dword ptr [bp - 6], eax              
  0def  b80100           mov ax, 1                                
  0df2  8a4e06           mov cl, byte ptr [bp + 6]                
  0df5  d3e0             shl ax, cl                               
  0df7  8946fe           mov word ptr [bp - 2], ax                
  0dfa  33f6             xor si, si                               
  0dfc  eb3f             jmp 0xe3d                                
  0dfe  33c9             xor cx, cx                               
  0e00  eb35             jmp 0xe37                                
  0e02  c45efa           les bx, ptr [bp - 6]                     
  0e05  ff46fa           inc word ptr [bp - 6]                    
  0e08  268a07           mov al, byte ptr es:[bx]                 
  0e0b  b400             mov ah, 0                                
  0e0d  8546fe           test word ptr [bp - 2], ax               
  0e10  7405             je 0xe17                                 
  0e12  b80100           mov ax, 1                                
  0e15  eb02             jmp 0xe19                                
  0e17  33c0             xor ax, ax                               
  0e19  250100           and ax, 1                                
  0e1c  8bde             mov bx, si                               
  0e1e  6bdb70           imul bx, bx, 0x70                        
  0e21  03d9             add bx, cx                               
  0e23  bad919           mov dx, 0x19d9                           
  0e26  8ec2             mov es, dx                               
  0e28  2680a70000df     and byte ptr es:[bx], 0xdf               
  0e2e  c0e005           shl al, 5                                
  0e31  2608870000       or byte ptr es:[bx], al                  
  0e36  41               inc cx                                   
  0e37  83f970           cmp cx, 0x70                             
  0e3a  7cc6             jl 0xe02                                 
  0e3c  46               inc si                                   
  0e3d  81fe9c00         cmp si, 0x9c                             
  0e41  7cbb             jl 0xdfe                                 
  0e43  66ff367012       push dword ptr [0x1270]                  
  0e48  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0e4d  83c404           add sp, 4                                
  0e50  c706282d0100     mov word ptr [0x2d28], 1                 
  0e56  5e               pop si                                   
  0e57  c9               leave                                    
  0e58  cb               retf                                     

ovl64_0e59:  ; ENTRY
  0e59  55               push bp                                  
  0e5a  8bec             mov bp, sp                               
  0e5c  0e               push cs                                  
  0e5d  e8d9fe           call 0xd39                               
  0e60  c706282d0000     mov word ptr [0x2d28], 0                 
  0e66  5d               pop bp                                   
  0e67  cb               retf                                     

ovl64_0e68:  ; ENTRY
  0e68  55               push bp                                  
  0e69  8bec             mov bp, sp                               
  0e6b  83ec06           sub sp, 6                                
  0e6e  56               push si                                  
  0e6f  57               push di                                  
  0e70  33c9             xor cx, cx                               
  0e72  33d2             xor dx, dx                               
  0e74  eb24             jmp 0xe9a                                
  0e76  8bda             mov bx, dx                               
  0e78  d1e3             shl bx, 1                                
  0e7a  b8042c           mov ax, 0x2c04                           
  0e7d  8ec0             mov es, ax                               
  0e7f  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0e85  7412             je 0xe99                                 
  0e87  8bda             mov bx, dx                               
  0e89  d1e3             shl bx, 1                                
  0e8b  b8042c           mov ax, 0x2c04                           
  0e8e  8ec0             mov es, ax                               
  0e90  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0e96  7501             jne 0xe99                                
  0e98  41               inc cx                                   
  0e99  42               inc dx                                   
  0e9a  83fa08           cmp dx, 8                                
  0e9d  7cd7             jl 0xe76                                 
  0e9f  83f901           cmp cx, 1                                
  0ea2  751e             jne 0xec2                                
  0ea4  b8042c           mov ax, 0x2c04                           
  0ea7  8ec0             mov es, ax                               
  0ea9  268b1e1001       mov bx, word ptr es:[0x110]              
  0eae  d1e3             shl bx, 1                                
  0eb0  b8042c           mov ax, 0x2c04                           
  0eb3  8ec0             mov es, ax                               
  0eb5  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0ebb  7505             jne 0xec2                                
  0ebd  b80100           mov ax, 1                                
  0ec0  eb02             jmp 0xec4                                
  0ec2  33c0             xor ax, ax                               
  0ec4  8946fa           mov word ptr [bp - 6], ax                
  0ec7  66ff367012       push dword ptr [0x1270]                  
  0ecc  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0ed1  83c404           add sp, 4                                
  0ed4  89166e12         mov word ptr [0x126e], dx                
  0ed8  a36c12           mov word ptr [0x126c], ax                
  0edb  66a16c12         mov eax, dword ptr [0x126c]              
  0edf  668946fc         mov dword ptr [bp - 4], eax              
  0ee3  33ff             xor di, di                               
  0ee5  eb71             jmp 0xf58                                
  0ee7  33f6             xor si, si                               
  0ee9  eb67             jmp 0xf52                                
  0eeb  837efa00         cmp word ptr [bp - 6], 0                 
  0eef  7434             je 0xf25                                 
  0ef1  8bdf             mov bx, di                               
  0ef3  6bdb70           imul bx, bx, 0x70                        
  0ef6  03de             add bx, si                               
  0ef8  b8d919           mov ax, 0x19d9                           
  0efb  8ec0             mov es, ax                               
  0efd  268a870000       mov al, byte ptr es:[bx]                 
  0f02  c1e805           shr ax, 5                                
  0f05  250100           and ax, 1                                
  0f08  250100           and ax, 1                                
  0f0b  8bdf             mov bx, di                               
  0f0d  6bdb70           imul bx, bx, 0x70                        
  0f10  03de             add bx, si                               
  0f12  bad919           mov dx, 0x19d9                           
  0f15  8ec2             mov es, dx                               
  0f17  2680a700007f     and byte ptr es:[bx], 0x7f               
  0f1d  c0e007           shl al, 7                                
  0f20  2608870000       or byte ptr es:[bx], al                  
  0f25  8bdf             mov bx, di                               
  0f27  6bdb70           imul bx, bx, 0x70                        
  0f2a  03de             add bx, si                               
  0f2c  b8d919           mov ax, 0x19d9                           
  0f2f  8ec0             mov es, ax                               
  0f31  268a870000       mov al, byte ptr es:[bx]                 
  0f36  c1e805           shr ax, 5                                
  0f39  250100           and ax, 1                                
  0f3c  ba042c           mov dx, 0x2c04                           
  0f3f  8ec2             mov es, dx                               
  0f41  268a0e1001       mov cl, byte ptr es:[0x110]              
  0f46  d2e0             shl al, cl                               
  0f48  c45efc           les bx, ptr [bp - 4]                     
  0f4b  260807           or byte ptr es:[bx], al                  
  0f4e  ff46fc           inc word ptr [bp - 4]                    
  0f51  46               inc si                                   
  0f52  83fe70           cmp si, 0x70                             
  0f55  7c94             jl 0xeeb                                 
  0f57  47               inc di                                   
  0f58  81ff9c00         cmp di, 0x9c                             
  0f5c  7c89             jl 0xee7                                 
  0f5e  66ff367012       push dword ptr [0x1270]                  
  0f63  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0f68  83c404           add sp, 4                                
  0f6b  5f               pop di                                   
  0f6c  5e               pop si                                   
  0f6d  c9               leave                                    
  0f6e  cb               retf                                     

ovl64_0f6f:  ; ENTRY
  0f6f  55               push bp                                  
  0f70  8bec             mov bp, sp                               
  0f72  56               push si                                  
  0f73  57               push di                                  
  0f74  33f6             xor si, si                               
  0f76  833e543200       cmp word ptr [0x3254], 0                 
  0f7b  746a             je 0xfe7                                 
  0f7d  33d2             xor dx, dx                               
  0f7f  eb5f             jmp 0xfe0                                
  0f81  8bda             mov bx, dx                               
  0f83  d1e3             shl bx, 1                                
  0f85  8b4e06           mov cx, word ptr [bp + 6]                
  0f88  038fda2e         add cx, word ptr [bx + 0x2eda]           
  0f8c  8bda             mov bx, dx                               
  0f8e  d1e3             shl bx, 1                                
  0f90  8b4608           mov ax, word ptr [bp + 8]                
  0f93  0387ea2e         add ax, word ptr [bx + 0x2eea]           
  0f97  8bf8             mov di, ax                               
  0f99  0bc9             or cx, cx                                
  0f9b  7c0f             jl 0xfac                                 
  0f9d  0bff             or di, di                                
  0f9f  7c0b             jl 0xfac                                 
  0fa1  83f970           cmp cx, 0x70                             
  0fa4  7d06             jge 0xfac                                
  0fa6  81ff9c00         cmp di, 0x9c                             
  0faa  7c0b             jl 0xfb7                                 
  0fac  b80100           mov ax, 1                                
  0faf  8aca             mov cl, dl                               
  0fb1  d3e0             shl ax, cl                               
  0fb3  0bf0             or si, ax                                
  0fb5  eb28             jmp 0xfdf                                
  0fb7  8bdf             mov bx, di                               
  0fb9  6bdb70           imul bx, bx, 0x70                        
  0fbc  03d9             add bx, cx                               
  0fbe  b8d919           mov ax, 0x19d9                           
  0fc1  8ec0             mov es, ax                               
  0fc3  268a870000       mov al, byte ptr es:[bx]                 
  0fc8  c1e807           shr ax, 7                                
  0fcb  250100           and ax, 1                                
  0fce  0bc0             or ax, ax                                
  0fd0  7404             je 0xfd6                                 
  0fd2  33c0             xor ax, ax                               
  0fd4  eb07             jmp 0xfdd                                
  0fd6  b80100           mov ax, 1                                
  0fd9  8aca             mov cl, dl                               
  0fdb  d3e0             shl ax, cl                               
  0fdd  0bf0             or si, ax                                
  0fdf  42               inc dx                                   
  0fe0  83fa08           cmp dx, 8                                
  0fe3  7c9c             jl 0xf81                                 
  0fe5  eb68             jmp 0x104f                               
  0fe7  33d2             xor dx, dx                               
  0fe9  eb5f             jmp 0x104a                               
  0feb  8bda             mov bx, dx                               
  0fed  d1e3             shl bx, 1                                
  0fef  8b4e06           mov cx, word ptr [bp + 6]                
  0ff2  038fda2e         add cx, word ptr [bx + 0x2eda]           
  0ff6  8bda             mov bx, dx                               
  0ff8  d1e3             shl bx, 1                                
  0ffa  8b4608           mov ax, word ptr [bp + 8]                
  0ffd  0387ea2e         add ax, word ptr [bx + 0x2eea]           
  1001  8bf8             mov di, ax                               
  1003  0bc9             or cx, cx                                
  1005  7c0f             jl 0x1016                                
  1007  0bff             or di, di                                
  1009  7c0b             jl 0x1016                                
  100b  83f970           cmp cx, 0x70                             
  100e  7d06             jge 0x1016                               
  1010  81ff9c00         cmp di, 0x9c                             
  1014  7c0b             jl 0x1021                                
  1016  b80100           mov ax, 1                                
  1019  8aca             mov cl, dl                               
  101b  d3e0             shl ax, cl                               
  101d  0bf0             or si, ax                                
  101f  eb28             jmp 0x1049                               
  1021  8bdf             mov bx, di                               
  1023  6bdb70           imul bx, bx, 0x70                        
  1026  03d9             add bx, cx                               
  1028  b8d919           mov ax, 0x19d9                           
  102b  8ec0             mov es, ax                               
  102d  268a870000       mov al, byte ptr es:[bx]                 
  1032  c1e805           shr ax, 5                                
  1035  250100           and ax, 1                                
  1038  0bc0             or ax, ax                                
  103a  7404             je 0x1040                                
  103c  33c0             xor ax, ax                               
  103e  eb07             jmp 0x1047                               
  1040  b80100           mov ax, 1                                
  1043  8aca             mov cl, dl                               
  1045  d3e0             shl ax, cl                               
  1047  0bf0             or si, ax                                
  1049  42               inc dx                                   
  104a  83fa08           cmp dx, 8                                
  104d  7c9c             jl 0xfeb                                 
  104f  8bc6             mov ax, si                               
  1051  5f               pop di                                   
  1052  5e               pop si                                   
  1053  5d               pop bp                                   
  1054  cb               retf                                     

ovl64_1055:  ; ENTRY
  1055  55               push bp                                  
  1056  8bec             mov bp, sp                               
  1058  56               push si                                  
  1059  57               push di                                  
  105a  33f6             xor si, si                               
  105c  833e543200       cmp word ptr [0x3254], 0                 
  1061  746a             je 0x10cd                                
  1063  33d2             xor dx, dx                               
  1065  eb5f             jmp 0x10c6                               
  1067  8bda             mov bx, dx                               
  1069  d1e3             shl bx, 1                                
  106b  8b4e06           mov cx, word ptr [bp + 6]                
  106e  038ffa2e         add cx, word ptr [bx + 0x2efa]           
  1072  8bda             mov bx, dx                               
  1074  d1e3             shl bx, 1                                
  1076  8b4608           mov ax, word ptr [bp + 8]                
  1079  03870a2f         add ax, word ptr [bx + 0x2f0a]           
  107d  8bf8             mov di, ax                               
  107f  0bc9             or cx, cx                                
  1081  7c0f             jl 0x1092                                
  1083  0bff             or di, di                                
  1085  7c0b             jl 0x1092                                
  1087  83f970           cmp cx, 0x70                             
  108a  7d06             jge 0x1092                               
  108c  81ff9c00         cmp di, 0x9c                             
  1090  7c0b             jl 0x109d                                
  1092  8b460a           mov ax, word ptr [bp + 0xa]              
  1095  8aca             mov cl, dl                               
  1097  d3e0             shl ax, cl                               
  1099  0bf0             or si, ax                                
  109b  eb28             jmp 0x10c5                               
  109d  8bdf             mov bx, di                               
  109f  6bdb70           imul bx, bx, 0x70                        
  10a2  03d9             add bx, cx                               
  10a4  b8d919           mov ax, 0x19d9                           
  10a7  8ec0             mov es, ax                               
  10a9  268a870000       mov al, byte ptr es:[bx]                 
  10ae  c1e807           shr ax, 7                                
  10b1  250100           and ax, 1                                
  10b4  0bc0             or ax, ax                                
  10b6  7404             je 0x10bc                                
  10b8  33c0             xor ax, ax                               
  10ba  eb07             jmp 0x10c3                               
  10bc  b80100           mov ax, 1                                
  10bf  8aca             mov cl, dl                               
  10c1  d3e0             shl ax, cl                               
  10c3  0bf0             or si, ax                                
  10c5  42               inc dx                                   
  10c6  83fa08           cmp dx, 8                                
  10c9  7c9c             jl 0x1067                                
  10cb  eb68             jmp 0x1135                               
  10cd  33d2             xor dx, dx                               
  10cf  eb5f             jmp 0x1130                               
  10d1  8bda             mov bx, dx                               
  10d3  d1e3             shl bx, 1                                
  10d5  8b4e06           mov cx, word ptr [bp + 6]                
  10d8  038ffa2e         add cx, word ptr [bx + 0x2efa]           
  10dc  8bda             mov bx, dx                               
  10de  d1e3             shl bx, 1                                
  10e0  8b4608           mov ax, word ptr [bp + 8]                
  10e3  03870a2f         add ax, word ptr [bx + 0x2f0a]           
  10e7  8bf8             mov di, ax                               
  10e9  0bc9             or cx, cx                                
  10eb  7c0f             jl 0x10fc                                
  10ed  0bff             or di, di                                
  10ef  7c0b             jl 0x10fc                                
  10f1  83f970           cmp cx, 0x70                             
  10f4  7d06             jge 0x10fc                               
  10f6  81ff9c00         cmp di, 0x9c                             
  10fa  7c0b             jl 0x1107                                
  10fc  8b460a           mov ax, word ptr [bp + 0xa]              
  10ff  8aca             mov cl, dl                               
  1101  d3e0             shl ax, cl                               
  1103  0bf0             or si, ax                                
  1105  eb28             jmp 0x112f                               
  1107  8bdf             mov bx, di                               
  1109  6bdb70           imul bx, bx, 0x70                        
  110c  03d9             add bx, cx                               
  110e  b8d919           mov ax, 0x19d9                           
  1111  8ec0             mov es, ax                               
  1113  268a870000       mov al, byte ptr es:[bx]                 
  1118  c1e805           shr ax, 5                                
  111b  250100           and ax, 1                                
  111e  0bc0             or ax, ax                                
  1120  7404             je 0x1126                                
  1122  33c0             xor ax, ax                               
  1124  eb07             jmp 0x112d                               
  1126  b80100           mov ax, 1                                
  1129  8aca             mov cl, dl                               
  112b  d3e0             shl ax, cl                               
  112d  0bf0             or si, ax                                
  112f  42               inc dx                                   
  1130  83fa08           cmp dx, 8                                
  1133  7c9c             jl 0x10d1                                
  1135  8bc6             mov ax, si                               
  1137  5f               pop di                                   
  1138  5e               pop si                                   
  1139  5d               pop bp                                   
  113a  cb               retf                                     

ovl64_113b:  ; ENTRY
  113b  55               push bp                                  
  113c  8bec             mov bp, sp                               
  113e  83ec0c           sub sp, 0xc                              
  1141  56               push si                                  
  1142  57               push di                                  
  1143  66ff367012       push dword ptr [0x1270]                  
  1148  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  114d  83c404           add sp, 4                                
  1150  89166e12         mov word ptr [0x126e], dx                
  1154  a36c12           mov word ptr [0x126c], ax                
  1157  66a16c12         mov eax, dword ptr [0x126c]              
  115b  668946f4         mov dword ptr [bp - 0xc], eax            
  115f  b8042c           mov ax, 0x2c04                           
  1162  8ec0             mov es, ax                               
  1164  26833e240100     cmp word ptr es:[0x124], 0               
  116a  7404             je 0x1170                                
  116c  b200             mov dl, 0                                
  116e  eb02             jmp 0x1172                               
  1170  b2ff             mov dl, 0xff                             
  1172  33ff             xor di, di                               
  1174  eb35             jmp 0x11ab                               
  1176  33f6             xor si, si                               
  1178  eb2b             jmp 0x11a5                               
  117a  c45ef4           les bx, ptr [bp - 0xc]                   
  117d  268817           mov byte ptr es:[bx], dl                 
  1180  ff46f4           inc word ptr [bp - 0xc]                  
  1183  8bdf             mov bx, di                               
  1185  6bdb70           imul bx, bx, 0x70                        
  1188  03de             add bx, si                               
  118a  b8d919           mov ax, 0x19d9                           
  118d  8ec0             mov es, ax                               
  118f  26808f000020     or byte ptr es:[bx], 0x20                
  1195  8bdf             mov bx, di                               
  1197  6bdb70           imul bx, bx, 0x70                        
  119a  03de             add bx, si                               
  119c  8ec0             mov es, ax                               
  119e  2680a700007f     and byte ptr es:[bx], 0x7f               
  11a4  46               inc si                                   
  11a5  83fe70           cmp si, 0x70                             
  11a8  7cd0             jl 0x117a                                
  11aa  47               inc di                                   
  11ab  81ff9c00         cmp di, 0x9c                             
  11af  7cc5             jl 0x1176                                
  11b1  33f6             xor si, si                               
  11b3  eb17             jmp 0x11cc                               
  11b5  33ff             xor di, di                               
  11b7  eb0d             jmp 0x11c6                               
  11b9  8bde             mov bx, si                               
  11bb  6bdb09           imul bx, bx, 9                           
  11be  03df             add bx, di                               
  11c0  c687d45eff       mov byte ptr [bx + 0x5ed4], 0xff         
  11c5  47               inc di                                   
  11c6  83ff09           cmp di, 9                                
  11c9  7cee             jl 0x11b9                                
  11cb  46               inc si                                   
  11cc  83fe09           cmp si, 9                                
  11cf  7ce4             jl 0x11b5                                
  11d1  c746fe0000       mov word ptr [bp - 2], 0                 
  11d6  e9a500           jmp 0x127e                               
  11d9  c746f80000       mov word ptr [bp - 8], 0                 
  11de  e98900           jmp 0x126a                               
  11e1  8b5ef8           mov bx, word ptr [bp - 8]                
  11e4  6bdb41           imul bx, bx, 0x41                        
  11e7  b8042c           mov ax, 0x2c04                           
  11ea  8ec0             mov es, ax                               
  11ec  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  11f1  98               cwde                                     
  11f2  3b46fe           cmp ax, word ptr [bp - 2]                
  11f5  7570             jne 0x1267                               
  11f7  8b5ef8           mov bx, word ptr [bp - 8]                
  11fa  6bdb41           imul bx, bx, 0x41                        
  11fd  b8042c           mov ax, 0x2c04                           
  1200  8ec0             mov es, ax                               
  1202  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  1207  8946fc           mov word ptr [bp - 4], ax                
  120a  8b5ef8           mov bx, word ptr [bp - 8]                
  120d  6bdb41           imul bx, bx, 0x41                        
  1210  b8042c           mov ax, 0x2c04                           
  1213  8ec0             mov es, ax                               
  1215  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  121a  8946fa           mov word ptr [bp - 6], ax                
  121d  8b76fc           mov si, word ptr [bp - 4]                
  1220  83c6fe           add si, -2                               
  1223  eb38             jmp 0x125d                               
  1225  8b7efa           mov di, word ptr [bp - 6]                
  1228  83c7fe           add di, -2                               
  122b  eb25             jmp 0x1252                               
  122d  8bc7             mov ax, di                               
  122f  6bc070           imul ax, ax, 0x70                        
  1232  8b166e12         mov dx, word ptr [0x126e]                
  1236  8b1e6c12         mov bx, word ptr [0x126c]                
  123a  03d8             add bx, ax                               
  123c  03de             add bx, si                               
  123e  8956f6           mov word ptr [bp - 0xa], dx              
  1241  895ef4           mov word ptr [bp - 0xc], bx              
  1244  b001             mov al, 1                                
  1246  8a4efe           mov cl, byte ptr [bp - 2]                
  1249  d2e0             shl al, cl                               
  124b  8e46f6           mov es, word ptr [bp - 0xa]              
  124e  260807           or byte ptr es:[bx], al                  
  1251  47               inc di                                   
  1252  8b46fa           mov ax, word ptr [bp - 6]                
  1255  050300           add ax, 3                                
  1258  3bc7             cmp ax, di                               
  125a  7dd1             jge 0x122d                               
  125c  46               inc si                                   
  125d  8b46fc           mov ax, word ptr [bp - 4]                
  1260  050300           add ax, 3                                
  1263  3bc6             cmp ax, si                               
  1265  7dbe             jge 0x1225                               
  1267  ff46f8           inc word ptr [bp - 8]                    
  126a  b8042c           mov ax, 0x2c04                           
  126d  8ec0             mov es, ax                               
  126f  26a17b15         mov ax, word ptr es:[0x157b]             
  1273  3b46f8           cmp ax, word ptr [bp - 8]                
  1276  7e03             jle 0x127b                               
  1278  e966ff           jmp 0x11e1                               
  127b  ff46fe           inc word ptr [bp - 2]                    
  127e  837efe08         cmp word ptr [bp - 2], 8                 
  1282  7d03             jge 0x1287                               
  1284  e952ff           jmp 0x11d9                               
  1287  66ff367012       push dword ptr [0x1270]                  
  128c  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1291  83c404           add sp, 4                                
  1294  5f               pop di                                   
  1295  5e               pop si                                   
  1296  c9               leave                                    
  1297  cb               retf                                     

ovl64_1298:  ; ENTRY
  1298  55               push bp                                  
  1299  8bec             mov bp, sp                               
  129b  83ec08           sub sp, 8                                
  129e  56               push si                                  
  129f  57               push di                                  
  12a0  8b5608           mov dx, word ptr [bp + 8]                
  12a3  8b4e0a           mov cx, word ptr [bp + 0xa]              
  12a6  c746f80000       mov word ptr [bp - 8], 0                 
  12ab  b8042c           mov ax, 0x2c04                           
  12ae  8ec0             mov es, ax                               
  12b0  26833e240100     cmp word ptr es:[0x124], 0               
  12b6  7505             jne 0x12bd                               
  12b8  33c0             xor ax, ax                               
  12ba  e90701           jmp 0x13c4                               
  12bd  8bd9             mov bx, cx                               
  12bf  69dbe000         imul bx, bx, 0xe0                        
  12c3  8bc2             mov ax, dx                               
  12c5  d1e0             shl ax, 1                                
  12c7  03d8             add bx, ax                               
  12c9  b81d1e           mov ax, 0x1e1d                           
  12cc  8ec0             mov es, ax                               
  12ce  268a9f0000       mov bl, byte ptr es:[bx]                 
  12d3  81e3ff00         and bx, 0xff                             
  12d7  b8042c           mov ax, 0x2c04                           
  12da  8ec0             mov es, ax                               
  12dc  268a871007       mov al, byte ptr es:[bx + 0x710]         
  12e1  98               cwde                                     
  12e2  8946fe           mov word ptr [bp - 2], ax                
  12e5  833efc5d02       cmp word ptr [0x5dfc], 2                 
  12ea  7406             je 0x12f2                                
  12ec  837efe0a         cmp word ptr [bp - 2], 0xa               
  12f0  7505             jne 0x12f7                               
  12f2  b80100           mov ax, 1                                
  12f5  eb02             jmp 0x12f9                               
  12f7  33c0             xor ax, ax                               
  12f9  8bd8             mov bx, ax                               
  12fb  0bdb             or bx, bx                                
  12fd  7407             je 0x1306                                
  12ff  8bc2             mov ax, dx                               
  1301  05feff           add ax, 0xfffe                           
  1304  eb03             jmp 0x1309                               
  1306  8bc2             mov ax, dx                               
  1308  48               dec ax                                   
  1309  8bf0             mov si, ax                               
  130b  0bdb             or bx, bx                                
  130d  7407             je 0x1316                                
  130f  8bc2             mov ax, dx                               
  1311  050200           add ax, 2                                
  1314  eb03             jmp 0x1319                               
  1316  8bc2             mov ax, dx                               
  1318  40               inc ax                                   
  1319  8bf8             mov di, ax                               
  131b  0bdb             or bx, bx                                
  131d  7407             je 0x1326                                
  131f  8bc1             mov ax, cx                               
  1321  05feff           add ax, 0xfffe                           
  1324  eb03             jmp 0x1329                               
  1326  8bc1             mov ax, cx                               
  1328  48               dec ax                                   
  1329  8946fc           mov word ptr [bp - 4], ax                
  132c  0bdb             or bx, bx                                
  132e  7407             je 0x1337                                
  1330  8bc1             mov ax, cx                               
  1332  050200           add ax, 2                                
  1335  eb03             jmp 0x133a                               
  1337  8bc1             mov ax, cx                               
  1339  40               inc ax                                   
  133a  8946fa           mov word ptr [bp - 6], ax                
  133d  8bd6             mov dx, si                               
  133f  eb3a             jmp 0x137b                               
  1341  8b4efc           mov cx, word ptr [bp - 4]                
  1344  eb2f             jmp 0x1375                               
  1346  0bd2             or dx, dx                                
  1348  7c2a             jl 0x1374                                
  134a  83fa70           cmp dx, 0x70                             
  134d  7d25             jge 0x1374                               
  134f  0bc9             or cx, cx                                
  1351  7c21             jl 0x1374                                
  1353  81f99c00         cmp cx, 0x9c                             
  1357  7d1b             jge 0x1374                               
  1359  8bd9             mov bx, cx                               
  135b  6bdb70           imul bx, bx, 0x70                        
  135e  03da             add bx, dx                               
  1360  b8d919           mov ax, 0x19d9                           
  1363  8ec0             mov es, ax                               
  1365  268a870000       mov al, byte ptr es:[bx]                 
  136a  c1e805           shr ax, 5                                
  136d  250100           and ax, 1                                
  1370  0bc0             or ax, ax                                
  1372  7414             je 0x1388                                
  1374  41               inc cx                                   
  1375  3b4efa           cmp cx, word ptr [bp - 6]                
  1378  7ecc             jle 0x1346                               
  137a  42               inc dx                                   
  137b  3bd7             cmp dx, di                               
  137d  7ec2             jle 0x1341                               
  137f  837ef800         cmp word ptr [bp - 8], 0                 
  1383  7503             jne 0x1388                               
  1385  e930ff           jmp 0x12b8                               
  1388  8bd6             mov dx, si                               
  138a  eb31             jmp 0x13bd                               
  138c  8b4efc           mov cx, word ptr [bp - 4]                
  138f  eb26             jmp 0x13b7                               
  1391  0bd2             or dx, dx                                
  1393  7c21             jl 0x13b6                                
  1395  83fa70           cmp dx, 0x70                             
  1398  7d1c             jge 0x13b6                               
  139a  0bc9             or cx, cx                                
  139c  7c18             jl 0x13b6                                
  139e  81f99c00         cmp cx, 0x9c                             
  13a2  7d12             jge 0x13b6                               
  13a4  8bd9             mov bx, cx                               
  13a6  6bdb70           imul bx, bx, 0x70                        
  13a9  03da             add bx, dx                               
  13ab  b8d919           mov ax, 0x19d9                           
  13ae  8ec0             mov es, ax                               
  13b0  26808f000020     or byte ptr es:[bx], 0x20                
  13b6  41               inc cx                                   
  13b7  3b4efa           cmp cx, word ptr [bp - 6]                
  13ba  7ed5             jle 0x1391                               
  13bc  42               inc dx                                   
  13bd  3bd7             cmp dx, di                               
  13bf  7ecb             jle 0x138c                               
  13c1  b80100           mov ax, 1                                
  13c4  5f               pop di                                   
  13c5  5e               pop si                                   
  13c6  c9               leave                                    
  13c7  cb               retf                                     

ovl64_13c8:  ; ENTRY
  13c8  55               push bp                                  
  13c9  8bec             mov bp, sp                               
  13cb  83ec06           sub sp, 6                                
  13ce  56               push si                                  
  13cf  57               push di                                  
  13d0  8b7606           mov si, word ptr [bp + 6]                
  13d3  8b7e08           mov di, word ptr [bp + 8]                
  13d6  b8042c           mov ax, 0x2c04                           
  13d9  8ec0             mov es, ax                               
  13db  26833e240100     cmp word ptr es:[0x124], 0               
  13e1  7503             jne 0x13e6                               
  13e3  e96e01           jmp 0x1554                               
  13e6  c706d25e0000     mov word ptr [0x5ed2], 0                 
  13ec  0bf6             or si, si                                
  13ee  7c04             jl 0x13f4                                
  13f0  8bc6             mov ax, si                               
  13f2  eb09             jmp 0x13fd                               
  13f4  b8042c           mov ax, 0x2c04                           
  13f7  8ec0             mov es, ax                               
  13f9  26a17701         mov ax, word ptr es:[0x177]              
  13fd  8bd0             mov dx, ax                               
  13ff  0bff             or di, di                                
  1401  7c04             jl 0x1407                                
  1403  8bc7             mov ax, di                               
  1405  eb09             jmp 0x1410                               
  1407  b8042c           mov ax, 0x2c04                           
  140a  8ec0             mov es, ax                               
  140c  26a17501         mov ax, word ptr es:[0x175]              
  1410  8946fe           mov word ptr [bp - 2], ax                
  1413  0bf6             or si, si                                
  1415  7c05             jl 0x141c                                
  1417  8bc6             mov ax, si                               
  1419  40               inc ax                                   
  141a  eb0a             jmp 0x1426                               
  141c  b8042c           mov ax, 0x2c04                           
  141f  8ec0             mov es, ax                               
  1421  26a17b01         mov ax, word ptr es:[0x17b]              
  1425  40               inc ax                                   
  1426  8946fc           mov word ptr [bp - 4], ax                
  1429  0bff             or di, di                                
  142b  7c05             jl 0x1432                                
  142d  8bc7             mov ax, di                               
  142f  40               inc ax                                   
  1430  eb0a             jmp 0x143c                               
  1432  b8042c           mov ax, 0x2c04                           
  1435  8ec0             mov es, ax                               
  1437  26a17901         mov ax, word ptr es:[0x179]              
  143b  40               inc ax                                   
  143c  8946fa           mov word ptr [bp - 6], ax                
  143f  833e543200       cmp word ptr [0x3254], 0                 
  1444  7503             jne 0x1449                               
  1446  e98700           jmp 0x14d0                               
  1449  8bf2             mov si, dx                               
  144b  eb7b             jmp 0x14c8                               
  144d  8b7efe           mov di, word ptr [bp - 2]                
  1450  eb70             jmp 0x14c2                               
  1452  8bdf             mov bx, di                               
  1454  6bdb70           imul bx, bx, 0x70                        
  1457  03de             add bx, si                               
  1459  b8d919           mov ax, 0x19d9                           
  145c  8ec0             mov es, ax                               
  145e  268a870000       mov al, byte ptr es:[bx]                 
  1463  c1e807           shr ax, 7                                
  1466  250100           and ax, 1                                
  1469  0bc0             or ax, ax                                
  146b  7423             je 0x1490                                
  146d  b8042c           mov ax, 0x2c04                           
  1470  8bd6             mov dx, si                               
  1472  8ec0             mov es, ax                               
  1474  262b167701       sub dx, word ptr es:[0x177]              
  1479  6bd209           imul dx, dx, 9                           
  147c  8bdf             mov bx, di                               
  147e  8ec0             mov es, ax                               
  1480  262b1e7501       sub bx, word ptr es:[0x175]              
  1485  03d3             add dx, bx                               
  1487  8bda             mov bx, dx                               
  1489  c687d45eff       mov byte ptr [bx + 0x5ed4], 0xff         
  148e  eb31             jmp 0x14c1                               
  1490  57               push di                                  
  1491  56               push si                                  
  1492  0e               push cs                                  
  1493  e8d9fa           call 0xf6f                               
  1496  83c404           add sp, 4                                
  1499  8bd8             mov bx, ax                               
  149b  8a87562d         mov al, byte ptr [bx + 0x2d56]           
  149f  ba042c           mov dx, 0x2c04                           
  14a2  8bde             mov bx, si                               
  14a4  8ec2             mov es, dx                               
  14a6  262b1e7701       sub bx, word ptr es:[0x177]              
  14ab  6bdb09           imul bx, bx, 9                           
  14ae  8bcf             mov cx, di                               
  14b0  8ec2             mov es, dx                               
  14b2  262b0e7501       sub cx, word ptr es:[0x175]              
  14b7  03d9             add bx, cx                               
  14b9  8887d45e         mov byte ptr [bx + 0x5ed4], al           
  14bd  ff06d25e         inc word ptr [0x5ed2]                    
  14c1  47               inc di                                   
  14c2  3b7efa           cmp di, word ptr [bp - 6]                
  14c5  7c8b             jl 0x1452                                
  14c7  46               inc si                                   
  14c8  3b76fc           cmp si, word ptr [bp - 4]                
  14cb  7c80             jl 0x144d                                
  14cd  e98400           jmp 0x1554                               
  14d0  8bf2             mov si, dx                               
  14d2  eb7b             jmp 0x154f                               
  14d4  8b7efe           mov di, word ptr [bp - 2]                
  14d7  eb70             jmp 0x1549                               
  14d9  8bdf             mov bx, di                               
  14db  6bdb70           imul bx, bx, 0x70                        
  14de  03de             add bx, si                               
  14e0  b8d919           mov ax, 0x19d9                           
  14e3  8ec0             mov es, ax                               
  14e5  268a870000       mov al, byte ptr es:[bx]                 
  14ea  c1e805           shr ax, 5                                
  14ed  250100           and ax, 1                                
  14f0  0bc0             or ax, ax                                
  14f2  7423             je 0x1517                                
  14f4  b8042c           mov ax, 0x2c04                           
  14f7  8bd6             mov dx, si                               
  14f9  8ec0             mov es, ax                               
  14fb  262b167701       sub dx, word ptr es:[0x177]              
  1500  6bd209           imul dx, dx, 9                           
  1503  8bdf             mov bx, di                               
  1505  8ec0             mov es, ax                               
  1507  262b1e7501       sub bx, word ptr es:[0x175]              
  150c  03d3             add dx, bx                               
  150e  8bda             mov bx, dx                               
  1510  c687d45eff       mov byte ptr [bx + 0x5ed4], 0xff         
  1515  eb31             jmp 0x1548                               
  1517  57               push di                                  
  1518  56               push si                                  
  1519  0e               push cs                                  
  151a  e852fa           call 0xf6f                               
  151d  83c404           add sp, 4                                
  1520  8bd8             mov bx, ax                               
  1522  8a87562d         mov al, byte ptr [bx + 0x2d56]           
  1526  ba042c           mov dx, 0x2c04                           
  1529  8bde             mov bx, si                               
  152b  8ec2             mov es, dx                               
  152d  262b1e7701       sub bx, word ptr es:[0x177]              
  1532  6bdb09           imul bx, bx, 9                           
  1535  8bcf             mov cx, di                               
  1537  8ec2             mov es, dx                               
  1539  262b0e7501       sub cx, word ptr es:[0x175]              
  153e  03d9             add bx, cx                               
  1540  8887d45e         mov byte ptr [bx + 0x5ed4], al           
  1544  ff06d25e         inc word ptr [0x5ed2]                    
  1548  47               inc di                                   
  1549  3b7efa           cmp di, word ptr [bp - 6]                
  154c  7c8b             jl 0x14d9                                
  154e  46               inc si                                   
  154f  3b76fc           cmp si, word ptr [bp - 4]                
  1552  7c80             jl 0x14d4                                
  1554  5f               pop di                                   
  1555  5e               pop si                                   
  1556  c9               leave                                    
  1557  cb               retf                                     

ovl64_1558:  ; ENTRY
  1558  55               push bp                                  
  1559  8bec             mov bp, sp                               
  155b  83ec04           sub sp, 4                                
  155e  56               push si                                  
  155f  57               push di                                  
  1560  a15432           mov ax, word ptr [0x3254]                
  1563  8946fc           mov word ptr [bp - 4], ax                
  1566  c70654320000     mov word ptr [0x3254], 0                 
  156c  c746fe0000       mov word ptr [bp - 2], 0                 
  1571  eb57             jmp 0x15ca                               
  1573  33f6             xor si, si                               
  1575  eb4b             jmp 0x15c2                               
  1577  33ff             xor di, di                               
  1579  eb40             jmp 0x15bb                               
  157b  8bdf             mov bx, di                               
  157d  6bdb70           imul bx, bx, 0x70                        
  1580  03de             add bx, si                               
  1582  b8d919           mov ax, 0x19d9                           
  1585  8ec0             mov es, ax                               
  1587  268a870000       mov al, byte ptr es:[bx]                 
  158c  c1e805           shr ax, 5                                
  158f  250100           and ax, 1                                
  1592  0bc0             or ax, ax                                
  1594  7524             jne 0x15ba                               
  1596  57               push di                                  
  1597  56               push si                                  
  1598  0e               push cs                                  
  1599  e8d3f9           call 0xf6f                               
  159c  83c404           add sp, 4                                
  159f  8bd8             mov bx, ax                               
  15a1  80bf562dff       cmp byte ptr [bx + 0x2d56], 0xff         
  15a6  7512             jne 0x15ba                               
  15a8  8bdf             mov bx, di                               
  15aa  6bdb70           imul bx, bx, 0x70                        
  15ad  03de             add bx, si                               
  15af  b8d919           mov ax, 0x19d9                           
  15b2  8ec0             mov es, ax                               
  15b4  26808f000020     or byte ptr es:[bx], 0x20                
  15ba  47               inc di                                   
  15bb  81ff9c00         cmp di, 0x9c                             
  15bf  7cba             jl 0x157b                                
  15c1  46               inc si                                   
  15c2  83fe70           cmp si, 0x70                             
  15c5  7cb0             jl 0x1577                                
  15c7  ff46fe           inc word ptr [bp - 2]                    
  15ca  837efe02         cmp word ptr [bp - 2], 2                 
  15ce  7ca3             jl 0x1573                                
  15d0  8b46fc           mov ax, word ptr [bp - 4]                
  15d3  a35432           mov word ptr [0x3254], ax                
  15d6  5f               pop di                                   
  15d7  5e               pop si                                   
  15d8  c9               leave                                    
  15d9  cb               retf                                     

ovl64_15da:  ; ENTRY
  15da  55               push bp                                  
  15db  8bec             mov bp, sp                               
  15dd  33c0             xor ax, ax                               
  15df  eb17             jmp 0x15f8                               
  15e1  33d2             xor dx, dx                               
  15e3  eb0d             jmp 0x15f2                               
  15e5  8bd8             mov bx, ax                               
  15e7  6bdb09           imul bx, bx, 9                           
  15ea  03da             add bx, dx                               
  15ec  c687d45eff       mov byte ptr [bx + 0x5ed4], 0xff         
  15f1  42               inc dx                                   
  15f2  83fa09           cmp dx, 9                                
  15f5  7cee             jl 0x15e5                                
  15f7  40               inc ax                                   
  15f8  3d0900           cmp ax, 9                                
  15fb  7ce4             jl 0x15e1                                
  15fd  5d               pop bp                                   
  15fe  cb               retf                                     

ovl64_15ff:  ; ENTRY
  15ff  55               push bp                                  
  1600  8bec             mov bp, sp                               
  1602  56               push si                                  
  1603  8b4e08           mov cx, word ptr [bp + 8]                
  1606  8b760a           mov si, word ptr [bp + 0xa]              
  1609  b8042c           mov ax, 0x2c04                           
  160c  8ec0             mov es, ax                               
  160e  26833e240100     cmp word ptr es:[0x124], 0               
  1614  7506             jne 0x161c                               
  1616  b80100           mov ax, 1                                
  1619  e93501           jmp 0x1751                               
  161c  8b5e06           mov bx, word ptr [bp + 6]                
  161f  83fb03           cmp bx, 3                                
  1622  7603             jbe 0x1627                               
  1624  e92801           jmp 0x174f                               
  1627  d1e3             shl bx, 1                                
  1629  2effa75417       jmp word ptr cs:[bx + 0x1754]            
ovl64_162e:  ; case
  162e  8bd9             mov bx, cx                               
  1630  6bdb09           imul bx, bx, 9                           
  1633  03de             add bx, si                               
  1635  80bfd45e0e       cmp byte ptr [bx + 0x5ed4], 0xe          
  163a  7503             jne 0x163f                               
  163c  e9f300           jmp 0x1732                               
  163f  b80100           mov ax, 1                                
  1642  e9ef00           jmp 0x1734                               
  1645  e9ea00           jmp 0x1732                               
ovl64_1648:  ; case
  1648  b8042c           mov ax, 0x2c04                           
  164b  8ec0             mov es, ax                               
  164d  26390e7701       cmp word ptr es:[0x177], cx              
  1652  7e03             jle 0x1657                               
  1654  e9df00           jmp 0x1736                               
  1657  8ec0             mov es, ax                               
  1659  26390e7b01       cmp word ptr es:[0x17b], cx              
  165e  7d03             jge 0x1663                               
  1660  e9d300           jmp 0x1736                               
  1663  8ec0             mov es, ax                               
  1665  2639367501       cmp word ptr es:[0x175], si              
  166a  7e03             jle 0x166f                               
  166c  e9c700           jmp 0x1736                               
  166f  8ec0             mov es, ax                               
  1671  2639367901       cmp word ptr es:[0x179], si              
  1676  7d03             jge 0x167b                               
  1678  e9bb00           jmp 0x1736                               
  167b  8bd1             mov dx, cx                               
  167d  8ec0             mov es, ax                               
  167f  262b167701       sub dx, word ptr es:[0x177]              
  1684  6bd209           imul dx, dx, 9                           
  1687  8bde             mov bx, si                               
  1689  8ec0             mov es, ax                               
  168b  262b1e7501       sub bx, word ptr es:[0x175]              
  1690  03d3             add dx, bx                               
  1692  8bda             mov bx, dx                               
  1694  80bfd45e0e       cmp byte ptr [bx + 0x5ed4], 0xe          
  1699  7503             jne 0x169e                               
  169b  e99400           jmp 0x1732                               
  169e  eb9f             jmp 0x163f                               
  16a0  e98f00           jmp 0x1732                               
  16a3  e99000           jmp 0x1736                               
ovl64_16a6:  ; case
  16a6  8bc1             mov ax, cx                               
  16a8  05f0ff           add ax, 0xfff0                           
  16ab  bb2800           mov bx, 0x28                             
  16ae  99               cdq                                      
  16af  f7fb             idiv bx                                  
  16b1  8bc8             mov cx, ax                               
  16b3  8bc6             mov ax, si                               
  16b5  05e2ff           add ax, 0xffe2                           
  16b8  99               cdq                                      
  16b9  f7fb             idiv bx                                  
  16bb  8bf0             mov si, ax                               
  16bd  8bd9             mov bx, cx                               
  16bf  6bdb09           imul bx, bx, 9                           
  16c2  03de             add bx, si                               
  16c4  80bfd45e0e       cmp byte ptr [bx + 0x5ed4], 0xe          
  16c9  7467             je 0x1732                                
  16cb  e971ff           jmp 0x163f                               
  16ce  eb62             jmp 0x1732                               
ovl64_16d0:  ; case
  16d0  8bc1             mov ax, cx                               
  16d2  0570fe           add ax, 0xfe70                           
  16d5  99               cdq                                      
  16d6  2bc2             sub ax, dx                               
  16d8  d1f8             sar ax, 1                                
  16da  8bc8             mov cx, ax                               
  16dc  8bc6             mov ax, si                               
  16de  05e2ff           add ax, 0xffe2                           
  16e1  99               cdq                                      
  16e2  2bc2             sub ax, dx                               
  16e4  8bf0             mov si, ax                               
  16e6  d1fe             sar si, 1                                
  16e8  b8042c           mov ax, 0x2c04                           
  16eb  8ec0             mov es, ax                               
  16ed  26390e7701       cmp word ptr es:[0x177], cx              
  16f2  7f42             jg 0x1736                                
  16f4  8ec0             mov es, ax                               
  16f6  26390e7b01       cmp word ptr es:[0x17b], cx              
  16fb  7c39             jl 0x1736                                
  16fd  8ec0             mov es, ax                               
  16ff  2639367501       cmp word ptr es:[0x175], si              
  1704  7f30             jg 0x1736                                
  1706  8ec0             mov es, ax                               
  1708  2639367901       cmp word ptr es:[0x179], si              
  170d  7c27             jl 0x1736                                
  170f  8bd1             mov dx, cx                               
  1711  8ec0             mov es, ax                               
  1713  262b167701       sub dx, word ptr es:[0x177]              
  1718  6bd209           imul dx, dx, 9                           
  171b  8bde             mov bx, si                               
  171d  8ec0             mov es, ax                               
  171f  262b1e7501       sub bx, word ptr es:[0x175]              
  1724  03d3             add dx, bx                               
  1726  8bda             mov bx, dx                               
  1728  80bfd45e0e       cmp byte ptr [bx + 0x5ed4], 0xe          
  172d  7403             je 0x1732                                
  172f  e90dff           jmp 0x163f                               
  1732  33c0             xor ax, ax                               
  1734  eb1b             jmp 0x1751                               
  1736  8bde             mov bx, si                               
  1738  6bdb70           imul bx, bx, 0x70                        
  173b  03d9             add bx, cx                               
  173d  b8d919           mov ax, 0x19d9                           
  1740  8ec0             mov es, ax                               
  1742  268a870000       mov al, byte ptr es:[bx]                 
  1747  c1e805           shr ax, 5                                
  174a  250100           and ax, 1                                
  174d  eb02             jmp 0x1751                               
  174f  33c0             xor ax, ax                               
  1751  5e               pop si                                   
  1752  5d               pop bp                                   
  1753  cb               retf                                     
  1754  2e164816a616d016 dw 162e,1648,16a6,16d0                   jump table

ovl64_175c:  ; ENTRY
  175c  55               push bp                                  
  175d  8bec             mov bp, sp                               
  175f  83ec0e           sub sp, 0xe                              
  1762  56               push si                                  
  1763  57               push di                                  
  1764  c746fe0100       mov word ptr [bp - 2], 1                 
  1769  33ff             xor di, di                               
  176b  c746f20000       mov word ptr [bp - 0xe], 0               
  1770  b8042c           mov ax, 0x2c04                           
  1773  8ec0             mov es, ax                               
  1775  26833e240100     cmp word ptr es:[0x124], 0               
  177b  7503             jne 0x1780                               
  177d  e96401           jmp 0x18e4                               
  1780  33d2             xor dx, dx                               
  1782  eb3f             jmp 0x17c3                               
  1784  8bda             mov bx, dx                               
  1786  d1e3             shl bx, 1                                
  1788  b8042c           mov ax, 0x2c04                           
  178b  8ec0             mov es, ax                               
  178d  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1793  7512             jne 0x17a7                               
  1795  8bda             mov bx, dx                               
  1797  d1e3             shl bx, 1                                
  1799  b8042c           mov ax, 0x2c04                           
  179c  8ec0             mov es, ax                               
  179e  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  17a4  7401             je 0x17a7                                
  17a6  47               inc di                                   
  17a7  8bda             mov bx, dx                               
  17a9  d1e3             shl bx, 1                                
  17ab  b8042c           mov ax, 0x2c04                           
  17ae  8ec0             mov es, ax                               
  17b0  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  17b6  750a             jne 0x17c2                               
  17b8  b80100           mov ax, 1                                
  17bb  8aca             mov cl, dl                               
  17bd  d3e0             shl ax, cl                               
  17bf  0946f2           or word ptr [bp - 0xe], ax               
  17c2  42               inc dx                                   
  17c3  83fa08           cmp dx, 8                                
  17c6  7cbc             jl 0x1784                                
  17c8  66ff367012       push dword ptr [0x1270]                  
  17cd  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  17d2  83c404           add sp, 4                                
  17d5  89166e12         mov word ptr [0x126e], dx                
  17d9  a36c12           mov word ptr [0x126c], ax                
  17dc  33c9             xor cx, cx                               
  17de  e9b000           jmp 0x1891                               
  17e1  8bd9             mov bx, cx                               
  17e3  6bdb41           imul bx, bx, 0x41                        
  17e6  b8042c           mov ax, 0x2c04                           
  17e9  8ec0             mov es, ax                               
  17eb  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  17f0  69dbe000         imul bx, bx, 0xe0                        
  17f4  8bf1             mov si, cx                               
  17f6  6bf641           imul si, si, 0x41                        
  17f9  b8042c           mov ax, 0x2c04                           
  17fc  8ec0             mov es, ax                               
  17fe  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1803  d1e0             shl ax, 1                                
  1805  03d8             add bx, ax                               
  1807  b81d1e           mov ax, 0x1e1d                           
  180a  8ec0             mov es, ax                               
  180c  268a9f0000       mov bl, byte ptr es:[bx]                 
  1811  81e3ff00         and bx, 0xff                             
  1815  b8042c           mov ax, 0x2c04                           
  1818  8ec0             mov es, ax                               
  181a  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1820  756e             jne 0x1890                               
  1822  8bd9             mov bx, cx                               
  1824  6bdb41           imul bx, bx, 0x41                        
  1827  b8042c           mov ax, 0x2c04                           
  182a  8ec0             mov es, ax                               
  182c  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1831  6bc070           imul ax, ax, 0x70                        
  1834  8b166e12         mov dx, word ptr [0x126e]                
  1838  8b1e6c12         mov bx, word ptr [0x126c]                
  183c  03d8             add bx, ax                               
  183e  8bf1             mov si, cx                               
  1840  6bf641           imul si, si, 0x41                        
  1843  b8042c           mov ax, 0x2c04                           
  1846  8ec0             mov es, ax                               
  1848  26039c7d15       add bx, word ptr es:[si + 0x157d]        
  184d  8956f8           mov word ptr [bp - 8], dx                
  1850  895ef6           mov word ptr [bp - 0xa], bx              
  1853  8e46f8           mov es, word ptr [bp - 8]                
  1856  268a07           mov al, byte ptr es:[bx]                 
  1859  8846fa           mov byte ptr [bp - 6], al                
  185c  268a4701         mov al, byte ptr es:[bx + 1]             
  1860  8846fb           mov byte ptr [bp - 5], al                
  1863  268a4770         mov al, byte ptr es:[bx + 0x70]          
  1867  8846fc           mov byte ptr [bp - 4], al                
  186a  268a4771         mov al, byte ptr es:[bx + 0x71]          
  186e  8846fd           mov byte ptr [bp - 3], al                
  1871  8a46fa           mov al, byte ptr [bp - 6]                
  1874  0a46fb           or al, byte ptr [bp - 5]                 
  1877  0a46fc           or al, byte ptr [bp - 4]                 
  187a  0a46fd           or al, byte ptr [bp - 3]                 
  187d  0a46f2           or al, byte ptr [bp - 0xe]               
  1880  8846f5           mov byte ptr [bp - 0xb], al              
  1883  807ef5ff         cmp byte ptr [bp - 0xb], 0xff            
  1887  7407             je 0x1890                                
  1889  c746fe0000       mov word ptr [bp - 2], 0                 
  188e  eb10             jmp 0x18a0                               
  1890  41               inc cx                                   
  1891  b8042c           mov ax, 0x2c04                           
  1894  8ec0             mov es, ax                               
  1896  26390e7b15       cmp word ptr es:[0x157b], cx             
  189b  7e03             jle 0x18a0                               
  189d  e941ff           jmp 0x17e1                               
  18a0  66ff367012       push dword ptr [0x1270]                  
  18a5  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  18aa  83c404           add sp, 4                                
  18ad  837efe00         cmp word ptr [bp - 2], 0                 
  18b1  7431             je 0x18e4                                
  18b3  b8042c           mov ax, 0x2c04                           
  18b6  8ec0             mov es, ax                               
  18b8  26c70624010000   mov word ptr es:[0x124], 0               
  18bf  0e               push cs                                  
  18c0  e817fd           call 0x15da                              
  18c3  0bff             or di, di                                
  18c5  7e19             jle 0x18e0                               
  18c7  6a19             push 0x19                                
  18c9  666a12           push 0x12                                
  18cc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  18d1  83c404           add sp, 4                                
  18d4  52               push dx                                  
  18d5  50               push ax                                  
  18d6  9a9300d730       lcall 0x30d7, 0x93                       -> ovl61:11d1
  18db  83c406           add sp, 6                                
  18de  eb04             jmp 0x18e4                               
  18e0  6a0f             push 0xf                                 
  18e2  ebe5             jmp 0x18c9                               
  18e4  5f               pop di                                   
  18e5  5e               pop si                                   
  18e6  c9               leave                                    
  18e7  cb               retf                                     

ovl64_18e8:  ; ENTRY
  18e8  55               push bp                                  
  18e9  8bec             mov bp, sp                               
  18eb  1e               push ds                                  
  18ec  68cb61           push 0x61cb                              
  18ef  1e               push ds                                  
  18f0  68255f           push 0x5f25                              
  18f3  b9a602           mov cx, 0x2a6                            
  18f6  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  18fb  800e696401       or byte ptr [0x6469], 1                  
  1900  33d2             xor dx, dx                               
  1902  eb1c             jmp 0x1920                               
  1904  33c9             xor cx, cx                               
  1906  eb12             jmp 0x191a                               
  1908  8bda             mov bx, dx                               
  190a  6bdb48           imul bx, bx, 0x48                        
  190d  8bc1             mov ax, cx                               
  190f  c1e003           shl ax, 3                                
  1912  03d8             add bx, ax                               
  1914  808fe16101       or byte ptr [bx + 0x61e1], 1             
  1919  41               inc cx                                   
  191a  83f909           cmp cx, 9                                
  191d  7ce9             jl 0x1908                                
  191f  42               inc dx                                   
  1920  83fa09           cmp dx, 9                                
  1923  7cdf             jl 0x1904                                
  1925  5d               pop bp                                   
  1926  cb               retf                                     

ovl64_1927:  ; ENTRY
  1927  55               push bp                                  
  1928  8bec             mov bp, sp                               
  192a  80266964fe       and byte ptr [0x6469], 0xfe              
  192f  5d               pop bp                                   
  1930  cb               retf                                     

ovl64_1931:  ; ENTRY
  1931  55               push bp                                  
  1932  8bec             mov bp, sp                               
  1934  c7061a2f0100     mov word ptr [0x2f1a], 1                 
  193a  33d2             xor dx, dx                               
  193c  eb2d             jmp 0x196b                               
  193e  33c9             xor cx, cx                               
  1940  eb23             jmp 0x1965                               
  1942  8bda             mov bx, dx                               
  1944  6bdb48           imul bx, bx, 0x48                        
  1947  8bc1             mov ax, cx                               
  1949  c1e003           shl ax, 3                                
  194c  03d8             add bx, ax                               
  194e  83a7e7611f       and word ptr [bx + 0x61e7], 0x1f         
  1953  8bda             mov bx, dx                               
  1955  6bdb48           imul bx, bx, 0x48                        
  1958  8bc1             mov ax, cx                               
  195a  c1e003           shl ax, 3                                
  195d  03d8             add bx, ax                               
  195f  83a7415f1f       and word ptr [bx + 0x5f41], 0x1f         
  1964  41               inc cx                                   
  1965  83f909           cmp cx, 9                                
  1968  7cd8             jl 0x1942                                
  196a  42               inc dx                                   
  196b  83fa09           cmp dx, 9                                
  196e  7cce             jl 0x193e                                
  1970  5d               pop bp                                   
  1971  cb               retf                                     

ovl64_1972:  ; ENTRY
  1972  55               push bp                                  
  1973  8bec             mov bp, sp                               
  1975  83ec1a           sub sp, 0x1a                             
  1978  56               push si                                  
  1979  a06964           mov al, byte ptr [0x6469]                
  197c  250100           and ax, 1                                
  197f  0bc0             or ax, ax                                
  1981  7503             jne 0x1986                               
  1983  e9f000           jmp 0x1a76                               
  1986  a1cb61           mov ax, word ptr [0x61cb]                
  1989  3b06255f         cmp ax, word ptr [0x5f25]                
  198d  7509             jne 0x1998                               
  198f  a1cd61           mov ax, word ptr [0x61cd]                
  1992  3b06275f         cmp ax, word ptr [0x5f27]                
  1996  7444             je 0x19dc                                
  1998  a1cb61           mov ax, word ptr [0x61cb]                
  199b  2b06255f         sub ax, word ptr [0x5f25]                
  199f  99               cdq                                      
  19a0  33c2             xor ax, dx                               
  19a2  2bc2             sub ax, dx                               
  19a4  3d0100           cmp ax, 1                                
  19a7  7e03             jle 0x19ac                               
  19a9  e9ca00           jmp 0x1a76                               
  19ac  a1cd61           mov ax, word ptr [0x61cd]                
  19af  2b06275f         sub ax, word ptr [0x5f27]                
  19b3  99               cdq                                      
  19b4  33c2             xor ax, dx                               
  19b6  2bc2             sub ax, dx                               
  19b8  3d0100           cmp ax, 1                                
  19bb  7e03             jle 0x19c0                               
  19bd  e9b600           jmp 0x1a76                               
  19c0  66ff36cb61       push dword ptr [0x61cb]                  
  19c5  66ff36255f       push dword ptr [0x5f25]                  
  19ca  9a2000e830       lcall 0x30e8, 0x20                       -> ovl62:0b51
  19cf  83c408           add sp, 8                                
  19d2  8946fe           mov word ptr [bp - 2], ax                
  19d5  50               push ax                                  
  19d6  90               nop                                      
  19d7  0e               push cs                                  
  19d8  e8a516           call 0x3080                              
  19db  59               pop cx                                   
  19dc  33c9             xor cx, cx                               
  19de  e98d00           jmp 0x1a6e                               
  19e1  33f6             xor si, si                               
  19e3  e97f00           jmp 0x1a65                               
  19e6  8bc1             mov ax, cx                               
  19e8  6bc048           imul ax, ax, 0x48                        
  19eb  8bd6             mov dx, si                               
  19ed  c1e203           shl dx, 3                                
  19f0  03c2             add ax, dx                               
  19f2  053b5f           add ax, 0x5f3b                           
  19f5  8c5efc           mov word ptr [bp - 4], ds                
  19f8  8946fa           mov word ptr [bp - 6], ax                
  19fb  8bc1             mov ax, cx                               
  19fd  6bc048           imul ax, ax, 0x48                        
  1a00  8bd6             mov dx, si                               
  1a02  c1e203           shl dx, 3                                
  1a05  03c2             add ax, dx                               
  1a07  05e161           add ax, 0x61e1                           
  1a0a  8c5ef8           mov word ptr [bp - 8], ds                
  1a0d  8946f6           mov word ptr [bp - 0xa], ax              
  1a10  c45ef6           les bx, ptr [bp - 0xa]                   
  1a13  268a07           mov al, byte ptr es:[bx]                 
  1a16  250100           and ax, 1                                
  1a19  0bc0             or ax, ax                                
  1a1b  7447             je 0x1a64                                
  1a1d  668b46fa         mov eax, dword ptr [bp - 6]              
  1a21  668946f2         mov dword ptr [bp - 0xe], eax            
  1a25  668946ee         mov dword ptr [bp - 0x12], eax           
  1a29  8346ee04         add word ptr [bp - 0x12], 4              
  1a2d  668b46f6         mov eax, dword ptr [bp - 0xa]            
  1a31  668946ea         mov dword ptr [bp - 0x16], eax           
  1a35  668946e6         mov dword ptr [bp - 0x1a], eax           
  1a39  8346e604         add word ptr [bp - 0x1a], 4              
  1a3d  c45eee           les bx, ptr [bp - 0x12]                  
  1a40  66268b07         mov eax, dword ptr es:[bx]               
  1a44  c45ee6           les bx, ptr [bp - 0x1a]                  
  1a47  66263b07         cmp eax, dword ptr es:[bx]               
  1a4b  7517             jne 0x1a64                               
  1a4d  c45ef2           les bx, ptr [bp - 0xe]                   
  1a50  66268b07         mov eax, dword ptr es:[bx]               
  1a54  c45eea           les bx, ptr [bp - 0x16]                  
  1a57  66263b07         cmp eax, dword ptr es:[bx]               
  1a5b  7507             jne 0x1a64                               
  1a5d  c45efa           les bx, ptr [bp - 6]                     
  1a60  268027fe         and byte ptr es:[bx], 0xfe               
  1a64  46               inc si                                   
  1a65  83fe09           cmp si, 9                                
  1a68  7d03             jge 0x1a6d                               
  1a6a  e979ff           jmp 0x19e6                               
  1a6d  41               inc cx                                   
  1a6e  83f909           cmp cx, 9                                
  1a71  7d03             jge 0x1a76                               
  1a73  e96bff           jmp 0x19e1                               
  1a76  5e               pop si                                   
  1a77  c9               leave                                    
  1a78  cb               retf                                     

ovl64_1a79:  ; ENTRY
  1a79  55               push bp                                  
  1a7a  8bec             mov bp, sp                               
  1a7c  81ec5201         sub sp, 0x152                            
  1a80  56               push si                                  
  1a81  57               push di                                  
  1a82  8c5ef6           mov word ptr [bp - 0xa], ds              
  1a85  c746f4255f       mov word ptr [bp - 0xc], 0x5f25          
  1a8a  c746f20000       mov word ptr [bp - 0xe], 0               
  1a8f  833e1a2f00       cmp word ptr [0x2f1a], 0                 
  1a94  7443             je 0x1ad9                                
  1a96  c7061a2f0000     mov word ptr [0x2f1a], 0                 
  1a9c  6a1a             push 0x1a                                
  1a9e  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1aa3  59               pop cx                                   
  1aa4  6a1b             push 0x1b                                
  1aa6  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1aab  59               pop cx                                   
  1aac  c746fc0000       mov word ptr [bp - 4], 0                 
  1ab1  eb10             jmp 0x1ac3                               
  1ab3  8b46fc           mov ax, word ptr [bp - 4]                
  1ab6  051000           add ax, 0x10                             
  1ab9  50               push ax                                  
  1aba  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1abf  59               pop cx                                   
  1ac0  ff46fc           inc word ptr [bp - 4]                    
  1ac3  837efc09         cmp word ptr [bp - 4], 9                 
  1ac7  7cea             jl 0x1ab3                                
  1ac9  6a2a             push 0x2a                                
  1acb  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1ad0  59               pop cx                                   
  1ad1  6a29             push 0x29                                
  1ad3  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1ad8  59               pop cx                                   
  1ad9  6a09             push 9                                   
  1adb  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1ae0  59               pop cx                                   
  1ae1  b8042c           mov ax, 0x2c04                           
  1ae4  8ec0             mov es, ax                               
  1ae6  26833e240100     cmp word ptr es:[0x124], 0               
  1aec  743d             je 0x1b2b                                
  1aee  66833e251600     cmp dword ptr [0x1625], 0                
  1af4  7435             je 0x1b2b                                
  1af6  f70650160a00     test word ptr [0x1650], 0xa              
  1afc  752d             jne 0x1b2b                               
  1afe  33f6             xor si, si                               
  1b00  eb20             jmp 0x1b22                               
  1b02  8bde             mov bx, si                               
  1b04  c1e302           shl bx, 2                                
  1b07  66ffb72516       push dword ptr [bx + 0x1625]             
  1b0c  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1b11  83c404           add sp, 4                                
  1b14  8bde             mov bx, si                               
  1b16  c1e302           shl bx, 2                                
  1b19  89973716         mov word ptr [bx + 0x1637], dx           
  1b1d  89873516         mov word ptr [bx + 0x1635], ax           
  1b21  46               inc si                                   
  1b22  a04f16           mov al, byte ptr [0x164f]                
  1b25  b400             mov ah, 0                                
  1b27  3bc6             cmp ax, si                               
  1b29  7fd7             jg 0x1b02                                
  1b2b  33ff             xor di, di                               
  1b2d  e99a00           jmp 0x1bca                               
  1b30  c746fe0000       mov word ptr [bp - 2], 0                 
  1b35  e98800           jmp 0x1bc0                               
  1b38  8bc7             mov ax, di                               
  1b3a  6bc048           imul ax, ax, 0x48                        
  1b3d  c45ef4           les bx, ptr [bp - 0xc]                   
  1b40  03d8             add bx, ax                               
  1b42  8b46fe           mov ax, word ptr [bp - 2]                
  1b45  c1e003           shl ax, 3                                
  1b48  03d8             add bx, ax                               
  1b4a  268a4716         mov al, byte ptr es:[bx + 0x16]          
  1b4e  250100           and ax, 1                                
  1b51  0bc0             or ax, ax                                
  1b53  7468             je 0x1bbd                                
  1b55  8bc7             mov ax, di                               
  1b57  6bc048           imul ax, ax, 0x48                        
  1b5a  c45ef4           les bx, ptr [bp - 0xc]                   
  1b5d  03d8             add bx, ax                               
  1b5f  8b46fe           mov ax, word ptr [bp - 2]                
  1b62  c1e003           shl ax, 3                                
  1b65  03d8             add bx, ax                               
  1b67  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  1b6b  251f00           and ax, 0x1f                             
  1b6e  3d0e00           cmp ax, 0xe                              
  1b71  7526             jne 0x1b99                               
  1b73  8b5efe           mov bx, word ptr [bp - 2]                
  1b76  d1e3             shl bx, 1                                
  1b78  ffb73c2d         push word ptr [bx + 0x2d3c]              
  1b7c  8bdf             mov bx, di                               
  1b7e  d1e3             shl bx, 1                                
  1b80  ffb72a2d         push word ptr [bx + 0x2d2a]              
  1b84  1e               push ds                                  
  1b85  689567           push 0x6795                              
  1b88  666a00           push 0                                   
  1b8b  1e               push ds                                  
  1b8c  681b16           push 0x161b                              
  1b8f  9a09002a05       lcall 0x52a, 9                           -> 052a:0009
  1b94  83c410           add sp, 0x10                             
  1b97  eb24             jmp 0x1bbd                               
  1b99  8b5ef2           mov bx, word ptr [bp - 0xe]              
  1b9c  c1e302           shl bx, 2                                
  1b9f  8d86aefe         lea ax, [bp - 0x152]                     
  1ba3  03d8             add bx, ax                               
  1ba5  36893f           mov word ptr ss:[bx], di                 
  1ba8  8b5ef2           mov bx, word ptr [bp - 0xe]              
  1bab  c1e302           shl bx, 2                                
  1bae  8d86b0fe         lea ax, [bp - 0x150]                     
  1bb2  03d8             add bx, ax                               
  1bb4  8b46fe           mov ax, word ptr [bp - 2]                
  1bb7  368907           mov word ptr ss:[bx], ax                 
  1bba  ff46f2           inc word ptr [bp - 0xe]                  
  1bbd  ff46fe           inc word ptr [bp - 2]                    
  1bc0  837efe09         cmp word ptr [bp - 2], 9                 
  1bc4  7d03             jge 0x1bc9                               
  1bc6  e96fff           jmp 0x1b38                               
  1bc9  47               inc di                                   
  1bca  83ff09           cmp di, 9                                
  1bcd  7d03             jge 0x1bd2                               
  1bcf  e95eff           jmp 0x1b30                               
  1bd2  b8042c           mov ax, 0x2c04                           
  1bd5  8ec0             mov es, ax                               
  1bd7  26833e240100     cmp word ptr es:[0x124], 0               
  1bdd  7430             je 0x1c0f                                
  1bdf  66833e251600     cmp dword ptr [0x1625], 0                
  1be5  7428             je 0x1c0f                                
  1be7  f70650160a00     test word ptr [0x1650], 0xa              
  1bed  7520             jne 0x1c0f                               
  1bef  33f6             xor si, si                               
  1bf1  eb13             jmp 0x1c06                               
  1bf3  8bde             mov bx, si                               
  1bf5  c1e302           shl bx, 2                                
  1bf8  66ffb72516       push dword ptr [bx + 0x1625]             
  1bfd  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1c02  83c404           add sp, 4                                
  1c05  46               inc si                                   
  1c06  a04f16           mov al, byte ptr [0x164f]                
  1c09  b400             mov ah, 0                                
  1c0b  3bc6             cmp ax, si                               
  1c0d  7fe4             jg 0x1bf3                                
  1c0f  66833e3d5100     cmp dword ptr [0x513d], 0                
  1c15  7435             je 0x1c4c                                
  1c17  f70668510a00     test word ptr [0x5168], 0xa              
  1c1d  752d             jne 0x1c4c                               
  1c1f  33f6             xor si, si                               
  1c21  eb20             jmp 0x1c43                               
  1c23  8bde             mov bx, si                               
  1c25  c1e302           shl bx, 2                                
  1c28  66ffb73d51       push dword ptr [bx + 0x513d]             
  1c2d  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1c32  83c404           add sp, 4                                
  1c35  8bde             mov bx, si                               
  1c37  c1e302           shl bx, 2                                
  1c3a  89974f51         mov word ptr [bx + 0x514f], dx           
  1c3e  89874d51         mov word ptr [bx + 0x514d], ax           
  1c42  46               inc si                                   
  1c43  a06751           mov al, byte ptr [0x5167]                
  1c46  b400             mov ah, 0                                
  1c48  3bc6             cmp ax, si                               
  1c4a  7fd7             jg 0x1c23                                
  1c4c  33f6             xor si, si                               
  1c4e  e99900           jmp 0x1cea                               
  1c51  8bde             mov bx, si                               
  1c53  c1e302           shl bx, 2                                
  1c56  8d86aefe         lea ax, [bp - 0x152]                     
  1c5a  03d8             add bx, ax                               
  1c5c  368b3f           mov di, word ptr ss:[bx]                 
  1c5f  8bde             mov bx, si                               
  1c61  c1e302           shl bx, 2                                
  1c64  8d86b0fe         lea ax, [bp - 0x150]                     
  1c68  03d8             add bx, ax                               
  1c6a  368b07           mov ax, word ptr ss:[bx]                 
  1c6d  8946fe           mov word ptr [bp - 2], ax                
  1c70  8bc7             mov ax, di                               
  1c72  6bc048           imul ax, ax, 0x48                        
  1c75  c45ef4           les bx, ptr [bp - 0xc]                   
  1c78  03d8             add bx, ax                               
  1c7a  8b46fe           mov ax, word ptr [bp - 2]                
  1c7d  c1e003           shl ax, 3                                
  1c80  03d8             add bx, ax                               
  1c82  268a4716         mov al, byte ptr es:[bx + 0x16]          
  1c86  d1e8             shr ax, 1                                
  1c88  250100           and ax, 1                                
  1c8b  0bc0             or ax, ax                                
  1c8d  755a             jne 0x1ce9                               
  1c8f  8bc7             mov ax, di                               
  1c91  6bc048           imul ax, ax, 0x48                        
  1c94  c45ef4           les bx, ptr [bp - 0xc]                   
  1c97  03d8             add bx, ax                               
  1c99  8b46fe           mov ax, word ptr [bp - 2]                
  1c9c  c1e003           shl ax, 3                                
  1c9f  03d8             add bx, ax                               
  1ca1  268b4716         mov ax, word ptr es:[bx + 0x16]          
  1ca5  c1e802           shr ax, 2                                
  1ca8  25ff00           and ax, 0xff                             
  1cab  8bc8             mov cx, ax                               
  1cad  8b5efe           mov bx, word ptr [bp - 2]                
  1cb0  d1e3             shl bx, 1                                
  1cb2  ffb73c2d         push word ptr [bx + 0x2d3c]              
  1cb6  8bdf             mov bx, di                               
  1cb8  d1e3             shl bx, 1                                
  1cba  ffb72a2d         push word ptr [bx + 0x2d2a]              
  1cbe  1e               push ds                                  
  1cbf  689567           push 0x6795                              
  1cc2  bb6000           mov bx, 0x60                             
  1cc5  99               cdq                                      
  1cc6  f7fb             idiv bx                                  
  1cc8  bb1000           mov bx, 0x10                             
  1ccb  8bc2             mov ax, dx                               
  1ccd  99               cdq                                      
  1cce  f7fb             idiv bx                                  
  1cd0  6bc028           imul ax, ax, 0x28                        
  1cd3  50               push ax                                  
  1cd4  8bc1             mov ax, cx                               
  1cd6  99               cdq                                      
  1cd7  f7fb             idiv bx                                  
  1cd9  6bd228           imul dx, dx, 0x28                        
  1cdc  52               push dx                                  
  1cdd  1e               push ds                                  
  1cde  683351           push 0x5133                              
  1ce1  9a09002a05       lcall 0x52a, 9                           -> 052a:0009
  1ce6  83c410           add sp, 0x10                             
  1ce9  46               inc si                                   
  1cea  3b76f2           cmp si, word ptr [bp - 0xe]              
  1ced  7d03             jge 0x1cf2                               
  1cef  e95fff           jmp 0x1c51                               
  1cf2  66833e3d5100     cmp dword ptr [0x513d], 0                
  1cf8  7428             je 0x1d22                                
  1cfa  f70668510a00     test word ptr [0x5168], 0xa              
  1d00  7520             jne 0x1d22                               
  1d02  33f6             xor si, si                               
  1d04  eb13             jmp 0x1d19                               
  1d06  8bde             mov bx, si                               
  1d08  c1e302           shl bx, 2                                
  1d0b  66ffb73d51       push dword ptr [bx + 0x513d]             
  1d10  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1d15  83c404           add sp, 4                                
  1d18  46               inc si                                   
  1d19  a06751           mov al, byte ptr [0x5167]                
  1d1c  b400             mov ah, 0                                
  1d1e  3bc6             cmp ax, si                               
  1d20  7fe4             jg 0x1d06                                
  1d22  c45ef4           les bx, ptr [bp - 0xc]                   
  1d25  268a879e02       mov al, byte ptr es:[bx + 0x29e]         
  1d2a  d1e8             shr ax, 1                                
  1d2c  250100           and ax, 1                                
  1d2f  0bc0             or ax, ax                                
  1d31  7503             jne 0x1d36                               
  1d33  e91301           jmp 0x1e49                               
  1d36  66833e785100     cmp dword ptr [0x5178], 0                
  1d3c  7435             je 0x1d73                                
  1d3e  f706a3510a00     test word ptr [0x51a3], 0xa              
  1d44  752d             jne 0x1d73                               
  1d46  33f6             xor si, si                               
  1d48  eb20             jmp 0x1d6a                               
  1d4a  8bde             mov bx, si                               
  1d4c  c1e302           shl bx, 2                                
  1d4f  66ffb77851       push dword ptr [bx + 0x5178]             
  1d54  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1d59  83c404           add sp, 4                                
  1d5c  8bde             mov bx, si                               
  1d5e  c1e302           shl bx, 2                                
  1d61  89978a51         mov word ptr [bx + 0x518a], dx           
  1d65  89878851         mov word ptr [bx + 0x5188], ax           
  1d69  46               inc si                                   
  1d6a  a0a251           mov al, byte ptr [0x51a2]                
  1d6d  b400             mov ah, 0                                
  1d6f  3bc6             cmp ax, si                               
  1d71  7fd7             jg 0x1d4a                                
  1d73  33f6             xor si, si                               
  1d75  e99900           jmp 0x1e11                               
  1d78  8bde             mov bx, si                               
  1d7a  c1e302           shl bx, 2                                
  1d7d  8d86aefe         lea ax, [bp - 0x152]                     
  1d81  03d8             add bx, ax                               
  1d83  368b3f           mov di, word ptr ss:[bx]                 
  1d86  8bde             mov bx, si                               
  1d88  c1e302           shl bx, 2                                
  1d8b  8d86b0fe         lea ax, [bp - 0x150]                     
  1d8f  03d8             add bx, ax                               
  1d91  368b07           mov ax, word ptr ss:[bx]                 
  1d94  8946fe           mov word ptr [bp - 2], ax                
  1d97  8bc7             mov ax, di                               
  1d99  6bc048           imul ax, ax, 0x48                        
  1d9c  c45ef4           les bx, ptr [bp - 0xc]                   
  1d9f  03d8             add bx, ax                               
  1da1  8b46fe           mov ax, word ptr [bp - 2]                
  1da4  c1e003           shl ax, 3                                
  1da7  03d8             add bx, ax                               
  1da9  268a4716         mov al, byte ptr es:[bx + 0x16]          
  1dad  d1e8             shr ax, 1                                
  1daf  250100           and ax, 1                                
  1db2  0bc0             or ax, ax                                
  1db4  745a             je 0x1e10                                
  1db6  8bc7             mov ax, di                               
  1db8  6bc048           imul ax, ax, 0x48                        
  1dbb  c45ef4           les bx, ptr [bp - 0xc]                   
  1dbe  03d8             add bx, ax                               
  1dc0  8b46fe           mov ax, word ptr [bp - 2]                
  1dc3  c1e003           shl ax, 3                                
  1dc6  03d8             add bx, ax                               
  1dc8  268b4716         mov ax, word ptr es:[bx + 0x16]          
  1dcc  c1e802           shr ax, 2                                
  1dcf  25ff00           and ax, 0xff                             
  1dd2  8bc8             mov cx, ax                               
  1dd4  8b5efe           mov bx, word ptr [bp - 2]                
  1dd7  d1e3             shl bx, 1                                
  1dd9  ffb73c2d         push word ptr [bx + 0x2d3c]              
  1ddd  8bdf             mov bx, di                               
  1ddf  d1e3             shl bx, 1                                
  1de1  ffb72a2d         push word ptr [bx + 0x2d2a]              
  1de5  1e               push ds                                  
  1de6  689567           push 0x6795                              
  1de9  bb6000           mov bx, 0x60                             
  1dec  99               cdq                                      
  1ded  f7fb             idiv bx                                  
  1def  bb1000           mov bx, 0x10                             
  1df2  8bc2             mov ax, dx                               
  1df4  99               cdq                                      
  1df5  f7fb             idiv bx                                  
  1df7  6bc028           imul ax, ax, 0x28                        
  1dfa  50               push ax                                  
  1dfb  8bc1             mov ax, cx                               
  1dfd  99               cdq                                      
  1dfe  f7fb             idiv bx                                  
  1e00  6bd228           imul dx, dx, 0x28                        
  1e03  52               push dx                                  
  1e04  1e               push ds                                  
  1e05  686e51           push 0x516e                              
  1e08  9a09002a05       lcall 0x52a, 9                           -> 052a:0009
  1e0d  83c410           add sp, 0x10                             
  1e10  46               inc si                                   
  1e11  3b76f2           cmp si, word ptr [bp - 0xe]              
  1e14  7d03             jge 0x1e19                               
  1e16  e95fff           jmp 0x1d78                               
  1e19  66833e785100     cmp dword ptr [0x5178], 0                
  1e1f  7428             je 0x1e49                                
  1e21  f706a3510a00     test word ptr [0x51a3], 0xa              
  1e27  7520             jne 0x1e49                               
  1e29  33f6             xor si, si                               
  1e2b  eb13             jmp 0x1e40                               
  1e2d  8bde             mov bx, si                               
  1e2f  c1e302           shl bx, 2                                
  1e32  66ffb77851       push dword ptr [bx + 0x5178]             
  1e37  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1e3c  83c404           add sp, 4                                
  1e3f  46               inc si                                   
  1e40  a0a251           mov al, byte ptr [0x51a2]                
  1e43  b400             mov ah, 0                                
  1e45  3bc6             cmp ax, si                               
  1e47  7fe4             jg 0x1e2d                                
  1e49  c45ef4           les bx, ptr [bp - 0xc]                   
  1e4c  268a879e02       mov al, byte ptr es:[bx + 0x29e]         
  1e51  c1e803           shr ax, 3                                
  1e54  250100           and ax, 1                                
  1e57  0bc0             or ax, ax                                
  1e59  7503             jne 0x1e5e                               
  1e5b  e9b400           jmp 0x1f12                               
  1e5e  33f6             xor si, si                               
  1e60  e9a700           jmp 0x1f0a                               
  1e63  8bde             mov bx, si                               
  1e65  c1e302           shl bx, 2                                
  1e68  8d86aefe         lea ax, [bp - 0x152]                     
  1e6c  03d8             add bx, ax                               
  1e6e  368b3f           mov di, word ptr ss:[bx]                 
  1e71  8bde             mov bx, si                               
  1e73  c1e302           shl bx, 2                                
  1e76  8d86b0fe         lea ax, [bp - 0x150]                     
  1e7a  03d8             add bx, ax                               
  1e7c  368b07           mov ax, word ptr ss:[bx]                 
  1e7f  8946fe           mov word ptr [bp - 2], ax                
  1e82  8bc7             mov ax, di                               
  1e84  6bc048           imul ax, ax, 0x48                        
  1e87  c45ef4           les bx, ptr [bp - 0xc]                   
  1e8a  03d8             add bx, ax                               
  1e8c  8b46fe           mov ax, word ptr [bp - 2]                
  1e8f  c1e003           shl ax, 3                                
  1e92  03d8             add bx, ax                               
  1e94  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  1e98  c1e805           shr ax, 5                                
  1e9b  250100           and ax, 1                                
  1e9e  0bc0             or ax, ax                                
  1ea0  7467             je 0x1f09                                
  1ea2  8bc7             mov ax, di                               
  1ea4  6bc048           imul ax, ax, 0x48                        
  1ea7  c45ef4           les bx, ptr [bp - 0xc]                   
  1eaa  03d8             add bx, ax                               
  1eac  8b46fe           mov ax, word ptr [bp - 2]                
  1eaf  c1e003           shl ax, 3                                
  1eb2  03d8             add bx, ax                               
  1eb4  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  1eb8  c1e806           shr ax, 6                                
  1ebb  251f00           and ax, 0x1f                             
  1ebe  8bc8             mov cx, ax                               
  1ec0  bb0d00           mov bx, 0xd                              
  1ec3  99               cdq                                      
  1ec4  f7fb             idiv bx                                  
  1ec6  6bc028           imul ax, ax, 0x28                        
  1ec9  8946fa           mov word ptr [bp - 6], ax                
  1ecc  8bc1             mov ax, cx                               
  1ece  99               cdq                                      
  1ecf  f7fb             idiv bx                                  
  1ed1  6bd230           imul dx, dx, 0x30                        
  1ed4  8956f8           mov word ptr [bp - 8], dx                
  1ed7  ff76fa           push word ptr [bp - 6]                   
  1eda  52               push dx                                  
  1edb  1e               push ds                                  
  1edc  689552           push 0x5295                              
  1edf  8b5efe           mov bx, word ptr [bp - 2]                
  1ee2  d1e3             shl bx, 1                                
  1ee4  ffb73c2d         push word ptr [bx + 0x2d3c]              
  1ee8  8bdf             mov bx, di                               
  1eea  d1e3             shl bx, 1                                
  1eec  ffb72a2d         push word ptr [bx + 0x2d2a]              
  1ef0  1e               push ds                                  
  1ef1  689567           push 0x6795                              
  1ef4  666830002800     push 0x280030                            
  1efa  ff76fa           push word ptr [bp - 6]                   
  1efd  52               push dx                                  
  1efe  1e               push ds                                  
  1eff  68d052           push 0x52d0                              
  1f02  ff1ec869         lcall [0x69c8]                           
  1f06  83c41c           add sp, 0x1c                             
  1f09  46               inc si                                   
  1f0a  3b76f2           cmp si, word ptr [bp - 0xe]              
  1f0d  7d03             jge 0x1f12                               
  1f0f  e951ff           jmp 0x1e63                               
  1f12  c45ef4           les bx, ptr [bp - 0xc]                   
  1f15  268a879e02       mov al, byte ptr es:[bx + 0x29e]         
  1f1a  c1e804           shr ax, 4                                
  1f1d  250100           and ax, 1                                
  1f20  0bc0             or ax, ax                                
  1f22  7479             je 0x1f9d                                
  1f24  33f6             xor si, si                               
  1f26  eb70             jmp 0x1f98                               
  1f28  8bde             mov bx, si                               
  1f2a  c1e302           shl bx, 2                                
  1f2d  8d86aefe         lea ax, [bp - 0x152]                     
  1f31  03d8             add bx, ax                               
  1f33  368b3f           mov di, word ptr ss:[bx]                 
  1f36  8bde             mov bx, si                               
  1f38  c1e302           shl bx, 2                                
  1f3b  8d86b0fe         lea ax, [bp - 0x150]                     
  1f3f  03d8             add bx, ax                               
  1f41  368b07           mov ax, word ptr ss:[bx]                 
  1f44  8946fe           mov word ptr [bp - 2], ax                
  1f47  8bc7             mov ax, di                               
  1f49  6bc048           imul ax, ax, 0x48                        
  1f4c  c45ef4           les bx, ptr [bp - 0xc]                   
  1f4f  03d8             add bx, ax                               
  1f51  8b46fe           mov ax, word ptr [bp - 2]                
  1f54  c1e003           shl ax, 3                                
  1f57  03d8             add bx, ax                               
  1f59  268a4719         mov al, byte ptr es:[bx + 0x19]          
  1f5d  c1e805           shr ax, 5                                
  1f60  250100           and ax, 1                                
  1f63  0bc0             or ax, ax                                
  1f65  7430             je 0x1f97                                
  1f67  666a00           push 0                                   
  1f6a  1e               push ds                                  
  1f6b  686c57           push 0x576c                              
  1f6e  8b5efe           mov bx, word ptr [bp - 2]                
  1f71  d1e3             shl bx, 1                                
  1f73  ffb73c2d         push word ptr [bx + 0x2d3c]              
  1f77  8bdf             mov bx, di                               
  1f79  d1e3             shl bx, 1                                
  1f7b  ffb72a2d         push word ptr [bx + 0x2d2a]              
  1f7f  1e               push ds                                  
  1f80  689567           push 0x6795                              
  1f83  666820001d00     push 0x1d0020                            
  1f89  666a00           push 0                                   
  1f8c  1e               push ds                                  
  1f8d  68a757           push 0x57a7                              
  1f90  ff1ec869         lcall [0x69c8]                           
  1f94  83c41c           add sp, 0x1c                             
  1f97  46               inc si                                   
  1f98  3b76f2           cmp si, word ptr [bp - 0xe]              
  1f9b  7c8b             jl 0x1f28                                
  1f9d  c45ef4           les bx, ptr [bp - 0xc]                   
  1fa0  268a879e02       mov al, byte ptr es:[bx + 0x29e]         
  1fa5  c1e802           shr ax, 2                                
  1fa8  250100           and ax, 1                                
  1fab  0bc0             or ax, ax                                
  1fad  7503             jne 0x1fb2                               
  1faf  e9a900           jmp 0x205b                               
  1fb2  33f6             xor si, si                               
  1fb4  e99c00           jmp 0x2053                               
  1fb7  8bde             mov bx, si                               
  1fb9  c1e302           shl bx, 2                                
  1fbc  8d86aefe         lea ax, [bp - 0x152]                     
  1fc0  03d8             add bx, ax                               
  1fc2  368b3f           mov di, word ptr ss:[bx]                 
  1fc5  8bde             mov bx, si                               
  1fc7  c1e302           shl bx, 2                                
  1fca  8d86b0fe         lea ax, [bp - 0x150]                     
  1fce  03d8             add bx, ax                               
  1fd0  368b07           mov ax, word ptr ss:[bx]                 
  1fd3  8946fe           mov word ptr [bp - 2], ax                
  1fd6  8bc7             mov ax, di                               
  1fd8  6bc048           imul ax, ax, 0x48                        
  1fdb  c45ef4           les bx, ptr [bp - 0xc]                   
  1fde  03d8             add bx, ax                               
  1fe0  8b46fe           mov ax, word ptr [bp - 2]                
  1fe3  c1e003           shl ax, 3                                
  1fe6  03d8             add bx, ax                               
  1fe8  268a471b         mov al, byte ptr es:[bx + 0x1b]          
  1fec  c1e803           shr ax, 3                                
  1fef  250100           and ax, 1                                
  1ff2  0bc0             or ax, ax                                
  1ff4  745c             je 0x2052                                
  1ff6  8bc7             mov ax, di                               
  1ff8  6bc048           imul ax, ax, 0x48                        
  1ffb  c45ef4           les bx, ptr [bp - 0xc]                   
  1ffe  03d8             add bx, ax                               
  2000  8b46fe           mov ax, word ptr [bp - 2]                
  2003  c1e003           shl ax, 3                                
  2006  03d8             add bx, ax                               
  2008  268a4718         mov al, byte ptr es:[bx + 0x18]          
  200c  c1e804           shr ax, 4                                
  200f  250f00           and ax, 0xf                              
  2012  8bc8             mov cx, ax                               
  2014  6a28             push 0x28                                
  2016  6bc030           imul ax, ax, 0x30                        
  2019  05c000           add ax, 0xc0                             
  201c  50               push ax                                  
  201d  1e               push ds                                  
  201e  689552           push 0x5295                              
  2021  8b5efe           mov bx, word ptr [bp - 2]                
  2024  d1e3             shl bx, 1                                
  2026  ffb73c2d         push word ptr [bx + 0x2d3c]              
  202a  8bdf             mov bx, di                               
  202c  d1e3             shl bx, 1                                
  202e  ffb72a2d         push word ptr [bx + 0x2d2a]              
  2032  1e               push ds                                  
  2033  689567           push 0x6795                              
  2036  666830002800     push 0x280030                            
  203c  6a28             push 0x28                                
  203e  8bc1             mov ax, cx                               
  2040  6bc030           imul ax, ax, 0x30                        
  2043  05c000           add ax, 0xc0                             
  2046  50               push ax                                  
  2047  1e               push ds                                  
  2048  68d052           push 0x52d0                              
  204b  ff1ec869         lcall [0x69c8]                           
  204f  83c41c           add sp, 0x1c                             
  2052  46               inc si                                   
  2053  3b76f2           cmp si, word ptr [bp - 0xe]              
  2056  7d03             jge 0x205b                               
  2058  e95cff           jmp 0x1fb7                               
  205b  c45ef4           les bx, ptr [bp - 0xc]                   
  205e  268a879e02       mov al, byte ptr es:[bx + 0x29e]         
  2063  c1e805           shr ax, 5                                
  2066  250100           and ax, 1                                
  2069  0bc0             or ax, ax                                
  206b  7479             je 0x20e6                                
  206d  33f6             xor si, si                               
  206f  eb70             jmp 0x20e1                               
  2071  8bde             mov bx, si                               
  2073  c1e302           shl bx, 2                                
  2076  8d86aefe         lea ax, [bp - 0x152]                     
  207a  03d8             add bx, ax                               
  207c  368b3f           mov di, word ptr ss:[bx]                 
  207f  8bde             mov bx, si                               
  2081  c1e302           shl bx, 2                                
  2084  8d86b0fe         lea ax, [bp - 0x150]                     
  2088  03d8             add bx, ax                               
  208a  368b07           mov ax, word ptr ss:[bx]                 
  208d  8946fe           mov word ptr [bp - 2], ax                
  2090  8bc7             mov ax, di                               
  2092  6bc048           imul ax, ax, 0x48                        
  2095  c45ef4           les bx, ptr [bp - 0xc]                   
  2098  03d8             add bx, ax                               
  209a  8b46fe           mov ax, word ptr [bp - 2]                
  209d  c1e003           shl ax, 3                                
  20a0  03d8             add bx, ax                               
  20a2  268a4719         mov al, byte ptr es:[bx + 0x19]          
  20a6  c1e806           shr ax, 6                                
  20a9  250100           and ax, 1                                
  20ac  0bc0             or ax, ax                                
  20ae  7430             je 0x20e0                                
  20b0  666a40           push 0x40                                
  20b3  1e               push ds                                  
  20b4  686c57           push 0x576c                              
  20b7  8b5efe           mov bx, word ptr [bp - 2]                
  20ba  d1e3             shl bx, 1                                
  20bc  ffb73c2d         push word ptr [bx + 0x2d3c]              
  20c0  8bdf             mov bx, di                               
  20c2  d1e3             shl bx, 1                                
  20c4  ffb72a2d         push word ptr [bx + 0x2d2a]              
  20c8  1e               push ds                                  
  20c9  689567           push 0x6795                              
  20cc  666820001d00     push 0x1d0020                            
  20d2  666a40           push 0x40                                
  20d5  1e               push ds                                  
  20d6  68a757           push 0x57a7                              
  20d9  ff1ec869         lcall [0x69c8]                           
  20dd  83c41c           add sp, 0x1c                             
  20e0  46               inc si                                   
  20e1  3b76f2           cmp si, word ptr [bp - 0xe]              
  20e4  7c8b             jl 0x2071                                
  20e6  c45ef4           les bx, ptr [bp - 0xc]                   
  20e9  268a879e02       mov al, byte ptr es:[bx + 0x29e]         
  20ee  c1e806           shr ax, 6                                
  20f1  250100           and ax, 1                                
  20f4  0bc0             or ax, ax                                
  20f6  7503             jne 0x20fb                               
  20f8  e99f00           jmp 0x219a                               
  20fb  33f6             xor si, si                               
  20fd  e99200           jmp 0x2192                               
  2100  8bde             mov bx, si                               
  2102  c1e302           shl bx, 2                                
  2105  8d86aefe         lea ax, [bp - 0x152]                     
  2109  03d8             add bx, ax                               
  210b  368b3f           mov di, word ptr ss:[bx]                 
  210e  8bde             mov bx, si                               
  2110  c1e302           shl bx, 2                                
  2113  8d86b0fe         lea ax, [bp - 0x150]                     
  2117  03d8             add bx, ax                               
  2119  368b07           mov ax, word ptr ss:[bx]                 
  211c  8946fe           mov word ptr [bp - 2], ax                
  211f  8bc7             mov ax, di                               
  2121  6bc048           imul ax, ax, 0x48                        
  2124  c45ef4           les bx, ptr [bp - 0xc]                   
  2127  03d8             add bx, ax                               
  2129  8b46fe           mov ax, word ptr [bp - 2]                
  212c  c1e003           shl ax, 3                                
  212f  03d8             add bx, ax                               
  2131  268a4719         mov al, byte ptr es:[bx + 0x19]          
  2135  250100           and ax, 1                                
  2138  0bc0             or ax, ax                                
  213a  7455             je 0x2191                                
  213c  6668a0011d00     push 0x1d01a0                            
  2142  1e               push ds                                  
  2143  68e54e           push 0x4ee5                              
  2146  8b5efe           mov bx, word ptr [bp - 2]                
  2149  d1e3             shl bx, 1                                
  214b  ffb73c2d         push word ptr [bx + 0x2d3c]              
  214f  8bdf             mov bx, di                               
  2151  d1e3             shl bx, 1                                
  2153  ffb72a2d         push word ptr [bx + 0x2d2a]              
  2157  1e               push ds                                  
  2158  689567           push 0x6795                              
  215b  666820001d00     push 0x1d0020                            
  2161  6668a0011d00     push 0x1d01a0                            
  2167  8bc7             mov ax, di                               
  2169  6bc048           imul ax, ax, 0x48                        
  216c  c45ef4           les bx, ptr [bp - 0xc]                   
  216f  03d8             add bx, ax                               
  2171  8b46fe           mov ax, word ptr [bp - 2]                
  2174  c1e003           shl ax, 3                                
  2177  03d8             add bx, ax                               
  2179  268a4719         mov al, byte ptr es:[bx + 0x19]          
  217d  d1e8             shr ax, 1                                
  217f  250f00           and ax, 0xf                              
  2182  6bc03b           imul ax, ax, 0x3b                        
  2185  05204f           add ax, 0x4f20                           
  2188  1e               push ds                                  
  2189  50               push ax                                  
  218a  ff1ec869         lcall [0x69c8]                           
  218e  83c41c           add sp, 0x1c                             
  2191  46               inc si                                   
  2192  3b76f2           cmp si, word ptr [bp - 0xe]              
  2195  7d03             jge 0x219a                               
  2197  e966ff           jmp 0x2100                               
  219a  c746fc0000       mov word ptr [bp - 4], 0                 
  219f  e91401           jmp 0x22b6                               
  21a2  8b46fc           mov ax, word ptr [bp - 4]                
  21a5  d1e0             shl ax, 1                                
  21a7  c45ef4           les bx, ptr [bp - 0xc]                   
  21aa  03d8             add bx, ax                               
  21ac  26837f0400       cmp word ptr es:[bx + 4], 0              
  21b1  7503             jne 0x21b6                               
  21b3  e9fd00           jmp 0x22b3                               
  21b6  33f6             xor si, si                               
  21b8  e9f000           jmp 0x22ab                               
  21bb  8bde             mov bx, si                               
  21bd  c1e302           shl bx, 2                                
  21c0  8d86aefe         lea ax, [bp - 0x152]                     
  21c4  03d8             add bx, ax                               
  21c6  368b3f           mov di, word ptr ss:[bx]                 
  21c9  8bde             mov bx, si                               
  21cb  c1e302           shl bx, 2                                
  21ce  8d86b0fe         lea ax, [bp - 0x150]                     
  21d2  03d8             add bx, ax                               
  21d4  368b07           mov ax, word ptr ss:[bx]                 
  21d7  8946fe           mov word ptr [bp - 2], ax                
  21da  8bc7             mov ax, di                               
  21dc  6bc048           imul ax, ax, 0x48                        
  21df  c45ef4           les bx, ptr [bp - 0xc]                   
  21e2  03d8             add bx, ax                               
  21e4  8b46fe           mov ax, word ptr [bp - 2]                
  21e7  c1e003           shl ax, 3                                
  21ea  03d8             add bx, ax                               
  21ec  268a471b         mov al, byte ptr es:[bx + 0x1b]          
  21f0  c1e803           shr ax, 3                                
  21f3  250100           and ax, 1                                
  21f6  0bc0             or ax, ax                                
  21f8  7423             je 0x221d                                
  21fa  8bc7             mov ax, di                               
  21fc  6bc048           imul ax, ax, 0x48                        
  21ff  8b5ef4           mov bx, word ptr [bp - 0xc]              
  2202  03d8             add bx, ax                               
  2204  8b46fe           mov ax, word ptr [bp - 2]                
  2207  c1e003           shl ax, 3                                
  220a  03d8             add bx, ax                               
  220c  268a471c         mov al, byte ptr es:[bx + 0x1c]          
  2210  c1e804           shr ax, 4                                
  2213  250100           and ax, 1                                
  2216  0bc0             or ax, ax                                
  2218  7503             jne 0x221d                               
  221a  e98d00           jmp 0x22aa                               
  221d  8bc7             mov ax, di                               
  221f  6bc048           imul ax, ax, 0x48                        
  2222  c45ef4           les bx, ptr [bp - 0xc]                   
  2225  03d8             add bx, ax                               
  2227  8b46fe           mov ax, word ptr [bp - 2]                
  222a  c1e003           shl ax, 3                                
  222d  03d8             add bx, ax                               
  222f  268b4717         mov ax, word ptr es:[bx + 0x17]          
  2233  c1e807           shr ax, 7                                
  2236  251f00           and ax, 0x1f                             
  2239  0bc0             or ax, ax                                
  223b  766d             jbe 0x22aa                               
  223d  8bc7             mov ax, di                               
  223f  6bc048           imul ax, ax, 0x48                        
  2242  8b5ef4           mov bx, word ptr [bp - 0xc]              
  2245  03d8             add bx, ax                               
  2247  8b46fe           mov ax, word ptr [bp - 2]                
  224a  c1e003           shl ax, 3                                
  224d  03d8             add bx, ax                               
  224f  268a4718         mov al, byte ptr es:[bx + 0x18]          
  2253  c1e804           shr ax, 4                                
  2256  250f00           and ax, 0xf                              
  2259  3b46fc           cmp ax, word ptr [bp - 4]                
  225c  754c             jne 0x22aa                               
  225e  ff76fe           push word ptr [bp - 2]                   
  2261  57               push di                                  
  2262  8bc7             mov ax, di                               
  2264  6bc048           imul ax, ax, 0x48                        
  2267  8b5ef4           mov bx, word ptr [bp - 0xc]              
  226a  03d8             add bx, ax                               
  226c  8b46fe           mov ax, word ptr [bp - 2]                
  226f  c1e003           shl ax, 3                                
  2272  03d8             add bx, ax                               
  2274  268b4717         mov ax, word ptr es:[bx + 0x17]          
  2278  c1e807           shr ax, 7                                
  227b  251f00           and ax, 0x1f                             
  227e  50               push ax                                  
  227f  8bc7             mov ax, di                               
  2281  6bc048           imul ax, ax, 0x48                        
  2284  8b5ef4           mov bx, word ptr [bp - 0xc]              
  2287  03d8             add bx, ax                               
  2289  8b46fe           mov ax, word ptr [bp - 2]                
  228c  c1e003           shl ax, 3                                
  228f  03d8             add bx, ax                               
  2291  268a4717         mov al, byte ptr es:[bx + 0x17]          
  2295  c1e802           shr ax, 2                                
  2298  251f00           and ax, 0x1f                             
  229b  50               push ax                                  
  229c  ff76fc           push word ptr [bp - 4]                   
  229f  1e               push ds                                  
  22a0  689567           push 0x6795                              
  22a3  0e               push cs                                  
  22a4  e88ee0           call 0x335                               
  22a7  83c40e           add sp, 0xe                              
  22aa  46               inc si                                   
  22ab  3b76f2           cmp si, word ptr [bp - 0xe]              
  22ae  7d03             jge 0x22b3                               
  22b0  e908ff           jmp 0x21bb                               
  22b3  ff46fc           inc word ptr [bp - 4]                    
  22b6  837efc09         cmp word ptr [bp - 4], 9                 
  22ba  7d03             jge 0x22bf                               
  22bc  e9e3fe           jmp 0x21a2                               
  22bf  c45ef4           les bx, ptr [bp - 0xc]                   
  22c2  268a879e02       mov al, byte ptr es:[bx + 0x29e]         
  22c7  c1e807           shr ax, 7                                
  22ca  250100           and ax, 1                                
  22cd  0bc0             or ax, ax                                
  22cf  7503             jne 0x22d4                               
  22d1  e9ba00           jmp 0x238e                               
  22d4  33f6             xor si, si                               
  22d6  e9ad00           jmp 0x2386                               
  22d9  8bde             mov bx, si                               
  22db  c1e302           shl bx, 2                                
  22de  8d86aefe         lea ax, [bp - 0x152]                     
  22e2  03d8             add bx, ax                               
  22e4  368b3f           mov di, word ptr ss:[bx]                 
  22e7  8bde             mov bx, si                               
  22e9  c1e302           shl bx, 2                                
  22ec  8d86b0fe         lea ax, [bp - 0x150]                     
  22f0  03d8             add bx, ax                               
  22f2  368b07           mov ax, word ptr ss:[bx]                 
  22f5  8946fe           mov word ptr [bp - 2], ax                
  22f8  8bc7             mov ax, di                               
  22fa  6bc048           imul ax, ax, 0x48                        
  22fd  c45ef4           les bx, ptr [bp - 0xc]                   
  2300  03d8             add bx, ax                               
  2302  8b46fe           mov ax, word ptr [bp - 2]                
  2305  c1e003           shl ax, 3                                
  2308  03d8             add bx, ax                               
  230a  268a471b         mov al, byte ptr es:[bx + 0x1b]          
  230e  c1e804           shr ax, 4                                
  2311  250300           and ax, 3                                
  2314  0bc0             or ax, ax                                
  2316  746d             je 0x2385                                
  2318  c746f8f001       mov word ptr [bp - 8], 0x1f0             
  231d  8bc7             mov ax, di                               
  231f  6bc048           imul ax, ax, 0x48                        
  2322  c45ef4           les bx, ptr [bp - 0xc]                   
  2325  03d8             add bx, ax                               
  2327  8b46fe           mov ax, word ptr [bp - 2]                
  232a  c1e003           shl ax, 3                                
  232d  03d8             add bx, ax                               
  232f  268a471b         mov al, byte ptr es:[bx + 0x1b]          
  2333  c1e804           shr ax, 4                                
  2336  250300           and ax, 3                                
  2339  3d0100           cmp ax, 1                                
  233c  7505             jne 0x2343                               
  233e  b81f00           mov ax, 0x1f                             
  2341  eb03             jmp 0x2346                               
  2343  b83000           mov ax, 0x30                             
  2346  8946fa           mov word ptr [bp - 6], ax                
  2349  50               push ax                                  
  234a  ff76f8           push word ptr [bp - 8]                   
  234d  1e               push ds                                  
  234e  681f52           push 0x521f                              
  2351  8b5efe           mov bx, word ptr [bp - 2]                
  2354  d1e3             shl bx, 1                                
  2356  8b873c2d         mov ax, word ptr [bx + 0x2d3c]           
  235a  050d00           add ax, 0xd                              
  235d  50               push ax                                  
  235e  8bdf             mov bx, di                               
  2360  d1e3             shl bx, 1                                
  2362  8b872a2d         mov ax, word ptr [bx + 0x2d2a]           
  2366  051000           add ax, 0x10                             
  2369  50               push ax                                  
  236a  1e               push ds                                  
  236b  689567           push 0x6795                              
  236e  666810000e00     push 0xe0010                             
  2374  ff76fa           push word ptr [bp - 6]                   
  2377  ff76f8           push word ptr [bp - 8]                   
  237a  1e               push ds                                  
  237b  685a52           push 0x525a                              
  237e  ff1ec869         lcall [0x69c8]                           
  2382  83c41c           add sp, 0x1c                             
  2385  46               inc si                                   
  2386  3b76f2           cmp si, word ptr [bp - 0xe]              
  2389  7d03             jge 0x238e                               
  238b  e94bff           jmp 0x22d9                               
  238e  c45ef4           les bx, ptr [bp - 0xc]                   
  2391  268a879f02       mov al, byte ptr es:[bx + 0x29f]         
  2396  250100           and ax, 1                                
  2399  0bc0             or ax, ax                                
  239b  7465             je 0x2402                                
  239d  268b8fa402       mov cx, word ptr es:[bx + 0x2a4]         
  23a2  8bc1             mov ax, cx                               
  23a4  bb1000           mov bx, 0x10                             
  23a7  99               cdq                                      
  23a8  f7fb             idiv bx                                  
  23aa  c1e205           shl dx, 5                                
  23ad  8956f8           mov word ptr [bp - 8], dx                
  23b0  8bc1             mov ax, cx                               
  23b2  99               cdq                                      
  23b3  f7fb             idiv bx                                  
  23b5  6bc01d           imul ax, ax, 0x1d                        
  23b8  8946fa           mov word ptr [bp - 6], ax                
  23bb  50               push ax                                  
  23bc  ff76f8           push word ptr [bp - 8]                   
  23bf  1e               push ds                                  
  23c0  681f52           push 0x521f                              
  23c3  8b5ef4           mov bx, word ptr [bp - 0xc]              
  23c6  268b9fa202       mov bx, word ptr es:[bx + 0x2a2]         
  23cb  d1e3             shl bx, 1                                
  23cd  8b873c2d         mov ax, word ptr [bx + 0x2d3c]           
  23d1  050500           add ax, 5                                
  23d4  50               push ax                                  
  23d5  8b5ef4           mov bx, word ptr [bp - 0xc]              
  23d8  268b9fa002       mov bx, word ptr es:[bx + 0x2a0]         
  23dd  d1e3             shl bx, 1                                
  23df  8b872a2d         mov ax, word ptr [bx + 0x2d2a]           
  23e3  050800           add ax, 8                                
  23e6  50               push ax                                  
  23e7  1e               push ds                                  
  23e8  689567           push 0x6795                              
  23eb  666820001d00     push 0x1d0020                            
  23f1  ff76fa           push word ptr [bp - 6]                   
  23f4  ff76f8           push word ptr [bp - 8]                   
  23f7  1e               push ds                                  
  23f8  685a52           push 0x525a                              
  23fb  ff1ec869         lcall [0x69c8]                           
  23ff  83c41c           add sp, 0x1c                             
  2402  b8042c           mov ax, 0x2c04                           
  2405  8ec0             mov es, ax                               
  2407  26833e240100     cmp word ptr es:[0x124], 0               
  240d  7503             jne 0x2412                               
  240f  e97d01           jmp 0x258f                               
  2412  66833e251600     cmp dword ptr [0x1625], 0                
  2418  7435             je 0x244f                                
  241a  f70650160a00     test word ptr [0x1650], 0xa              
  2420  752d             jne 0x244f                               
  2422  33f6             xor si, si                               
  2424  eb20             jmp 0x2446                               
  2426  8bde             mov bx, si                               
  2428  c1e302           shl bx, 2                                
  242b  66ffb72516       push dword ptr [bx + 0x1625]             
  2430  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  2435  83c404           add sp, 4                                
  2438  8bde             mov bx, si                               
  243a  c1e302           shl bx, 2                                
  243d  89973716         mov word ptr [bx + 0x1637], dx           
  2441  89873516         mov word ptr [bx + 0x1635], ax           
  2445  46               inc si                                   
  2446  a04f16           mov al, byte ptr [0x164f]                
  2449  b400             mov ah, 0                                
  244b  3bc6             cmp ax, si                               
  244d  7fd7             jg 0x2426                                
  244f  66833e285500     cmp dword ptr [0x5528], 0                
  2455  7435             je 0x248c                                
  2457  f70653550a00     test word ptr [0x5553], 0xa              
  245d  752d             jne 0x248c                               
  245f  33f6             xor si, si                               
  2461  eb20             jmp 0x2483                               
  2463  8bde             mov bx, si                               
  2465  c1e302           shl bx, 2                                
  2468  66ffb72855       push dword ptr [bx + 0x5528]             
  246d  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  2472  83c404           add sp, 4                                
  2475  8bde             mov bx, si                               
  2477  c1e302           shl bx, 2                                
  247a  89973a55         mov word ptr [bx + 0x553a], dx           
  247e  89873855         mov word ptr [bx + 0x5538], ax           
  2482  46               inc si                                   
  2483  a05255           mov al, byte ptr [0x5552]                
  2486  b400             mov ah, 0                                
  2488  3bc6             cmp ax, si                               
  248a  7fd7             jg 0x2463                                
  248c  33f6             xor si, si                               
  248e  e99600           jmp 0x2527                               
  2491  8bde             mov bx, si                               
  2493  c1e302           shl bx, 2                                
  2496  8d86aefe         lea ax, [bp - 0x152]                     
  249a  03d8             add bx, ax                               
  249c  368b3f           mov di, word ptr ss:[bx]                 
  249f  8bde             mov bx, si                               
  24a1  c1e302           shl bx, 2                                
  24a4  8d86b0fe         lea ax, [bp - 0x150]                     
  24a8  03d8             add bx, ax                               
  24aa  368b07           mov ax, word ptr ss:[bx]                 
  24ad  8946fe           mov word ptr [bp - 2], ax                
  24b0  8bc7             mov ax, di                               
  24b2  6bc048           imul ax, ax, 0x48                        
  24b5  c45ef4           les bx, ptr [bp - 0xc]                   
  24b8  03d8             add bx, ax                               
  24ba  8b46fe           mov ax, word ptr [bp - 2]                
  24bd  c1e003           shl ax, 3                                
  24c0  03d8             add bx, ax                               
  24c2  268a4719         mov al, byte ptr es:[bx + 0x19]          
  24c6  c1e807           shr ax, 7                                
  24c9  250100           and ax, 1                                
  24cc  0bc0             or ax, ax                                
  24ce  7456             je 0x2526                                
  24d0  8bc7             mov ax, di                               
  24d2  6bc048           imul ax, ax, 0x48                        
  24d5  c45ef4           les bx, ptr [bp - 0xc]                   
  24d8  03d8             add bx, ax                               
  24da  8b46fe           mov ax, word ptr [bp - 2]                
  24dd  c1e003           shl ax, 3                                
  24e0  03d8             add bx, ax                               
  24e2  268a4f1a         mov cl, byte ptr es:[bx + 0x1a]          
  24e6  83e11f           and cx, 0x1f                             
  24e9  8bc1             mov ax, cx                               
  24eb  bb0700           mov bx, 7                                
  24ee  99               cdq                                      
  24ef  f7fb             idiv bx                                  
  24f1  6bc029           imul ax, ax, 0x29                        
  24f4  50               push ax                                  
  24f5  8bc1             mov ax, cx                               
  24f7  99               cdq                                      
  24f8  f7fb             idiv bx                                  
  24fa  6bd230           imul dx, dx, 0x30                        
  24fd  52               push dx                                  
  24fe  1e               push ds                                  
  24ff  681e55           push 0x551e                              
  2502  8b5efe           mov bx, word ptr [bp - 2]                
  2505  d1e3             shl bx, 1                                
  2507  ffb73c2d         push word ptr [bx + 0x2d3c]              
  250b  8bdf             mov bx, di                               
  250d  d1e3             shl bx, 1                                
  250f  ffb72a2d         push word ptr [bx + 0x2d2a]              
  2513  1e               push ds                                  
  2514  689567           push 0x6795                              
  2517  666a00           push 0                                   
  251a  1e               push ds                                  
  251b  681b16           push 0x161b                              
  251e  9a7f012a05       lcall 0x52a, 0x17f                       -> 052a:017f
  2523  83c418           add sp, 0x18                             
  2526  46               inc si                                   
  2527  3b76f2           cmp si, word ptr [bp - 0xe]              
  252a  7d03             jge 0x252f                               
  252c  e962ff           jmp 0x2491                               
  252f  66833e285500     cmp dword ptr [0x5528], 0                
  2535  7428             je 0x255f                                
  2537  f70653550a00     test word ptr [0x5553], 0xa              
  253d  7520             jne 0x255f                               
  253f  33f6             xor si, si                               
  2541  eb13             jmp 0x2556                               
  2543  8bde             mov bx, si                               
  2545  c1e302           shl bx, 2                                
  2548  66ffb72855       push dword ptr [bx + 0x5528]             
  254d  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  2552  83c404           add sp, 4                                
  2555  46               inc si                                   
  2556  a05255           mov al, byte ptr [0x5552]                
  2559  b400             mov ah, 0                                
  255b  3bc6             cmp ax, si                               
  255d  7fe4             jg 0x2543                                
  255f  66833e251600     cmp dword ptr [0x1625], 0                
  2565  7428             je 0x258f                                
  2567  f70650160a00     test word ptr [0x1650], 0xa              
  256d  7520             jne 0x258f                               
  256f  33f6             xor si, si                               
  2571  eb13             jmp 0x2586                               
  2573  8bde             mov bx, si                               
  2575  c1e302           shl bx, 2                                
  2578  66ffb72516       push dword ptr [bx + 0x1625]             
  257d  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  2582  83c404           add sp, 4                                
  2585  46               inc si                                   
  2586  a04f16           mov al, byte ptr [0x164f]                
  2589  b400             mov ah, 0                                
  258b  3bc6             cmp ax, si                               
  258d  7fe4             jg 0x2573                                
  258f  5f               pop di                                   
  2590  5e               pop si                                   
  2591  c9               leave                                    
  2592  cb               retf                                     

ovl64_2593:  ; ENTRY
  2593  55               push bp                                  
  2594  8bec             mov bp, sp                               
  2596  b8042c           mov ax, 0x2c04                           
  2599  8ec0             mov es, ax                               
  259b  26a17d01         mov ax, word ptr es:[0x17d]              
  259f  a3255f           mov word ptr [0x5f25], ax                
  25a2  b8042c           mov ax, 0x2c04                           
  25a5  8ec0             mov es, ax                               
  25a7  26a17f01         mov ax, word ptr es:[0x17f]              
  25ab  a3275f           mov word ptr [0x5f27], ax                
  25ae  1e               push ds                                  
  25af  68255f           push 0x5f25                              
  25b2  90               nop                                      
  25b3  0e               push cs                                  
  25b4  e83500           call 0x25ec                              
  25b7  83c404           add sp, 4                                
  25ba  1e               push ds                                  
  25bb  68255f           push 0x5f25                              
  25be  90               nop                                      
  25bf  0e               push cs                                  
  25c0  e89301           call 0x2756                              
  25c3  83c404           add sp, 4                                
  25c6  1e               push ds                                  
  25c7  68255f           push 0x5f25                              
  25ca  90               nop                                      
  25cb  0e               push cs                                  
  25cc  e8b603           call 0x2985                              
  25cf  83c404           add sp, 4                                
  25d2  1e               push ds                                  
  25d3  68255f           push 0x5f25                              
  25d6  90               nop                                      
  25d7  0e               push cs                                  
  25d8  e8a107           call 0x2d7c                              
  25db  83c404           add sp, 4                                
  25de  1e               push ds                                  
  25df  68255f           push 0x5f25                              
  25e2  90               nop                                      
  25e3  0e               push cs                                  
  25e4  e80e09           call 0x2ef5                              
  25e7  83c404           add sp, 4                                
  25ea  5d               pop bp                                   
  25eb  cb               retf                                     

ovl64_25ec:  ; ENTRY
  25ec  55               push bp                                  
  25ed  8bec             mov bp, sp                               
  25ef  83ec1a           sub sp, 0x1a                             
  25f2  56               push si                                  
  25f3  57               push di                                  
  25f4  33c9             xor cx, cx                               
  25f6  eb2d             jmp 0x2625                               
  25f8  33d2             xor dx, dx                               
  25fa  eb23             jmp 0x261f                               
  25fc  8bd9             mov bx, cx                               
  25fe  6bdb1d           imul bx, bx, 0x1d                        
  2601  03da             add bx, dx                               
  2603  b8042c           mov ax, 0x2c04                           
  2606  8ec0             mov es, ax                               
  2608  2680bf0b0600     cmp byte ptr es:[bx + 0x60b], 0          
  260e  750e             jne 0x261e                               
  2610  8bd9             mov bx, cx                               
  2612  d1e3             shl bx, 1                                
  2614  8d46e6           lea ax, [bp - 0x1a]                      
  2617  03d8             add bx, ax                               
  2619  368917           mov word ptr ss:[bx], dx                 
  261c  eb06             jmp 0x2624                               
  261e  42               inc dx                                   
  261f  83fa1d           cmp dx, 0x1d                             
  2622  7cd8             jl 0x25fc                                
  2624  41               inc cx                                   
  2625  83f909           cmp cx, 9                                
  2628  7cce             jl 0x25f8                                
  262a  33d2             xor dx, dx                               
  262c  eb10             jmp 0x263e                               
  262e  8bc2             mov ax, dx                               
  2630  d1e0             shl ax, 1                                
  2632  c45e06           les bx, ptr [bp + 6]                     
  2635  03d8             add bx, ax                               
  2637  26c747040000     mov word ptr es:[bx + 4], 0              
  263d  42               inc dx                                   
  263e  83fa09           cmp dx, 9                                
  2641  7ceb             jl 0x262e                                
  2643  33f6             xor si, si                               
  2645  e9c900           jmp 0x2711                               
  2648  33ff             xor di, di                               
  264a  e9bb00           jmp 0x2708                               
  264d  8bc6             mov ax, si                               
  264f  6bc048           imul ax, ax, 0x48                        
  2652  8b5608           mov dx, word ptr [bp + 8]                
  2655  8b5e06           mov bx, word ptr [bp + 6]                
  2658  03d8             add bx, ax                               
  265a  8bc7             mov ax, di                               
  265c  c1e003           shl ax, 3                                
  265f  03d8             add bx, ax                               
  2661  83c316           add bx, 0x16                             
  2664  8956fe           mov word ptr [bp - 2], dx                
  2667  8bc2             mov ax, dx                               
  2669  895efc           mov word ptr [bp - 4], bx                
  266c  8bd3             mov dx, bx                               
  266e  8946fa           mov word ptr [bp - 6], ax                
  2671  8956f8           mov word ptr [bp - 8], dx                
  2674  8346f804         add word ptr [bp - 8], 4                 
  2678  c45ef8           les bx, ptr [bp - 8]                     
  267b  6626c70700000000 mov dword ptr es:[bx], 0                 
  2683  c45efc           les bx, ptr [bp - 4]                     
  2686  6626c70700000000 mov dword ptr es:[bx], 0                 
  268e  8bc6             mov ax, si                               
  2690  6bc048           imul ax, ax, 0x48                        
  2693  c45e06           les bx, ptr [bp + 6]                     
  2696  03d8             add bx, ax                               
  2698  8bc7             mov ax, di                               
  269a  c1e003           shl ax, 3                                
  269d  03d8             add bx, ax                               
  269f  26804f1601       or byte ptr es:[bx + 0x16], 1            
  26a4  b8042c           mov ax, 0x2c04                           
  26a7  8ec0             mov es, ax                               
  26a9  268b1e7501       mov bx, word ptr es:[0x175]              
  26ae  03df             add bx, di                               
  26b0  69dbe000         imul bx, bx, 0xe0                        
  26b4  8ec0             mov es, ax                               
  26b6  26a17701         mov ax, word ptr es:[0x177]              
  26ba  03c6             add ax, si                               
  26bc  d1e0             shl ax, 1                                
  26be  03d8             add bx, ax                               
  26c0  b81d1e           mov ax, 0x1e1d                           
  26c3  8ec0             mov es, ax                               
  26c5  268a8f0100       mov cl, byte ptr es:[bx + 1]             
  26ca  83e10f           and cx, 0xf                              
  26cd  83f908           cmp cx, 8                                
  26d0  7d04             jge 0x26d6                               
  26d2  8bc1             mov ax, cx                               
  26d4  eb03             jmp 0x26d9                               
  26d6  b80800           mov ax, 8                                
  26d9  8bc8             mov cx, ax                               
  26db  8bd9             mov bx, cx                               
  26dd  d1e3             shl bx, 1                                
  26df  8d46e6           lea ax, [bp - 0x1a]                      
  26e2  03d8             add bx, ax                               
  26e4  368b07           mov ax, word ptr ss:[bx]                 
  26e7  251f00           and ax, 0x1f                             
  26ea  8bd6             mov dx, si                               
  26ec  6bd248           imul dx, dx, 0x48                        
  26ef  c45e06           les bx, ptr [bp + 6]                     
  26f2  03da             add bx, dx                               
  26f4  8bd7             mov dx, di                               
  26f6  c1e203           shl dx, 3                                
  26f9  03da             add bx, dx                               
  26fb  2680671783       and byte ptr es:[bx + 0x17], 0x83        
  2700  c0e002           shl al, 2                                
  2703  26084717         or byte ptr es:[bx + 0x17], al           
  2707  47               inc di                                   
  2708  83ff09           cmp di, 9                                
  270b  7d03             jge 0x2710                               
  270d  e93dff           jmp 0x264d                               
  2710  46               inc si                                   
  2711  83fe09           cmp si, 9                                
  2714  7d03             jge 0x2719                               
  2716  e92fff           jmp 0x2648                               
  2719  c45e06           les bx, ptr [bp + 6]                     
  271c  26808f9e0201     or byte ptr es:[bx + 0x29e], 1           
  2722  2680a79e02fd     and byte ptr es:[bx + 0x29e], 0xfd       
  2728  2680a79e02fb     and byte ptr es:[bx + 0x29e], 0xfb       
  272e  2680a79e02f7     and byte ptr es:[bx + 0x29e], 0xf7       
  2734  2680a79e02ef     and byte ptr es:[bx + 0x29e], 0xef       
  273a  2680a79e02df     and byte ptr es:[bx + 0x29e], 0xdf       
  2740  2680a79e02bf     and byte ptr es:[bx + 0x29e], 0xbf       
  2746  2680a79e027f     and byte ptr es:[bx + 0x29e], 0x7f       
  274c  2680a79f02fe     and byte ptr es:[bx + 0x29f], 0xfe       
  2752  5f               pop di                                   
  2753  5e               pop si                                   
  2754  c9               leave                                    
  2755  cb               retf                                     

ovl64_2756:  ; ENTRY
  2756  55               push bp                                  
  2757  8bec             mov bp, sp                               
  2759  83ec02           sub sp, 2                                
  275c  56               push si                                  
  275d  57               push di                                  
  275e  b8042c           mov ax, 0x2c04                           
  2761  8ec0             mov es, ax                               
  2763  26833e240100     cmp word ptr es:[0x124], 0               
  2769  740a             je 0x2775                                
  276b  666aff           push -1                                  
  276e  0e               push cs                                  
  276f  e856ec           call 0x13c8                              
  2772  83c404           add sp, 4                                
  2775  33c9             xor cx, cx                               
  2777  b8042c           mov ax, 0x2c04                           
  277a  8ec0             mov es, ax                               
  277c  268b3e7701       mov di, word ptr es:[0x177]              
  2781  e9ee01           jmp 0x2972                               
  2784  33f6             xor si, si                               
  2786  b8042c           mov ax, 0x2c04                           
  2789  8ec0             mov es, ax                               
  278b  26a17501         mov ax, word ptr es:[0x175]              
  278f  8946fe           mov word ptr [bp - 2], ax                
  2792  e9ca01           jmp 0x295f                               
  2795  8b5efe           mov bx, word ptr [bp - 2]                
  2798  69dbe000         imul bx, bx, 0xe0                        
  279c  8bc7             mov ax, di                               
  279e  d1e0             shl ax, 1                                
  27a0  03d8             add bx, ax                               
  27a2  b81d1e           mov ax, 0x1e1d                           
  27a5  8ec0             mov es, ax                               
  27a7  268a970000       mov dl, byte ptr es:[bx]                 
  27ac  81e2ff00         and dx, 0xff                             
  27b0  83fa60           cmp dx, 0x60                             
  27b3  7c47             jl 0x27fc                                
  27b5  8bc2             mov ax, dx                               
  27b7  05a0ff           add ax, 0xffa0                           
  27ba  25ff00           and ax, 0xff                             
  27bd  8bd1             mov dx, cx                               
  27bf  6bd248           imul dx, dx, 0x48                        
  27c2  c45e06           les bx, ptr [bp + 6]                     
  27c5  03da             add bx, dx                               
  27c7  8bd6             mov dx, si                               
  27c9  c1e203           shl dx, 3                                
  27cc  03da             add bx, dx                               
  27ce  2681671603fc     and word ptr es:[bx + 0x16], 0xfc03      
  27d4  c1e002           shl ax, 2                                
  27d7  26094716         or word ptr es:[bx + 0x16], ax           
  27db  8bc1             mov ax, cx                               
  27dd  6bc048           imul ax, ax, 0x48                        
  27e0  8b5e06           mov bx, word ptr [bp + 6]                
  27e3  03d8             add bx, ax                               
  27e5  8bc6             mov ax, si                               
  27e7  c1e003           shl ax, 3                                
  27ea  03d8             add bx, ax                               
  27ec  26804f1602       or byte ptr es:[bx + 0x16], 2            
  27f1  8b5e06           mov bx, word ptr [bp + 6]                
  27f4  26808f9e0202     or byte ptr es:[bx + 0x29e], 2           
  27fa  eb23             jmp 0x281f                               
  27fc  8bc2             mov ax, dx                               
  27fe  25ff00           and ax, 0xff                             
  2801  8bd1             mov dx, cx                               
  2803  6bd248           imul dx, dx, 0x48                        
  2806  c45e06           les bx, ptr [bp + 6]                     
  2809  03da             add bx, dx                               
  280b  8bd6             mov dx, si                               
  280d  c1e203           shl dx, 3                                
  2810  03da             add bx, dx                               
  2812  2681671603fc     and word ptr es:[bx + 0x16], 0xfc03      
  2818  c1e002           shl ax, 2                                
  281b  26094716         or word ptr es:[bx + 0x16], ax           
  281f  8b5efe           mov bx, word ptr [bp - 2]                
  2822  69dbe000         imul bx, bx, 0xe0                        
  2826  8bc7             mov ax, di                               
  2828  d1e0             shl ax, 1                                
  282a  03d8             add bx, ax                               
  282c  b81d1e           mov ax, 0x1e1d                           
  282f  8ec0             mov es, ax                               
  2831  268a870100       mov al, byte ptr es:[bx + 1]             
  2836  c1e807           shr ax, 7                                
  2839  250100           and ax, 1                                
  283c  0bc0             or ax, ax                                
  283e  741f             je 0x285f                                
  2840  8bc1             mov ax, cx                               
  2842  6bc048           imul ax, ax, 0x48                        
  2845  c45e06           les bx, ptr [bp + 6]                     
  2848  03d8             add bx, ax                               
  284a  8bc6             mov ax, si                               
  284c  c1e003           shl ax, 3                                
  284f  03d8             add bx, ax                               
  2851  26804f1920       or byte ptr es:[bx + 0x19], 0x20         
  2856  8b5e06           mov bx, word ptr [bp + 6]                
  2859  26808f9e0210     or byte ptr es:[bx + 0x29e], 0x10        
  285f  8b5efe           mov bx, word ptr [bp - 2]                
  2862  69dbe000         imul bx, bx, 0xe0                        
  2866  8bc7             mov ax, di                               
  2868  d1e0             shl ax, 1                                
  286a  03d8             add bx, ax                               
  286c  b81d1e           mov ax, 0x1e1d                           
  286f  8ec0             mov es, ax                               
  2871  268a870100       mov al, byte ptr es:[bx + 1]             
  2876  c1e805           shr ax, 5                                
  2879  250100           and ax, 1                                
  287c  0bc0             or ax, ax                                
  287e  741f             je 0x289f                                
  2880  8bc1             mov ax, cx                               
  2882  6bc048           imul ax, ax, 0x48                        
  2885  c45e06           les bx, ptr [bp + 6]                     
  2888  03d8             add bx, ax                               
  288a  8bc6             mov ax, si                               
  288c  c1e003           shl ax, 3                                
  288f  03d8             add bx, ax                               
  2891  26804f1b08       or byte ptr es:[bx + 0x1b], 8            
  2896  8b5e06           mov bx, word ptr [bp + 6]                
  2899  26808f9e0204     or byte ptr es:[bx + 0x29e], 4           
  289f  8b5efe           mov bx, word ptr [bp - 2]                
  28a2  6bdb70           imul bx, bx, 0x70                        
  28a5  03df             add bx, di                               
  28a7  b8d919           mov ax, 0x19d9                           
  28aa  8ec0             mov es, ax                               
  28ac  268a870000       mov al, byte ptr es:[bx]                 
  28b1  251f00           and ax, 0x1f                             
  28b4  0bc0             or ax, ax                                
  28b6  7456             je 0x290e                                
  28b8  8bc1             mov ax, cx                               
  28ba  6bc048           imul ax, ax, 0x48                        
  28bd  c45e06           les bx, ptr [bp + 6]                     
  28c0  03d8             add bx, ax                               
  28c2  8bc6             mov ax, si                               
  28c4  c1e003           shl ax, 3                                
  28c7  03d8             add bx, ax                               
  28c9  26804f1a20       or byte ptr es:[bx + 0x1a], 0x20         
  28ce  8b5efe           mov bx, word ptr [bp - 2]                
  28d1  6bdb70           imul bx, bx, 0x70                        
  28d4  03df             add bx, di                               
  28d6  b8d919           mov ax, 0x19d9                           
  28d9  8ec0             mov es, ax                               
  28db  268a870000       mov al, byte ptr es:[bx]                 
  28e0  251f00           and ax, 0x1f                             
  28e3  48               dec ax                                   
  28e4  251f00           and ax, 0x1f                             
  28e7  8bd1             mov dx, cx                               
  28e9  6bd248           imul dx, dx, 0x48                        
  28ec  c45e06           les bx, ptr [bp + 6]                     
  28ef  03da             add bx, dx                               
  28f1  8bd6             mov dx, si                               
  28f3  c1e203           shl dx, 3                                
  28f6  03da             add bx, dx                               
  28f8  2681671a3ff8     and word ptr es:[bx + 0x1a], 0xf83f      
  28fe  c1e006           shl ax, 6                                
  2901  2609471a         or word ptr es:[bx + 0x1a], ax           
  2905  8b5e06           mov bx, word ptr [bp + 6]                
  2908  26808f9e0208     or byte ptr es:[bx + 0x29e], 8           
  290e  8bd9             mov bx, cx                               
  2910  6bdb09           imul bx, bx, 9                           
  2913  03de             add bx, si                               
  2915  80bfd45e00       cmp byte ptr [bx + 0x5ed4], 0            
  291a  7c3f             jl 0x295b                                
  291c  8bc1             mov ax, cx                               
  291e  6bc048           imul ax, ax, 0x48                        
  2921  c45e06           les bx, ptr [bp + 6]                     
  2924  03d8             add bx, ax                               
  2926  8bc6             mov ax, si                               
  2928  c1e003           shl ax, 3                                
  292b  03d8             add bx, ax                               
  292d  26804f1980       or byte ptr es:[bx + 0x19], 0x80         
  2932  8bd9             mov bx, cx                               
  2934  6bdb09           imul bx, bx, 9                           
  2937  03de             add bx, si                               
  2939  8a87d45e         mov al, byte ptr [bx + 0x5ed4]           
  293d  98               cwde                                     
  293e  251f00           and ax, 0x1f                             
  2941  8bd1             mov dx, cx                               
  2943  6bd248           imul dx, dx, 0x48                        
  2946  8b5e06           mov bx, word ptr [bp + 6]                
  2949  03da             add bx, dx                               
  294b  8bd6             mov dx, si                               
  294d  c1e203           shl dx, 3                                
  2950  03da             add bx, dx                               
  2952  2680671ae0       and byte ptr es:[bx + 0x1a], 0xe0        
  2957  2608471a         or byte ptr es:[bx + 0x1a], al           
  295b  ff46fe           inc word ptr [bp - 2]                    
  295e  46               inc si                                   
  295f  b8042c           mov ax, 0x2c04                           
  2962  8ec0             mov es, ax                               
  2964  26a17901         mov ax, word ptr es:[0x179]              
  2968  3b46fe           cmp ax, word ptr [bp - 2]                
  296b  7c03             jl 0x2970                                
  296d  e925fe           jmp 0x2795                               
  2970  47               inc di                                   
  2971  41               inc cx                                   
  2972  b8042c           mov ax, 0x2c04                           
  2975  8ec0             mov es, ax                               
  2977  26393e7b01       cmp word ptr es:[0x17b], di              
  297c  7c03             jl 0x2981                                
  297e  e903fe           jmp 0x2784                               
  2981  5f               pop di                                   
  2982  5e               pop si                                   
  2983  c9               leave                                    
  2984  cb               retf                                     

ovl64_2985:  ; ENTRY
  2985  55               push bp                                  
  2986  8bec             mov bp, sp                               
  2988  83ec02           sub sp, 2                                
  298b  56               push si                                  
  298c  57               push di                                  
  298d  b8042c           mov ax, 0x2c04                           
  2990  8ec0             mov es, ax                               
  2992  268b0e8101       mov cx, word ptr es:[0x181]              
  2997  e9a902           jmp 0x2c43                               
  299a  8bd9             mov bx, cx                               
  299c  6bdb16           imul bx, bx, 0x16                        
  299f  b81d1e           mov ax, 0x1e1d                           
  29a2  8ec0             mov es, ax                               
  29a4  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  29aa  7d03             jge 0x29af                               
  29ac  e99402           jmp 0x2c43                               
  29af  8bd9             mov bx, cx                               
  29b1  6bdb16           imul bx, bx, 0x16                        
  29b4  b81d1e           mov ax, 0x1e1d                           
  29b7  8ec0             mov es, ax                               
  29b9  2680bf8588ff     cmp byte ptr es:[bx - 0x777b], 0xff      
  29bf  7503             jne 0x29c4                               
  29c1  e97f02           jmp 0x2c43                               
  29c4  8bd9             mov bx, cx                               
  29c6  6bdb16           imul bx, bx, 0x16                        
  29c9  b81d1e           mov ax, 0x1e1d                           
  29cc  8ec0             mov es, ax                               
  29ce  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  29d3  ba042c           mov dx, 0x2c04                           
  29d6  8ec2             mov es, dx                               
  29d8  263b067501       cmp ax, word ptr es:[0x175]              
  29dd  7d03             jge 0x29e2                               
  29df  e96102           jmp 0x2c43                               
  29e2  8bd9             mov bx, cx                               
  29e4  6bdb16           imul bx, bx, 0x16                        
  29e7  b81d1e           mov ax, 0x1e1d                           
  29ea  8ec0             mov es, ax                               
  29ec  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  29f1  8ec2             mov es, dx                               
  29f3  263b067901       cmp ax, word ptr es:[0x179]              
  29f8  7e03             jle 0x29fd                               
  29fa  e94602           jmp 0x2c43                               
  29fd  8bd9             mov bx, cx                               
  29ff  6bdb16           imul bx, bx, 0x16                        
  2a02  b81d1e           mov ax, 0x1e1d                           
  2a05  8ec0             mov es, ax                               
  2a07  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  2a0c  8ec2             mov es, dx                               
  2a0e  263b067701       cmp ax, word ptr es:[0x177]              
  2a13  7d03             jge 0x2a18                               
  2a15  e92b02           jmp 0x2c43                               
  2a18  8bd9             mov bx, cx                               
  2a1a  6bdb16           imul bx, bx, 0x16                        
  2a1d  b81d1e           mov ax, 0x1e1d                           
  2a20  8ec0             mov es, ax                               
  2a22  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  2a27  8ec2             mov es, dx                               
  2a29  263b067b01       cmp ax, word ptr es:[0x17b]              
  2a2e  7e03             jle 0x2a33                               
  2a30  e91002           jmp 0x2c43                               
  2a33  8bd9             mov bx, cx                               
  2a35  6bdb16           imul bx, bx, 0x16                        
  2a38  b81d1e           mov ax, 0x1e1d                           
  2a3b  ba0000           mov dx, 0                                
  2a3e  81c28088         add dx, 0x8880                           
  2a42  03da             add bx, dx                               
  2a44  8ec0             mov es, ax                               
  2a46  268b07           mov ax, word ptr es:[bx]                 
  2a49  ba042c           mov dx, 0x2c04                           
  2a4c  8ec2             mov es, dx                               
  2a4e  262b067701       sub ax, word ptr es:[0x177]              
  2a53  8bf8             mov di, ax                               
  2a55  8bd9             mov bx, cx                               
  2a57  6bdb16           imul bx, bx, 0x16                        
  2a5a  b81d1e           mov ax, 0x1e1d                           
  2a5d  8ec0             mov es, ax                               
  2a5f  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  2a64  8ec2             mov es, dx                               
  2a66  262b067501       sub ax, word ptr es:[0x175]              
  2a6b  8946fe           mov word ptr [bp - 2], ax                
  2a6e  8bc7             mov ax, di                               
  2a70  6bc048           imul ax, ax, 0x48                        
  2a73  c45e06           les bx, ptr [bp + 6]                     
  2a76  03d8             add bx, ax                               
  2a78  8b46fe           mov ax, word ptr [bp - 2]                
  2a7b  c1e003           shl ax, 3                                
  2a7e  03d8             add bx, ax                               
  2a80  268b4717         mov ax, word ptr es:[bx + 0x17]          
  2a84  c1e807           shr ax, 7                                
  2a87  251f00           and ax, 0x1f                             
  2a8a  40               inc ax                                   
  2a8b  251f00           and ax, 0x1f                             
  2a8e  8bd7             mov dx, di                               
  2a90  6bd248           imul dx, dx, 0x48                        
  2a93  8b5e06           mov bx, word ptr [bp + 6]                
  2a96  03da             add bx, dx                               
  2a98  8b56fe           mov dx, word ptr [bp - 2]                
  2a9b  c1e203           shl dx, 3                                
  2a9e  03da             add bx, dx                               
  2aa0  268167177ff0     and word ptr es:[bx + 0x17], 0xf07f      
  2aa6  c1e007           shl ax, 7                                
  2aa9  26094717         or word ptr es:[bx + 0x17], ax           
  2aad  8bd9             mov bx, cx                               
  2aaf  6bdb16           imul bx, bx, 0x16                        
  2ab2  b81d1e           mov ax, 0x1e1d                           
  2ab5  8ec0             mov es, ax                               
  2ab7  2680bf85880f     cmp byte ptr es:[bx - 0x777b], 0xf       
  2abd  7505             jne 0x2ac4                               
  2abf  b80800           mov ax, 8                                
  2ac2  eb10             jmp 0x2ad4                               
  2ac4  8bd9             mov bx, cx                               
  2ac6  6bdb16           imul bx, bx, 0x16                        
  2ac9  b81d1e           mov ax, 0x1e1d                           
  2acc  8ec0             mov es, ax                               
  2ace  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  2ad3  98               cwde                                     
  2ad4  250f00           and ax, 0xf                              
  2ad7  8bd7             mov dx, di                               
  2ad9  6bd248           imul dx, dx, 0x48                        
  2adc  c45e06           les bx, ptr [bp + 6]                     
  2adf  03da             add bx, dx                               
  2ae1  8b56fe           mov dx, word ptr [bp - 2]                
  2ae4  c1e203           shl dx, 3                                
  2ae7  03da             add bx, dx                               
  2ae9  268067180f       and byte ptr es:[bx + 0x18], 0xf         
  2aee  c0e004           shl al, 4                                
  2af1  26084718         or byte ptr es:[bx + 0x18], al           
  2af5  8bc7             mov ax, di                               
  2af7  6bc048           imul ax, ax, 0x48                        
  2afa  8b5e06           mov bx, word ptr [bp + 6]                
  2afd  03d8             add bx, ax                               
  2aff  8b46fe           mov ax, word ptr [bp - 2]                
  2b02  c1e003           shl ax, 3                                
  2b05  03d8             add bx, ax                               
  2b07  268a5f18         mov bl, byte ptr es:[bx + 0x18]          
  2b0b  c1eb04           shr bx, 4                                
  2b0e  83e30f           and bx, 0xf                              
  2b11  6bdb1d           imul bx, bx, 0x1d                        
  2b14  8bf1             mov si, cx                               
  2b16  6bf616           imul si, si, 0x16                        
  2b19  b81d1e           mov ax, 0x1e1d                           
  2b1c  8ec0             mov es, ax                               
  2b1e  268a848488       mov al, byte ptr es:[si - 0x777c]        
  2b23  98               cwde                                     
  2b24  03d8             add bx, ax                               
  2b26  b8042c           mov ax, 0x2c04                           
  2b29  8ec0             mov es, ax                               
  2b2b  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  2b30  8bd7             mov dx, di                               
  2b32  6bd248           imul dx, dx, 0x48                        
  2b35  c45e06           les bx, ptr [bp + 6]                     
  2b38  03da             add bx, dx                               
  2b3a  8b56fe           mov dx, word ptr [bp - 2]                
  2b3d  c1e203           shl dx, 3                                
  2b40  03da             add bx, dx                               
  2b42  268a5f18         mov bl, byte ptr es:[bx + 0x18]          
  2b46  c1eb04           shr bx, 4                                
  2b49  83e30f           and bx, 0xf                              
  2b4c  6bdb1d           imul bx, bx, 0x1d                        
  2b4f  8bd7             mov dx, di                               
  2b51  6bd248           imul dx, dx, 0x48                        
  2b54  8b7606           mov si, word ptr [bp + 6]                
  2b57  03f2             add si, dx                               
  2b59  8b56fe           mov dx, word ptr [bp - 2]                
  2b5c  c1e203           shl dx, 3                                
  2b5f  03f2             add si, dx                               
  2b61  268a5417         mov dl, byte ptr es:[si + 0x17]          
  2b65  c1ea02           shr dx, 2                                
  2b68  83e21f           and dx, 0x1f                             
  2b6b  03da             add bx, dx                               
  2b6d  ba042c           mov dx, 0x2c04                           
  2b70  8ec2             mov es, dx                               
  2b72  263a870b06       cmp al, byte ptr es:[bx + 0x60b]         
  2b77  7e31             jle 0x2baa                               
  2b79  8bd9             mov bx, cx                               
  2b7b  6bdb16           imul bx, bx, 0x16                        
  2b7e  b81d1e           mov ax, 0x1e1d                           
  2b81  8ec0             mov es, ax                               
  2b83  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  2b88  98               cwde                                     
  2b89  251f00           and ax, 0x1f                             
  2b8c  8bd7             mov dx, di                               
  2b8e  6bd248           imul dx, dx, 0x48                        
  2b91  c45e06           les bx, ptr [bp + 6]                     
  2b94  03da             add bx, dx                               
  2b96  8b56fe           mov dx, word ptr [bp - 2]                
  2b99  c1e203           shl dx, 3                                
  2b9c  03da             add bx, dx                               
  2b9e  2680671783       and byte ptr es:[bx + 0x17], 0x83        
  2ba3  c0e002           shl al, 2                                
  2ba6  26084717         or byte ptr es:[bx + 0x17], al           
  2baa  8bd9             mov bx, cx                               
  2bac  6bdb16           imul bx, bx, 0x16                        
  2baf  b81d1e           mov ax, 0x1e1d                           
  2bb2  8ec0             mov es, ax                               
  2bb4  26f7878c880010   test word ptr es:[bx - 0x7774], 0x1000   
  2bbb  745d             je 0x2c1a                                
  2bbd  8bd9             mov bx, cx                               
  2bbf  6bdb16           imul bx, bx, 0x16                        
  2bc2  b81d1e           mov ax, 0x1e1d                           
  2bc5  ba0000           mov dx, 0                                
  2bc8  81c28088         add dx, 0x8880                           
  2bcc  03da             add bx, dx                               
  2bce  8ec0             mov es, ax                               
  2bd0  268b07           mov ax, word ptr es:[bx]                 
  2bd3  d1e0             shl ax, 1                                
  2bd5  8bd9             mov bx, cx                               
  2bd7  6bdb16           imul bx, bx, 0x16                        
  2bda  ba1d1e           mov dx, 0x1e1d                           
  2bdd  8ec2             mov es, dx                               
  2bdf  268b9f8288       mov bx, word ptr es:[bx - 0x777e]        
  2be4  69dbe000         imul bx, bx, 0xe0                        
  2be8  03d8             add bx, ax                               
  2bea  b81d1e           mov ax, 0x1e1d                           
  2bed  8ec0             mov es, ax                               
  2bef  268a870100       mov al, byte ptr es:[bx + 1]             
  2bf4  c1e807           shr ax, 7                                
  2bf7  250100           and ax, 1                                
  2bfa  0bc0             or ax, ax                                
  2bfc  751c             jne 0x2c1a                               
  2bfe  8bc7             mov ax, di                               
  2c00  6bc048           imul ax, ax, 0x48                        
  2c03  c45e06           les bx, ptr [bp + 6]                     
  2c06  03d8             add bx, ax                               
  2c08  8b46fe           mov ax, word ptr [bp - 2]                
  2c0b  c1e003           shl ax, 3                                
  2c0e  03d8             add bx, ax                               
  2c10  2680671783       and byte ptr es:[bx + 0x17], 0x83        
  2c15  26804f1714       or byte ptr es:[bx + 0x17], 0x14         
  2c1a  8bc7             mov ax, di                               
  2c1c  6bc048           imul ax, ax, 0x48                        
  2c1f  c45e06           les bx, ptr [bp + 6]                     
  2c22  03d8             add bx, ax                               
  2c24  8b46fe           mov ax, word ptr [bp - 2]                
  2c27  c1e003           shl ax, 3                                
  2c2a  03d8             add bx, ax                               
  2c2c  268a4718         mov al, byte ptr es:[bx + 0x18]          
  2c30  c1e804           shr ax, 4                                
  2c33  250f00           and ax, 0xf                              
  2c36  d1e0             shl ax, 1                                
  2c38  8b5e06           mov bx, word ptr [bp + 6]                
  2c3b  03d8             add bx, ax                               
  2c3d  26c747040100     mov word ptr es:[bx + 4], 1              
  2c43  8bc1             mov ax, cx                               
  2c45  49               dec cx                                   
  2c46  0bc0             or ax, ax                                
  2c48  7403             je 0x2c4d                                
  2c4a  e94dfd           jmp 0x299a                               
  2c4d  66833e625e00     cmp dword ptr [0x5e62], 0                
  2c53  7503             jne 0x2c58                               
  2c55  e92001           jmp 0x2d78                               
  2c58  c41e625e         les bx, ptr [0x5e62]                     
  2c5c  268b07           mov ax, word ptr es:[bx]                 
  2c5f  ba042c           mov dx, 0x2c04                           
  2c62  8ec2             mov es, dx                               
  2c64  263b067701       cmp ax, word ptr es:[0x177]              
  2c69  7d03             jge 0x2c6e                               
  2c6b  e90a01           jmp 0x2d78                               
  2c6e  8e06645e         mov es, word ptr [0x5e64]                
  2c72  8ec2             mov es, dx                               
  2c74  263b067b01       cmp ax, word ptr es:[0x17b]              
  2c79  7e03             jle 0x2c7e                               
  2c7b  e9fa00           jmp 0x2d78                               
  2c7e  8e06645e         mov es, word ptr [0x5e64]                
  2c82  268b4702         mov ax, word ptr es:[bx + 2]             
  2c86  8ec2             mov es, dx                               
  2c88  263b067501       cmp ax, word ptr es:[0x175]              
  2c8d  7d03             jge 0x2c92                               
  2c8f  e9e600           jmp 0x2d78                               
  2c92  8e06645e         mov es, word ptr [0x5e64]                
  2c96  8ec2             mov es, dx                               
  2c98  263b067901       cmp ax, word ptr es:[0x179]              
  2c9d  7e03             jle 0x2ca2                               
  2c9f  e9d600           jmp 0x2d78                               
  2ca2  8e06645e         mov es, word ptr [0x5e64]                
  2ca6  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  2cac  7405             je 0x2cb3                                
  2cae  b80500           mov ax, 5                                
  2cb1  eb09             jmp 0x2cbc                               
  2cb3  c41e625e         les bx, ptr [0x5e62]                     
  2cb7  268a4704         mov al, byte ptr es:[bx + 4]             
  2cbb  98               cwde                                     
  2cbc  251f00           and ax, 0x1f                             
  2cbf  c41e625e         les bx, ptr [0x5e62]                     
  2cc3  268b17           mov dx, word ptr es:[bx]                 
  2cc6  bb042c           mov bx, 0x2c04                           
  2cc9  8ec3             mov es, bx                               
  2ccb  262b167701       sub dx, word ptr es:[0x177]              
  2cd0  6bd248           imul dx, dx, 0x48                        
  2cd3  c45e06           les bx, ptr [bp + 6]                     
  2cd6  03da             add bx, dx                               
  2cd8  50               push ax                                  
  2cd9  06               push es                                  
  2cda  c436625e         les si, ptr [0x5e62]                     
  2cde  268b4402         mov ax, word ptr es:[si + 2]             
  2ce2  ba042c           mov dx, 0x2c04                           
  2ce5  8ec2             mov es, dx                               
  2ce7  262b067501       sub ax, word ptr es:[0x175]              
  2cec  c1e003           shl ax, 3                                
  2cef  03d8             add bx, ax                               
  2cf1  07               pop es                                   
  2cf2  2680671783       and byte ptr es:[bx + 0x17], 0x83        
  2cf7  58               pop ax                                   
  2cf8  c0e002           shl al, 2                                
  2cfb  26084717         or byte ptr es:[bx + 0x17], al           
  2cff  c41e625e         les bx, ptr [0x5e62]                     
  2d03  268b07           mov ax, word ptr es:[bx]                 
  2d06  8ec2             mov es, dx                               
  2d08  262b067701       sub ax, word ptr es:[0x177]              
  2d0d  6bc048           imul ax, ax, 0x48                        
  2d10  c45e06           les bx, ptr [bp + 6]                     
  2d13  03d8             add bx, ax                               
  2d15  06               push es                                  
  2d16  8e06645e         mov es, word ptr [0x5e64]                
  2d1a  268b4402         mov ax, word ptr es:[si + 2]             
  2d1e  8ec2             mov es, dx                               
  2d20  262b067501       sub ax, word ptr es:[0x175]              
  2d25  c1e003           shl ax, 3                                
  2d28  03d8             add bx, ax                               
  2d2a  07               pop es                                   
  2d2b  26804f1c10       or byte ptr es:[bx + 0x1c], 0x10         
  2d30  c41e625e         les bx, ptr [0x5e62]                     
  2d34  268a4705         mov al, byte ptr es:[bx + 5]             
  2d38  98               cwde                                     
  2d39  250f00           and ax, 0xf                              
  2d3c  268b17           mov dx, word ptr es:[bx]                 
  2d3f  bb042c           mov bx, 0x2c04                           
  2d42  8ec3             mov es, bx                               
  2d44  262b167701       sub dx, word ptr es:[0x177]              
  2d49  6bd248           imul dx, dx, 0x48                        
  2d4c  c45e06           les bx, ptr [bp + 6]                     
  2d4f  03da             add bx, dx                               
  2d51  50               push ax                                  
  2d52  06               push es                                  
  2d53  8e06645e         mov es, word ptr [0x5e64]                
  2d57  268b4402         mov ax, word ptr es:[si + 2]             
  2d5b  ba042c           mov dx, 0x2c04                           
  2d5e  8ec2             mov es, dx                               
  2d60  262b067501       sub ax, word ptr es:[0x175]              
  2d65  c1e003           shl ax, 3                                
  2d68  03d8             add bx, ax                               
  2d6a  07               pop es                                   
  2d6b  268067180f       and byte ptr es:[bx + 0x18], 0xf         
  2d70  58               pop ax                                   
  2d71  c0e004           shl al, 4                                
  2d74  26084718         or byte ptr es:[bx + 0x18], al           
  2d78  5f               pop di                                   
  2d79  5e               pop si                                   
  2d7a  c9               leave                                    
  2d7b  cb               retf                                     

ovl64_2d7c:  ; ENTRY
  2d7c  55               push bp                                  
  2d7d  8bec             mov bp, sp                               
  2d7f  83ec02           sub sp, 2                                
  2d82  56               push si                                  
  2d83  57               push di                                  
  2d84  b91600           mov cx, 0x16                             
  2d87  e95d01           jmp 0x2ee7                               
  2d8a  8bd9             mov bx, cx                               
  2d8c  6bdb1d           imul bx, bx, 0x1d                        
  2d8f  b8042c           mov ax, 0x2c04                           
  2d92  8ec0             mov es, ax                               
  2d94  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  2d9a  7403             je 0x2d9f                                
  2d9c  e94801           jmp 0x2ee7                               
  2d9f  8bd9             mov bx, cx                               
  2da1  6bdb1d           imul bx, bx, 0x1d                        
  2da4  b8042c           mov ax, 0x2c04                           
  2da7  8ec0             mov es, ax                               
  2da9  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  2dae  ba042c           mov dx, 0x2c04                           
  2db1  8ec2             mov es, dx                               
  2db3  263b067701       cmp ax, word ptr es:[0x177]              
  2db8  7d03             jge 0x2dbd                               
  2dba  e92a01           jmp 0x2ee7                               
  2dbd  8bd9             mov bx, cx                               
  2dbf  6bdb1d           imul bx, bx, 0x1d                        
  2dc2  b8042c           mov ax, 0x2c04                           
  2dc5  8ec0             mov es, ax                               
  2dc7  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  2dcc  8ec2             mov es, dx                               
  2dce  263b067b01       cmp ax, word ptr es:[0x17b]              
  2dd3  7e03             jle 0x2dd8                               
  2dd5  e90f01           jmp 0x2ee7                               
  2dd8  8bd9             mov bx, cx                               
  2dda  6bdb1d           imul bx, bx, 0x1d                        
  2ddd  b8042c           mov ax, 0x2c04                           
  2de0  8ec0             mov es, ax                               
  2de2  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  2de7  8ec2             mov es, dx                               
  2de9  263b067501       cmp ax, word ptr es:[0x175]              
  2dee  7d03             jge 0x2df3                               
  2df0  e9f400           jmp 0x2ee7                               
  2df3  8bd9             mov bx, cx                               
  2df5  6bdb1d           imul bx, bx, 0x1d                        
  2df8  b8042c           mov ax, 0x2c04                           
  2dfb  8ec0             mov es, ax                               
  2dfd  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  2e02  8ec2             mov es, dx                               
  2e04  263b067901       cmp ax, word ptr es:[0x179]              
  2e09  7e03             jle 0x2e0e                               
  2e0b  e9d900           jmp 0x2ee7                               
  2e0e  8bd9             mov bx, cx                               
  2e10  6bdb1d           imul bx, bx, 0x1d                        
  2e13  b8042c           mov ax, 0x2c04                           
  2e16  8ec0             mov es, ax                               
  2e18  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  2e1d  8ec2             mov es, dx                               
  2e1f  262b067701       sub ax, word ptr es:[0x177]              
  2e24  8bf0             mov si, ax                               
  2e26  8bd9             mov bx, cx                               
  2e28  6bdb1d           imul bx, bx, 0x1d                        
  2e2b  b8042c           mov ax, 0x2c04                           
  2e2e  8ec0             mov es, ax                               
  2e30  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  2e35  8ec2             mov es, dx                               
  2e37  262b067501       sub ax, word ptr es:[0x175]              
  2e3c  8bf8             mov di, ax                               
  2e3e  8bd9             mov bx, cx                               
  2e40  6bdb1d           imul bx, bx, 0x1d                        
  2e43  b8042c           mov ax, 0x2c04                           
  2e46  8ec0             mov es, ax                               
  2e48  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  2e4d  6bc070           imul ax, ax, 0x70                        
  2e50  8bd9             mov bx, cx                               
  2e52  6bdb1d           imul bx, bx, 0x1d                        
  2e55  ba042c           mov dx, 0x2c04                           
  2e58  8ec2             mov es, dx                               
  2e5a  260387020d       add ax, word ptr es:[bx + 0xd02]         
  2e5f  bad919           mov dx, 0x19d9                           
  2e62  8bd8             mov bx, ax                               
  2e64  8ec2             mov es, dx                               
  2e66  268a870000       mov al, byte ptr es:[bx]                 
  2e6b  c1e806           shr ax, 6                                
  2e6e  250100           and ax, 1                                
  2e71  8946fe           mov word ptr [bp - 2], ax                
  2e74  837efe00         cmp word ptr [bp - 2], 0                 
  2e78  744e             je 0x2ec8                                
  2e7a  8bc6             mov ax, si                               
  2e7c  6bc048           imul ax, ax, 0x48                        
  2e7f  c45e06           les bx, ptr [bp + 6]                     
  2e82  03d8             add bx, ax                               
  2e84  8bc7             mov ax, di                               
  2e86  c1e003           shl ax, 3                                
  2e89  03d8             add bx, ax                               
  2e8b  26804f1901       or byte ptr es:[bx + 0x19], 1            
  2e90  8bc1             mov ax, cx                               
  2e92  250f00           and ax, 0xf                              
  2e95  8bd6             mov dx, si                               
  2e97  6bd248           imul dx, dx, 0x48                        
  2e9a  8b5e06           mov bx, word ptr [bp + 6]                
  2e9d  03da             add bx, dx                               
  2e9f  8bd7             mov dx, di                               
  2ea1  c1e203           shl dx, 3                                
  2ea4  03da             add bx, dx                               
  2ea6  26806719e1       and byte ptr es:[bx + 0x19], 0xe1        
  2eab  d0e0             shl al, 1                                
  2ead  26084719         or byte ptr es:[bx + 0x19], al           
  2eb1  8b5e06           mov bx, word ptr [bp + 6]                
  2eb4  26808f9e0240     or byte ptr es:[bx + 0x29e], 0x40        
  2eba  8bc1             mov ax, cx                               
  2ebc  d1e0             shl ax, 1                                
  2ebe  03d8             add bx, ax                               
  2ec0  26c747040100     mov word ptr es:[bx + 4], 1              
  2ec6  eb1f             jmp 0x2ee7                               
  2ec8  8bc6             mov ax, si                               
  2eca  6bc048           imul ax, ax, 0x48                        
  2ecd  c45e06           les bx, ptr [bp + 6]                     
  2ed0  03d8             add bx, ax                               
  2ed2  8bc7             mov ax, di                               
  2ed4  c1e003           shl ax, 3                                
  2ed7  03d8             add bx, ax                               
  2ed9  26804f1940       or byte ptr es:[bx + 0x19], 0x40         
  2ede  8b5e06           mov bx, word ptr [bp + 6]                
  2ee1  26808f9e0220     or byte ptr es:[bx + 0x29e], 0x20        
  2ee7  8bc1             mov ax, cx                               
  2ee9  49               dec cx                                   
  2eea  0bc0             or ax, ax                                
  2eec  7403             je 0x2ef1                                
  2eee  e999fe           jmp 0x2d8a                               
  2ef1  5f               pop di                                   
  2ef2  5e               pop si                                   
  2ef3  c9               leave                                    
  2ef4  cb               retf                                     

ovl64_2ef5:  ; ENTRY
  2ef5  55               push bp                                  
  2ef6  8bec             mov bp, sp                               
  2ef8  83ec06           sub sp, 6                                
  2efb  56               push si                                  
  2efc  57               push di                                  
  2efd  66833e625e00     cmp dword ptr [0x5e62], 0                
  2f03  7503             jne 0x2f08                               
  2f05  e97401           jmp 0x307c                               
  2f08  833ea62e00       cmp word ptr [0x2ea6], 0                 
  2f0d  7f03             jg 0x2f12                                
  2f0f  e96a01           jmp 0x307c                               
  2f12  a1a82e           mov ax, word ptr [0x2ea8]                
  2f15  3b06a62e         cmp ax, word ptr [0x2ea6]                
  2f19  7c03             jl 0x2f1e                                
  2f1b  e95e01           jmp 0x307c                               
  2f1e  b8042c           mov ax, 0x2c04                           
  2f21  8ec0             mov es, ax                               
  2f23  26a17501         mov ax, word ptr es:[0x175]              
  2f27  8946fe           mov word ptr [bp - 2], ax                
  2f2a  b8042c           mov ax, 0x2c04                           
  2f2d  8ec0             mov es, ax                               
  2f2f  26a17901         mov ax, word ptr es:[0x179]              
  2f33  8946fa           mov word ptr [bp - 6], ax                
  2f36  b8042c           mov ax, 0x2c04                           
  2f39  8ec0             mov es, ax                               
  2f3b  268b3e7701       mov di, word ptr es:[0x177]              
  2f40  8ec0             mov es, ax                               
  2f42  26a17b01         mov ax, word ptr es:[0x17b]              
  2f46  8946fc           mov word ptr [bp - 4], ax                
  2f49  8b0ea82e         mov cx, word ptr [0x2ea8]                
  2f4d  eb7c             jmp 0x2fcb                               
  2f4f  8bd9             mov bx, cx                               
  2f51  c1e302           shl bx, 2                                
  2f54  39bf7564         cmp word ptr [bx + 0x6475], di           
  2f58  7c70             jl 0x2fca                                
  2f5a  8bd9             mov bx, cx                               
  2f5c  c1e302           shl bx, 2                                
  2f5f  8b877564         mov ax, word ptr [bx + 0x6475]           
  2f63  3b46fc           cmp ax, word ptr [bp - 4]                
  2f66  7f62             jg 0x2fca                                
  2f68  8bd9             mov bx, cx                               
  2f6a  c1e302           shl bx, 2                                
  2f6d  8b877764         mov ax, word ptr [bx + 0x6477]           
  2f71  3b46fe           cmp ax, word ptr [bp - 2]                
  2f74  7c54             jl 0x2fca                                
  2f76  8bd9             mov bx, cx                               
  2f78  c1e302           shl bx, 2                                
  2f7b  3b46fa           cmp ax, word ptr [bp - 6]                
  2f7e  7f4a             jg 0x2fca                                
  2f80  3b0eaa2e         cmp cx, word ptr [0x2eaa]                
  2f84  7d05             jge 0x2f8b                               
  2f86  b80100           mov ax, 1                                
  2f89  eb03             jmp 0x2f8e                               
  2f8b  b80200           mov ax, 2                                
  2f8e  250300           and ax, 3                                
  2f91  8bd9             mov bx, cx                               
  2f93  c1e302           shl bx, 2                                
  2f96  8b977564         mov dx, word ptr [bx + 0x6475]           
  2f9a  2bd7             sub dx, di                               
  2f9c  6bd248           imul dx, dx, 0x48                        
  2f9f  c45e06           les bx, ptr [bp + 6]                     
  2fa2  03da             add bx, dx                               
  2fa4  8bf1             mov si, cx                               
  2fa6  c1e602           shl si, 2                                
  2fa9  8b947764         mov dx, word ptr [si + 0x6477]           
  2fad  2b56fe           sub dx, word ptr [bp - 2]                
  2fb0  c1e203           shl dx, 3                                
  2fb3  03da             add bx, dx                               
  2fb5  2680671bcf       and byte ptr es:[bx + 0x1b], 0xcf        
  2fba  c0e004           shl al, 4                                
  2fbd  2608471b         or byte ptr es:[bx + 0x1b], al           
  2fc1  8b5e06           mov bx, word ptr [bp + 6]                
  2fc4  26808f9e0280     or byte ptr es:[bx + 0x29e], 0x80        
  2fca  41               inc cx                                   
  2fcb  a1a62e           mov ax, word ptr [0x2ea6]                
  2fce  48               dec ax                                   
  2fcf  3bc1             cmp ax, cx                               
  2fd1  7e03             jle 0x2fd6                               
  2fd3  e979ff           jmp 0x2f4f                               
  2fd6  393e7164         cmp word ptr [0x6471], di                
  2fda  7d03             jge 0x2fdf                               
  2fdc  e99d00           jmp 0x307c                               
  2fdf  a17164           mov ax, word ptr [0x6471]                
  2fe2  3b46fc           cmp ax, word ptr [bp - 4]                
  2fe5  7e03             jle 0x2fea                               
  2fe7  e99200           jmp 0x307c                               
  2fea  a17364           mov ax, word ptr [0x6473]                
  2fed  3b46fe           cmp ax, word ptr [bp - 2]                
  2ff0  7d03             jge 0x2ff5                               
  2ff2  e98700           jmp 0x307c                               
  2ff5  3b46fa           cmp ax, word ptr [bp - 6]                
  2ff8  7e03             jle 0x2ffd                               
  2ffa  e97f00           jmp 0x307c                               
  2ffd  a17164           mov ax, word ptr [0x6471]                
  3000  2bc7             sub ax, di                               
  3002  6bc048           imul ax, ax, 0x48                        
  3005  c45e06           les bx, ptr [bp + 6]                     
  3008  03d8             add bx, ax                               
  300a  a17364           mov ax, word ptr [0x6473]                
  300d  2b46fe           sub ax, word ptr [bp - 2]                
  3010  c1e003           shl ax, 3                                
  3013  03d8             add bx, ax                               
  3015  26804f1b40       or byte ptr es:[bx + 0x1b], 0x40         
  301a  c41e625e         les bx, ptr [0x5e62]                     
  301e  268a4704         mov al, byte ptr es:[bx + 4]             
  3022  98               cwde                                     
  3023  251f00           and ax, 0x1f                             
  3026  8b167164         mov dx, word ptr [0x6471]                
  302a  2bd7             sub dx, di                               
  302c  6bd248           imul dx, dx, 0x48                        
  302f  c45e06           les bx, ptr [bp + 6]                     
  3032  03da             add bx, dx                               
  3034  8b167364         mov dx, word ptr [0x6473]                
  3038  2b56fe           sub dx, word ptr [bp - 2]                
  303b  c1e203           shl dx, 3                                
  303e  03da             add bx, dx                               
  3040  2681671b7ff0     and word ptr es:[bx + 0x1b], 0xf07f      
  3046  c1e007           shl ax, 7                                
  3049  2609471b         or word ptr es:[bx + 0x1b], ax           
  304d  8b5e06           mov bx, word ptr [bp + 6]                
  3050  26808f9f0201     or byte ptr es:[bx + 0x29f], 1           
  3056  a17164           mov ax, word ptr [0x6471]                
  3059  2bc7             sub ax, di                               
  305b  268987a002       mov word ptr es:[bx + 0x2a0], ax         
  3060  a17364           mov ax, word ptr [0x6473]                
  3063  2b46fe           sub ax, word ptr [bp - 2]                
  3066  268987a202       mov word ptr es:[bx + 0x2a2], ax         
  306b  c41e625e         les bx, ptr [0x5e62]                     
  306f  268a4704         mov al, byte ptr es:[bx + 4]             
  3073  98               cwde                                     
  3074  c45e06           les bx, ptr [bp + 6]                     
  3077  268987a402       mov word ptr es:[bx + 0x2a4], ax         
  307c  5f               pop di                                   
  307d  5e               pop si                                   
  307e  c9               leave                                    
  307f  cb               retf                                     

ovl64_3080:  ; ENTRY
  3080  55               push bp                                  
  3081  8bec             mov bp, sp                               
  3083  56               push si                                  
  3084  57               push di                                  
  3085  a06964           mov al, byte ptr [0x6469]                
  3088  250100           and ax, 1                                
  308b  0bc0             or ax, ax                                
  308d  7503             jne 0x3092                               
  308f  e93704           jmp 0x34c9                               
  3092  8b5e06           mov bx, word ptr [bp + 6]                
  3095  83fb07           cmp bx, 7                                
  3098  7603             jbe 0x309d                               
  309a  e9fb02           jmp 0x3398                               
  309d  d1e3             shl bx, 1                                
  309f  2effa7dd34       jmp word ptr cs:[bx + 0x34dd]            
ovl64_30a4:  ; case
  30a4  33ff             xor di, di                               
  30a6  eb35             jmp 0x30dd                               
  30a8  33f6             xor si, si                               
  30aa  eb2b             jmp 0x30d7                               
  30ac  8bc6             mov ax, si                               
  30ae  6bc048           imul ax, ax, 0x48                        
  30b1  8bd7             mov dx, di                               
  30b3  c1e203           shl dx, 3                                
  30b6  03c2             add ax, dx                               
  30b8  05e161           add ax, 0x61e1                           
  30bb  1e               push ds                                  
  30bc  50               push ax                                  
  30bd  8bc6             mov ax, si                               
  30bf  6bc048           imul ax, ax, 0x48                        
  30c2  8bd7             mov dx, di                               
  30c4  c1e203           shl dx, 3                                
  30c7  03c2             add ax, dx                               
  30c9  05e961           add ax, 0x61e9                           
  30cc  1e               push ds                                  
  30cd  50               push ax                                  
  30ce  b90800           mov cx, 8                                
  30d1  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  30d6  46               inc si                                   
  30d7  83fe09           cmp si, 9                                
  30da  7cd0             jl 0x30ac                                
  30dc  47               inc di                                   
  30dd  83ff08           cmp di, 8                                
  30e0  7cc6             jl 0x30a8                                
  30e2  33f6             xor si, si                               
  30e4  eb0b             jmp 0x30f1                               
  30e6  8bde             mov bx, si                               
  30e8  6bdb48           imul bx, bx, 0x48                        
  30eb  80a72162fe       and byte ptr [bx + 0x6221], 0xfe         
  30f0  46               inc si                                   
  30f1  83fe09           cmp si, 9                                
  30f4  7cf0             jl 0x30e6                                
  30f6  e99f02           jmp 0x3398                               
ovl64_30f9:  ; case
  30f9  33ff             xor di, di                               
  30fb  eb35             jmp 0x3132                               
  30fd  be0800           mov si, 8                                
  3100  eb2b             jmp 0x312d                               
  3102  8bc6             mov ax, si                               
  3104  6bc048           imul ax, ax, 0x48                        
  3107  8bd7             mov dx, di                               
  3109  c1e203           shl dx, 3                                
  310c  03c2             add ax, dx                               
  310e  05e161           add ax, 0x61e1                           
  3111  1e               push ds                                  
  3112  50               push ax                                  
  3113  8bc6             mov ax, si                               
  3115  6bc048           imul ax, ax, 0x48                        
  3118  8bd7             mov dx, di                               
  311a  c1e203           shl dx, 3                                
  311d  03c2             add ax, dx                               
  311f  05a161           add ax, 0x61a1                           
  3122  1e               push ds                                  
  3123  50               push ax                                  
  3124  b90800           mov cx, 8                                
  3127  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  312c  4e               dec si                                   
  312d  0bf6             or si, si                                
  312f  7fd1             jg 0x3102                                
  3131  47               inc di                                   
  3132  83ff08           cmp di, 8                                
  3135  7cc6             jl 0x30fd                                
  3137  33f6             xor si, si                               
  3139  eb0b             jmp 0x3146                               
  313b  8bde             mov bx, si                               
  313d  6bdb48           imul bx, bx, 0x48                        
  3140  80a72162fe       and byte ptr [bx + 0x6221], 0xfe         
  3145  46               inc si                                   
  3146  83fe09           cmp si, 9                                
  3149  7cf0             jl 0x313b                                
  314b  33ff             xor di, di                               
  314d  eb0b             jmp 0x315a                               
  314f  8bdf             mov bx, di                               
  3151  c1e303           shl bx, 3                                
  3154  80a7e161fe       and byte ptr [bx + 0x61e1], 0xfe         
  3159  47               inc di                                   
  315a  83ff09           cmp di, 9                                
  315d  7cf0             jl 0x314f                                
  315f  e93602           jmp 0x3398                               
ovl64_3162:  ; case
  3162  be0800           mov si, 8                                
  3165  eb35             jmp 0x319c                               
  3167  33ff             xor di, di                               
  3169  eb2b             jmp 0x3196                               
  316b  8bc6             mov ax, si                               
  316d  6bc048           imul ax, ax, 0x48                        
  3170  8bd7             mov dx, di                               
  3172  c1e203           shl dx, 3                                
  3175  03c2             add ax, dx                               
  3177  05e161           add ax, 0x61e1                           
  317a  1e               push ds                                  
  317b  50               push ax                                  
  317c  8bc6             mov ax, si                               
  317e  6bc048           imul ax, ax, 0x48                        
  3181  8bd7             mov dx, di                               
  3183  c1e203           shl dx, 3                                
  3186  03c2             add ax, dx                               
  3188  059961           add ax, 0x6199                           
  318b  1e               push ds                                  
  318c  50               push ax                                  
  318d  b90800           mov cx, 8                                
  3190  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  3195  47               inc di                                   
  3196  83ff09           cmp di, 9                                
  3199  7cd0             jl 0x316b                                
  319b  4e               dec si                                   
  319c  0bf6             or si, si                                
  319e  7fc7             jg 0x3167                                
  31a0  33ff             xor di, di                               
  31a2  eb0b             jmp 0x31af                               
  31a4  8bdf             mov bx, di                               
  31a6  c1e303           shl bx, 3                                
  31a9  80a7e161fe       and byte ptr [bx + 0x61e1], 0xfe         
  31ae  47               inc di                                   
  31af  83ff09           cmp di, 9                                
  31b2  7cf0             jl 0x31a4                                
  31b4  e9e101           jmp 0x3398                               
ovl64_31b7:  ; case
  31b7  bf0800           mov di, 8                                
  31ba  eb35             jmp 0x31f1                               
  31bc  be0800           mov si, 8                                
  31bf  eb2b             jmp 0x31ec                               
  31c1  8bc6             mov ax, si                               
  31c3  6bc048           imul ax, ax, 0x48                        
  31c6  8bd7             mov dx, di                               
  31c8  c1e203           shl dx, 3                                
  31cb  03c2             add ax, dx                               
  31cd  05e161           add ax, 0x61e1                           
  31d0  1e               push ds                                  
  31d1  50               push ax                                  
  31d2  8bc6             mov ax, si                               
  31d4  6bc048           imul ax, ax, 0x48                        
  31d7  8bd7             mov dx, di                               
  31d9  c1e203           shl dx, 3                                
  31dc  03c2             add ax, dx                               
  31de  059161           add ax, 0x6191                           
  31e1  1e               push ds                                  
  31e2  50               push ax                                  
  31e3  b90800           mov cx, 8                                
  31e6  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  31eb  4e               dec si                                   
  31ec  0bf6             or si, si                                
  31ee  7fd1             jg 0x31c1                                
  31f0  4f               dec di                                   
  31f1  0bff             or di, di                                
  31f3  7fc7             jg 0x31bc                                
  31f5  33f6             xor si, si                               
  31f7  eb0b             jmp 0x3204                               
  31f9  8bde             mov bx, si                               
  31fb  6bdb48           imul bx, bx, 0x48                        
  31fe  80a7e161fe       and byte ptr [bx + 0x61e1], 0xfe         
  3203  46               inc si                                   
  3204  83fe09           cmp si, 9                                
  3207  7cf0             jl 0x31f9                                
  3209  33ff             xor di, di                               
  320b  eb0b             jmp 0x3218                               
  320d  8bdf             mov bx, di                               
  320f  c1e303           shl bx, 3                                
  3212  80a7e161fe       and byte ptr [bx + 0x61e1], 0xfe         
  3217  47               inc di                                   
  3218  83ff09           cmp di, 9                                
  321b  7cf0             jl 0x320d                                
  321d  e97801           jmp 0x3398                               
ovl64_3220:  ; case
  3220  bf0800           mov di, 8                                
  3223  eb35             jmp 0x325a                               
  3225  33f6             xor si, si                               
  3227  eb2b             jmp 0x3254                               
  3229  8bc6             mov ax, si                               
  322b  6bc048           imul ax, ax, 0x48                        
  322e  8bd7             mov dx, di                               
  3230  c1e203           shl dx, 3                                
  3233  03c2             add ax, dx                               
  3235  05e161           add ax, 0x61e1                           
  3238  1e               push ds                                  
  3239  50               push ax                                  
  323a  8bc6             mov ax, si                               
  323c  6bc048           imul ax, ax, 0x48                        
  323f  8bd7             mov dx, di                               
  3241  c1e203           shl dx, 3                                
  3244  03c2             add ax, dx                               
  3246  05d961           add ax, 0x61d9                           
  3249  1e               push ds                                  
  324a  50               push ax                                  
  324b  b90800           mov cx, 8                                
  324e  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  3253  46               inc si                                   
  3254  83fe09           cmp si, 9                                
  3257  7cd0             jl 0x3229                                
  3259  4f               dec di                                   
  325a  0bff             or di, di                                
  325c  7fc7             jg 0x3225                                
  325e  33f6             xor si, si                               
  3260  eb0b             jmp 0x326d                               
  3262  8bde             mov bx, si                               
  3264  6bdb48           imul bx, bx, 0x48                        
  3267  80a7e161fe       and byte ptr [bx + 0x61e1], 0xfe         
  326c  46               inc si                                   
  326d  83fe09           cmp si, 9                                
  3270  7cf0             jl 0x3262                                
  3272  e92301           jmp 0x3398                               
ovl64_3275:  ; case
  3275  bf0800           mov di, 8                                
  3278  eb35             jmp 0x32af                               
  327a  33f6             xor si, si                               
  327c  eb2b             jmp 0x32a9                               
  327e  8bc6             mov ax, si                               
  3280  6bc048           imul ax, ax, 0x48                        
  3283  8bd7             mov dx, di                               
  3285  c1e203           shl dx, 3                                
  3288  03c2             add ax, dx                               
  328a  05e161           add ax, 0x61e1                           
  328d  1e               push ds                                  
  328e  50               push ax                                  
  328f  8bc6             mov ax, si                               
  3291  6bc048           imul ax, ax, 0x48                        
  3294  8bd7             mov dx, di                               
  3296  c1e203           shl dx, 3                                
  3299  03c2             add ax, dx                               
  329b  052162           add ax, 0x6221                           
  329e  1e               push ds                                  
  329f  50               push ax                                  
  32a0  b90800           mov cx, 8                                
  32a3  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  32a8  46               inc si                                   
  32a9  83fe08           cmp si, 8                                
  32ac  7cd0             jl 0x327e                                
  32ae  4f               dec di                                   
  32af  0bff             or di, di                                
  32b1  7fc7             jg 0x327a                                
  32b3  33f6             xor si, si                               
  32b5  eb0b             jmp 0x32c2                               
  32b7  8bde             mov bx, si                               
  32b9  6bdb48           imul bx, bx, 0x48                        
  32bc  80a7e161fe       and byte ptr [bx + 0x61e1], 0xfe         
  32c1  46               inc si                                   
  32c2  83fe09           cmp si, 9                                
  32c5  7cf0             jl 0x32b7                                
  32c7  33ff             xor di, di                               
  32c9  eb0b             jmp 0x32d6                               
  32cb  8bdf             mov bx, di                               
  32cd  c1e303           shl bx, 3                                
  32d0  80a72164fe       and byte ptr [bx + 0x6421], 0xfe         
  32d5  47               inc di                                   
  32d6  83ff09           cmp di, 9                                
  32d9  7cf0             jl 0x32cb                                
  32db  e9ba00           jmp 0x3398                               
ovl64_32de:  ; case
  32de  33f6             xor si, si                               
  32e0  eb35             jmp 0x3317                               
  32e2  33ff             xor di, di                               
  32e4  eb2b             jmp 0x3311                               
  32e6  8bc6             mov ax, si                               
  32e8  6bc048           imul ax, ax, 0x48                        
  32eb  8bd7             mov dx, di                               
  32ed  c1e203           shl dx, 3                                
  32f0  03c2             add ax, dx                               
  32f2  05e161           add ax, 0x61e1                           
  32f5  1e               push ds                                  
  32f6  50               push ax                                  
  32f7  8bc6             mov ax, si                               
  32f9  6bc048           imul ax, ax, 0x48                        
  32fc  8bd7             mov dx, di                               
  32fe  c1e203           shl dx, 3                                
  3301  03c2             add ax, dx                               
  3303  052962           add ax, 0x6229                           
  3306  1e               push ds                                  
  3307  50               push ax                                  
  3308  b90800           mov cx, 8                                
  330b  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  3310  47               inc di                                   
  3311  83ff09           cmp di, 9                                
  3314  7cd0             jl 0x32e6                                
  3316  46               inc si                                   
  3317  83fe08           cmp si, 8                                
  331a  7cc6             jl 0x32e2                                
  331c  33ff             xor di, di                               
  331e  eb0b             jmp 0x332b                               
  3320  8bdf             mov bx, di                               
  3322  c1e303           shl bx, 3                                
  3325  80a72164fe       and byte ptr [bx + 0x6421], 0xfe         
  332a  47               inc di                                   
  332b  83ff09           cmp di, 9                                
  332e  7cf0             jl 0x3320                                
  3330  eb66             jmp 0x3398                               
ovl64_3332:  ; case
  3332  33f6             xor si, si                               
  3334  eb35             jmp 0x336b                               
  3336  33ff             xor di, di                               
  3338  eb2b             jmp 0x3365                               
  333a  8bc6             mov ax, si                               
  333c  6bc048           imul ax, ax, 0x48                        
  333f  8bd7             mov dx, di                               
  3341  c1e203           shl dx, 3                                
  3344  03c2             add ax, dx                               
  3346  05e161           add ax, 0x61e1                           
  3349  1e               push ds                                  
  334a  50               push ax                                  
  334b  8bc6             mov ax, si                               
  334d  6bc048           imul ax, ax, 0x48                        
  3350  8bd7             mov dx, di                               
  3352  c1e203           shl dx, 3                                
  3355  03c2             add ax, dx                               
  3357  053162           add ax, 0x6231                           
  335a  1e               push ds                                  
  335b  50               push ax                                  
  335c  b90800           mov cx, 8                                
  335f  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  3364  47               inc di                                   
  3365  83ff09           cmp di, 9                                
  3368  7cd0             jl 0x333a                                
  336a  46               inc si                                   
  336b  83fe08           cmp si, 8                                
  336e  7cc6             jl 0x3336                                
  3370  33ff             xor di, di                               
  3372  eb0b             jmp 0x337f                               
  3374  8bdf             mov bx, di                               
  3376  c1e303           shl bx, 3                                
  3379  80a72164fe       and byte ptr [bx + 0x6421], 0xfe         
  337e  47               inc di                                   
  337f  83ff09           cmp di, 9                                
  3382  7cf0             jl 0x3374                                
  3384  33f6             xor si, si                               
  3386  eb0b             jmp 0x3393                               
  3388  8bde             mov bx, si                               
  338a  6bdb48           imul bx, bx, 0x48                        
  338d  80a72162fe       and byte ptr [bx + 0x6221], 0xfe         
  3392  46               inc si                                   
  3393  83fe09           cmp si, 9                                
  3396  7cf0             jl 0x3388                                
  3398  8b5e06           mov bx, word ptr [bp + 6]                
  339b  83fb07           cmp bx, 7                                
  339e  7603             jbe 0x33a3                               
  33a0  e92601           jmp 0x34c9                               
  33a3  d1e3             shl bx, 1                                
  33a5  2effa7cd34       jmp word ptr cs:[bx + 0x34cd]            
ovl64_33aa:  ; case
  33aa  666a00           push 0                                   
  33ad  1e               push ds                                  
  33ae  689567           push 0x6795                              
  33b1  666868014001     push 0x1400168                           
  33b7  666800002800     push 0x280000                            
  33bd  1e               push ds                                  
  33be  689567           push 0x6795                              
  33c1  ff1ed469         lcall [0x69d4]                           
  33c5  83c414           add sp, 0x14                             
  33c8  e9fe00           jmp 0x34c9                               
ovl64_33cb:  ; case
  33cb  666a28           push 0x28                                
  33ce  1e               push ds                                  
  33cf  689567           push 0x6795                              
  33d2  666840014001     push 0x1400140                           
  33d8  ebdd             jmp 0x33b7                               
ovl64_33da:  ; case
  33da  be0800           mov si, 8                                
  33dd  eb27             jmp 0x3406                               
  33df  6a00             push 0                                   
  33e1  8bc6             mov ax, si                               
  33e3  6bc028           imul ax, ax, 0x28                        
  33e6  50               push ax                                  
  33e7  1e               push ds                                  
  33e8  689567           push 0x6795                              
  33eb  666828006801     push 0x1680028                           
  33f1  6a00             push 0                                   
  33f3  8bc6             mov ax, si                               
  33f5  48               dec ax                                   
  33f6  6bc028           imul ax, ax, 0x28                        
  33f9  50               push ax                                  
  33fa  1e               push ds                                  
  33fb  689567           push 0x6795                              
  33fe  ff1ed469         lcall [0x69d4]                           
  3402  83c414           add sp, 0x14                             
  3405  4e               dec si                                   
  3406  0bf6             or si, si                                
  3408  7fd5             jg 0x33df                                
  340a  e9bc00           jmp 0x34c9                               
ovl64_340d:  ; case
  340d  be0800           mov si, 8                                
  3410  eb27             jmp 0x3439                               
  3412  6a28             push 0x28                                
  3414  8bc6             mov ax, si                               
  3416  6bc028           imul ax, ax, 0x28                        
  3419  50               push ax                                  
  341a  1e               push ds                                  
  341b  689567           push 0x6795                              
  341e  666828004001     push 0x1400028                           
  3424  6a00             push 0                                   
  3426  8bc6             mov ax, si                               
  3428  48               dec ax                                   
  3429  6bc028           imul ax, ax, 0x28                        
  342c  50               push ax                                  
  342d  1e               push ds                                  
  342e  689567           push 0x6795                              
  3431  ff1ed469         lcall [0x69d4]                           
  3435  83c414           add sp, 0x14                             
  3438  4e               dec si                                   
  3439  0bf6             or si, si                                
  343b  7fd5             jg 0x3412                                
  343d  e98900           jmp 0x34c9                               
ovl64_3440:  ; case
  3440  bf0800           mov di, 8                                
  3443  eb27             jmp 0x346c                               
  3445  8bc7             mov ax, di                               
  3447  6bc028           imul ax, ax, 0x28                        
  344a  50               push ax                                  
  344b  6a00             push 0                                   
  344d  1e               push ds                                  
  344e  689567           push 0x6795                              
  3451  666868012800     push 0x280168                            
  3457  8bc7             mov ax, di                               
  3459  48               dec ax                                   
  345a  6bc028           imul ax, ax, 0x28                        
  345d  50               push ax                                  
  345e  6a00             push 0                                   
  3460  1e               push ds                                  
  3461  689567           push 0x6795                              
  3464  ff1ed469         lcall [0x69d4]                           
  3468  83c414           add sp, 0x14                             
  346b  4f               dec di                                   
  346c  0bff             or di, di                                
  346e  7fd5             jg 0x3445                                
  3470  eb57             jmp 0x34c9                               
ovl64_3472:  ; case
  3472  bf0800           mov di, 8                                
  3475  eb27             jmp 0x349e                               
  3477  8bc7             mov ax, di                               
  3479  6bc028           imul ax, ax, 0x28                        
  347c  50               push ax                                  
  347d  6a00             push 0                                   
  347f  1e               push ds                                  
  3480  689567           push 0x6795                              
  3483  666840012800     push 0x280140                            
  3489  8bc7             mov ax, di                               
  348b  48               dec ax                                   
  348c  6bc028           imul ax, ax, 0x28                        
  348f  50               push ax                                  
  3490  6a28             push 0x28                                
  3492  1e               push ds                                  
  3493  689567           push 0x6795                              
  3496  ff1ed469         lcall [0x69d4]                           
  349a  83c414           add sp, 0x14                             
  349d  4f               dec di                                   
  349e  0bff             or di, di                                
  34a0  7fd5             jg 0x3477                                
  34a2  eb25             jmp 0x34c9                               
ovl64_34a4:  ; case
  34a4  666a00           push 0                                   
  34a7  1e               push ds                                  
  34a8  689567           push 0x6795                              
  34ab  666840016801     push 0x1680140                           
  34b1  6a00             push 0                                   
  34b3  eb0f             jmp 0x34c4                               
ovl64_34b5:  ; case
  34b5  666a00           push 0                                   
  34b8  1e               push ds                                  
  34b9  689567           push 0x6795                              
  34bc  666840014001     push 0x1400140                           
  34c2  6a28             push 0x28                                
  34c4  6a28             push 0x28                                
  34c6  e9f4fe           jmp 0x33bd                               
  34c9  5f               pop di                                   
  34ca  5e               pop si                                   
  34cb  5d               pop bp                                   
  34cc  cb               retf                                     
  34cd  aa33cb33da330d34 dw 33aa,33cb,33da,340d,3440,3472,34a4,34b5,30a4,30f9,3162,31b7,3220,3275,32de,3332 jump table
