; ovl36 stub 3024 file_off 0x5be00 size 0x2674

ovl36_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec0e           sub sp, 0xe                              
  0006  56               push si                                  
  0007  57               push di                                  
  0008  8b7606           mov si, word ptr [bp + 6]                
  000b  8bc6             mov ax, si                               
  000d  a35e41           mov word ptr [0x415e], ax                
  0010  8b7e08           mov di, word ptr [bp + 8]                
  0013  8bc7             mov ax, di                               
  0015  a35c41           mov word ptr [0x415c], ax                
  0018  66833e625e00     cmp dword ptr [0x5e62], 0                
  001e  7503             jne 0x23                                 
  0020  e9d004           jmp 0x4f3                                
  0023  8bdf             mov bx, di                               
  0025  69dbe000         imul bx, bx, 0xe0                        
  0029  8bc6             mov ax, si                               
  002b  d1e0             shl ax, 1                                
  002d  03d8             add bx, ax                               
  002f  b81d1e           mov ax, 0x1e1d                           
  0032  8ec0             mov es, ax                               
  0034  268a870000       mov al, byte ptr es:[bx]                 
  0039  25ff00           and ax, 0xff                             
  003c  8946fa           mov word ptr [bp - 6], ax                
  003f  833efc5d02       cmp word ptr [0x5dfc], 2                 
  0044  743b             je 0x81                                  
  0046  b8042c           mov ax, 0x2c04                           
  0049  8b5efa           mov bx, word ptr [bp - 6]                
  004c  8ec0             mov es, ax                               
  004e  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0053  98               cwde                                     
  0054  d1e0             shl ax, 1                                
  0056  8bd8             mov bx, ax                               
  0058  83bf741200       cmp word ptr [bx + 0x1274], 0            
  005d  7f22             jg 0x81                                  
  005f  8b5e08           mov bx, word ptr [bp + 8]                
  0062  6bdb70           imul bx, bx, 0x70                        
  0065  035e06           add bx, word ptr [bp + 6]                
  0068  b8d919           mov ax, 0x19d9                           
  006b  8ec0             mov es, ax                               
  006d  268a870000       mov al, byte ptr es:[bx]                 
  0072  251f00           and ax, 0x1f                             
  0075  0bc0             or ax, ax                                
  0077  7508             jne 0x81                                 
  0079  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  007e  e97204           jmp 0x4f3                                
  0081  ff7608           push word ptr [bp + 8]                   
  0084  ff7606           push word ptr [bp + 6]                   
  0087  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  008c  83c404           add sp, 4                                
  008f  8946f2           mov word ptr [bp - 0xe], ax              
  0092  8b5e08           mov bx, word ptr [bp + 8]                
  0095  69dbe000         imul bx, bx, 0xe0                        
  0099  8b4606           mov ax, word ptr [bp + 6]                
  009c  d1e0             shl ax, 1                                
  009e  03d8             add bx, ax                               
  00a0  b81d1e           mov ax, 0x1e1d                           
  00a3  8ec0             mov es, ax                               
  00a5  268a970100       mov dl, byte ptr es:[bx + 1]             
  00aa  83e20f           and dx, 0xf                              
  00ad  b8042c           mov ax, 0x2c04                           
  00b0  8ec0             mov es, ax                               
  00b2  26833e1c0100     cmp word ptr es:[0x11c], 0               
  00b8  7503             jne 0xbd                                 
  00ba  e9b600           jmp 0x173                                
  00bd  83fa0f           cmp dx, 0xf                              
  00c0  7503             jne 0xc5                                 
  00c2  e9ae00           jmp 0x173                                
  00c5  8ec0             mov es, ax                               
  00c7  268b1e1001       mov bx, word ptr es:[0x110]              
  00cc  c1e303           shl bx, 3                                
  00cf  03da             add bx, dx                               
  00d1  b8042c           mov ax, 0x2c04                           
  00d4  8ec0             mov es, ax                               
  00d6  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  00db  250300           and ax, 3                                
  00de  0bc0             or ax, ax                                
  00e0  742a             je 0x10c                                 
  00e2  837ef200         cmp word ptr [bp - 0xe], 0               
  00e6  7f03             jg 0xeb                                  
  00e8  e98800           jmp 0x173                                
  00eb  b8042c           mov ax, 0x2c04                           
  00ee  8ec0             mov es, ax                               
  00f0  268b1e1001       mov bx, word ptr es:[0x110]              
  00f5  c1e303           shl bx, 3                                
  00f8  03da             add bx, dx                               
  00fa  b8042c           mov ax, 0x2c04                           
  00fd  8ec0             mov es, ax                               
  00ff  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0104  250300           and ax, 3                                
  0107  3d0100           cmp ax, 1                                
  010a  7567             jne 0x173                                
  010c  682430           push 0x3024                              
  010f  687000           push 0x70                                
  0112  682430           push 0x3024                              
  0115  686b00           push 0x6b                                
  0118  66688c000400     push 0x4008c                             
  011e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0123  83c404           add sp, 4                                
  0126  52               push dx                                  
  0127  50               push ax                                  
  0128  66688c000300     push 0x3008c                             
  012e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0133  83c404           add sp, 4                                
  0136  52               push dx                                  
  0137  50               push ax                                  
  0138  66688c000200     push 0x2008c                             
  013e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0143  83c404           add sp, 4                                
  0146  52               push dx                                  
  0147  50               push ax                                  
  0148  66688c000100     push 0x1008c                             
  014e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0153  83c404           add sp, 4                                
  0156  52               push dx                                  
  0157  50               push ax                                  
  0158  66688c000000     push 0x8c                                
  015e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0163  83c404           add sp, 4                                
  0166  52               push dx                                  
  0167  50               push ax                                  
  0168  9a2500a530       lcall 0x30a5, 0x25                       -> ovl56:0088
  016d  83c41c           add sp, 0x1c                             
  0170  e98003           jmp 0x4f3                                
  0173  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  0178  c41e625e         les bx, ptr [0x5e62]                     
  017c  268b07           mov ax, word ptr es:[bx]                 
  017f  8946fe           mov word ptr [bp - 2], ax                
  0182  268b4702         mov ax, word ptr es:[bx + 2]             
  0186  8946fc           mov word ptr [bp - 4], ax                
  0189  833eda2b00       cmp word ptr [0x2bda], 0                 
  018e  7407             je 0x197                                 
  0190  833e005e01       cmp word ptr [0x5e00], 1                 
  0195  7c12             jl 0x1a9                                 
  0197  833eda2b00       cmp word ptr [0x2bda], 0                 
  019c  7523             jne 0x1c1                                
  019e  c41e625e         les bx, ptr [0x5e62]                     
  01a2  26807f0701       cmp byte ptr es:[bx + 7], 1              
  01a7  7d18             jge 0x1c1                                
  01a9  666801000100     push 0x10001                             
  01af  6a01             push 1                                   
  01b1  9ab308620b       lcall 0xb62, 0x8b3                       -> 0b62:08b3
  01b6  83c406           add sp, 6                                
  01b9  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  01be  e93203           jmp 0x4f3                                
  01c1  8bdf             mov bx, di                               
  01c3  69dbe000         imul bx, bx, 0xe0                        
  01c7  8bc6             mov ax, si                               
  01c9  d1e0             shl ax, 1                                
  01cb  03d8             add bx, ax                               
  01cd  b81d1e           mov ax, 0x1e1d                           
  01d0  8ec0             mov es, ax                               
  01d2  268a870000       mov al, byte ptr es:[bx]                 
  01d7  25ff00           and ax, 0xff                             
  01da  8946fa           mov word ptr [bp - 6], ax                
  01dd  b8042c           mov ax, 0x2c04                           
  01e0  8b5efa           mov bx, word ptr [bp - 6]                
  01e3  8ec0             mov es, ax                               
  01e5  268a871007       mov al, byte ptr es:[bx + 0x710]         
  01ea  98               cwde                                     
  01eb  d1e0             shl ax, 1                                
  01ed  8bd8             mov bx, ax                               
  01ef  83bf741202       cmp word ptr [bx + 0x1274], 2            
  01f4  7d05             jge 0x1fb                                
  01f6  b80200           mov ax, 2                                
  01f9  eb16             jmp 0x211                                
  01fb  b8042c           mov ax, 0x2c04                           
  01fe  8b5efa           mov bx, word ptr [bp - 6]                
  0201  8ec0             mov es, ax                               
  0203  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0208  98               cwde                                     
  0209  d1e0             shl ax, 1                                
  020b  8bd8             mov bx, ax                               
  020d  8b877412         mov ax, word ptr [bx + 0x1274]           
  0211  a36041           mov word ptr [0x4160], ax                
  0214  8bdf             mov bx, di                               
  0216  69dbe000         imul bx, bx, 0xe0                        
  021a  8bc6             mov ax, si                               
  021c  d1e0             shl ax, 1                                
  021e  03d8             add bx, ax                               
  0220  b81d1e           mov ax, 0x1e1d                           
  0223  8ec0             mov es, ax                               
  0225  268a870100       mov al, byte ptr es:[bx + 1]             
  022a  250f00           and ax, 0xf                              
  022d  ba042c           mov dx, 0x2c04                           
  0230  8ec2             mov es, dx                               
  0232  263b061001       cmp ax, word ptr es:[0x110]              
  0237  7503             jne 0x23c                                
  0239  e9b702           jmp 0x4f3                                
  023c  b8042c           mov ax, 0x2c04                           
  023f  8b5efa           mov bx, word ptr [bp - 6]                
  0242  8ec0             mov es, ax                               
  0244  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  024a  7423             je 0x26f                                 
  024c  8bdf             mov bx, di                               
  024e  69dbe000         imul bx, bx, 0xe0                        
  0252  8bc6             mov ax, si                               
  0254  d1e0             shl ax, 1                                
  0256  03d8             add bx, ax                               
  0258  b81d1e           mov ax, 0x1e1d                           
  025b  8ec0             mov es, ax                               
  025d  268a870100       mov al, byte ptr es:[bx + 1]             
  0262  c1e804           shr ax, 4                                
  0265  250100           and ax, 1                                
  0268  0bc0             or ax, ax                                
  026a  7503             jne 0x26f                                
  026c  e98402           jmp 0x4f3                                
  026f  6a01             push 1                                   
  0271  57               push di                                  
  0272  56               push si                                  
  0273  90               nop                                      
  0274  0e               push cs                                  
  0275  e8be15           call 0x1836                              
  0278  83c406           add sp, 6                                
  027b  ff76fc           push word ptr [bp - 4]                   
  027e  ff76fe           push word ptr [bp - 2]                   
  0281  57               push di                                  
  0282  56               push si                                  
  0283  90               nop                                      
  0284  0e               push cs                                  
  0285  e89a02           call 0x522                               
  0288  83c408           add sp, 8                                
  028b  57               push di                                  
  028c  56               push si                                  
  028d  9a20003030       lcall 0x3030, 0x20                       -> ovl38:008b
  0292  83c404           add sp, 4                                
  0295  66833edd4100     cmp dword ptr [0x41dd], 0                
  029b  7418             je 0x2b5                                 
  029d  b8042c           mov ax, 0x2c04                           
  02a0  8ec0             mov es, ax                               
  02a2  268b1e1001       mov bx, word ptr es:[0x110]              
  02a7  d1e3             shl bx, 1                                
  02a9  8a87be0c         mov al, byte ptr [bx + 0xcbe]            
  02ad  c41edd41         les bx, ptr [0x41dd]                     
  02b1  26084730         or byte ptr es:[bx + 0x30], al           
  02b5  90               nop                                      
  02b6  0e               push cs                                  
  02b7  e8ec05           call 0x8a6                               
  02ba  8946f8           mov word ptr [bp - 8], ax                
  02bd  1e               push ds                                  
  02be  68c642           push 0x42c6                              
  02c1  1e               push ds                                  
  02c2  68e642           push 0x42e6                              
  02c5  57               push di                                  
  02c6  56               push si                                  
  02c7  9a4300db2f       lcall 0x2fdb, 0x43                       -> ovl25:09d7
  02cc  83c40c           add sp, 0xc                              
  02cf  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  02d4  6a00             push 0                                   
  02d6  9a2a002c30       lcall 0x302c, 0x2a                       -> ovl37:0160
  02db  59               pop cx                                   
  02dc  ff76f8           push word ptr [bp - 8]                   
  02df  6a00             push 0                                   
  02e1  9a25002c30       lcall 0x302c, 0x25                       -> ovl37:0094
  02e6  83c404           add sp, 4                                
  02e9  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  02ee  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  02f3  837ef801         cmp word ptr [bp - 8], 1                 
  02f7  7403             je 0x2fc                                 
  02f9  e92101           jmp 0x41d                                
  02fc  b8042c           mov ax, 0x2c04                           
  02ff  8b5efa           mov bx, word ptr [bp - 6]                
  0302  8ec0             mov es, ax                               
  0304  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  030a  7403             je 0x30f                                 
  030c  e9bb00           jmp 0x3ca                                
  030f  833eb24100       cmp word ptr [0x41b2], 0                 
  0314  7418             je 0x32e                                 
  0316  66688d00ffff     push 0xffff008d                          
  031c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0321  83c404           add sp, 4                                
  0324  52               push dx                                  
  0325  50               push ax                                  
  0326  9a2f002c30       lcall 0x302c, 0x2f                       -> ovl37:04c5
  032b  83c404           add sp, 4                                
  032e  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  0334  7414             je 0x34a                                 
  0336  c41e5e5e         les bx, ptr [0x5e5e]                     
  033a  268a470a         mov al, byte ptr es:[bx + 0xa]           
  033e  98               cwde                                     
  033f  6bc014           imul ax, ax, 0x14                        
  0342  ba042c           mov dx, 0x2c04                           
  0345  052302           add ax, 0x223                            
  0348  eb0d             jmp 0x357                                
  034a  a0fa41           mov al, byte ptr [0x41fa]                
  034d  98               cwde                                     
  034e  6bc014           imul ax, ax, 0x14                        
  0351  ba042c           mov dx, 0x2c04                           
  0354  050000           add ax, 0                                
  0357  52               push dx                                  
  0358  50               push ax                                  
  0359  1e               push ds                                  
  035a  684841           push 0x4148                              
  035d  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0362  83c408           add sp, 8                                
  0365  57               push di                                  
  0366  56               push si                                  
  0367  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  036c  83c404           add sp, 4                                
  036f  6bc041           imul ax, ax, 0x41                        
  0372  058115           add ax, 0x1581                           
  0375  68042c           push 0x2c04                              
  0378  50               push ax                                  
  0379  1e               push ds                                  
  037a  683441           push 0x4134                              
  037d  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0382  83c408           add sp, 8                                
  0385  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  038b  7435             je 0x3c2                                 
  038d  c41e5e5e         les bx, ptr [0x5e5e]                     
  0391  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0395  98               cwde                                     
  0396  6bc014           imul ax, ax, 0x14                        
  0399  052302           add ax, 0x223                            
  039c  68042c           push 0x2c04                              
  039f  50               push ax                                  
  03a0  66688e000000     push 0x8e                                
  03a6  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03ab  83c404           add sp, 4                                
  03ae  52               push dx                                  
  03af  50               push ax                                  
  03b0  1e               push ds                                  
  03b1  686241           push 0x4162                              
  03b4  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03b9  83c40c           add sp, 0xc                              
  03bc  1e               push ds                                  
  03bd  686241           push 0x4162                              
  03c0  eb6b             jmp 0x42d                                
  03c2  66688f000000     push 0x8f                                
  03c8  eb59             jmp 0x423                                
  03ca  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  03d0  7443             je 0x415                                 
  03d2  c41e5e5e         les bx, ptr [0x5e5e]                     
  03d6  268a470a         mov al, byte ptr es:[bx + 0xa]           
  03da  98               cwde                                     
  03db  6bc014           imul ax, ax, 0x14                        
  03de  052302           add ax, 0x223                            
  03e1  68042c           push 0x2c04                              
  03e4  50               push ax                                  
  03e5  666890000000     push 0x90                                
  03eb  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03f0  83c404           add sp, 4                                
  03f3  52               push dx                                  
  03f4  50               push ax                                  
  03f5  1e               push ds                                  
  03f6  686241           push 0x4162                              
  03f9  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03fe  83c40c           add sp, 0xc                              
  0401  1e               push ds                                  
  0402  686241           push 0x4162                              
  0405  9a2f002c30       lcall 0x302c, 0x2f                       -> ovl37:04c5
  040a  83c404           add sp, 4                                
  040d  666890000100     push 0x10090                             
  0413  eb0e             jmp 0x423                                
  0415  666891000000     push 0x91                                
  041b  eb06             jmp 0x423                                
  041d  666892000000     push 0x92                                
  0423  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0428  83c404           add sp, 4                                
  042b  52               push dx                                  
  042c  50               push ax                                  
  042d  9a2f002c30       lcall 0x302c, 0x2f                       -> ovl37:04c5
  0432  83c404           add sp, 4                                
  0435  57               push di                                  
  0436  56               push si                                  
  0437  ff76f8           push word ptr [bp - 8]                   
  043a  90               nop                                      
  043b  0e               push cs                                  
  043c  e82c06           call 0xa6b                               
  043f  83c406           add sp, 6                                
  0442  8946f6           mov word ptr [bp - 0xa], ax              
  0445  9a34002c30       lcall 0x302c, 0x34                       -> ovl37:04f6
  044a  666a00           push 0                                   
  044d  666801000100     push 0x10001                             
  0453  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0458  83c408           add sp, 8                                
  045b  837ef801         cmp word ptr [bp - 8], 1                 
  045f  7537             jne 0x498                                
  0461  8bdf             mov bx, di                               
  0463  69dbe000         imul bx, bx, 0xe0                        
  0467  8bc6             mov ax, si                               
  0469  d1e0             shl ax, 1                                
  046b  03d8             add bx, ax                               
  046d  b81d1e           mov ax, 0x1e1d                           
  0470  8ec0             mov es, ax                               
  0472  26808f010010     or byte ptr es:[bx + 1], 0x10            
  0478  16               push ss                                  
  0479  8d46f4           lea ax, [bp - 0xc]                       
  047c  50               push ax                                  
  047d  57               push di                                  
  047e  56               push si                                  
  047f  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  0484  83c408           add sp, 8                                
  0487  8916645e         mov word ptr [0x5e64], dx                
  048b  a3625e           mov word ptr [0x5e62], ax                
  048e  52               push dx                                  
  048f  50               push ax                                  
  0490  9a3e001931       lcall 0x3119, 0x3e                       -> ovl67:06eb
  0495  83c404           add sp, 4                                
  0498  ff76f8           push word ptr [bp - 8]                   
  049b  90               nop                                      
  049c  0e               push cs                                  
  049d  e8d41d           call 0x2274                              
  04a0  59               pop cx                                   
  04a1  666801000100     push 0x10001                             
  04a7  6a01             push 1                                   
  04a9  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  04ae  83c406           add sp, 6                                
  04b1  837ef621         cmp word ptr [bp - 0xa], 0x21            
  04b5  7420             je 0x4d7                                 
  04b7  666a00           push 0                                   
  04ba  666a00           push 0                                   
  04bd  6a00             push 0                                   
  04bf  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  04c4  83c40a           add sp, 0xa                              
  04c7  0bc0             or ax, ax                                
  04c9  7528             jne 0x4f3                                
  04cb  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  04d0  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  04d5  eb1c             jmp 0x4f3                                
  04d7  682430           push 0x3024                              
  04da  687500           push 0x75                                
  04dd  666a00           push 0                                   
  04e0  6a00             push 0                                   
  04e2  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  04e7  83c40a           add sp, 0xa                              
  04ea  0bc0             or ax, ax                                
  04ec  7505             jne 0x4f3                                
  04ee  90               nop                                      
  04ef  0e               push cs                                  
  04f0  e80400           call 0x4f7                               
  04f3  5f               pop di                                   
  04f4  5e               pop si                                   
  04f5  c9               leave                                    
  04f6  cb               retf                                     

ovl36_04f7:  ; ENTRY
  04f7  55               push bp                                  
  04f8  8bec             mov bp, sp                               
  04fa  ff365c41         push word ptr [0x415c]                   
  04fe  ff365e41         push word ptr [0x415e]                   
  0502  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0507  83c404           add sp, 4                                
  050a  50               push ax                                  
  050b  a0fb41           mov al, byte ptr [0x41fb]                
  050e  98               cwde                                     
  050f  50               push ax                                  
  0510  1e               push ds                                  
  0511  683441           push 0x4134                              
  0514  1e               push ds                                  
  0515  684841           push 0x4148                              
  0518  9a20000530       lcall 0x3005, 0x20                       -> ovl31:0000
  051d  83c40c           add sp, 0xc                              
  0520  5d               pop bp                                   
  0521  cb               retf                                     

ovl36_0522:  ; ENTRY
  0522  55               push bp                                  
  0523  8bec             mov bp, sp                               
  0525  83ec04           sub sp, 4                                
  0528  56               push si                                  
  0529  57               push di                                  
  052a  8b760a           mov si, word ptr [bp + 0xa]              
  052d  8b7e0c           mov di, word ptr [bp + 0xc]              
  0530  83feff           cmp si, -1                               
  0533  7505             jne 0x53a                                
  0535  b80100           mov ax, 1                                
  0538  eb02             jmp 0x53c                                
  053a  33c0             xor ax, ax                               
  053c  8946fc           mov word ptr [bp - 4], ax                
  053f  c41e625e         les bx, ptr [0x5e62]                     
  0543  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0549  7403             je 0x54e                                 
  054b  e9d500           jmp 0x623                                
  054e  8b5e08           mov bx, word ptr [bp + 8]                
  0551  69dbe000         imul bx, bx, 0xe0                        
  0555  8b4606           mov ax, word ptr [bp + 6]                
  0558  d1e0             shl ax, 1                                
  055a  03d8             add bx, ax                               
  055c  b81d1e           mov ax, 0x1e1d                           
  055f  8ec0             mov es, ax                               
  0561  268a9f0000       mov bl, byte ptr es:[bx]                 
  0566  81e3ff00         and bx, 0xff                             
  056a  b8042c           mov ax, 0x2c04                           
  056d  8ec0             mov es, ax                               
  056f  2680bf100703     cmp byte ptr es:[bx + 0x710], 3          
  0575  742c             je 0x5a3                                 
  0577  8b5e08           mov bx, word ptr [bp + 8]                
  057a  69dbe000         imul bx, bx, 0xe0                        
  057e  8b4606           mov ax, word ptr [bp + 6]                
  0581  d1e0             shl ax, 1                                
  0583  03d8             add bx, ax                               
  0585  b81d1e           mov ax, 0x1e1d                           
  0588  8ec0             mov es, ax                               
  058a  268a9f0000       mov bl, byte ptr es:[bx]                 
  058f  81e3ff00         and bx, 0xff                             
  0593  b8042c           mov ax, 0x2c04                           
  0596  8ec0             mov es, ax                               
  0598  2680bf100702     cmp byte ptr es:[bx + 0x710], 2          
  059e  7403             je 0x5a3                                 
  05a0  e98000           jmp 0x623                                
  05a3  833efc5d02       cmp word ptr [0x5dfc], 2                 
  05a8  7479             je 0x623                                 
  05aa  c746fe0000       mov word ptr [bp - 2], 0                 
  05af  eb66             jmp 0x617                                
  05b1  8b5efe           mov bx, word ptr [bp - 2]                
  05b4  c1e302           shl bx, 2                                
  05b7  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  05bb  0b87405e         or ax, word ptr [bx + 0x5e40]            
  05bf  7453             je 0x614                                 
  05c1  8b5efe           mov bx, word ptr [bp - 2]                
  05c4  c1e302           shl bx, 2                                
  05c7  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  05cb  268a4704         mov al, byte ptr es:[bx + 4]             
  05cf  98               cwde                                     
  05d0  6bc006           imul ax, ax, 6                           
  05d3  8bd8             mov bx, ax                               
  05d5  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  05d9  98               cwde                                     
  05da  0bc0             or ax, ax                                
  05dc  7536             jne 0x614                                
  05de  8b5efe           mov bx, word ptr [bp - 2]                
  05e1  c1e302           shl bx, 2                                
  05e4  66ffb73e5e       push dword ptr [bx + 0x5e3e]             
  05e9  9a2f001d30       lcall 0x301d, 0x2f                       -> ovl35:08b4
  05ee  83c404           add sp, 4                                
  05f1  0bc0             or ax, ax                                
  05f3  751f             jne 0x614                                
  05f5  8b5efe           mov bx, word ptr [bp - 2]                
  05f8  c1e302           shl bx, 2                                
  05fb  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  05ff  26814f0c0010     or word ptr es:[bx + 0xc], 0x1000        
  0605  8b5efe           mov bx, word ptr [bp - 2]                
  0608  c1e302           shl bx, 2                                
  060b  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  060f  26c6470700       mov byte ptr es:[bx + 7], 0              
  0614  ff46fe           inc word ptr [bp - 2]                    
  0617  837efe08         cmp word ptr [bp - 2], 8                 
  061b  7c94             jl 0x5b1                                 
  061d  c706005e0000     mov word ptr [0x5e00], 0                 
  0623  833eda2b00       cmp word ptr [0x2bda], 0                 
  0628  7503             jne 0x62d                                
  062a  e9ab00           jmp 0x6d8                                
  062d  a1005e           mov ax, word ptr [0x5e00]                
  0630  2b066041         sub ax, word ptr [0x4160]                
  0634  7d04             jge 0x63a                                
  0636  33c0             xor ax, ax                               
  0638  eb07             jmp 0x641                                
  063a  a1005e           mov ax, word ptr [0x5e00]                
  063d  2b066041         sub ax, word ptr [0x4160]                
  0641  a3005e           mov word ptr [0x5e00], ax                
  0644  ba0800           mov dx, 8                                
  0647  e98200           jmp 0x6cc                                
  064a  8bda             mov bx, dx                               
  064c  c1e302           shl bx, 2                                
  064f  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  0653  0b87405e         or ax, word ptr [bx + 0x5e40]            
  0657  7473             je 0x6cc                                 
  0659  8bda             mov bx, dx                               
  065b  c1e302           shl bx, 2                                
  065e  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0662  8b4606           mov ax, word ptr [bp + 6]                
  0665  268907           mov word ptr es:[bx], ax                 
  0668  8bda             mov bx, dx                               
  066a  c1e302           shl bx, 2                                
  066d  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  0671  8b4608           mov ax, word ptr [bp + 8]                
  0674  26894702         mov word ptr es:[bx + 2], ax             
  0678  8bda             mov bx, dx                               
  067a  c1e302           shl bx, 2                                
  067d  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  0681  26c74712ffff     mov word ptr es:[bx + 0x12], 0xffff      
  0687  8bda             mov bx, dx                               
  0689  c1e302           shl bx, 2                                
  068c  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  0690  26c74714ffff     mov word ptr es:[bx + 0x14], 0xffff      
  0696  8bda             mov bx, dx                               
  0698  c1e302           shl bx, 2                                
  069b  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  069f  268a4707         mov al, byte ptr es:[bx + 7]             
  06a3  98               cwde                                     
  06a4  2b066041         sub ax, word ptr [0x4160]                
  06a8  7d04             jge 0x6ae                                
  06aa  b000             mov al, 0                                
  06ac  eb11             jmp 0x6bf                                
  06ae  8bda             mov bx, dx                               
  06b0  c1e302           shl bx, 2                                
  06b3  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  06b7  268a4707         mov al, byte ptr es:[bx + 7]             
  06bb  2a066041         sub al, byte ptr [0x4160]                
  06bf  8bda             mov bx, dx                               
  06c1  c1e302           shl bx, 2                                
  06c4  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  06c8  26884707         mov byte ptr es:[bx + 7], al             
  06cc  8bc2             mov ax, dx                               
  06ce  4a               dec dx                                   
  06cf  0bc0             or ax, ax                                
  06d1  7403             je 0x6d6                                 
  06d3  e974ff           jmp 0x64a                                
  06d6  eb40             jmp 0x718                                
  06d8  c41e625e         les bx, ptr [0x5e62]                     
  06dc  268a4707         mov al, byte ptr es:[bx + 7]             
  06e0  98               cwde                                     
  06e1  2b066041         sub ax, word ptr [0x4160]                
  06e5  7d04             jge 0x6eb                                
  06e7  b000             mov al, 0                                
  06e9  eb0c             jmp 0x6f7                                
  06eb  c41e625e         les bx, ptr [0x5e62]                     
  06ef  268a4707         mov al, byte ptr es:[bx + 7]             
  06f3  2a066041         sub al, byte ptr [0x4160]                
  06f7  c41e625e         les bx, ptr [0x5e62]                     
  06fb  26884707         mov byte ptr es:[bx + 7], al             
  06ff  8b4606           mov ax, word ptr [bp + 6]                
  0702  268907           mov word ptr es:[bx], ax                 
  0705  8b4608           mov ax, word ptr [bp + 8]                
  0708  26894702         mov word ptr es:[bx + 2], ax             
  070c  26c74712ffff     mov word ptr es:[bx + 0x12], 0xffff      
  0712  26c74714ffff     mov word ptr es:[bx + 0x14], 0xffff      
  0718  837efc00         cmp word ptr [bp - 4], 0                 
  071c  7403             je 0x721                                 
  071e  e98101           jmp 0x8a2                                
  0721  b8042c           mov ax, 0x2c04                           
  0724  8ec0             mov es, ax                               
  0726  2639367701       cmp word ptr es:[0x177], si              
  072b  7d1e             jge 0x74b                                
  072d  8ec0             mov es, ax                               
  072f  2639367b01       cmp word ptr es:[0x17b], si              
  0734  7e15             jle 0x74b                                
  0736  8ec0             mov es, ax                               
  0738  26393e7501       cmp word ptr es:[0x175], di              
  073d  7d0c             jge 0x74b                                
  073f  8ec0             mov es, ax                               
  0741  26393e7901       cmp word ptr es:[0x179], di              
  0746  7e03             jle 0x74b                                
  0748  e98000           jmp 0x7cb                                
  074b  b8042c           mov ax, 0x2c04                           
  074e  8ec0             mov es, ax                               
  0750  2689367d01       mov word ptr es:[0x17d], si              
  0755  8ec0             mov es, ax                               
  0757  26893e7f01       mov word ptr es:[0x17f], di              
  075c  8bc7             mov ax, di                               
  075e  05fcff           add ax, 0xfffc                           
  0761  7d04             jge 0x767                                
  0763  33c0             xor ax, ax                               
  0765  eb05             jmp 0x76c                                
  0767  8bc7             mov ax, di                               
  0769  05fcff           add ax, 0xfffc                           
  076c  ba042c           mov dx, 0x2c04                           
  076f  8ec2             mov es, dx                               
  0771  26a37501         mov word ptr es:[0x175], ax              
  0775  8bc6             mov ax, si                               
  0777  05fcff           add ax, 0xfffc                           
  077a  7d04             jge 0x780                                
  077c  33c0             xor ax, ax                               
  077e  eb05             jmp 0x785                                
  0780  8bc6             mov ax, si                               
  0782  05fcff           add ax, 0xfffc                           
  0785  ba042c           mov dx, 0x2c04                           
  0788  8ec2             mov es, dx                               
  078a  26a37701         mov word ptr es:[0x177], ax              
  078e  8bc6             mov ax, si                               
  0790  050400           add ax, 4                                
  0793  3d7000           cmp ax, 0x70                             
  0796  7e05             jle 0x79d                                
  0798  b87000           mov ax, 0x70                             
  079b  eb05             jmp 0x7a2                                
  079d  8bc6             mov ax, si                               
  079f  050400           add ax, 4                                
  07a2  ba042c           mov dx, 0x2c04                           
  07a5  8ec2             mov es, dx                               
  07a7  26a37b01         mov word ptr es:[0x17b], ax              
  07ab  8bc7             mov ax, di                               
  07ad  050400           add ax, 4                                
  07b0  3d9c00           cmp ax, 0x9c                             
  07b3  7e05             jle 0x7ba                                
  07b5  b89c00           mov ax, 0x9c                             
  07b8  eb05             jmp 0x7bf                                
  07ba  8bc7             mov ax, di                               
  07bc  050400           add ax, 4                                
  07bf  ba042c           mov dx, 0x2c04                           
  07c2  8ec2             mov es, dx                               
  07c4  26a37901         mov word ptr es:[0x179], ax              
  07c8  e9d700           jmp 0x8a2                                
  07cb  397606           cmp word ptr [bp + 6], si                
  07ce  7e31             jle 0x801                                
  07d0  b8042c           mov ax, 0x2c04                           
  07d3  8ec0             mov es, ax                               
  07d5  26a17d01         mov ax, word ptr es:[0x17d]              
  07d9  40               inc ax                                   
  07da  3b4606           cmp ax, word ptr [bp + 6]                
  07dd  7d22             jge 0x801                                
  07df  b8042c           mov ax, 0x2c04                           
  07e2  8ec0             mov es, ax                               
  07e4  26833e7b016f     cmp word ptr es:[0x17b], 0x6f            
  07ea  7d15             jge 0x801                                
  07ec  8ec0             mov es, ax                               
  07ee  26ff067d01       inc word ptr es:[0x17d]                  
  07f3  8ec0             mov es, ax                               
  07f5  26ff067701       inc word ptr es:[0x177]                  
  07fa  8ec0             mov es, ax                               
  07fc  26ff067b01       inc word ptr es:[0x17b]                  
  0801  397606           cmp word ptr [bp + 6], si                
  0804  7d30             jge 0x836                                
  0806  b8042c           mov ax, 0x2c04                           
  0809  8ec0             mov es, ax                               
  080b  26a17d01         mov ax, word ptr es:[0x17d]              
  080f  3b4606           cmp ax, word ptr [bp + 6]                
  0812  7e22             jle 0x836                                
  0814  b8042c           mov ax, 0x2c04                           
  0817  8ec0             mov es, ax                               
  0819  26833e770100     cmp word ptr es:[0x177], 0               
  081f  7e15             jle 0x836                                
  0821  8ec0             mov es, ax                               
  0823  26ff0e7d01       dec word ptr es:[0x17d]                  
  0828  8ec0             mov es, ax                               
  082a  26ff0e7701       dec word ptr es:[0x177]                  
  082f  8ec0             mov es, ax                               
  0831  26ff0e7b01       dec word ptr es:[0x17b]                  
  0836  397e08           cmp word ptr [bp + 8], di                
  0839  7e32             jle 0x86d                                
  083b  b8042c           mov ax, 0x2c04                           
  083e  8ec0             mov es, ax                               
  0840  26a17f01         mov ax, word ptr es:[0x17f]              
  0844  40               inc ax                                   
  0845  3b4608           cmp ax, word ptr [bp + 8]                
  0848  7d23             jge 0x86d                                
  084a  b8042c           mov ax, 0x2c04                           
  084d  8ec0             mov es, ax                               
  084f  26813e79019b00   cmp word ptr es:[0x179], 0x9b            
  0856  7d15             jge 0x86d                                
  0858  8ec0             mov es, ax                               
  085a  26ff067f01       inc word ptr es:[0x17f]                  
  085f  8ec0             mov es, ax                               
  0861  26ff067501       inc word ptr es:[0x175]                  
  0866  8ec0             mov es, ax                               
  0868  26ff067901       inc word ptr es:[0x179]                  
  086d  397e08           cmp word ptr [bp + 8], di                
  0870  7d30             jge 0x8a2                                
  0872  b8042c           mov ax, 0x2c04                           
  0875  8ec0             mov es, ax                               
  0877  26a17f01         mov ax, word ptr es:[0x17f]              
  087b  3b4608           cmp ax, word ptr [bp + 8]                
  087e  7e22             jle 0x8a2                                
  0880  b8042c           mov ax, 0x2c04                           
  0883  8ec0             mov es, ax                               
  0885  26833e750100     cmp word ptr es:[0x175], 0               
  088b  7e15             jle 0x8a2                                
  088d  8ec0             mov es, ax                               
  088f  26ff0e7f01       dec word ptr es:[0x17f]                  
  0894  8ec0             mov es, ax                               
  0896  26ff0e7501       dec word ptr es:[0x175]                  
  089b  8ec0             mov es, ax                               
  089d  26ff0e7901       dec word ptr es:[0x179]                  
  08a2  5f               pop di                                   
  08a3  5e               pop si                                   
  08a4  c9               leave                                    
  08a5  cb               retf                                     

ovl36_08a6:  ; ENTRY
  08a6  55               push bp                                  
  08a7  8bec             mov bp, sp                               
  08a9  83ec0c           sub sp, 0xc                              
  08ac  56               push si                                  
  08ad  57               push di                                  
  08ae  c746fc0100       mov word ptr [bp - 4], 1                 
  08b3  33ff             xor di, di                               
  08b5  8bf7             mov si, di                               
  08b7  8bc6             mov ax, si                               
  08b9  a2b441           mov byte ptr [0x41b4], al                
  08bc  98               cwde                                     
  08bd  a3b241           mov word ptr [0x41b2], ax                
  08c0  c646ff00         mov byte ptr [bp - 1], 0                 
  08c4  a0c442           mov al, byte ptr [0x42c4]                
  08c7  98               cwde                                     
  08c8  3bc6             cmp ax, si                               
  08ca  740b             je 0x8d7                                 
  08cc  a0c542           mov al, byte ptr [0x42c5]                
  08cf  98               cwde                                     
  08d0  3bc7             cmp ax, di                               
  08d2  7403             je 0x8d7                                 
  08d4  e98201           jmp 0xa59                                
  08d7  c646ff01         mov byte ptr [bp - 1], 1                 
  08db  c706b2410100     mov word ptr [0x41b2], 1                 
  08e1  e97501           jmp 0xa59                                
  08e4  c646fe00         mov byte ptr [bp - 2], 0                 
  08e8  c746f40000       mov word ptr [bp - 0xc], 0               
  08ed  80bda44201       cmp byte ptr [di + 0x42a4], 1            
  08f2  7d05             jge 0x8f9                                
  08f4  b80100           mov ax, 1                                
  08f7  eb05             jmp 0x8fe                                
  08f9  8a85a442         mov al, byte ptr [di + 0x42a4]           
  08fd  98               cwde                                     
  08fe  8946fa           mov word ptr [bp - 6], ax                
  0901  80bc9c4201       cmp byte ptr [si + 0x429c], 1            
  0906  7d05             jge 0x90d                                
  0908  b80100           mov ax, 1                                
  090b  eb05             jmp 0x912                                
  090d  8a849c42         mov al, byte ptr [si + 0x429c]           
  0911  98               cwde                                     
  0912  8946f8           mov word ptr [bp - 8], ax                
  0915  e93601           jmp 0xa4e                                
  0918  6a00             push 0                                   
  091a  b8042c           mov ax, 0x2c04                           
  091d  8ec0             mov es, ax                               
  091f  26833e260100     cmp word ptr es:[0x126], 0               
  0925  7405             je 0x92c                                 
  0927  b81800           mov ax, 0x18                             
  092a  eb03             jmp 0x92f                                
  092c  b81400           mov ax, 0x14                             
  092f  50               push ax                                  
  0930  6a01             push 1                                   
  0932  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0937  83c406           add sp, 6                                
  093a  8946f6           mov word ptr [bp - 0xa], ax              
  093d  6a00             push 0                                   
  093f  b8042c           mov ax, 0x2c04                           
  0942  8ec0             mov es, ax                               
  0944  26833e260100     cmp word ptr es:[0x126], 0               
  094a  7405             je 0x951                                 
  094c  b81800           mov ax, 0x18                             
  094f  eb03             jmp 0x954                                
  0951  b81400           mov ax, 0x14                             
  0954  50               push ax                                  
  0955  6a01             push 1                                   
  0957  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  095c  83c406           add sp, 6                                
  095f  8bc8             mov cx, ax                               
  0961  8b46f4           mov ax, word ptr [bp - 0xc]              
  0964  ff46f4           inc word ptr [bp - 0xc]                  
  0967  3d1027           cmp ax, 0x2710                           
  096a  7e08             jle 0x974                                
  096c  c746f60000       mov word ptr [bp - 0xa], 0               
  0971  b96400           mov cx, 0x64                             
  0974  8b46f6           mov ax, word ptr [bp - 0xa]              
  0977  3b46fa           cmp ax, word ptr [bp - 6]                
  097a  7f08             jg 0x984                                 
  097c  3b4ef8           cmp cx, word ptr [bp - 8]                
  097f  7f03             jg 0x984                                 
  0981  e9ca00           jmp 0xa4e                                
  0984  8b46f6           mov ax, word ptr [bp - 0xa]              
  0987  3b46fa           cmp ax, word ptr [bp - 6]                
  098a  7e08             jle 0x994                                
  098c  3b4ef8           cmp cx, word ptr [bp - 8]                
  098f  7e03             jle 0x994                                
  0991  e9ba00           jmp 0xa4e                                
  0994  8b46f6           mov ax, word ptr [bp - 0xa]              
  0997  3b46fa           cmp ax, word ptr [bp - 6]                
  099a  7f57             jg 0x9f3                                 
  099c  3b4ef8           cmp cx, word ptr [bp - 8]                
  099f  7e52             jle 0x9f3                                
  09a1  b8042c           mov ax, 0x2c04                           
  09a4  8ec0             mov es, ax                               
  09a6  26833e2e0100     cmp word ptr es:[0x12e], 0               
  09ac  7423             je 0x9d1                                 
  09ae  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  09b3  751c             jne 0x9d1                                
  09b5  a0fa41           mov al, byte ptr [0x41fa]                
  09b8  98               cwde                                     
  09b9  d1e0             shl ax, 1                                
  09bb  ba042c           mov dx, 0x2c04                           
  09be  8bd8             mov bx, ax                               
  09c0  8ec2             mov es, dx                               
  09c2  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  09c8  7507             jne 0x9d1                                
  09ca  803efb410f       cmp byte ptr [0x41fb], 0xf               
  09cf  7422             je 0x9f3                                 
  09d1  fe8c7442         dec byte ptr [si + 0x4274]               
  09d5  80bc744200       cmp byte ptr [si + 0x4274], 0            
  09da  7d4c             jge 0xa28                                
  09dc  c646fe01         mov byte ptr [bp - 2], 1                 
  09e0  c684244200       mov byte ptr [si + 0x4224], 0            
  09e5  46               inc si                                   
  09e6  a0b441           mov al, byte ptr [0x41b4]                
  09e9  98               cwde                                     
  09ea  8bd8             mov bx, ax                               
  09ec  c687b54101       mov byte ptr [bx + 0x41b5], 1            
  09f1  eb2d             jmp 0xa20                                
  09f3  8b46f6           mov ax, word ptr [bp - 0xa]              
  09f6  3b46fa           cmp ax, word ptr [bp - 6]                
  09f9  7e2d             jle 0xa28                                
  09fb  3b4ef8           cmp cx, word ptr [bp - 8]                
  09fe  7f28             jg 0xa28                                 
  0a00  fe8d7c42         dec byte ptr [di + 0x427c]               
  0a04  80bd7c4200       cmp byte ptr [di + 0x427c], 0            
  0a09  7d1d             jge 0xa28                                
  0a0b  c646fe01         mov byte ptr [bp - 2], 1                 
  0a0f  c6852c4200       mov byte ptr [di + 0x422c], 0            
  0a14  47               inc di                                   
  0a15  a0b441           mov al, byte ptr [0x41b4]                
  0a18  98               cwde                                     
  0a19  8bd8             mov bx, ax                               
  0a1b  c687b54100       mov byte ptr [bx + 0x41b5], 0            
  0a20  a0b441           mov al, byte ptr [0x41b4]                
  0a23  fec0             inc al                                   
  0a25  a2b441           mov byte ptr [0x41b4], al                
  0a28  a0c542           mov al, byte ptr [0x42c5]                
  0a2b  98               cwde                                     
  0a2c  3bc7             cmp ax, di                               
  0a2e  7408             je 0xa38                                 
  0a30  a0c442           mov al, byte ptr [0x42c4]                
  0a33  98               cwde                                     
  0a34  3bc6             cmp ax, si                               
  0a36  7516             jne 0xa4e                                
  0a38  c646ff01         mov byte ptr [bp - 1], 1                 
  0a3c  a0c542           mov al, byte ptr [0x42c5]                
  0a3f  98               cwde                                     
  0a40  3bc7             cmp ax, di                               
  0a42  7505             jne 0xa49                                
  0a44  b80100           mov ax, 1                                
  0a47  eb02             jmp 0xa4b                                
  0a49  33c0             xor ax, ax                               
  0a4b  8946fc           mov word ptr [bp - 4], ax                
  0a4e  8a46fe           mov al, byte ptr [bp - 2]                
  0a51  98               cwde                                     
  0a52  0bc0             or ax, ax                                
  0a54  7503             jne 0xa59                                
  0a56  e9bffe           jmp 0x918                                
  0a59  8a46ff           mov al, byte ptr [bp - 1]                
  0a5c  98               cwde                                     
  0a5d  0bc0             or ax, ax                                
  0a5f  7503             jne 0xa64                                
  0a61  e980fe           jmp 0x8e4                                
  0a64  8b46fc           mov ax, word ptr [bp - 4]                
  0a67  5f               pop di                                   
  0a68  5e               pop si                                   
  0a69  c9               leave                                    
  0a6a  cb               retf                                     

ovl36_0a6b:  ; ENTRY
  0a6b  55               push bp                                  
  0a6c  8bec             mov bp, sp                               
  0a6e  83ec02           sub sp, 2                                
  0a71  56               push si                                  
  0a72  57               push di                                  
  0a73  90               nop                                      
  0a74  0e               push cs                                  
  0a75  e88710           call 0x1aff                              
  0a78  ff760a           push word ptr [bp + 0xa]                 
  0a7b  ff7608           push word ptr [bp + 8]                   
  0a7e  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0a83  83c404           add sp, 4                                
  0a86  0bc0             or ax, ax                                
  0a88  7c73             jl 0xafd                                 
  0a8a  a0c442           mov al, byte ptr [0x42c4]                
  0a8d  98               cwde                                     
  0a8e  50               push ax                                  
  0a8f  a0c542           mov al, byte ptr [0x42c5]                
  0a92  98               cwde                                     
  0a93  5a               pop dx                                   
  0a94  03d0             add dx, ax                               
  0a96  83fa08           cmp dx, 8                                
  0a99  7c62             jl 0xafd                                 
  0a9b  803ec54204       cmp byte ptr [0x42c5], 4                 
  0aa0  7c5b             jl 0xafd                                 
  0aa2  837e0601         cmp word ptr [bp + 6], 1                 
  0aa6  7555             jne 0xafd                                
  0aa8  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  0aae  7426             je 0xad6                                 
  0ab0  c41e5e5e         les bx, ptr [0x5e5e]                     
  0ab4  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0ab8  98               cwde                                     
  0ab9  6bc014           imul ax, ax, 0x14                        
  0abc  052302           add ax, 0x223                            
  0abf  68042c           push 0x2c04                              
  0ac2  50               push ax                                  
  0ac3  ff760a           push word ptr [bp + 0xa]                 
  0ac6  ff7608           push word ptr [bp + 8]                   
  0ac9  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0ace  83c404           add sp, 4                                
  0ad1  50               push ax                                  
  0ad2  6aff             push -1                                  
  0ad4  eb18             jmp 0xaee                                
  0ad6  1e               push ds                                  
  0ad7  68120d           push 0xd12                               
  0ada  ff760a           push word ptr [bp + 0xa]                 
  0add  ff7608           push word ptr [bp + 8]                   
  0ae0  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0ae5  83c404           add sp, 4                                
  0ae8  50               push ax                                  
  0ae9  a0fa41           mov al, byte ptr [0x41fa]                
  0aec  98               cwde                                     
  0aed  50               push ax                                  
  0aee  6a05             push 5                                   
  0af0  a0fa41           mov al, byte ptr [0x41fa]                
  0af3  98               cwde                                     
  0af4  50               push ax                                  
  0af5  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  0afa  83c40c           add sp, 0xc                              
  0afd  c706fe5d0000     mov word ptr [0x5dfe], 0                 
  0b03  bf0800           mov di, 8                                
  0b06  eb11             jmp 0xb19                                
  0b08  8bdf             mov bx, di                               
  0b0a  c1e302           shl bx, 2                                
  0b0d  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  0b13  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  0b19  8bc7             mov ax, di                               
  0b1b  4f               dec di                                   
  0b1c  0bc0             or ax, ax                                
  0b1e  75e8             jne 0xb08                                
  0b20  33f6             xor si, si                               
  0b22  eb28             jmp 0xb4c                                
  0b24  80bc244200       cmp byte ptr [si + 0x4224], 0            
  0b29  7420             je 0xb4b                                 
  0b2b  8bde             mov bx, si                               
  0b2d  c1e302           shl bx, 2                                
  0b30  8b87c842         mov ax, word ptr [bx + 0x42c8]           
  0b34  8b97c642         mov dx, word ptr [bx + 0x42c6]           
  0b38  8b1efe5d         mov bx, word ptr [0x5dfe]                
  0b3c  c1e302           shl bx, 2                                
  0b3f  8987405e         mov word ptr [bx + 0x5e40], ax           
  0b43  89973e5e         mov word ptr [bx + 0x5e3e], dx           
  0b47  ff06fe5d         inc word ptr [0x5dfe]                    
  0b4b  46               inc si                                   
  0b4c  a0c442           mov al, byte ptr [0x42c4]                
  0b4f  98               cwde                                     
  0b50  3bc6             cmp ax, si                               
  0b52  7fd0             jg 0xb24                                 
  0b54  66a13e5e         mov eax, dword ptr [0x5e3e]              
  0b58  66a3625e         mov dword ptr [0x5e62], eax              
  0b5c  33f6             xor si, si                               
  0b5e  e9a900           jmp 0xc0a                                
  0b61  8a842442         mov al, byte ptr [si + 0x4224]           
  0b65  98               cwde                                     
  0b66  0bc0             or ax, ax                                
  0b68  756b             jne 0xbd5                                
  0b6a  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  0b6f  7550             jne 0xbc1                                
  0b71  8bde             mov bx, si                               
  0b73  c1e302           shl bx, 2                                
  0b76  c49fc642         les bx, ptr [bx + 0x42c6]                
  0b7a  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0b7e  98               cwde                                     
  0b7f  6bc014           imul ax, ax, 0x14                        
  0b82  052302           add ax, 0x223                            
  0b85  68042c           push 0x2c04                              
  0b88  50               push ax                                  
  0b89  6a00             push 0                                   
  0b8b  ff760a           push word ptr [bp + 0xa]                 
  0b8e  ff7608           push word ptr [bp + 8]                   
  0b91  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0b96  83c404           add sp, 4                                
  0b99  50               push ax                                  
  0b9a  6a01             push 1                                   
  0b9c  a0fa41           mov al, byte ptr [0x41fa]                
  0b9f  98               cwde                                     
  0ba0  50               push ax                                  
  0ba1  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  0ba6  83c40c           add sp, 0xc                              
  0ba9  ff760a           push word ptr [bp + 0xa]                 
  0bac  ff7608           push word ptr [bp + 8]                   
  0baf  8bde             mov bx, si                               
  0bb1  c1e302           shl bx, 2                                
  0bb4  66ffb7c642       push dword ptr [bx + 0x42c6]             
  0bb9  90               nop                                      
  0bba  0e               push cs                                  
  0bbb  e80f0b           call 0x16cd                              
  0bbe  83c408           add sp, 8                                
  0bc1  8bde             mov bx, si                               
  0bc3  c1e302           shl bx, 2                                
  0bc6  66ffb7c642       push dword ptr [bx + 0x42c6]             
  0bcb  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  0bd0  83c404           add sp, 4                                
  0bd3  eb34             jmp 0xc09                                
  0bd5  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  0bda  752d             jne 0xc09                                
  0bdc  8a1ef241         mov bl, byte ptr [0x41f2]                
  0be0  81e3ff00         and bx, 0xff                             
  0be4  b8042c           mov ax, 0x2c04                           
  0be7  8ec0             mov es, ax                               
  0be9  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0bef  7504             jne 0xbf5                                
  0bf1  6a02             push 2                                   
  0bf3  eb02             jmp 0xbf7                                
  0bf5  6a01             push 1                                   
  0bf7  8bde             mov bx, si                               
  0bf9  c1e302           shl bx, 2                                
  0bfc  66ffb7c642       push dword ptr [bx + 0x42c6]             
  0c01  9a61007330       lcall 0x3073, 0x61                       -> ovl47:04f1
  0c06  83c406           add sp, 6                                
  0c09  46               inc si                                   
  0c0a  a0c442           mov al, byte ptr [0x42c4]                
  0c0d  98               cwde                                     
  0c0e  3bc6             cmp ax, si                               
  0c10  7e03             jle 0xc15                                
  0c12  e94cff           jmp 0xb61                                
  0c15  33f6             xor si, si                               
  0c17  e99000           jmp 0xcaa                                
  0c1a  8a842c42         mov al, byte ptr [si + 0x422c]           
  0c1e  98               cwde                                     
  0c1f  0bc0             or ax, ax                                
  0c21  756b             jne 0xc8e                                
  0c23  80bc54421c       cmp byte ptr [si + 0x4254], 0x1c         
  0c28  7550             jne 0xc7a                                
  0c2a  8bde             mov bx, si                               
  0c2c  c1e302           shl bx, 2                                
  0c2f  c49fe642         les bx, ptr [bx + 0x42e6]                
  0c33  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0c37  98               cwde                                     
  0c38  6bc014           imul ax, ax, 0x14                        
  0c3b  052302           add ax, 0x223                            
  0c3e  68042c           push 0x2c04                              
  0c41  50               push ax                                  
  0c42  6a00             push 0                                   
  0c44  ff760a           push word ptr [bp + 0xa]                 
  0c47  ff7608           push word ptr [bp + 8]                   
  0c4a  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0c4f  83c404           add sp, 4                                
  0c52  50               push ax                                  
  0c53  6a01             push 1                                   
  0c55  a0fb41           mov al, byte ptr [0x41fb]                
  0c58  98               cwde                                     
  0c59  50               push ax                                  
  0c5a  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  0c5f  83c40c           add sp, 0xc                              
  0c62  ff760a           push word ptr [bp + 0xa]                 
  0c65  ff7608           push word ptr [bp + 8]                   
  0c68  8bde             mov bx, si                               
  0c6a  c1e302           shl bx, 2                                
  0c6d  66ffb7e642       push dword ptr [bx + 0x42e6]             
  0c72  90               nop                                      
  0c73  0e               push cs                                  
  0c74  e8560a           call 0x16cd                              
  0c77  83c408           add sp, 8                                
  0c7a  8bde             mov bx, si                               
  0c7c  c1e302           shl bx, 2                                
  0c7f  66ffb7e642       push dword ptr [bx + 0x42e6]             
  0c84  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  0c89  83c404           add sp, 4                                
  0c8c  eb1b             jmp 0xca9                                
  0c8e  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  0c93  7514             jne 0xca9                                
  0c95  6a01             push 1                                   
  0c97  8bde             mov bx, si                               
  0c99  c1e302           shl bx, 2                                
  0c9c  66ffb7e642       push dword ptr [bx + 0x42e6]             
  0ca1  9a61007330       lcall 0x3073, 0x61                       -> ovl47:04f1
  0ca6  83c406           add sp, 6                                
  0ca9  46               inc si                                   
  0caa  a0c542           mov al, byte ptr [0x42c5]                
  0cad  98               cwde                                     
  0cae  3bc6             cmp ax, si                               
  0cb0  7e03             jle 0xcb5                                
  0cb2  e965ff           jmp 0xc1a                                
  0cb5  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  0cba  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  0cbf  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  0cc4  837e0600         cmp word ptr [bp + 6], 0                 
  0cc8  7532             jne 0xcfc                                
  0cca  a0fb41           mov al, byte ptr [0x41fb]                
  0ccd  98               cwde                                     
  0cce  250f00           and ax, 0xf                              
  0cd1  8b1ee141         mov bx, word ptr [0x41e1]                
  0cd5  69dbe000         imul bx, bx, 0xe0                        
  0cd9  8b16e941         mov dx, word ptr [0x41e9]                
  0cdd  d1e2             shl dx, 1                                
  0cdf  03da             add bx, dx                               
  0ce1  ba1d1e           mov dx, 0x1e1d                           
  0ce4  8ec2             mov es, dx                               
  0ce6  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  0cec  2608870100       or byte ptr es:[bx + 1], al              
  0cf1  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  0cf6  b80100           mov ax, 1                                
  0cf9  e9d703           jmp 0x10d3                               
  0cfc  a0fa41           mov al, byte ptr [0x41fa]                
  0cff  98               cwde                                     
  0d00  250f00           and ax, 0xf                              
  0d03  8b1ee141         mov bx, word ptr [0x41e1]                
  0d07  69dbe000         imul bx, bx, 0xe0                        
  0d0b  8b16e941         mov dx, word ptr [0x41e9]                
  0d0f  d1e2             shl dx, 1                                
  0d11  03da             add bx, dx                               
  0d13  ba1d1e           mov dx, 0x1e1d                           
  0d16  8ec2             mov es, dx                               
  0d18  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  0d1e  2608870100       or byte ptr es:[bx + 1], al              
  0d23  ff36e141         push word ptr [0x41e1]                   
  0d27  ff36e941         push word ptr [0x41e9]                   
  0d2b  b8042c           mov ax, 0x2c04                           
  0d2e  8ec0             mov es, ax                               
  0d30  26ff361001       push word ptr es:[0x110]                 
  0d35  9a8e00f930       lcall 0x30f9, 0x8e                       -> ovl64:1298
  0d3a  83c406           add sp, 6                                
  0d3d  6a01             push 1                                   
  0d3f  ff36e141         push word ptr [0x41e1]                   
  0d43  ff36e941         push word ptr [0x41e9]                   
  0d47  9a4d00f230       lcall 0x30f2, 0x4d                       -> ovl63:1fed
  0d4c  83c406           add sp, 6                                
  0d4f  a0f341           mov al, byte ptr [0x41f3]                
  0d52  c1e805           shr ax, 5                                
  0d55  250100           and ax, 1                                
  0d58  0bc0             or ax, ax                                
  0d5a  7419             je 0xd75                                 
  0d5c  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0d5f  69dbe000         imul bx, bx, 0xe0                        
  0d63  8b4608           mov ax, word ptr [bp + 8]                
  0d66  d1e0             shl ax, 1                                
  0d68  03d8             add bx, ax                               
  0d6a  b81d1e           mov ax, 0x1e1d                           
  0d6d  8ec0             mov es, ax                               
  0d6f  2680a70100df     and byte ptr es:[bx + 1], 0xdf           
  0d75  8a1ef241         mov bl, byte ptr [0x41f2]                
  0d79  81e3ff00         and bx, 0xff                             
  0d7d  b8042c           mov ax, 0x2c04                           
  0d80  8ec0             mov es, ax                               
  0d82  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0d88  7403             je 0xd8d                                 
  0d8a  e969ff           jmp 0xcf6                                
  0d8d  803efb410f       cmp byte ptr [0x41fb], 0xf               
  0d92  7504             jne 0xd98                                
  0d94  33f6             xor si, si                               
  0d96  eb48             jmp 0xde0                                
  0d98  a0fb41           mov al, byte ptr [0x41fb]                
  0d9b  98               cwde                                     
  0d9c  d1e0             shl ax, 1                                
  0d9e  8bd8             mov bx, ax                               
  0da0  83bfea5d01       cmp word ptr [bx + 0x5dea], 1            
  0da5  7e26             jle 0xdcd                                
  0da7  a0fb41           mov al, byte ptr [0x41fb]                
  0daa  98               cwde                                     
  0dab  6bc014           imul ax, ax, 0x14                        
  0dae  ba042c           mov dx, 0x2c04                           
  0db1  8bd8             mov bx, ax                               
  0db3  8ec2             mov es, dx                               
  0db5  268b878501       mov ax, word ptr es:[bx + 0x185]         
  0dba  50               push ax                                  
  0dbb  a0fb41           mov al, byte ptr [0x41fb]                
  0dbe  98               cwde                                     
  0dbf  d1e0             shl ax, 1                                
  0dc1  8bd8             mov bx, ax                               
  0dc3  58               pop ax                                   
  0dc4  99               cdq                                      
  0dc5  f7bfea5d         idiv word ptr [bx + 0x5dea]              
  0dc9  8bf0             mov si, ax                               
  0dcb  eb13             jmp 0xde0                                
  0dcd  a0fb41           mov al, byte ptr [0x41fb]                
  0dd0  98               cwde                                     
  0dd1  6bc014           imul ax, ax, 0x14                        
  0dd4  ba042c           mov dx, 0x2c04                           
  0dd7  8bd8             mov bx, ax                               
  0dd9  8ec2             mov es, dx                               
  0ddb  268bb78501       mov si, word ptr es:[bx + 0x185]         
  0de0  8bc6             mov ax, si                               
  0de2  99               cdq                                      
  0de3  2bc2             sub ax, dx                               
  0de5  d1f8             sar ax, 1                                
  0de7  0bc0             or ax, ax                                
  0de9  7d04             jge 0xdef                                
  0deb  33c0             xor ax, ax                               
  0ded  eb07             jmp 0xdf6                                
  0def  8bc6             mov ax, si                               
  0df1  99               cdq                                      
  0df2  2bc2             sub ax, dx                               
  0df4  d1f8             sar ax, 1                                
  0df6  8bf0             mov si, ax                               
  0df8  a0fa41           mov al, byte ptr [0x41fa]                
  0dfb  98               cwde                                     
  0dfc  d1e0             shl ax, 1                                
  0dfe  ba042c           mov dx, 0x2c04                           
  0e01  8bd8             mov bx, ax                               
  0e03  8ec2             mov es, dx                               
  0e05  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0e0b  752d             jne 0xe3a                                
  0e0d  0bf6             or si, si                                
  0e0f  7e29             jle 0xe3a                                
  0e11  56               push si                                  
  0e12  666893000000     push 0x93                                
  0e18  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e1d  83c404           add sp, 4                                
  0e20  52               push dx                                  
  0e21  50               push ax                                  
  0e22  1e               push ds                                  
  0e23  686241           push 0x4162                              
  0e26  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e2b  83c40a           add sp, 0xa                              
  0e2e  1e               push ds                                  
  0e2f  686241           push 0x4162                              
  0e32  9a2f002c30       lcall 0x302c, 0x2f                       -> ovl37:04c5
  0e37  83c404           add sp, 4                                
  0e3a  803efb4108       cmp byte ptr [0x41fb], 8                 
  0e3f  7d26             jge 0xe67                                
  0e41  a0fa41           mov al, byte ptr [0x41fa]                
  0e44  98               cwde                                     
  0e45  6bc014           imul ax, ax, 0x14                        
  0e48  ba042c           mov dx, 0x2c04                           
  0e4b  8bd8             mov bx, ax                               
  0e4d  8ec2             mov es, dx                               
  0e4f  2601b78501       add word ptr es:[bx + 0x185], si         
  0e54  a0fb41           mov al, byte ptr [0x41fb]                
  0e57  98               cwde                                     
  0e58  6bc014           imul ax, ax, 0x14                        
  0e5b  8bde             mov bx, si                               
  0e5d  d1e3             shl bx, 1                                
  0e5f  8ec2             mov es, dx                               
  0e61  93               xchg bx, ax                              
  0e62  2629878501       sub word ptr es:[bx + 0x185], ax         
  0e67  c41edd41         les bx, ptr [0x41dd]                     
  0e6b  26807f150f       cmp byte ptr es:[bx + 0x15], 0xf         
  0e70  7426             je 0xe98                                 
  0e72  268a472f         mov al, byte ptr es:[bx + 0x2f]          
  0e76  b400             mov ah, 0                                
  0e78  ba042c           mov dx, 0x2c04                           
  0e7b  8ec2             mov es, dx                               
  0e7d  263b061001       cmp ax, word ptr es:[0x110]              
  0e82  7504             jne 0xe88                                
  0e84  b00f             mov al, 0xf                              
  0e86  eb08             jmp 0xe90                                
  0e88  c41edd41         les bx, ptr [0x41dd]                     
  0e8c  268a4715         mov al, byte ptr es:[bx + 0x15]          
  0e90  c41edd41         les bx, ptr [0x41dd]                     
  0e94  2688472f         mov byte ptr es:[bx + 0x2f], al          
  0e98  c41edd41         les bx, ptr [0x41dd]                     
  0e9c  26c6473000       mov byte ptr es:[bx + 0x30], 0           
  0ea1  a0fa41           mov al, byte ptr [0x41fa]                
  0ea4  26884715         mov byte ptr es:[bx + 0x15], al          
  0ea8  26c6472d00       mov byte ptr es:[bx + 0x2d], 0           
  0ead  bf0400           mov di, 4                                
  0eb0  e9a000           jmp 0xf53                                
  0eb3  8bdf             mov bx, di                               
  0eb5  d1e3             shl bx, 1                                
  0eb7  8b9fe141         mov bx, word ptr [bx + 0x41e1]           
  0ebb  69dbe000         imul bx, bx, 0xe0                        
  0ebf  8bf7             mov si, di                               
  0ec1  d1e6             shl si, 1                                
  0ec3  8b84e941         mov ax, word ptr [si + 0x41e9]           
  0ec7  d1e0             shl ax, 1                                
  0ec9  03d8             add bx, ax                               
  0ecb  b81d1e           mov ax, 0x1e1d                           
  0ece  8ec0             mov es, ax                               
  0ed0  2680a70100ef     and byte ptr es:[bx + 1], 0xef           
  0ed6  a0fa41           mov al, byte ptr [0x41fa]                
  0ed9  98               cwde                                     
  0eda  50               push ax                                  
  0edb  66ff36dd41       push dword ptr [0x41dd]                  
  0ee0  9a20003730       lcall 0x3037, 0x20                       -> ovl39:0000
  0ee5  83c406           add sp, 6                                
  0ee8  a0fa41           mov al, byte ptr [0x41fa]                
  0eeb  98               cwde                                     
  0eec  250f00           and ax, 0xf                              
  0eef  8bdf             mov bx, di                               
  0ef1  d1e3             shl bx, 1                                
  0ef3  8b9fe141         mov bx, word ptr [bx + 0x41e1]           
  0ef7  69dbe000         imul bx, bx, 0xe0                        
  0efb  8bf7             mov si, di                               
  0efd  d1e6             shl si, 1                                
  0eff  8b94e941         mov dx, word ptr [si + 0x41e9]           
  0f03  d1e2             shl dx, 1                                
  0f05  03da             add bx, dx                               
  0f07  ba1d1e           mov dx, 0x1e1d                           
  0f0a  8ec2             mov es, dx                               
  0f0c  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  0f12  2608870100       or byte ptr es:[bx + 1], al              
  0f17  8bdf             mov bx, di                               
  0f19  d1e3             shl bx, 1                                
  0f1b  ffb7e141         push word ptr [bx + 0x41e1]              
  0f1f  8bdf             mov bx, di                               
  0f21  d1e3             shl bx, 1                                
  0f23  ffb7e941         push word ptr [bx + 0x41e9]              
  0f27  b8042c           mov ax, 0x2c04                           
  0f2a  8ec0             mov es, ax                               
  0f2c  26ff361001       push word ptr es:[0x110]                 
  0f31  9a8e00f930       lcall 0x30f9, 0x8e                       -> ovl64:1298
  0f36  83c406           add sp, 6                                
  0f39  6a01             push 1                                   
  0f3b  8bdf             mov bx, di                               
  0f3d  d1e3             shl bx, 1                                
  0f3f  ffb7e141         push word ptr [bx + 0x41e1]              
  0f43  8bdf             mov bx, di                               
  0f45  d1e3             shl bx, 1                                
  0f47  ffb7e941         push word ptr [bx + 0x41e9]              
  0f4b  9a4d00f230       lcall 0x30f2, 0x4d                       -> ovl63:1fed
  0f50  83c406           add sp, 6                                
  0f53  8bc7             mov ax, di                               
  0f55  4f               dec di                                   
  0f56  0bc0             or ax, ax                                
  0f58  7403             je 0xf5d                                 
  0f5a  e956ff           jmp 0xeb3                                
  0f5d  6a01             push 1                                   
  0f5f  b8042c           mov ax, 0x2c04                           
  0f62  8ec0             mov es, ax                               
  0f64  26ff361001       push word ptr es:[0x110]                 
  0f69  9a9e0d5505       lcall 0x555, 0xd9e                       -> 0555:0d9e
  0f6e  83c404           add sp, 4                                
  0f71  c41edd41         les bx, ptr [0x41dd]                     
  0f75  26c747310000     mov word ptr es:[bx + 0x31], 0           
  0f7b  26ff7702         push word ptr es:[bx + 2]                
  0f7f  26ff37           push word ptr es:[bx]                    
  0f82  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0f87  83c404           add sp, 4                                
  0f8a  8946fe           mov word ptr [bp - 2], ax                
  0f8d  b8042c           mov ax, 0x2c04                           
  0f90  8ec0             mov es, ax                               
  0f92  268b368101       mov si, word ptr es:[0x181]              
  0f97  eb71             jmp 0x100a                               
  0f99  8bde             mov bx, si                               
  0f9b  6bdb16           imul bx, bx, 0x16                        
  0f9e  b81d1e           mov ax, 0x1e1d                           
  0fa1  8ec0             mov es, ax                               
  0fa3  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0fa8  3a06fb41         cmp al, byte ptr [0x41fb]                
  0fac  755c             jne 0x100a                               
  0fae  8bde             mov bx, si                               
  0fb0  6bdb16           imul bx, bx, 0x16                        
  0fb3  b81d1e           mov ax, 0x1e1d                           
  0fb6  8ec0             mov es, ax                               
  0fb8  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  0fbe  754a             jne 0x100a                               
  0fc0  8bde             mov bx, si                               
  0fc2  6bdb16           imul bx, bx, 0x16                        
  0fc5  b81d1e           mov ax, 0x1e1d                           
  0fc8  8ec0             mov es, ax                               
  0fca  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0fcf  250f00           and ax, 0xf                              
  0fd2  3d0100           cmp ax, 1                                
  0fd5  7533             jne 0x100a                               
  0fd7  8bde             mov bx, si                               
  0fd9  6bdb16           imul bx, bx, 0x16                        
  0fdc  b81d1e           mov ax, 0x1e1d                           
  0fdf  8ec0             mov es, ax                               
  0fe1  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0fe6  d1e8             shr ax, 1                                
  0fe8  257f00           and ax, 0x7f                             
  0feb  3b46fe           cmp ax, word ptr [bp - 2]                
  0fee  751a             jne 0x100a                               
  0ff0  8bc6             mov ax, si                               
  0ff2  6bc016           imul ax, ax, 0x16                        
  0ff5  ba0000           mov dx, 0                                
  0ff8  03d0             add dx, ax                               
  0ffa  81c28088         add dx, 0x8880                           
  0ffe  681d1e           push 0x1e1d                              
  1001  52               push dx                                  
  1002  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  1007  83c404           add sp, 4                                
  100a  8bc6             mov ax, si                               
  100c  4e               dec si                                   
  100d  0bc0             or ax, ax                                
  100f  7588             jne 0xf99                                
  1011  33f6             xor si, si                               
  1013  e99c00           jmp 0x10b2                               
  1016  8bde             mov bx, si                               
  1018  6bdb41           imul bx, bx, 0x41                        
  101b  b8042c           mov ax, 0x2c04                           
  101e  8ec0             mov es, ax                               
  1020  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  1026  7503             jne 0x102b                               
  1028  e98600           jmp 0x10b1                               
  102b  8bde             mov bx, si                               
  102d  6bdb41           imul bx, bx, 0x41                        
  1030  b8042c           mov ax, 0x2c04                           
  1033  8ec0             mov es, ax                               
  1035  268b87b015       mov ax, word ptr es:[bx + 0x15b0]        
  103a  c41edd41         les bx, ptr [0x41dd]                     
  103e  263b07           cmp ax, word ptr es:[bx]                 
  1041  756e             jne 0x10b1                               
  1043  8bde             mov bx, si                               
  1045  6bdb41           imul bx, bx, 0x41                        
  1048  b8042c           mov ax, 0x2c04                           
  104b  8ec0             mov es, ax                               
  104d  268b87b215       mov ax, word ptr es:[bx + 0x15b2]        
  1052  c41edd41         les bx, ptr [0x41dd]                     
  1056  263b4702         cmp ax, word ptr es:[bx + 2]             
  105a  7555             jne 0x10b1                               
  105c  8bde             mov bx, si                               
  105e  6bdb41           imul bx, bx, 0x41                        
  1061  b8042c           mov ax, 0x2c04                           
  1064  33d2             xor dx, dx                               
  1066  8ec0             mov es, ax                               
  1068  268997b015       mov word ptr es:[bx + 0x15b0], dx        
  106d  8bc2             mov ax, dx                               
  106f  8bde             mov bx, si                               
  1071  6bdb41           imul bx, bx, 0x41                        
  1074  ba042c           mov dx, 0x2c04                           
  1077  8ec2             mov es, dx                               
  1079  268987ae15       mov word ptr es:[bx + 0x15ae], ax        
  107e  8bde             mov bx, si                               
  1080  6bdb41           imul bx, bx, 0x41                        
  1083  b8042c           mov ax, 0x2c04                           
  1086  b200             mov dl, 0                                
  1088  8ec0             mov es, ax                               
  108a  268897aa15       mov byte ptr es:[bx + 0x15aa], dl        
  108f  8ac2             mov al, dl                               
  1091  98               cwde                                     
  1092  8bde             mov bx, si                               
  1094  6bdb41           imul bx, bx, 0x41                        
  1097  ba042c           mov dx, 0x2c04                           
  109a  8ec2             mov es, dx                               
  109c  268987b215       mov word ptr es:[bx + 0x15b2], ax        
  10a1  8bde             mov bx, si                               
  10a3  6bdb41           imul bx, bx, 0x41                        
  10a6  b8042c           mov ax, 0x2c04                           
  10a9  8ec0             mov es, ax                               
  10ab  26c687a915ff     mov byte ptr es:[bx + 0x15a9], 0xff      
  10b1  46               inc si                                   
  10b2  b8042c           mov ax, 0x2c04                           
  10b5  8ec0             mov es, ax                               
  10b7  2639367b15       cmp word ptr es:[0x157b], si             
  10bc  7e03             jle 0x10c1                               
  10be  e955ff           jmp 0x1016                               
  10c1  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  10c6  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  10cb  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  10d0  b82100           mov ax, 0x21                             
  10d3  5f               pop di                                   
  10d4  5e               pop si                                   
  10d5  c9               leave                                    
  10d6  cb               retf                                     

ovl36_10d7:  ; ENTRY
  10d7  55               push bp                                  
  10d8  8bec             mov bp, sp                               
  10da  56               push si                                  
  10db  57               push di                                  
  10dc  8b7e06           mov di, word ptr [bp + 6]                
  10df  83ff08           cmp di, 8                                
  10e2  7c03             jl 0x10e7                                
  10e4  e95f01           jmp 0x1246                               
  10e7  33d2             xor dx, dx                               
  10e9  33c9             xor cx, cx                               
  10eb  eb13             jmp 0x1100                               
  10ed  8bda             mov bx, dx                               
  10ef  d1e3             shl bx, 1                                
  10f1  b8042c           mov ax, 0x2c04                           
  10f4  8ec0             mov es, ax                               
  10f6  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  10fc  7401             je 0x10ff                                
  10fe  41               inc cx                                   
  10ff  42               inc dx                                   
  1100  83fa08           cmp dx, 8                                
  1103  7ce8             jl 0x10ed                                
  1105  83f901           cmp cx, 1                                
  1108  753f             jne 0x1149                               
  110a  8bdf             mov bx, di                               
  110c  6bdb14           imul bx, bx, 0x14                        
  110f  b8042c           mov ax, 0x2c04                           
  1112  8ec0             mov es, ax                               
  1114  268b879301       mov ax, word ptr es:[bx + 0x193]         
  1119  8bdf             mov bx, di                               
  111b  6bdb14           imul bx, bx, 0x14                        
  111e  ba042c           mov dx, 0x2c04                           
  1121  8ec2             mov es, dx                               
  1123  2689878901       mov word ptr es:[bx + 0x189], ax         
  1128  8bdf             mov bx, di                               
  112a  6bdb14           imul bx, bx, 0x14                        
  112d  b8042c           mov ax, 0x2c04                           
  1130  8ec0             mov es, ax                               
  1132  268b879501       mov ax, word ptr es:[bx + 0x195]         
  1137  8bdf             mov bx, di                               
  1139  6bdb14           imul bx, bx, 0x14                        
  113c  ba042c           mov dx, 0x2c04                           
  113f  8ec2             mov es, dx                               
  1141  2689878b01       mov word ptr es:[bx + 0x18b], ax         
  1146  e9fd00           jmp 0x1246                               
  1149  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  114e  8bdf             mov bx, di                               
  1150  6bdb14           imul bx, bx, 0x14                        
  1153  b8042c           mov ax, 0x2c04                           
  1156  8ec0             mov es, ax                               
  1158  26ffb79501       push word ptr es:[bx + 0x195]            
  115d  8bdf             mov bx, di                               
  115f  6bdb14           imul bx, bx, 0x14                        
  1162  b8042c           mov ax, 0x2c04                           
  1165  8ec0             mov es, ax                               
  1167  26ffb79301       push word ptr es:[bx + 0x193]            
  116c  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  1171  83c404           add sp, 4                                
  1174  8bc8             mov cx, ax                               
  1176  0bc9             or cx, cx                                
  1178  7c44             jl 0x11be                                
  117a  8bd9             mov bx, cx                               
  117c  6bdb41           imul bx, bx, 0x41                        
  117f  b8042c           mov ax, 0x2c04                           
  1182  8ec0             mov es, ax                               
  1184  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1189  69dbe000         imul bx, bx, 0xe0                        
  118d  8bf1             mov si, cx                               
  118f  6bf641           imul si, si, 0x41                        
  1192  b8042c           mov ax, 0x2c04                           
  1195  8ec0             mov es, ax                               
  1197  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  119c  d1e0             shl ax, 1                                
  119e  03d8             add bx, ax                               
  11a0  b81d1e           mov ax, 0x1e1d                           
  11a3  8ec0             mov es, ax                               
  11a5  268a9f0000       mov bl, byte ptr es:[bx]                 
  11aa  81e3ff00         and bx, 0xff                             
  11ae  b8042c           mov ax, 0x2c04                           
  11b1  8ec0             mov es, ax                               
  11b3  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  11b9  7403             je 0x11be                                
  11bb  b9ffff           mov cx, 0xffff                           
  11be  8bdf             mov bx, di                               
  11c0  d1e3             shl bx, 1                                
  11c2  83bfea5d00       cmp word ptr [bx + 0x5dea], 0            
  11c7  7503             jne 0x11cc                               
  11c9  e93eff           jmp 0x110a                               
  11cc  0bc9             or cx, cx                                
  11ce  7c17             jl 0x11e7                                
  11d0  8bd9             mov bx, cx                               
  11d2  6bdb41           imul bx, bx, 0x41                        
  11d5  b8042c           mov ax, 0x2c04                           
  11d8  8ec0             mov es, ax                               
  11da  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  11df  98               cwde                                     
  11e0  3bc7             cmp ax, di                               
  11e2  7503             jne 0x11e7                               
  11e4  e923ff           jmp 0x110a                               
  11e7  6a00             push 0                                   
  11e9  57               push di                                  
  11ea  8bdf             mov bx, di                               
  11ec  6bdb14           imul bx, bx, 0x14                        
  11ef  b8042c           mov ax, 0x2c04                           
  11f2  8ec0             mov es, ax                               
  11f4  26ffb78b01       push word ptr es:[bx + 0x18b]            
  11f9  8bdf             mov bx, di                               
  11fb  6bdb14           imul bx, bx, 0x14                        
  11fe  b8042c           mov ax, 0x2c04                           
  1201  8ec0             mov es, ax                               
  1203  26ffb78901       push word ptr es:[bx + 0x189]            
  1208  9a5c00e830       lcall 0x30e8, 0x5c                       -> ovl62:04fa
  120d  83c408           add sp, 8                                
  1210  8bc8             mov cx, ax                               
  1212  0bc9             or cx, cx                                
  1214  7c30             jl 0x1246                                
  1216  8bd9             mov bx, cx                               
  1218  6bdb41           imul bx, bx, 0x41                        
  121b  b8042c           mov ax, 0x2c04                           
  121e  8ec0             mov es, ax                               
  1220  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  1225  8bdf             mov bx, di                               
  1227  6bdb14           imul bx, bx, 0x14                        
  122a  ba042c           mov dx, 0x2c04                           
  122d  8ec2             mov es, dx                               
  122f  2689878901       mov word ptr es:[bx + 0x189], ax         
  1234  8bd9             mov bx, cx                               
  1236  6bdb41           imul bx, bx, 0x41                        
  1239  b8042c           mov ax, 0x2c04                           
  123c  8ec0             mov es, ax                               
  123e  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1243  e9f1fe           jmp 0x1137                               
  1246  5f               pop di                                   
  1247  5e               pop si                                   
  1248  5d               pop bp                                   
  1249  cb               retf                                     

ovl36_124a:  ; ENTRY
  124a  55               push bp                                  
  124b  8bec             mov bp, sp                               
  124d  83ec0c           sub sp, 0xc                              
  1250  56               push si                                  
  1251  57               push di                                  
  1252  8b7606           mov si, word ptr [bp + 6]                
  1255  8b7e08           mov di, word ptr [bp + 8]                
  1258  8bdf             mov bx, di                               
  125a  69dbe000         imul bx, bx, 0xe0                        
  125e  8bc6             mov ax, si                               
  1260  d1e0             shl ax, 1                                
  1262  03d8             add bx, ax                               
  1264  b81d1e           mov ax, 0x1e1d                           
  1267  8ec0             mov es, ax                               
  1269  268a870100       mov al, byte ptr es:[bx + 1]             
  126e  250f00           and ax, 0xf                              
  1271  8946fc           mov word ptr [bp - 4], ax                
  1274  89365e41         mov word ptr [0x415e], si                
  1278  893e5c41         mov word ptr [0x415c], di                
  127c  b8042c           mov ax, 0x2c04                           
  127f  8ec0             mov es, ax                               
  1281  26833e590100     cmp word ptr es:[0x159], 0               
  1287  7518             jne 0x12a1                               
  1289  837efc08         cmp word ptr [bp - 4], 8                 
  128d  7d17             jge 0x12a6                               
  128f  8b5efc           mov bx, word ptr [bp - 4]                
  1292  d1e3             shl bx, 1                                
  1294  b8042c           mov ax, 0x2c04                           
  1297  8ec0             mov es, ax                               
  1299  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  129f  7505             jne 0x12a6                               
  12a1  b80100           mov ax, 1                                
  12a4  eb02             jmp 0x12a8                               
  12a6  33c0             xor ax, ax                               
  12a8  8946fa           mov word ptr [bp - 6], ax                
  12ab  b8042c           mov ax, 0x2c04                           
  12ae  8ec0             mov es, ax                               
  12b0  26833e590100     cmp word ptr es:[0x159], 0               
  12b6  7406             je 0x12be                                
  12b8  837efc08         cmp word ptr [bp - 4], 8                 
  12bc  7c18             jl 0x12d6                                
  12be  837efc08         cmp word ptr [bp - 4], 8                 
  12c2  7d17             jge 0x12db                               
  12c4  8b5efc           mov bx, word ptr [bp - 4]                
  12c7  d1e3             shl bx, 1                                
  12c9  b8042c           mov ax, 0x2c04                           
  12cc  8ec0             mov es, ax                               
  12ce  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  12d4  7505             jne 0x12db                               
  12d6  b80100           mov ax, 1                                
  12d9  eb02             jmp 0x12dd                               
  12db  33c0             xor ax, ax                               
  12dd  8946f8           mov word ptr [bp - 8], ax                
  12e0  c746f60000       mov word ptr [bp - 0xa], 0               
  12e5  833e543200       cmp word ptr [0x3254], 0                 
  12ea  7423             je 0x130f                                
  12ec  8bdf             mov bx, di                               
  12ee  6bdb70           imul bx, bx, 0x70                        
  12f1  03de             add bx, si                               
  12f3  b8d919           mov ax, 0x19d9                           
  12f6  8ec0             mov es, ax                               
  12f8  268a870000       mov al, byte ptr es:[bx]                 
  12fd  c1e807           shr ax, 7                                
  1300  250100           and ax, 1                                
  1303  0bc0             or ax, ax                                
  1305  7508             jne 0x130f                               
  1307  33c0             xor ax, ax                               
  1309  8946f8           mov word ptr [bp - 8], ax                
  130c  8946fa           mov word ptr [bp - 6], ax                
  130f  57               push di                                  
  1310  56               push si                                  
  1311  9a20003030       lcall 0x3030, 0x20                       -> ovl38:008b
  1316  83c404           add sp, 4                                
  1319  837e0a00         cmp word ptr [bp + 0xa], 0               
  131d  755a             jne 0x1379                               
  131f  a0c542           mov al, byte ptr [0x42c5]                
  1322  98               cwde                                     
  1323  a32c41           mov word ptr [0x412c], ax                
  1326  c7062e410000     mov word ptr [0x412e], 0                 
  132c  a0c442           mov al, byte ptr [0x42c4]                
  132f  98               cwde                                     
  1330  a33041           mov word ptr [0x4130], ax                
  1333  c70632410000     mov word ptr [0x4132], 0                 
  1339  0e               push cs                                  
  133a  e869f5           call 0x8a6                               
  133d  a0c442           mov al, byte ptr [0x42c4]                
  1340  98               cwde                                     
  1341  8bf0             mov si, ax                               
  1343  eb0b             jmp 0x1350                               
  1345  80bc244200       cmp byte ptr [si + 0x4224], 0            
  134a  7404             je 0x1350                                
  134c  ff063241         inc word ptr [0x4132]                    
  1350  8bc6             mov ax, si                               
  1352  4e               dec si                                   
  1353  0bc0             or ax, ax                                
  1355  75ee             jne 0x1345                               
  1357  a0c542           mov al, byte ptr [0x42c5]                
  135a  98               cwde                                     
  135b  8bf0             mov si, ax                               
  135d  eb0b             jmp 0x136a                               
  135f  80bc2c4200       cmp byte ptr [si + 0x422c], 0            
  1364  7404             je 0x136a                                
  1366  ff062e41         inc word ptr [0x412e]                    
  136a  8bc6             mov ax, si                               
  136c  4e               dec si                                   
  136d  0bc0             or ax, ax                                
  136f  75ee             jne 0x135f                               
  1371  8cda             mov dx, ds                               
  1373  b82c41           mov ax, 0x412c                           
  1376  e93603           jmp 0x16af                               
  1379  33c9             xor cx, cx                               
  137b  33d2             xor dx, dx                               
  137d  eb24             jmp 0x13a3                               
  137f  8bda             mov bx, dx                               
  1381  d1e3             shl bx, 1                                
  1383  b8042c           mov ax, 0x2c04                           
  1386  8ec0             mov es, ax                               
  1388  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  138e  7412             je 0x13a2                                
  1390  8bda             mov bx, dx                               
  1392  d1e3             shl bx, 1                                
  1394  b8042c           mov ax, 0x2c04                           
  1397  8ec0             mov es, ax                               
  1399  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  139f  7501             jne 0x13a2                               
  13a1  41               inc cx                                   
  13a2  42               inc dx                                   
  13a3  83fa08           cmp dx, 8                                
  13a6  7cd7             jl 0x137f                                
  13a8  83f901           cmp cx, 1                                
  13ab  7e05             jle 0x13b2                               
  13ad  b80100           mov ax, 1                                
  13b0  eb02             jmp 0x13b4                               
  13b2  33c0             xor ax, ax                               
  13b4  8946f4           mov word ptr [bp - 0xc], ax              
  13b7  837ef400         cmp word ptr [bp - 0xc], 0               
  13bb  741b             je 0x13d8                                
  13bd  b8042c           mov ax, 0x2c04                           
  13c0  8ec0             mov es, ax                               
  13c2  26833e240100     cmp word ptr es:[0x124], 0               
  13c8  740e             je 0x13d8                                
  13ca  8b46fa           mov ax, word ptr [bp - 6]                
  13cd  8946f6           mov word ptr [bp - 0xa], ax              
  13d0  33c0             xor ax, ax                               
  13d2  8946f8           mov word ptr [bp - 8], ax                
  13d5  8946fa           mov word ptr [bp - 6], ax                
  13d8  66833edd4100     cmp dword ptr [0x41dd], 0                
  13de  745b             je 0x143b                                
  13e0  b8042c           mov ax, 0x2c04                           
  13e3  8ec0             mov es, ax                               
  13e5  26833e1c0100     cmp word ptr es:[0x11c], 0               
  13eb  7436             je 0x1423                                
  13ed  c41edd41         les bx, ptr [0x41dd]                     
  13f1  26807f150f       cmp byte ptr es:[bx + 0x15], 0xf         
  13f6  742b             je 0x1423                                
  13f8  268a4715         mov al, byte ptr es:[bx + 0x15]          
  13fc  98               cwde                                     
  13fd  ba042c           mov dx, 0x2c04                           
  1400  8ec2             mov es, dx                               
  1402  268b1e1001       mov bx, word ptr es:[0x110]              
  1407  c1e303           shl bx, 3                                
  140a  03d8             add bx, ax                               
  140c  b8042c           mov ax, 0x2c04                           
  140f  8ec0             mov es, ax                               
  1411  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1416  250300           and ax, 3                                
  1419  3d0200           cmp ax, 2                                
  141c  7405             je 0x1423                                
  141e  90               nop                                      
  141f  0e               push cs                                  
  1420  e8850c           call 0x20a8                              
  1423  b8042c           mov ax, 0x2c04                           
  1426  8ec0             mov es, ax                               
  1428  268b1e1001       mov bx, word ptr es:[0x110]              
  142d  d1e3             shl bx, 1                                
  142f  8a87be0c         mov al, byte ptr [bx + 0xcbe]            
  1433  c41edd41         les bx, ptr [0x41dd]                     
  1437  26084730         or byte ptr es:[bx + 0x30], al           
  143b  837efa00         cmp word ptr [bp - 6], 0                 
  143f  741f             je 0x1460                                
  1441  837ef400         cmp word ptr [bp - 0xc], 0               
  1445  740d             je 0x1454                                
  1447  b8042c           mov ax, 0x2c04                           
  144a  8ec0             mov es, ax                               
  144c  26833e240100     cmp word ptr es:[0x124], 0               
  1452  750c             jne 0x1460                               
  1454  6a01             push 1                                   
  1456  57               push di                                  
  1457  56               push si                                  
  1458  90               nop                                      
  1459  0e               push cs                                  
  145a  e8d903           call 0x1836                              
  145d  83c406           add sp, 6                                
  1460  666aff           push -1                                  
  1463  57               push di                                  
  1464  56               push si                                  
  1465  0e               push cs                                  
  1466  e8b9f0           call 0x522                               
  1469  83c408           add sp, 8                                
  146c  837efa00         cmp word ptr [bp - 6], 0                 
  1470  740a             je 0x147c                                
  1472  57               push di                                  
  1473  56               push si                                  
  1474  9a25000831       lcall 0x3108, 0x25                       -> ovl65:0227
  1479  83c404           add sp, 4                                
  147c  837efa00         cmp word ptr [bp - 6], 0                 
  1480  7506             jne 0x1488                               
  1482  837ef600         cmp word ptr [bp - 0xa], 0               
  1486  7463             je 0x14eb                                
  1488  837efc08         cmp word ptr [bp - 4], 8                 
  148c  7d2b             jge 0x14b9                               
  148e  8b46fc           mov ax, word ptr [bp - 4]                
  1491  6bc014           imul ax, ax, 0x14                        
  1494  050000           add ax, 0                                
  1497  68042c           push 0x2c04                              
  149a  50               push ax                                  
  149b  666894000000     push 0x94                                
  14a1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  14a6  83c404           add sp, 4                                
  14a9  52               push dx                                  
  14aa  50               push ax                                  
  14ab  1e               push ds                                  
  14ac  686241           push 0x4162                              
  14af  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  14b4  83c40c           add sp, 0xc                              
  14b7  eb1c             jmp 0x14d5                               
  14b9  666895000000     push 0x95                                
  14bf  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  14c4  83c404           add sp, 4                                
  14c7  52               push dx                                  
  14c8  50               push ax                                  
  14c9  1e               push ds                                  
  14ca  686241           push 0x4162                              
  14cd  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  14d2  83c408           add sp, 8                                
  14d5  6a05             push 5                                   
  14d7  1e               push ds                                  
  14d8  686241           push 0x4162                              
  14db  9a9300d730       lcall 0x30d7, 0x93                       -> ovl61:11d1
  14e0  83c406           add sp, 6                                
  14e3  c706f80c0100     mov word ptr [0xcf8], 1                  
  14e9  eb06             jmp 0x14f1                               
  14eb  c706f80c0000     mov word ptr [0xcf8], 0                  
  14f1  0e               push cs                                  
  14f2  e8b1f3           call 0x8a6                               
  14f5  8946fe           mov word ptr [bp - 2], ax                
  14f8  1e               push ds                                  
  14f9  68c642           push 0x42c6                              
  14fc  1e               push ds                                  
  14fd  68e642           push 0x42e6                              
  1500  57               push di                                  
  1501  56               push si                                  
  1502  9a4300db2f       lcall 0x2fdb, 0x43                       -> ovl25:09d7
  1507  83c40c           add sp, 0xc                              
  150a  837ef800         cmp word ptr [bp - 8], 0                 
  150e  7506             jne 0x1516                               
  1510  837ef600         cmp word ptr [bp - 0xa], 0               
  1514  7427             je 0x153d                                
  1516  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  151b  6a00             push 0                                   
  151d  9a2a002c30       lcall 0x302c, 0x2a                       -> ovl37:0160
  1522  59               pop cx                                   
  1523  6a05             push 5                                   
  1525  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  152a  59               pop cx                                   
  152b  ff76fe           push word ptr [bp - 2]                   
  152e  6a00             push 0                                   
  1530  9a25002c30       lcall 0x302c, 0x25                       -> ovl37:0094
  1535  83c404           add sp, 4                                
  1538  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  153d  57               push di                                  
  153e  56               push si                                  
  153f  ff76fe           push word ptr [bp - 2]                   
  1542  0e               push cs                                  
  1543  e825f5           call 0xa6b                               
  1546  83c406           add sp, 6                                
  1549  837efe01         cmp word ptr [bp - 2], 1                 
  154d  7517             jne 0x1566                               
  154f  8bdf             mov bx, di                               
  1551  69dbe000         imul bx, bx, 0xe0                        
  1555  8bc6             mov ax, si                               
  1557  d1e0             shl ax, 1                                
  1559  03d8             add bx, ax                               
  155b  b81d1e           mov ax, 0x1e1d                           
  155e  8ec0             mov es, ax                               
  1560  26808f010010     or byte ptr es:[bx + 1], 0x10            
  1566  837ef800         cmp word ptr [bp - 8], 0                 
  156a  750f             jne 0x157b                               
  156c  837ef600         cmp word ptr [bp - 0xa], 0               
  1570  7509             jne 0x157b                               
  1572  837efa00         cmp word ptr [bp - 6], 0                 
  1576  7503             jne 0x157b                               
  1578  e9b200           jmp 0x162d                               
  157b  837efe00         cmp word ptr [bp - 2], 0                 
  157f  751b             jne 0x159c                               
  1581  b8042c           mov ax, 0x2c04                           
  1584  8ec0             mov es, ax                               
  1586  26a11001         mov ax, word ptr es:[0x110]              
  158a  6bc014           imul ax, ax, 0x14                        
  158d  050000           add ax, 0                                
  1590  68042c           push 0x2c04                              
  1593  50               push ax                                  
  1594  666898000000     push 0x98                                
  159a  eb3c             jmp 0x15d8                               
  159c  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  15a2  741b             je 0x15bf                                
  15a4  c41e5e5e         les bx, ptr [0x5e5e]                     
  15a8  268a470a         mov al, byte ptr es:[bx + 0xa]           
  15ac  98               cwde                                     
  15ad  6bc014           imul ax, ax, 0x14                        
  15b0  052302           add ax, 0x223                            
  15b3  68042c           push 0x2c04                              
  15b6  50               push ax                                  
  15b7  66688e000000     push 0x8e                                
  15bd  eb19             jmp 0x15d8                               
  15bf  b8042c           mov ax, 0x2c04                           
  15c2  8ec0             mov es, ax                               
  15c4  26a11001         mov ax, word ptr es:[0x110]              
  15c8  6bc014           imul ax, ax, 0x14                        
  15cb  050000           add ax, 0                                
  15ce  68042c           push 0x2c04                              
  15d1  50               push ax                                  
  15d2  666896000000     push 0x96                                
  15d8  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  15dd  83c404           add sp, 4                                
  15e0  52               push dx                                  
  15e1  50               push ax                                  
  15e2  1e               push ds                                  
  15e3  686241           push 0x4162                              
  15e6  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  15eb  83c40c           add sp, 0xc                              
  15ee  837ef800         cmp word ptr [bp - 8], 0                 
  15f2  7506             jne 0x15fa                               
  15f4  837ef600         cmp word ptr [bp - 0xa], 0               
  15f8  7427             je 0x1621                                
  15fa  1e               push ds                                  
  15fb  686241           push 0x4162                              
  15fe  90               nop                                      
  15ff  0e               push cs                                  
  1600  e8b000           call 0x16b3                              
  1603  83c404           add sp, 4                                
  1606  1e               push ds                                  
  1607  686241           push 0x4162                              
  160a  9a2f002c30       lcall 0x302c, 0x2f                       -> ovl37:04c5
  160f  83c404           add sp, 4                                
  1612  6a0a             push 0xa                                 
  1614  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  1619  59               pop cx                                   
  161a  9a34002c30       lcall 0x302c, 0x34                       -> ovl37:04f6
  161f  eb0c             jmp 0x162d                               
  1621  1e               push ds                                  
  1622  686241           push 0x4162                              
  1625  90               nop                                      
  1626  0e               push cs                                  
  1627  e88900           call 0x16b3                              
  162a  83c404           add sp, 4                                
  162d  837efa00         cmp word ptr [bp - 6], 0                 
  1631  744e             je 0x1681                                
  1633  837ef400         cmp word ptr [bp - 0xc], 0               
  1637  740d             je 0x1646                                
  1639  b8042c           mov ax, 0x2c04                           
  163c  8ec0             mov es, ax                               
  163e  26833e240100     cmp word ptr es:[0x124], 0               
  1644  753b             jne 0x1681                               
  1646  6a00             push 0                                   
  1648  57               push di                                  
  1649  56               push si                                  
  164a  90               nop                                      
  164b  0e               push cs                                  
  164c  e8e701           call 0x1836                              
  164f  83c406           add sp, 6                                
  1652  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  1657  833e543200       cmp word ptr [0x3254], 0                 
  165c  7412             je 0x1670                                
  165e  b8042c           mov ax, 0x2c04                           
  1661  8ec0             mov es, ax                               
  1663  26833e240100     cmp word ptr es:[0x124], 0               
  1669  7405             je 0x1670                                
  166b  9a2a000831       lcall 0x3108, 0x2a                       -> ovl65:05ec
  1670  666a00           push 0                                   
  1673  666801000100     push 0x10001                             
  1679  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  167e  83c408           add sp, 8                                
  1681  ff76fe           push word ptr [bp - 2]                   
  1684  90               nop                                      
  1685  0e               push cs                                  
  1686  e8eb0b           call 0x2274                              
  1689  59               pop cx                                   
  168a  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  168f  666a00           push 0                                   
  1692  666a00           push 0                                   
  1695  6a00             push 0                                   
  1697  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  169c  83c40a           add sp, 0xa                              
  169f  0bc0             or ax, ax                                
  16a1  57               push di                                  
  16a2  56               push si                                  
  16a3  9a2a00e42f       lcall 0x2fe4, 0x2a                       -> ovl26:038d
  16a8  83c404           add sp, 4                                
  16ab  33d2             xor dx, dx                               
  16ad  33c0             xor ax, ax                               
  16af  5f               pop di                                   
  16b0  5e               pop si                                   
  16b1  c9               leave                                    
  16b2  cb               retf                                     

ovl36_16b3:  ; ENTRY
  16b3  55               push bp                                  
  16b4  8bec             mov bp, sp                               
  16b6  833ef80c00       cmp word ptr [0xcf8], 0                  
  16bb  740e             je 0x16cb                                
  16bd  6a05             push 5                                   
  16bf  66ff7606         push dword ptr [bp + 6]                  
  16c3  9a9300d730       lcall 0x30d7, 0x93                       -> ovl61:11d1
  16c8  83c406           add sp, 6                                
  16cb  5d               pop bp                                   
  16cc  cb               retf                                     

ovl36_16cd:  ; ENTRY
  16cd  55               push bp                                  
  16ce  8bec             mov bp, sp                               
  16d0  83ec0e           sub sp, 0xe                              
  16d3  56               push si                                  
  16d4  57               push di                                  
  16d5  8b7e0a           mov di, word ptr [bp + 0xa]              
  16d8  c646f301         mov byte ptr [bp - 0xd], 1               
  16dc  c45e06           les bx, ptr [bp + 6]                     
  16df  268a470a         mov al, byte ptr es:[bx + 0xa]           
  16e3  98               cwde                                     
  16e4  d1e0             shl ax, 1                                
  16e6  ba042c           mov dx, 0x2c04                           
  16e9  8bd8             mov bx, ax                               
  16eb  8ec2             mov es, dx                               
  16ed  26c78743050000   mov word ptr es:[bx + 0x543], 0          
  16f4  66ff7606         push dword ptr [bp + 6]                  
  16f8  666a00           push 0                                   
  16fb  6a02             push 2                                   
  16fd  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  1702  83c40a           add sp, 0xa                              
  1705  833e2e4800       cmp word ptr [0x482e], 0                 
  170a  7e38             jle 0x1744                               
  170c  8b5e0c           mov bx, word ptr [bp + 0xc]              
  170f  69dbe000         imul bx, bx, 0xe0                        
  1713  8bc7             mov ax, di                               
  1715  d1e0             shl ax, 1                                
  1717  03d8             add bx, ax                               
  1719  b81d1e           mov ax, 0x1e1d                           
  171c  8ec0             mov es, ax                               
  171e  268a9f0000       mov bl, byte ptr es:[bx]                 
  1723  81e3ff00         and bx, 0xff                             
  1727  b8042c           mov ax, 0x2c04                           
  172a  8ec0             mov es, ax                               
  172c  268a871007       mov al, byte ptr es:[bx + 0x710]         
  1731  98               cwde                                     
  1732  8946f4           mov word ptr [bp - 0xc], ax              
  1735  837ef402         cmp word ptr [bp - 0xc], 2               
  1739  7509             jne 0x1744                               
  173b  9a3e00ba30       lcall 0x30ba, 0x3e                       -> ovl58:023d
  1740  c646f300         mov byte ptr [bp - 0xd], 0               
  1744  33f6             xor si, si                               
  1746  e9e000           jmp 0x1829                               
  1749  8bde             mov bx, si                               
  174b  d1e3             shl bx, 1                                
  174d  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  1751  6bdb1d           imul bx, bx, 0x1d                        
  1754  b8042c           mov ax, 0x2c04                           
  1757  8a56f3           mov dl, byte ptr [bp - 0xd]              
  175a  8ec0             mov es, ax                               
  175c  268897ff0c       mov byte ptr es:[bx + 0xcff], dl         
  1761  8bde             mov bx, si                               
  1763  d1e3             shl bx, 1                                
  1765  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  1769  6bdb1d           imul bx, bx, 0x1d                        
  176c  b8042c           mov ax, 0x2c04                           
  176f  8ec0             mov es, ax                               
  1771  26c787000d0000   mov word ptr es:[bx + 0xd00], 0          
  1778  8bde             mov bx, si                               
  177a  d1e3             shl bx, 1                                
  177c  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  1780  6bdb1d           imul bx, bx, 0x1d                        
  1783  b8042c           mov ax, 0x2c04                           
  1786  8ec0             mov es, ax                               
  1788  2689bf020d       mov word ptr es:[bx + 0xd02], di         
  178d  8bde             mov bx, si                               
  178f  d1e3             shl bx, 1                                
  1791  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  1795  6bdb1d           imul bx, bx, 0x1d                        
  1798  b8042c           mov ax, 0x2c04                           
  179b  8b560c           mov dx, word ptr [bp + 0xc]              
  179e  8ec0             mov es, ax                               
  17a0  268997040d       mov word ptr es:[bx + 0xd04], dx         
  17a5  8bde             mov bx, si                               
  17a7  d1e3             shl bx, 1                                
  17a9  8b87fc4b         mov ax, word ptr [bx + 0x4bfc]           
  17ad  ba042c           mov dx, 0x2c04                           
  17b0  8ec2             mov es, dx                               
  17b2  263b061001       cmp ax, word ptr es:[0x110]              
  17b7  756f             jne 0x1828                               
  17b9  16               push ss                                  
  17ba  8d46f6           lea ax, [bp - 0xa]                       
  17bd  50               push ax                                  
  17be  16               push ss                                  
  17bf  8d46f8           lea ax, [bp - 8]                         
  17c2  50               push ax                                  
  17c3  6afe             push -2                                  
  17c5  9a48005830       lcall 0x3058, 0x48                       -> ovl44:0410
  17ca  83c40a           add sp, 0xa                              
  17cd  33d2             xor dx, dx                               
  17cf  eb52             jmp 0x1823                               
  17d1  8bda             mov bx, dx                               
  17d3  d1e3             shl bx, 1                                
  17d5  8d46f8           lea ax, [bp - 8]                         
  17d8  03d8             add bx, ax                               
  17da  368b1f           mov bx, word ptr ss:[bx]                 
  17dd  6bdb41           imul bx, bx, 0x41                        
  17e0  b8042c           mov ax, 0x2c04                           
  17e3  8ec0             mov es, ax                               
  17e5  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  17ec  8bda             mov bx, dx                               
  17ee  d1e3             shl bx, 1                                
  17f0  8d46f8           lea ax, [bp - 8]                         
  17f3  03d8             add bx, ax                               
  17f5  368b1f           mov bx, word ptr ss:[bx]                 
  17f8  6bdb41           imul bx, bx, 0x41                        
  17fb  b8042c           mov ax, 0x2c04                           
  17fe  8ec0             mov es, ax                               
  1800  26c787b015ffff   mov word ptr es:[bx + 0x15b0], 0xffff    
  1807  8bda             mov bx, dx                               
  1809  d1e3             shl bx, 1                                
  180b  8d46f8           lea ax, [bp - 8]                         
  180e  03d8             add bx, ax                               
  1810  368b1f           mov bx, word ptr ss:[bx]                 
  1813  6bdb41           imul bx, bx, 0x41                        
  1816  b8042c           mov ax, 0x2c04                           
  1819  8ec0             mov es, ax                               
  181b  26c787b215ffff   mov word ptr es:[bx + 0x15b2], 0xffff    
  1822  42               inc dx                                   
  1823  3b56f6           cmp dx, word ptr [bp - 0xa]              
  1826  7ca9             jl 0x17d1                                
  1828  46               inc si                                   
  1829  3b362e48         cmp si, word ptr [0x482e]                
  182d  7d03             jge 0x1832                               
  182f  e917ff           jmp 0x1749                               
  1832  5f               pop di                                   
  1833  5e               pop si                                   
  1834  c9               leave                                    
  1835  cb               retf                                     

ovl36_1836:  ; ENTRY
  1836  55               push bp                                  
  1837  8bec             mov bp, sp                               
  1839  83ec16           sub sp, 0x16                             
  183c  56               push si                                  
  183d  57               push di                                  
  183e  8b7606           mov si, word ptr [bp + 6]                
  1841  8b7e08           mov di, word ptr [bp + 8]                
  1844  33c9             xor cx, cx                               
  1846  33d2             xor dx, dx                               
  1848  eb24             jmp 0x186e                               
  184a  8bda             mov bx, dx                               
  184c  d1e3             shl bx, 1                                
  184e  b8042c           mov ax, 0x2c04                           
  1851  8ec0             mov es, ax                               
  1853  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1859  7412             je 0x186d                                
  185b  8bda             mov bx, dx                               
  185d  d1e3             shl bx, 1                                
  185f  b8042c           mov ax, 0x2c04                           
  1862  8ec0             mov es, ax                               
  1864  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  186a  7501             jne 0x186d                               
  186c  41               inc cx                                   
  186d  42               inc dx                                   
  186e  83fa08           cmp dx, 8                                
  1871  7cd7             jl 0x184a                                
  1873  83f901           cmp cx, 1                                
  1876  7e05             jle 0x187d                               
  1878  b80100           mov ax, 1                                
  187b  eb02             jmp 0x187f                               
  187d  33c0             xor ax, ax                               
  187f  8946ea           mov word ptr [bp - 0x16], ax             
  1882  837eea00         cmp word ptr [bp - 0x16], 0              
  1886  7426             je 0x18ae                                
  1888  b8042c           mov ax, 0x2c04                           
  188b  8ec0             mov es, ax                               
  188d  26833e240100     cmp word ptr es:[0x124], 0               
  1893  7419             je 0x18ae                                
  1895  8ec0             mov es, ax                               
  1897  268b1e1001       mov bx, word ptr es:[0x110]              
  189c  d1e3             shl bx, 1                                
  189e  b8042c           mov ax, 0x2c04                           
  18a1  8ec0             mov es, ax                               
  18a3  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  18a9  7503             jne 0x18ae                               
  18ab  e98f01           jmp 0x1a3d                               
  18ae  b8042c           mov ax, 0x2c04                           
  18b1  8ec0             mov es, ax                               
  18b3  26833e240100     cmp word ptr es:[0x124], 0               
  18b9  7425             je 0x18e0                                
  18bb  833e543200       cmp word ptr [0x3254], 0                 
  18c0  741e             je 0x18e0                                
  18c2  8bdf             mov bx, di                               
  18c4  6bdb70           imul bx, bx, 0x70                        
  18c7  03de             add bx, si                               
  18c9  b8d919           mov ax, 0x19d9                           
  18cc  8ec0             mov es, ax                               
  18ce  268a870000       mov al, byte ptr es:[bx]                 
  18d3  c1e807           shr ax, 7                                
  18d6  250100           and ax, 1                                
  18d9  0bc0             or ax, ax                                
  18db  7503             jne 0x18e0                               
  18dd  e95d01           jmp 0x1a3d                               
  18e0  b8042c           mov ax, 0x2c04                           
  18e3  8ec0             mov es, ax                               
  18e5  26ff367f01       push word ptr es:[0x17f]                 
  18ea  8ec0             mov es, ax                               
  18ec  26ff367d01       push word ptr es:[0x17d]                 
  18f1  9a25000831       lcall 0x3108, 0x25                       -> ovl65:0227
  18f6  83c404           add sp, 4                                
  18f9  9a2a00f930       lcall 0x30f9, 0x2a                       -> ovl64:0053
  18fe  837e0a00         cmp word ptr [bp + 0xa], 0               
  1902  7503             jne 0x1907                               
  1904  e9d000           jmp 0x19d7                               
  1907  6a0b             push 0xb                                 
  1909  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  190e  59               pop cx                                   
  190f  8d46f0           lea ax, [bp - 0x10]                      
  1912  16               push ss                                  
  1913  50               push ax                                  
  1914  1e               push ds                                  
  1915  68fa0c           push 0xcfa                               
  1918  b90800           mov cx, 8                                
  191b  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  1920  b8042c           mov ax, 0x2c04                           
  1923  8ec0             mov es, ax                               
  1925  2639367701       cmp word ptr es:[0x177], si              
  192a  7508             jne 0x1934                               
  192c  8346f028         add word ptr [bp - 0x10], 0x28           
  1930  836ef430         sub word ptr [bp - 0xc], 0x30            
  1934  b8042c           mov ax, 0x2c04                           
  1937  8ec0             mov es, ax                               
  1939  2639367b01       cmp word ptr es:[0x17b], si              
  193e  7504             jne 0x1944                               
  1940  836ef430         sub word ptr [bp - 0xc], 0x30            
  1944  b8042c           mov ax, 0x2c04                           
  1947  8ec0             mov es, ax                               
  1949  26393e7501       cmp word ptr es:[0x175], di              
  194e  7508             jne 0x1958                               
  1950  8346f228         add word ptr [bp - 0xe], 0x28            
  1954  836ef628         sub word ptr [bp - 0xa], 0x28            
  1958  b8042c           mov ax, 0x2c04                           
  195b  8ec0             mov es, ax                               
  195d  26393e7901       cmp word ptr es:[0x179], di              
  1962  7504             jne 0x1968                               
  1964  836ef628         sub word ptr [bp - 0xa], 0x28            
  1968  b8042c           mov ax, 0x2c04                           
  196b  8bd6             mov dx, si                               
  196d  8ec0             mov es, ax                               
  196f  262b167701       sub dx, word ptr es:[0x177]              
  1974  6bd228           imul dx, dx, 0x28                        
  1977  52               push dx                                  
  1978  8ec0             mov es, ax                               
  197a  2639367701       cmp word ptr es:[0x177], si              
  197f  7504             jne 0x1985                               
  1981  33c0             xor ax, ax                               
  1983  eb03             jmp 0x1988                               
  1985  b82800           mov ax, 0x28                             
  1988  5a               pop dx                                   
  1989  2bd0             sub dx, ax                               
  198b  8956ec           mov word ptr [bp - 0x14], dx             
  198e  b8042c           mov ax, 0x2c04                           
  1991  8bd7             mov dx, di                               
  1993  8ec0             mov es, ax                               
  1995  262b167501       sub dx, word ptr es:[0x175]              
  199a  6bd228           imul dx, dx, 0x28                        
  199d  52               push dx                                  
  199e  8ec0             mov es, ax                               
  19a0  26393e7501       cmp word ptr es:[0x175], di              
  19a5  7504             jne 0x19ab                               
  19a7  33c0             xor ax, ax                               
  19a9  eb03             jmp 0x19ae                               
  19ab  b82800           mov ax, 0x28                             
  19ae  5a               pop dx                                   
  19af  2bd0             sub dx, ax                               
  19b1  8956ee           mov word ptr [bp - 0x12], dx             
  19b4  66ff76f0         push dword ptr [bp - 0x10]               
  19b8  1e               push ds                                  
  19b9  68f656           push 0x56f6                              
  19bc  52               push dx                                  
  19bd  ff76ec           push word ptr [bp - 0x14]                
  19c0  1e               push ds                                  
  19c1  689567           push 0x6795                              
  19c4  66ff76f4         push dword ptr [bp - 0xc]                
  19c8  66ff76f0         push dword ptr [bp - 0x10]               
  19cc  1e               push ds                                  
  19cd  683157           push 0x5731                              
  19d0  ff1ec869         lcall [0x69c8]                           
  19d4  83c41c           add sp, 0x1c                             
  19d7  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  19dc  666868016801     push 0x1680168                           
  19e2  666a00           push 0                                   
  19e5  16               push ss                                  
  19e6  8d46f8           lea ax, [bp - 8]                         
  19e9  50               push ax                                  
  19ea  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  19ef  83c40c           add sp, 0xc                              
  19f2  666810001e00     push 0x1e0010                            
  19f8  16               push ss                                  
  19f9  8d46f8           lea ax, [bp - 8]                         
  19fc  50               push ax                                  
  19fd  1e               push ds                                  
  19fe  689567           push 0x6795                              
  1a01  9a9d00d014       lcall 0x14d0, 0x9d                       -> 14d0:009d
  1a06  83c40c           add sp, 0xc                              
  1a09  b8042c           mov ax, 0x2c04                           
  1a0c  8ec0             mov es, ax                               
  1a0e  268b1e1001       mov bx, word ptr es:[0x110]              
  1a13  d1e3             shl bx, 1                                
  1a15  b8042c           mov ax, 0x2c04                           
  1a18  8ec0             mov es, ax                               
  1a1a  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1a20  750b             jne 0x1a2d                               
  1a22  837e0a00         cmp word ptr [bp + 0xa], 0               
  1a26  7405             je 0x1a2d                                
  1a28  9a5c00ba30       lcall 0x30ba, 0x5c                       -> ovl58:0206
  1a2d  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1a32  837e0a00         cmp word ptr [bp + 0xa], 0               
  1a36  7405             je 0x1a3d                                
  1a38  9a2000f930       lcall 0x30f9, 0x20                       -> ovl64:1927
  1a3d  5f               pop di                                   
  1a3e  5e               pop si                                   
  1a3f  c9               leave                                    
  1a40  cb               retf                                     

ovl36_1a41:  ; ENTRY
  1a41  55               push bp                                  
  1a42  8bec             mov bp, sp                               
  1a44  83ec14           sub sp, 0x14                             
  1a47  b8042c           mov ax, 0x2c04                           
  1a4a  8ec0             mov es, ax                               
  1a4c  26ff367f01       push word ptr es:[0x17f]                 
  1a51  8ec0             mov es, ax                               
  1a53  26ff367d01       push word ptr es:[0x17d]                 
  1a58  9a25000831       lcall 0x3108, 0x25                       -> ovl65:0227
  1a5d  83c404           add sp, 4                                
  1a60  9a2a00f930       lcall 0x30f9, 0x2a                       -> ovl64:0053
  1a65  6a0b             push 0xb                                 
  1a67  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  1a6c  59               pop cx                                   
  1a6d  8d46f0           lea ax, [bp - 0x10]                      
  1a70  16               push ss                                  
  1a71  50               push ax                                  
  1a72  8b460a           mov ax, word ptr [bp + 0xa]              
  1a75  c1e003           shl ax, 3                                
  1a78  05020d           add ax, 0xd02                            
  1a7b  1e               push ds                                  
  1a7c  50               push ax                                  
  1a7d  b90800           mov cx, 8                                
  1a80  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  1a85  b8042c           mov ax, 0x2c04                           
  1a88  8b5606           mov dx, word ptr [bp + 6]                
  1a8b  8ec0             mov es, ax                               
  1a8d  262b167701       sub dx, word ptr es:[0x177]              
  1a92  6bd228           imul dx, dx, 0x28                        
  1a95  8956ec           mov word ptr [bp - 0x14], dx             
  1a98  8b5608           mov dx, word ptr [bp + 8]                
  1a9b  8ec0             mov es, ax                               
  1a9d  262b167501       sub dx, word ptr es:[0x175]              
  1aa2  6bd228           imul dx, dx, 0x28                        
  1aa5  8956ee           mov word ptr [bp - 0x12], dx             
  1aa8  66ff76f0         push dword ptr [bp - 0x10]               
  1aac  1e               push ds                                  
  1aad  68f656           push 0x56f6                              
  1ab0  52               push dx                                  
  1ab1  ff76ec           push word ptr [bp - 0x14]                
  1ab4  1e               push ds                                  
  1ab5  689567           push 0x6795                              
  1ab8  66ff76f4         push dword ptr [bp - 0xc]                
  1abc  66ff76f0         push dword ptr [bp - 0x10]               
  1ac0  1e               push ds                                  
  1ac1  683157           push 0x5731                              
  1ac4  ff1ec869         lcall [0x69c8]                           
  1ac8  83c41c           add sp, 0x1c                             
  1acb  666868016801     push 0x1680168                           
  1ad1  666a00           push 0                                   
  1ad4  16               push ss                                  
  1ad5  8d46f8           lea ax, [bp - 8]                         
  1ad8  50               push ax                                  
  1ad9  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1ade  83c40c           add sp, 0xc                              
  1ae1  666810001e00     push 0x1e0010                            
  1ae7  16               push ss                                  
  1ae8  8d46f8           lea ax, [bp - 8]                         
  1aeb  50               push ax                                  
  1aec  1e               push ds                                  
  1aed  689567           push 0x6795                              
  1af0  9a9d00d014       lcall 0x14d0, 0x9d                       -> 14d0:009d
  1af5  83c40c           add sp, 0xc                              
  1af8  9a2000f930       lcall 0x30f9, 0x20                       -> ovl64:1927
  1afd  c9               leave                                    
  1afe  cb               retf                                     

ovl36_1aff:  ; ENTRY
  1aff  55               push bp                                  
  1b00  8bec             mov bp, sp                               
  1b02  83ec04           sub sp, 4                                
  1b05  56               push si                                  
  1b06  57               push di                                  
  1b07  803efa410f       cmp byte ptr [0x41fa], 0xf               
  1b0c  7405             je 0x1b13                                
  1b0e  b80100           mov ax, 1                                
  1b11  eb02             jmp 0x1b15                               
  1b13  33c0             xor ax, ax                               
  1b15  8946fe           mov word ptr [bp - 2], ax                
  1b18  803efb410f       cmp byte ptr [0x41fb], 0xf               
  1b1d  7405             je 0x1b24                                
  1b1f  b80100           mov ax, 1                                
  1b22  eb02             jmp 0x1b26                               
  1b24  33c0             xor ax, ax                               
  1b26  8946fc           mov word ptr [bp - 4], ax                
  1b29  837efe00         cmp word ptr [bp - 2], 0                 
  1b2d  740b             je 0x1b3a                                
  1b2f  837efc00         cmp word ptr [bp - 4], 0                 
  1b33  7405             je 0x1b3a                                
  1b35  b80100           mov ax, 1                                
  1b38  eb02             jmp 0x1b3c                               
  1b3a  33c0             xor ax, ax                               
  1b3c  8bf8             mov di, ax                               
  1b3e  33f6             xor si, si                               
  1b40  e95401           jmp 0x1c97                               
  1b43  8a842442         mov al, byte ptr [si + 0x4224]           
  1b47  98               cwde                                     
  1b48  0bc0             or ax, ax                                
  1b4a  7403             je 0x1b4f                                
  1b4c  e94401           jmp 0x1c93                               
  1b4f  80bcfc4100       cmp byte ptr [si + 0x41fc], 0            
  1b54  7442             je 0x1b98                                
  1b56  837efe00         cmp word ptr [bp - 2], 0                 
  1b5a  741c             je 0x1b78                                
  1b5c  a0fa41           mov al, byte ptr [0x41fa]                
  1b5f  98               cwde                                     
  1b60  6bc050           imul ax, ax, 0x50                        
  1b63  50               push ax                                  
  1b64  a0fa41           mov al, byte ptr [0x41fa]                
  1b67  98               cwde                                     
  1b68  6bc00a           imul ax, ax, 0xa                         
  1b6b  5b               pop bx                                   
  1b6c  03d8             add bx, ax                               
  1b6e  b8042c           mov ax, 0x2c04                           
  1b71  8ec0             mov es, ax                               
  1b73  26ff876911       inc word ptr es:[bx + 0x1169]            
  1b78  0bff             or di, di                                
  1b7a  741c             je 0x1b98                                
  1b7c  a0fb41           mov al, byte ptr [0x41fb]                
  1b7f  98               cwde                                     
  1b80  6bc050           imul ax, ax, 0x50                        
  1b83  50               push ax                                  
  1b84  a0fa41           mov al, byte ptr [0x41fa]                
  1b87  98               cwde                                     
  1b88  6bc00a           imul ax, ax, 0xa                         
  1b8b  5b               pop bx                                   
  1b8c  03d8             add bx, ax                               
  1b8e  b8042c           mov ax, 0x2c04                           
  1b91  8ec0             mov es, ax                               
  1b93  26ff876911       inc word ptr es:[bx + 0x1169]            
  1b98  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  1b9d  7548             jne 0x1be7                               
  1b9f  837efe00         cmp word ptr [bp - 2], 0                 
  1ba3  741c             je 0x1bc1                                
  1ba5  a0fa41           mov al, byte ptr [0x41fa]                
  1ba8  98               cwde                                     
  1ba9  6bc050           imul ax, ax, 0x50                        
  1bac  50               push ax                                  
  1bad  a0fa41           mov al, byte ptr [0x41fa]                
  1bb0  98               cwde                                     
  1bb1  6bc00a           imul ax, ax, 0xa                         
  1bb4  5b               pop bx                                   
  1bb5  03d8             add bx, ax                               
  1bb7  b8042c           mov ax, 0x2c04                           
  1bba  8ec0             mov es, ax                               
  1bbc  26ff876711       inc word ptr es:[bx + 0x1167]            
  1bc1  0bff             or di, di                                
  1bc3  7503             jne 0x1bc8                               
  1bc5  e9ce00           jmp 0x1c96                               
  1bc8  a0fb41           mov al, byte ptr [0x41fb]                
  1bcb  98               cwde                                     
  1bcc  6bc050           imul ax, ax, 0x50                        
  1bcf  50               push ax                                  
  1bd0  a0fa41           mov al, byte ptr [0x41fa]                
  1bd3  98               cwde                                     
  1bd4  6bc00a           imul ax, ax, 0xa                         
  1bd7  5b               pop bx                                   
  1bd8  03d8             add bx, ax                               
  1bda  b8042c           mov ax, 0x2c04                           
  1bdd  8ec0             mov es, ax                               
  1bdf  26ff876711       inc word ptr es:[bx + 0x1167]            
  1be4  e9af00           jmp 0x1c96                               
  1be7  8a844c42         mov al, byte ptr [si + 0x424c]           
  1beb  98               cwde                                     
  1bec  6bc006           imul ax, ax, 6                           
  1bef  8bd8             mov bx, ax                               
  1bf1  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  1bf6  7444             je 0x1c3c                                
  1bf8  837efe00         cmp word ptr [bp - 2], 0                 
  1bfc  741c             je 0x1c1a                                
  1bfe  a0fa41           mov al, byte ptr [0x41fa]                
  1c01  98               cwde                                     
  1c02  6bc050           imul ax, ax, 0x50                        
  1c05  50               push ax                                  
  1c06  a0fa41           mov al, byte ptr [0x41fa]                
  1c09  98               cwde                                     
  1c0a  6bc00a           imul ax, ax, 0xa                         
  1c0d  5b               pop bx                                   
  1c0e  03d8             add bx, ax                               
  1c10  b8042c           mov ax, 0x2c04                           
  1c13  8ec0             mov es, ax                               
  1c15  26ff876511       inc word ptr es:[bx + 0x1165]            
  1c1a  0bff             or di, di                                
  1c1c  7478             je 0x1c96                                
  1c1e  a0fb41           mov al, byte ptr [0x41fb]                
  1c21  98               cwde                                     
  1c22  6bc050           imul ax, ax, 0x50                        
  1c25  50               push ax                                  
  1c26  a0fa41           mov al, byte ptr [0x41fa]                
  1c29  98               cwde                                     
  1c2a  6bc00a           imul ax, ax, 0xa                         
  1c2d  5b               pop bx                                   
  1c2e  03d8             add bx, ax                               
  1c30  b8042c           mov ax, 0x2c04                           
  1c33  8ec0             mov es, ax                               
  1c35  26ff876511       inc word ptr es:[bx + 0x1165]            
  1c3a  eb5a             jmp 0x1c96                               
  1c3c  8a844c42         mov al, byte ptr [si + 0x424c]           
  1c40  98               cwde                                     
  1c41  6bc006           imul ax, ax, 6                           
  1c44  8bd8             mov bx, ax                               
  1c46  8a87c845         mov al, byte ptr [bx + 0x45c8]           
  1c4a  98               cwde                                     
  1c4b  0bc0             or ax, ax                                
  1c4d  7547             jne 0x1c96                               
  1c4f  837efe00         cmp word ptr [bp - 2], 0                 
  1c53  741c             je 0x1c71                                
  1c55  a0fa41           mov al, byte ptr [0x41fa]                
  1c58  98               cwde                                     
  1c59  6bc050           imul ax, ax, 0x50                        
  1c5c  50               push ax                                  
  1c5d  a0fa41           mov al, byte ptr [0x41fa]                
  1c60  98               cwde                                     
  1c61  6bc00a           imul ax, ax, 0xa                         
  1c64  5b               pop bx                                   
  1c65  03d8             add bx, ax                               
  1c67  b8042c           mov ax, 0x2c04                           
  1c6a  8ec0             mov es, ax                               
  1c6c  26ff876311       inc word ptr es:[bx + 0x1163]            
  1c71  0bff             or di, di                                
  1c73  7421             je 0x1c96                                
  1c75  a0fb41           mov al, byte ptr [0x41fb]                
  1c78  98               cwde                                     
  1c79  6bc050           imul ax, ax, 0x50                        
  1c7c  50               push ax                                  
  1c7d  a0fa41           mov al, byte ptr [0x41fa]                
  1c80  98               cwde                                     
  1c81  6bc00a           imul ax, ax, 0xa                         
  1c84  5b               pop bx                                   
  1c85  03d8             add bx, ax                               
  1c87  b8042c           mov ax, 0x2c04                           
  1c8a  8ec0             mov es, ax                               
  1c8c  26ff876311       inc word ptr es:[bx + 0x1163]            
  1c91  eb03             jmp 0x1c96                               
  1c93  ba0100           mov dx, 1                                
  1c96  46               inc si                                   
  1c97  a0c442           mov al, byte ptr [0x42c4]                
  1c9a  98               cwde                                     
  1c9b  3bc6             cmp ax, si                               
  1c9d  7e03             jle 0x1ca2                               
  1c9f  e9a1fe           jmp 0x1b43                               
  1ca2  33f6             xor si, si                               
  1ca4  e95301           jmp 0x1dfa                               
  1ca7  8a842c42         mov al, byte ptr [si + 0x422c]           
  1cab  98               cwde                                     
  1cac  0bc0             or ax, ax                                
  1cae  7403             je 0x1cb3                                
  1cb0  e94401           jmp 0x1df7                               
  1cb3  80bc044200       cmp byte ptr [si + 0x4204], 0            
  1cb8  7442             je 0x1cfc                                
  1cba  837efc00         cmp word ptr [bp - 4], 0                 
  1cbe  741c             je 0x1cdc                                
  1cc0  a0fb41           mov al, byte ptr [0x41fb]                
  1cc3  98               cwde                                     
  1cc4  6bc050           imul ax, ax, 0x50                        
  1cc7  50               push ax                                  
  1cc8  a0fb41           mov al, byte ptr [0x41fb]                
  1ccb  98               cwde                                     
  1ccc  6bc00a           imul ax, ax, 0xa                         
  1ccf  5b               pop bx                                   
  1cd0  03d8             add bx, ax                               
  1cd2  b8042c           mov ax, 0x2c04                           
  1cd5  8ec0             mov es, ax                               
  1cd7  26ff876911       inc word ptr es:[bx + 0x1169]            
  1cdc  0bff             or di, di                                
  1cde  741c             je 0x1cfc                                
  1ce0  a0fa41           mov al, byte ptr [0x41fa]                
  1ce3  98               cwde                                     
  1ce4  6bc050           imul ax, ax, 0x50                        
  1ce7  50               push ax                                  
  1ce8  a0fb41           mov al, byte ptr [0x41fb]                
  1ceb  98               cwde                                     
  1cec  6bc00a           imul ax, ax, 0xa                         
  1cef  5b               pop bx                                   
  1cf0  03d8             add bx, ax                               
  1cf2  b8042c           mov ax, 0x2c04                           
  1cf5  8ec0             mov es, ax                               
  1cf7  26ff876911       inc word ptr es:[bx + 0x1169]            
  1cfc  80bc54421c       cmp byte ptr [si + 0x4254], 0x1c         
  1d01  7548             jne 0x1d4b                               
  1d03  837efc00         cmp word ptr [bp - 4], 0                 
  1d07  741c             je 0x1d25                                
  1d09  a0fb41           mov al, byte ptr [0x41fb]                
  1d0c  98               cwde                                     
  1d0d  6bc050           imul ax, ax, 0x50                        
  1d10  50               push ax                                  
  1d11  a0fb41           mov al, byte ptr [0x41fb]                
  1d14  98               cwde                                     
  1d15  6bc00a           imul ax, ax, 0xa                         
  1d18  5b               pop bx                                   
  1d19  03d8             add bx, ax                               
  1d1b  b8042c           mov ax, 0x2c04                           
  1d1e  8ec0             mov es, ax                               
  1d20  26ff876711       inc word ptr es:[bx + 0x1167]            
  1d25  0bff             or di, di                                
  1d27  7503             jne 0x1d2c                               
  1d29  e9cd00           jmp 0x1df9                               
  1d2c  a0fa41           mov al, byte ptr [0x41fa]                
  1d2f  98               cwde                                     
  1d30  6bc050           imul ax, ax, 0x50                        
  1d33  50               push ax                                  
  1d34  a0fb41           mov al, byte ptr [0x41fb]                
  1d37  98               cwde                                     
  1d38  6bc00a           imul ax, ax, 0xa                         
  1d3b  5b               pop bx                                   
  1d3c  03d8             add bx, ax                               
  1d3e  b8042c           mov ax, 0x2c04                           
  1d41  8ec0             mov es, ax                               
  1d43  26ff876711       inc word ptr es:[bx + 0x1167]            
  1d48  e9ae00           jmp 0x1df9                               
  1d4b  8a845442         mov al, byte ptr [si + 0x4254]           
  1d4f  98               cwde                                     
  1d50  6bc006           imul ax, ax, 6                           
  1d53  8bd8             mov bx, ax                               
  1d55  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  1d5a  7444             je 0x1da0                                
  1d5c  837efc00         cmp word ptr [bp - 4], 0                 
  1d60  741c             je 0x1d7e                                
  1d62  a0fb41           mov al, byte ptr [0x41fb]                
  1d65  98               cwde                                     
  1d66  6bc050           imul ax, ax, 0x50                        
  1d69  50               push ax                                  
  1d6a  a0fb41           mov al, byte ptr [0x41fb]                
  1d6d  98               cwde                                     
  1d6e  6bc00a           imul ax, ax, 0xa                         
  1d71  5b               pop bx                                   
  1d72  03d8             add bx, ax                               
  1d74  b8042c           mov ax, 0x2c04                           
  1d77  8ec0             mov es, ax                               
  1d79  26ff876511       inc word ptr es:[bx + 0x1165]            
  1d7e  0bff             or di, di                                
  1d80  7477             je 0x1df9                                
  1d82  a0fa41           mov al, byte ptr [0x41fa]                
  1d85  98               cwde                                     
  1d86  6bc050           imul ax, ax, 0x50                        
  1d89  50               push ax                                  
  1d8a  a0fb41           mov al, byte ptr [0x41fb]                
  1d8d  98               cwde                                     
  1d8e  6bc00a           imul ax, ax, 0xa                         
  1d91  5b               pop bx                                   
  1d92  03d8             add bx, ax                               
  1d94  b8042c           mov ax, 0x2c04                           
  1d97  8ec0             mov es, ax                               
  1d99  26ff876511       inc word ptr es:[bx + 0x1165]            
  1d9e  eb59             jmp 0x1df9                               
  1da0  8a845442         mov al, byte ptr [si + 0x4254]           
  1da4  98               cwde                                     
  1da5  6bc006           imul ax, ax, 6                           
  1da8  8bd8             mov bx, ax                               
  1daa  8a87c845         mov al, byte ptr [bx + 0x45c8]           
  1dae  98               cwde                                     
  1daf  0bc0             or ax, ax                                
  1db1  7546             jne 0x1df9                               
  1db3  837efc00         cmp word ptr [bp - 4], 0                 
  1db7  741c             je 0x1dd5                                
  1db9  a0fb41           mov al, byte ptr [0x41fb]                
  1dbc  98               cwde                                     
  1dbd  6bc050           imul ax, ax, 0x50                        
  1dc0  50               push ax                                  
  1dc1  a0fb41           mov al, byte ptr [0x41fb]                
  1dc4  98               cwde                                     
  1dc5  6bc00a           imul ax, ax, 0xa                         
  1dc8  5b               pop bx                                   
  1dc9  03d8             add bx, ax                               
  1dcb  b8042c           mov ax, 0x2c04                           
  1dce  8ec0             mov es, ax                               
  1dd0  26ff876311       inc word ptr es:[bx + 0x1163]            
  1dd5  0bff             or di, di                                
  1dd7  7420             je 0x1df9                                
  1dd9  a0fa41           mov al, byte ptr [0x41fa]                
  1ddc  98               cwde                                     
  1ddd  6bc050           imul ax, ax, 0x50                        
  1de0  50               push ax                                  
  1de1  a0fb41           mov al, byte ptr [0x41fb]                
  1de4  98               cwde                                     
  1de5  6bc00a           imul ax, ax, 0xa                         
  1de8  5b               pop bx                                   
  1de9  03d8             add bx, ax                               
  1deb  b8042c           mov ax, 0x2c04                           
  1dee  8ec0             mov es, ax                               
  1df0  26ff876311       inc word ptr es:[bx + 0x1163]            
  1df5  eb02             jmp 0x1df9                               
  1df7  33d2             xor dx, dx                               
  1df9  46               inc si                                   
  1dfa  a0c542           mov al, byte ptr [0x42c5]                
  1dfd  98               cwde                                     
  1dfe  3bc6             cmp ax, si                               
  1e00  7e03             jle 0x1e05                               
  1e02  e9a2fe           jmp 0x1ca7                               
  1e05  0bd2             or dx, dx                                
  1e07  7503             jne 0x1e0c                               
  1e09  e98600           jmp 0x1e92                               
  1e0c  33f6             xor si, si                               
  1e0e  eb77             jmp 0x1e87                               
  1e10  80bc54421c       cmp byte ptr [si + 0x4254], 0x1c         
  1e15  756f             jne 0x1e86                               
  1e17  8bde             mov bx, si                               
  1e19  c1e302           shl bx, 2                                
  1e1c  66ffb7e642       push dword ptr [bx + 0x42e6]             
  1e21  666a00           push 0                                   
  1e24  6a02             push 2                                   
  1e26  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  1e2b  83c40a           add sp, 0xa                              
  1e2e  33d2             xor dx, dx                               
  1e30  eb4e             jmp 0x1e80                               
  1e32  8bda             mov bx, dx                               
  1e34  d1e3             shl bx, 1                                
  1e36  83bffc4b08       cmp word ptr [bx + 0x4bfc], 8            
  1e3b  7d42             jge 0x1e7f                               
  1e3d  0bff             or di, di                                
  1e3f  741c             je 0x1e5d                                
  1e41  a0fa41           mov al, byte ptr [0x41fa]                
  1e44  98               cwde                                     
  1e45  6bc050           imul ax, ax, 0x50                        
  1e48  50               push ax                                  
  1e49  a0fb41           mov al, byte ptr [0x41fb]                
  1e4c  98               cwde                                     
  1e4d  6bc00a           imul ax, ax, 0xa                         
  1e50  5b               pop bx                                   
  1e51  03d8             add bx, ax                               
  1e53  b8042c           mov ax, 0x2c04                           
  1e56  8ec0             mov es, ax                               
  1e58  26ff876b11       inc word ptr es:[bx + 0x116b]            
  1e5d  837efc00         cmp word ptr [bp - 4], 0                 
  1e61  741c             je 0x1e7f                                
  1e63  a0fb41           mov al, byte ptr [0x41fb]                
  1e66  98               cwde                                     
  1e67  6bc050           imul ax, ax, 0x50                        
  1e6a  50               push ax                                  
  1e6b  a0fb41           mov al, byte ptr [0x41fb]                
  1e6e  98               cwde                                     
  1e6f  6bc00a           imul ax, ax, 0xa                         
  1e72  5b               pop bx                                   
  1e73  03d8             add bx, ax                               
  1e75  b8042c           mov ax, 0x2c04                           
  1e78  8ec0             mov es, ax                               
  1e7a  26ff876b11       inc word ptr es:[bx + 0x116b]            
  1e7f  42               inc dx                                   
  1e80  3b162e48         cmp dx, word ptr [0x482e]                
  1e84  7cac             jl 0x1e32                                
  1e86  46               inc si                                   
  1e87  a0c542           mov al, byte ptr [0x42c5]                
  1e8a  98               cwde                                     
  1e8b  3bc6             cmp ax, si                               
  1e8d  7f81             jg 0x1e10                                
  1e8f  e98300           jmp 0x1f15                               
  1e92  33f6             xor si, si                               
  1e94  eb77             jmp 0x1f0d                               
  1e96  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  1e9b  756f             jne 0x1f0c                               
  1e9d  8bde             mov bx, si                               
  1e9f  c1e302           shl bx, 2                                
  1ea2  66ffb7c642       push dword ptr [bx + 0x42c6]             
  1ea7  666a00           push 0                                   
  1eaa  6a02             push 2                                   
  1eac  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  1eb1  83c40a           add sp, 0xa                              
  1eb4  33d2             xor dx, dx                               
  1eb6  eb4e             jmp 0x1f06                               
  1eb8  8bda             mov bx, dx                               
  1eba  d1e3             shl bx, 1                                
  1ebc  83bffc4b08       cmp word ptr [bx + 0x4bfc], 8            
  1ec1  7d42             jge 0x1f05                               
  1ec3  0bff             or di, di                                
  1ec5  741c             je 0x1ee3                                
  1ec7  a0fb41           mov al, byte ptr [0x41fb]                
  1eca  98               cwde                                     
  1ecb  6bc050           imul ax, ax, 0x50                        
  1ece  50               push ax                                  
  1ecf  a0fa41           mov al, byte ptr [0x41fa]                
  1ed2  98               cwde                                     
  1ed3  6bc00a           imul ax, ax, 0xa                         
  1ed6  5b               pop bx                                   
  1ed7  03d8             add bx, ax                               
  1ed9  b8042c           mov ax, 0x2c04                           
  1edc  8ec0             mov es, ax                               
  1ede  26ff876b11       inc word ptr es:[bx + 0x116b]            
  1ee3  837efe00         cmp word ptr [bp - 2], 0                 
  1ee7  741c             je 0x1f05                                
  1ee9  a0fa41           mov al, byte ptr [0x41fa]                
  1eec  98               cwde                                     
  1eed  6bc050           imul ax, ax, 0x50                        
  1ef0  50               push ax                                  
  1ef1  a0fa41           mov al, byte ptr [0x41fa]                
  1ef4  98               cwde                                     
  1ef5  6bc00a           imul ax, ax, 0xa                         
  1ef8  5b               pop bx                                   
  1ef9  03d8             add bx, ax                               
  1efb  b8042c           mov ax, 0x2c04                           
  1efe  8ec0             mov es, ax                               
  1f00  26ff876b11       inc word ptr es:[bx + 0x116b]            
  1f05  42               inc dx                                   
  1f06  3b162e48         cmp dx, word ptr [0x482e]                
  1f0a  7cac             jl 0x1eb8                                
  1f0c  46               inc si                                   
  1f0d  a0c442           mov al, byte ptr [0x42c4]                
  1f10  98               cwde                                     
  1f11  3bc6             cmp ax, si                               
  1f13  7f81             jg 0x1e96                                
  1f15  5f               pop di                                   
  1f16  5e               pop si                                   
  1f17  c9               leave                                    
  1f18  cb               retf                                     

ovl36_1f19:  ; ENTRY
  1f19  55               push bp                                  
  1f1a  8bec             mov bp, sp                               
  1f1c  83ec0e           sub sp, 0xe                              
  1f1f  b8042c           mov ax, 0x2c04                           
  1f22  8ec0             mov es, ax                               
  1f24  26833e2c0100     cmp word ptr es:[0x12c], 0               
  1f2a  7503             jne 0x1f2f                               
  1f2c  e91f01           jmp 0x204e                               
  1f2f  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1f34  6a0c             push 0xc                                 
  1f36  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1f3b  59               pop cx                                   
  1f3c  666800000300     push 0x30000                             
  1f42  666801000f00     push 0xf0001                             
  1f48  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1f4d  83c408           add sp, 8                                
  1f50  666a7b           push 0x7b                                
  1f53  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1f58  83c404           add sp, 4                                
  1f5b  52               push dx                                  
  1f5c  50               push ax                                  
  1f5d  666840014300     push 0x430140                            
  1f63  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1f68  83c408           add sp, 8                                
  1f6b  6a19             push 0x19                                
  1f6d  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1f72  59               pop cx                                   
  1f73  c7066a160100     mov word ptr [0x166a], 1                 
  1f79  666880008200     push 0x820080                            
  1f7f  666a00           push 0                                   
  1f82  16               push ss                                  
  1f83  8d46f8           lea ax, [bp - 8]                         
  1f86  50               push ax                                  
  1f87  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1f8c  83c40c           add sp, 0xc                              
  1f8f  666800017500     push 0x750100                            
  1f95  16               push ss                                  
  1f96  8d46f4           lea ax, [bp - 0xc]                       
  1f99  50               push ax                                  
  1f9a  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  1f9f  83c408           add sp, 8                                
  1fa2  66ff76f4         push dword ptr [bp - 0xc]                
  1fa6  8d46f8           lea ax, [bp - 8]                         
  1fa9  8cd2             mov dx, ss                               
  1fab  b90800           mov cx, 8                                
  1fae  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1fb3  6a30             push 0x30                                
  1fb5  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1fba  83c40e           add sp, 0xe                              
  1fbd  6668a8010100     push 0x101a8                             
  1fc3  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1fc8  83c404           add sp, 4                                
  1fcb  ff7608           push word ptr [bp + 8]                   
  1fce  ff7606           push word ptr [bp + 6]                   
  1fd1  90               nop                                      
  1fd2  0e               push cs                                  
  1fd3  e88f00           call 0x2065                              
  1fd6  83c404           add sp, 4                                
  1fd9  8946f2           mov word ptr [bp - 0xe], ax              
  1fdc  666800000300     push 0x30000                             
  1fe2  666802000f00     push 0xf0002                             
  1fe8  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1fed  83c408           add sp, 8                                
  1ff0  66687c00ffff     push 0xffff007c                          
  1ff6  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1ffb  83c404           add sp, 4                                
  1ffe  52               push dx                                  
  1fff  50               push ax                                  
  2000  666840010201     push 0x1020140                           
  2006  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  200b  83c408           add sp, 8                                
  200e  66687d00ffff     push 0xffff007d                          
  2014  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2019  83c404           add sp, 4                                
  201c  52               push dx                                  
  201d  50               push ax                                  
  201e  666840011601     push 0x1160140                           
  2024  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  2029  83c408           add sp, 8                                
  202c  ff76f2           push word ptr [bp - 0xe]                 
  202f  6a7e             push 0x7e                                
  2031  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2036  83c404           add sp, 4                                
  2039  52               push dx                                  
  203a  50               push ax                                  
  203b  666840012a01     push 0x12a0140                           
  2041  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  2046  83c408           add sp, 8                                
  2049  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  204e  c9               leave                                    
  204f  cb               retf                                     

ovl36_2050:  ; ENTRY
  2050  55               push bp                                  
  2051  8bec             mov bp, sp                               
  2053  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  2058  666a00           push 0                                   
  205b  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  2060  83c404           add sp, 4                                
  2063  5d               pop bp                                   
  2064  cb               retf                                     

ovl36_2065:  ; ENTRY
  2065  55               push bp                                  
  2066  8bec             mov bp, sp                               
  2068  83ec04           sub sp, 4                                
  206b  56               push si                                  
  206c  57               push di                                  
  206d  33f6             xor si, si                               
  206f  33ff             xor di, di                               
  2071  eb21             jmp 0x2094                               
  2073  6a00             push 0                                   
  2075  ff7608           push word ptr [bp + 8]                   
  2078  ff7606           push word ptr [bp + 6]                   
  207b  0e               push cs                                  
  207c  e8cbf1           call 0x124a                              
  207f  83c406           add sp, 6                                
  2082  8956fe           mov word ptr [bp - 2], dx                
  2085  8946fc           mov word ptr [bp - 4], ax                
  2088  c45efc           les bx, ptr [bp - 4]                     
  208b  26837f0600       cmp word ptr es:[bx + 6], 0              
  2090  7e01             jle 0x2093                               
  2092  46               inc si                                   
  2093  47               inc di                                   
  2094  83ff13           cmp di, 0x13                             
  2097  7cda             jl 0x2073                                
  2099  8bc6             mov ax, si                               
  209b  99               cdq                                      
  209c  2bc2             sub ax, dx                               
  209e  8bf0             mov si, ax                               
  20a0  d1fe             sar si, 1                                
  20a2  8bc6             mov ax, si                               
  20a4  5f               pop di                                   
  20a5  5e               pop si                                   
  20a6  c9               leave                                    
  20a7  cb               retf                                     

ovl36_20a8:  ; ENTRY
  20a8  55               push bp                                  
  20a9  8bec             mov bp, sp                               
  20ab  56               push si                                  
  20ac  8b1e5c41         mov bx, word ptr [0x415c]                
  20b0  69dbe000         imul bx, bx, 0xe0                        
  20b4  a15e41           mov ax, word ptr [0x415e]                
  20b7  d1e0             shl ax, 1                                
  20b9  03d8             add bx, ax                               
  20bb  b81d1e           mov ax, 0x1e1d                           
  20be  8ec0             mov es, ax                               
  20c0  268a870100       mov al, byte ptr es:[bx + 1]             
  20c5  250f00           and ax, 0xf                              
  20c8  8bf0             mov si, ax                               
  20ca  83fe0f           cmp si, 0xf                              
  20cd  7503             jne 0x20d2                               
  20cf  e98d01           jmp 0x225f                               
  20d2  b8042c           mov ax, 0x2c04                           
  20d5  8ec0             mov es, ax                               
  20d7  268b1e1001       mov bx, word ptr es:[0x110]              
  20dc  c1e303           shl bx, 3                                
  20df  03de             add bx, si                               
  20e1  b8042c           mov ax, 0x2c04                           
  20e4  8ec0             mov es, ax                               
  20e6  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  20eb  250300           and ax, 3                                
  20ee  0bc0             or ax, ax                                
  20f0  7512             jne 0x2104                               
  20f2  666a64           push 0x64                                
  20f5  6a01             push 1                                   
  20f7  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  20fc  83c406           add sp, 6                                
  20ff  056400           add ax, 0x64                             
  2102  eb31             jmp 0x2135                               
  2104  b8042c           mov ax, 0x2c04                           
  2107  8ec0             mov es, ax                               
  2109  268b1e1001       mov bx, word ptr es:[0x110]              
  210e  c1e303           shl bx, 3                                
  2111  03de             add bx, si                               
  2113  b8042c           mov ax, 0x2c04                           
  2116  8ec0             mov es, ax                               
  2118  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  211d  250300           and ax, 3                                
  2120  3d0100           cmp ax, 1                                
  2123  7526             jne 0x214b                               
  2125  666a0f           push 0xf                                 
  2128  6a01             push 1                                   
  212a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  212f  83c406           add sp, 6                                
  2132  050a00           add ax, 0xa                              
  2135  ba042c           mov dx, 0x2c04                           
  2138  8ec2             mov es, dx                               
  213a  268b1e1001       mov bx, word ptr es:[0x110]              
  213f  d1e3             shl bx, 1                                
  2141  ba042c           mov dx, 0x2c04                           
  2144  8ec2             mov es, dx                               
  2146  260187e310       add word ptr es:[bx + 0x10e3], ax        
  214b  b8042c           mov ax, 0x2c04                           
  214e  8ec0             mov es, ax                               
  2150  268b1e1001       mov bx, word ptr es:[0x110]              
  2155  c1e303           shl bx, 3                                
  2158  03de             add bx, si                               
  215a  b8042c           mov ax, 0x2c04                           
  215d  8ec0             mov es, ax                               
  215f  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  2165  26808f3b1502     or byte ptr es:[bx + 0x153b], 2          
  216b  8bc6             mov ax, si                               
  216d  c1e003           shl ax, 3                                
  2170  ba042c           mov dx, 0x2c04                           
  2173  8ec2             mov es, dx                               
  2175  2603061001       add ax, word ptr es:[0x110]              
  217a  ba042c           mov dx, 0x2c04                           
  217d  8bd8             mov bx, ax                               
  217f  8ec2             mov es, dx                               
  2181  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  2187  26808f3b1502     or byte ptr es:[bx + 0x153b], 2          
  218d  b8042c           mov ax, 0x2c04                           
  2190  8ec0             mov es, ax                               
  2192  268b1e1001       mov bx, word ptr es:[0x110]              
  2197  c1e303           shl bx, 3                                
  219a  03de             add bx, si                               
  219c  b8042c           mov ax, 0x2c04                           
  219f  8ec0             mov es, ax                               
  21a1  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  21a7  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  21ad  8bc6             mov ax, si                               
  21af  c1e003           shl ax, 3                                
  21b2  ba042c           mov dx, 0x2c04                           
  21b5  8ec2             mov es, dx                               
  21b7  2603061001       add ax, word ptr es:[0x110]              
  21bc  ba042c           mov dx, 0x2c04                           
  21bf  8bd8             mov bx, ax                               
  21c1  8ec2             mov es, dx                               
  21c3  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  21c9  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  21cf  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  21d4  0bc0             or ax, ax                                
  21d6  751c             jne 0x21f4                               
  21d8  666a00           push 0                                   
  21db  6a00             push 0                                   
  21dd  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  21e2  83c406           add sp, 6                                
  21e5  ff365c41         push word ptr [0x415c]                   
  21e9  ff365e41         push word ptr [0x415e]                   
  21ed  0e               push cs                                  
  21ee  e80fde           call 0                                   
  21f1  83c404           add sp, 4                                
  21f4  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  21f9  0bc0             or ax, ax                                
  21fb  7443             je 0x2240                                
  21fd  b8042c           mov ax, 0x2c04                           
  2200  8ec0             mov es, ax                               
  2202  26833e590100     cmp word ptr es:[0x159], 0               
  2208  7436             je 0x2240                                
  220a  8bc6             mov ax, si                               
  220c  6bc014           imul ax, ax, 0x14                        
  220f  050000           add ax, 0                                
  2212  68042c           push 0x2c04                              
  2215  50               push ax                                  
  2216  66686f000200     push 0x2006f                             
  221c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2221  83c404           add sp, 4                                
  2224  52               push dx                                  
  2225  50               push ax                                  
  2226  1e               push ds                                  
  2227  68885c           push 0x5c88                              
  222a  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  222f  83c40c           add sp, 0xc                              
  2232  6a14             push 0x14                                
  2234  1e               push ds                                  
  2235  68885c           push 0x5c88                              
  2238  9a9300d730       lcall 0x30d7, 0x93                       -> ovl61:11d1
  223d  83c406           add sp, 6                                
  2240  666a00           push 0                                   
  2243  56               push si                                  
  2244  b8042c           mov ax, 0x2c04                           
  2247  8ec0             mov es, ax                               
  2249  26ff361001       push word ptr es:[0x110]                 
  224e  6a08             push 8                                   
  2250  8ec0             mov es, ax                               
  2252  26ff361001       push word ptr es:[0x110]                 
  2257  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  225c  83c40c           add sp, 0xc                              
  225f  5e               pop si                                   
  2260  5d               pop bp                                   
  2261  cb               retf                                     

ovl36_2262:  ; ENTRY
  2262  55               push bp                                  
  2263  8bec             mov bp, sp                               
  2265  666a00           push 0                                   
  2268  6a00             push 0                                   
  226a  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  226f  83c406           add sp, 6                                
  2272  5d               pop bp                                   
  2273  cb               retf                                     

ovl36_2274:  ; ENTRY
  2274  55               push bp                                  
  2275  8bec             mov bp, sp                               
  2277  83ec0e           sub sp, 0xe                              
  227a  56               push si                                  
  227b  57               push di                                  
  227c  33f6             xor si, si                               
  227e  c746f80000       mov word ptr [bp - 8], 0                 
  2283  c746f60000       mov word ptr [bp - 0xa], 0               
  2288  33c9             xor cx, cx                               
  228a  eb53             jmp 0x22df                               
  228c  8bd9             mov bx, cx                               
  228e  c1e302           shl bx, 2                                
  2291  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  2295  0b87405e         or ax, word ptr [bx + 0x5e40]            
  2299  7443             je 0x22de                                
  229b  8bd9             mov bx, cx                               
  229d  c1e302           shl bx, 2                                
  22a0  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  22a4  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  22a9  741d             je 0x22c8                                
  22ab  8bd9             mov bx, cx                               
  22ad  c1e302           shl bx, 2                                
  22b0  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  22b4  268a4704         mov al, byte ptr es:[bx + 4]             
  22b8  98               cwde                                     
  22b9  6bc006           imul ax, ax, 6                           
  22bc  8bd8             mov bx, ax                               
  22be  8a87c845         mov al, byte ptr [bx + 0x45c8]           
  22c2  98               cwde                                     
  22c3  0bc0             or ax, ax                                
  22c5  7501             jne 0x22c8                               
  22c7  46               inc si                                   
  22c8  8bd9             mov bx, cx                               
  22ca  c1e302           shl bx, 2                                
  22cd  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  22d1  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  22d7  7405             je 0x22de                                
  22d9  c746f60100       mov word ptr [bp - 0xa], 1               
  22de  41               inc cx                                   
  22df  83f908           cmp cx, 8                                
  22e2  7ca8             jl 0x228c                                
  22e4  33ff             xor di, di                               
  22e6  b8042c           mov ax, 0x2c04                           
  22e9  8ec0             mov es, ax                               
  22eb  268b0e8101       mov cx, word ptr es:[0x181]              
  22f0  eb5c             jmp 0x234e                               
  22f2  8bd9             mov bx, cx                               
  22f4  6bdb16           imul bx, bx, 0x16                        
  22f7  b81d1e           mov ax, 0x1e1d                           
  22fa  8ec0             mov es, ax                               
  22fc  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  2301  98               cwde                                     
  2302  ba042c           mov dx, 0x2c04                           
  2305  8ec2             mov es, dx                               
  2307  263b061001       cmp ax, word ptr es:[0x110]              
  230c  7540             jne 0x234e                               
  230e  8bd9             mov bx, cx                               
  2310  6bdb16           imul bx, bx, 0x16                        
  2313  b81d1e           mov ax, 0x1e1d                           
  2316  8ec0             mov es, ax                               
  2318  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  231e  742e             je 0x234e                                
  2320  8bd9             mov bx, cx                               
  2322  6bdb16           imul bx, bx, 0x16                        
  2325  8ec0             mov es, ax                               
  2327  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  232c  98               cwde                                     
  232d  6bc006           imul ax, ax, 6                           
  2330  8bd8             mov bx, ax                               
  2332  8a87c845         mov al, byte ptr [bx + 0x45c8]           
  2336  98               cwde                                     
  2337  0bc0             or ax, ax                                
  2339  7513             jne 0x234e                               
  233b  8bd9             mov bx, cx                               
  233d  6bdb16           imul bx, bx, 0x16                        
  2340  b81d1e           mov ax, 0x1e1d                           
  2343  8ec0             mov es, ax                               
  2345  2680bf8a8800     cmp byte ptr es:[bx - 0x7776], 0         
  234b  7e01             jle 0x234e                               
  234d  47               inc di                                   
  234e  8bc1             mov ax, cx                               
  2350  49               dec cx                                   
  2351  0bc0             or ax, ax                                
  2353  759d             jne 0x22f2                               
  2355  8bc7             mov ax, di                               
  2357  6bc005           imul ax, ax, 5                           
  235a  ba2800           mov dx, 0x28                             
  235d  2bd0             sub dx, ax                               
  235f  83fa0c           cmp dx, 0xc                              
  2362  7d05             jge 0x2369                               
  2364  b80c00           mov ax, 0xc                              
  2367  eb0c             jmp 0x2375                               
  2369  8bc7             mov ax, di                               
  236b  6bc005           imul ax, ax, 5                           
  236e  50               push ax                                  
  236f  b82800           mov ax, 0x28                             
  2372  5a               pop dx                                   
  2373  2bc2             sub ax, dx                               
  2375  8946f4           mov word ptr [bp - 0xc], ax              
  2378  803ec44202       cmp byte ptr [0x42c4], 2                 
  237d  7c0c             jl 0x238b                                
  237f  803ec54202       cmp byte ptr [0x42c5], 2                 
  2384  7c05             jl 0x238b                                
  2386  b80100           mov ax, 1                                
  2389  eb02             jmp 0x238d                               
  238b  33c0             xor ax, ax                               
  238d  8bf8             mov di, ax                               
  238f  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  2394  3d1400           cmp ax, 0x14                             
  2397  7d15             jge 0x23ae                               
  2399  0bff             or di, di                                
  239b  7511             jne 0x23ae                               
  239d  803ec54201       cmp byte ptr [0x42c5], 1                 
  23a2  7c0a             jl 0x23ae                                
  23a4  803ea44204       cmp byte ptr [0x42a4], 4                 
  23a9  7c03             jl 0x23ae                                
  23ab  bf0100           mov di, 1                                
  23ae  837ef600         cmp word ptr [bp - 0xa], 0               
  23b2  7403             je 0x23b7                                
  23b4  e9b902           jmp 0x2670                               
  23b7  837e0601         cmp word ptr [bp + 6], 1                 
  23bb  7403             je 0x23c0                                
  23bd  e9b002           jmp 0x2670                               
  23c0  0bff             or di, di                                
  23c2  7503             jne 0x23c7                               
  23c4  e9a902           jmp 0x2670                               
  23c7  0bf6             or si, si                                
  23c9  7f03             jg 0x23ce                                
  23cb  e9a202           jmp 0x2670                               
  23ce  666a64           push 0x64                                
  23d1  6a01             push 1                                   
  23d3  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  23d8  83c406           add sp, 6                                
  23db  3b46f4           cmp ax, word ptr [bp - 0xc]              
  23de  7c03             jl 0x23e3                                
  23e0  e98d02           jmp 0x2670                               
  23e3  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  23e9  7503             jne 0x23ee                               
  23eb  e98202           jmp 0x2670                               
  23ee  6aff             push -1                                  
  23f0  56               push si                                  
  23f1  6a01             push 1                                   
  23f3  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  23f8  83c406           add sp, 6                                
  23fb  8946fe           mov word ptr [bp - 2], ax                
  23fe  33f6             xor si, si                               
  2400  33c9             xor cx, cx                               
  2402  eb59             jmp 0x245d                               
  2404  8bd9             mov bx, cx                               
  2406  c1e302           shl bx, 2                                
  2409  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  240d  0b87405e         or ax, word ptr [bx + 0x5e40]            
  2411  7449             je 0x245c                                
  2413  8bd9             mov bx, cx                               
  2415  c1e302           shl bx, 2                                
  2418  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  241c  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  2421  7439             je 0x245c                                
  2423  8bd9             mov bx, cx                               
  2425  c1e302           shl bx, 2                                
  2428  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  242c  268a4704         mov al, byte ptr es:[bx + 4]             
  2430  98               cwde                                     
  2431  6bc006           imul ax, ax, 6                           
  2434  8bd8             mov bx, ax                               
  2436  8a87c845         mov al, byte ptr [bx + 0x45c8]           
  243a  98               cwde                                     
  243b  0bc0             or ax, ax                                
  243d  751d             jne 0x245c                               
  243f  8bc6             mov ax, si                               
  2441  46               inc si                                   
  2442  3b46fe           cmp ax, word ptr [bp - 2]                
  2445  7515             jne 0x245c                               
  2447  8bd9             mov bx, cx                               
  2449  c1e302           shl bx, 2                                
  244c  8b87405e         mov ax, word ptr [bx + 0x5e40]           
  2450  8b973e5e         mov dx, word ptr [bx + 0x5e3e]           
  2454  8946fc           mov word ptr [bp - 4], ax                
  2457  8956fa           mov word ptr [bp - 6], dx                
  245a  eb06             jmp 0x2462                               
  245c  41               inc cx                                   
  245d  83f908           cmp cx, 8                                
  2460  7ca2             jl 0x2404                                
  2462  c45efa           les bx, ptr [bp - 6]                     
  2465  26807f0a04       cmp byte ptr es:[bx + 0xa], 4            
  246a  7c03             jl 0x246f                                
  246c  e90102           jmp 0x2670                               
  246f  c45efa           les bx, ptr [bp - 6]                     
  2472  268a470a         mov al, byte ptr es:[bx + 0xa]           
  2476  fec0             inc al                                   
  2478  2688470a         mov byte ptr es:[bx + 0xa], al           
  247c  26807f080f       cmp byte ptr es:[bx + 8], 0xf            
  2481  7d15             jge 0x2498                               
  2483  6a01             push 1                                   
  2485  ff76fc           push word ptr [bp - 4]                   
  2488  53               push bx                                  
  2489  9a0500620b       lcall 0xb62, 5                           -> 0b62:0005
  248e  83c406           add sp, 6                                
  2491  c746f80100       mov word ptr [bp - 8], 1                 
  2496  eb0d             jmp 0x24a5                               
  2498  c45efa           les bx, ptr [bp - 6]                     
  249b  268a4706         mov al, byte ptr es:[bx + 6]             
  249f  fec0             inc al                                   
  24a1  26884706         mov byte ptr es:[bx + 6], al             
  24a5  a0fa41           mov al, byte ptr [0x41fa]                
  24a8  98               cwde                                     
  24a9  d1e0             shl ax, 1                                
  24ab  ba042c           mov dx, 0x2c04                           
  24ae  8bd8             mov bx, ax                               
  24b0  8ec2             mov es, dx                               
  24b2  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  24b8  7403             je 0x24bd                                
  24ba  e9b301           jmp 0x2670                               
  24bd  c45efa           les bx, ptr [bp - 6]                     
  24c0  268a470a         mov al, byte ptr es:[bx + 0xa]           
  24c4  98               cwde                                     
  24c5  48               dec ax                                   
  24c6  8946f2           mov word ptr [bp - 0xe], ax              
  24c9  6a08             push 8                                   
  24cb  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  24d0  59               pop cx                                   
  24d1  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  24d6  8b46f2           mov ax, word ptr [bp - 0xe]              
  24d9  051800           add ax, 0x18                             
  24dc  50               push ax                                  
  24dd  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  24e2  59               pop cx                                   
  24e3  666a00           push 0                                   
  24e6  666a00           push 0                                   
  24e9  666a00           push 0                                   
  24ec  66689b000000     push 0x9b                                
  24f2  68b000           push 0xb0                                
  24f5  1e               push ds                                  
  24f6  682a34           push 0x342a                              
  24f9  c45efa           les bx, ptr [bp - 6]                     
  24fc  268a4705         mov al, byte ptr es:[bx + 5]             
  2500  98               cwde                                     
  2501  50               push ax                                  
  2502  268a4704         mov al, byte ptr es:[bx + 4]             
  2506  98               cwde                                     
  2507  50               push ax                                  
  2508  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  250d  83c41a           add sp, 0x1a                             
  2510  666800000300     push 0x30000                             
  2516  666802000f00     push 0xf0002                             
  251c  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  2521  83c408           add sp, 8                                
  2524  66689e00ffff     push 0xffff009e                          
  252a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  252f  83c404           add sp, 4                                
  2532  52               push dx                                  
  2533  50               push ax                                  
  2534  6668d8009b00     push 0x9b00d8                            
  253a  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  253f  83c408           add sp, 8                                
  2542  c45efa           les bx, ptr [bp - 6]                     
  2545  268a4704         mov al, byte ptr es:[bx + 4]             
  2549  98               cwde                                     
  254a  50               push ax                                  
  254b  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  2550  59               pop cx                                   
  2551  52               push dx                                  
  2552  50               push ax                                  
  2553  66689f000000     push 0x9f                                
  2559  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  255e  83c404           add sp, 4                                
  2561  52               push dx                                  
  2562  50               push ax                                  
  2563  1e               push ds                                  
  2564  68885c           push 0x5c88                              
  2567  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  256c  83c40c           add sp, 0xc                              
  256f  1e               push ds                                  
  2570  68885c           push 0x5c88                              
  2573  6668d800af00     push 0xaf00d8                            
  2579  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  257e  83c408           add sp, 8                                
  2581  6668a000ffff     push 0xffff00a0                          
  2587  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  258c  83c404           add sp, 4                                
  258f  52               push dx                                  
  2590  50               push ax                                  
  2591  6668b000c300     push 0xc300b0                            
  2597  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  259c  83c408           add sp, 8                                
  259f  c45efa           les bx, ptr [bp - 6]                     
  25a2  268a470a         mov al, byte ptr es:[bx + 0xa]           
  25a6  98               cwde                                     
  25a7  48               dec ax                                   
  25a8  50               push ax                                  
  25a9  68a100           push 0xa1                                
  25ac  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  25b1  83c404           add sp, 4                                
  25b4  52               push dx                                  
  25b5  50               push ax                                  
  25b6  6668b000d700     push 0xd700b0                            
  25bc  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  25c1  83c408           add sp, 8                                
  25c4  837ef800         cmp word ptr [bp - 8], 0                 
  25c8  742d             je 0x25f7                                
  25ca  6668a2000000     push 0xa2                                
  25d0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  25d5  83c404           add sp, 4                                
  25d8  52               push dx                                  
  25d9  50               push ax                                  
  25da  6668b000f500     push 0xf500b0                            
  25e0  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  25e5  83c408           add sp, 8                                
  25e8  c45efa           les bx, ptr [bp - 6]                     
  25eb  268a4708         mov al, byte ptr es:[bx + 8]             
  25ef  98               cwde                                     
  25f0  50               push ax                                  
  25f1  268a4708         mov al, byte ptr es:[bx + 8]             
  25f5  eb2b             jmp 0x2622                               
  25f7  6668a2000100     push 0x100a2                             
  25fd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2602  83c404           add sp, 4                                
  2605  52               push dx                                  
  2606  50               push ax                                  
  2607  6668b000f500     push 0xf500b0                            
  260d  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  2612  83c408           add sp, 8                                
  2615  c45efa           les bx, ptr [bp - 6]                     
  2618  268a4706         mov al, byte ptr es:[bx + 6]             
  261c  98               cwde                                     
  261d  50               push ax                                  
  261e  268a4706         mov al, byte ptr es:[bx + 6]             
  2622  98               cwde                                     
  2623  48               dec ax                                   
  2624  50               push ax                                  
  2625  6668a2000200     push 0x200a2                             
  262b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2630  83c404           add sp, 4                                
  2633  52               push dx                                  
  2634  50               push ax                                  
  2635  1e               push ds                                  
  2636  68885c           push 0x5c88                              
  2639  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  263e  83c40c           add sp, 0xc                              
  2641  1e               push ds                                  
  2642  68885c           push 0x5c88                              
  2645  6668b0000901     push 0x10900b0                           
  264b  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  2650  83c408           add sp, 8                                
  2653  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  2658  666a00           push 0                                   
  265b  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  2660  83c404           add sp, 4                                
  2663  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  2668  6a01             push 1                                   
  266a  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  266f  59               pop cx                                   
  2670  5f               pop di                                   
  2671  5e               pop si                                   
  2672  c9               leave                                    
  2673  cb               retf                                     
