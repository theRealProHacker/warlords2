; ovl34 stub 3014 file_off 0x590a0 size 0x19cd

ovl34_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec0c           sub sp, 0xc                              
  0006  56               push si                                  
  0007  57               push di                                  
  0008  66833e625e00     cmp dword ptr [0x5e62], 0                
  000e  7503             jne 0x13                                 
  0010  e99401           jmp 0x1a7                                
  0013  c41e625e         les bx, ptr [0x5e62]                     
  0017  26807f0700       cmp byte ptr es:[bx + 7], 0              
  001c  7f03             jg 0x21                                  
  001e  e98601           jmp 0x1a7                                
  0021  c41e625e         les bx, ptr [0x5e62]                     
  0025  268b37           mov si, word ptr es:[bx]                 
  0028  8bc6             mov ax, si                               
  002a  a32a41           mov word ptr [0x412a], ax                
  002d  268b7f02         mov di, word ptr es:[bx + 2]             
  0031  8bc7             mov ax, di                               
  0033  a32841           mov word ptr [0x4128], ax                
  0036  8bdf             mov bx, di                               
  0038  69dbe000         imul bx, bx, 0xe0                        
  003c  8bc6             mov ax, si                               
  003e  d1e0             shl ax, 1                                
  0040  03d8             add bx, ax                               
  0042  b81d1e           mov ax, 0x1e1d                           
  0045  8ec0             mov es, ax                               
  0047  268a870000       mov al, byte ptr es:[bx]                 
  004c  25ff00           and ax, 0xff                             
  004f  8946fa           mov word ptr [bp - 6], ax                
  0052  b8042c           mov ax, 0x2c04                           
  0055  8b5efa           mov bx, word ptr [bp - 6]                
  0058  8ec0             mov es, ax                               
  005a  268a871007       mov al, byte ptr es:[bx + 0x710]         
  005f  98               cwde                                     
  0060  8946fc           mov word ptr [bp - 4], ax                
  0063  66c746f400000000 mov dword ptr [bp - 0xc], 0              
  006b  837efc0b         cmp word ptr [bp - 4], 0xb               
  006f  752a             jne 0x9b                                 
  0071  57               push di                                  
  0072  56               push si                                  
  0073  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  0078  83c404           add sp, 4                                
  007b  8bd0             mov dx, ax                               
  007d  0bd2             or dx, dx                                
  007f  7d07             jge 0x88                                 
  0081  c746fc0700       mov word ptr [bp - 4], 7                 
  0086  eb13             jmp 0x9b                                 
  0088  8bc2             mov ax, dx                               
  008a  6bc01f           imul ax, ax, 0x1f                        
  008d  051108           add ax, 0x811                            
  0090  c746f6042c       mov word ptr [bp - 0xa], 0x2c04          
  0095  8946f4           mov word ptr [bp - 0xc], ax              
  0098  8956f8           mov word ptr [bp - 8], dx                
  009b  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  00a1  7505             jne 0xa8                                 
  00a3  b80100           mov ax, 1                                
  00a6  eb02             jmp 0xaa                                 
  00a8  33c0             xor ax, ax                               
  00aa  8946fe           mov word ptr [bp - 2], ax                
  00ad  837efe01         cmp word ptr [bp - 2], 1                 
  00b1  7522             jne 0xd5                                 
  00b3  837efc0b         cmp word ptr [bp - 4], 0xb               
  00b7  7403             je 0xbc                                  
  00b9  e9eb00           jmp 0x1a7                                
  00bc  c45ef4           les bx, ptr [bp - 0xc]                   
  00bf  26807f1801       cmp byte ptr es:[bx + 0x18], 1           
  00c4  7403             je 0xc9                                  
  00c6  e9de00           jmp 0x1a7                                
  00c9  ff76f8           push word ptr [bp - 8]                   
  00cc  90               nop                                      
  00cd  0e               push cs                                  
  00ce  e8d007           call 0x8a1                               
  00d1  59               pop cx                                   
  00d2  e9d200           jmp 0x1a7                                
  00d5  837efc0b         cmp word ptr [bp - 4], 0xb               
  00d9  7403             je 0xde                                  
  00db  e9c900           jmp 0x1a7                                
  00de  8bdf             mov bx, di                               
  00e0  69dbe000         imul bx, bx, 0xe0                        
  00e4  8bc6             mov ax, si                               
  00e6  d1e0             shl ax, 1                                
  00e8  03d8             add bx, ax                               
  00ea  b81d1e           mov ax, 0x1e1d                           
  00ed  8ec0             mov es, ax                               
  00ef  268a870100       mov al, byte ptr es:[bx + 1]             
  00f4  c1e806           shr ax, 6                                
  00f7  250100           and ax, 1                                
  00fa  0bc0             or ax, ax                                
  00fc  7403             je 0x101                                 
  00fe  e9a600           jmp 0x1a7                                
  0101  c45ef4           les bx, ptr [bp - 0xc]                   
  0104  26807f1803       cmp byte ptr es:[bx + 0x18], 3           
  0109  756e             jne 0x179                                
  010b  6a03             push 3                                   
  010d  66ff365e5e       push dword ptr [0x5e5e]                  
  0112  9a61007330       lcall 0x3073, 0x61                       -> ovl47:04f1
  0117  83c406           add sp, 6                                
  011a  c41e5e5e         les bx, ptr [0x5e5e]                     
  011e  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0122  98               cwde                                     
  0123  6bc014           imul ax, ax, 0x14                        
  0126  052302           add ax, 0x223                            
  0129  68042c           push 0x2c04                              
  012c  50               push ax                                  
  012d  666a65           push 0x65                                
  0130  6a06             push 6                                   
  0132  b8042c           mov ax, 0x2c04                           
  0135  8ec0             mov es, ax                               
  0137  26ff361001       push word ptr es:[0x110]                 
  013c  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  0141  83c40c           add sp, 0xc                              
  0144  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  0149  0bc0             or ax, ax                                
  014b  750a             jne 0x157                                
  014d  ff76f8           push word ptr [bp - 8]                   
  0150  90               nop                                      
  0151  0e               push cs                                  
  0152  e84b09           call 0xaa0                               
  0155  eb08             jmp 0x15f                                
  0157  ff76f8           push word ptr [bp - 8]                   
  015a  9a2500e42f       lcall 0x2fe4, 0x25                       -> ovl26:0080
  015f  59               pop cx                                   
  0160  8bdf             mov bx, di                               
  0162  69dbe000         imul bx, bx, 0xe0                        
  0166  8bc6             mov ax, si                               
  0168  d1e0             shl ax, 1                                
  016a  03d8             add bx, ax                               
  016c  b81d1e           mov ax, 0x1e1d                           
  016f  8ec0             mov es, ax                               
  0171  26808f010040     or byte ptr es:[bx + 1], 0x40            
  0177  eb2e             jmp 0x1a7                                
  0179  c45ef4           les bx, ptr [bp - 0xc]                   
  017c  26807f1801       cmp byte ptr es:[bx + 0x18], 1           
  0181  7516             jne 0x199                                
  0183  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  0188  0bc0             or ax, ax                                
  018a  7403             je 0x18f                                 
  018c  e93aff           jmp 0xc9                                 
  018f  9a20005b2f       lcall 0x2f5b, 0x20                       -> ovl01:0000
  0194  eb11             jmp 0x1a7                                
  0196  e930ff           jmp 0xc9                                 
  0199  57               push di                                  
  019a  56               push si                                  
  019b  66ff76f4         push dword ptr [bp - 0xc]                
  019f  90               nop                                      
  01a0  0e               push cs                                  
  01a1  e80700           call 0x1ab                               
  01a4  83c408           add sp, 8                                
  01a7  5f               pop di                                   
  01a8  5e               pop si                                   
  01a9  c9               leave                                    
  01aa  cb               retf                                     

ovl34_01ab:  ; ENTRY
  01ab  55               push bp                                  
  01ac  8bec             mov bp, sp                               
  01ae  83ec0e           sub sp, 0xe                              
  01b1  56               push si                                  
  01b2  57               push di                                  
  01b3  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  01b8  f7d8             neg ax                                   
  01ba  1bc0             sbb ax, ax                               
  01bc  40               inc ax                                   
  01bd  8bf8             mov di, ax                               
  01bf  ff760c           push word ptr [bp + 0xc]                 
  01c2  ff760a           push word ptr [bp + 0xa]                 
  01c5  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  01ca  83c404           add sp, 4                                
  01cd  8946f6           mov word ptr [bp - 0xa], ax              
  01d0  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  01d5  0bff             or di, di                                
  01d7  7430             je 0x209                                 
  01d9  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  01de  6a00             push 0                                   
  01e0  c41e5e5e         les bx, ptr [0x5e5e]                     
  01e4  26ff7702         push word ptr es:[bx + 2]                
  01e8  26ff37           push word ptr es:[bx]                    
  01eb  9a2f002430       lcall 0x3024, 0x2f                       -> ovl36:1a41
  01f0  83c406           add sp, 6                                
  01f3  ff76f6           push word ptr [bp - 0xa]                 
  01f6  90               nop                                      
  01f7  0e               push cs                                  
  01f8  e86015           call 0x175b                              
  01fb  59               pop cx                                   
  01fc  6a00             push 0                                   
  01fe  9a2f00ba30       lcall 0x30ba, 0x2f                       -> ovl58:01a9
  0203  59               pop cx                                   
  0204  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0209  6a03             push 3                                   
  020b  66ff365e5e       push dword ptr [0x5e5e]                  
  0210  9a61007330       lcall 0x3073, 0x61                       -> ovl47:04f1
  0215  83c406           add sp, 6                                
  0218  c45e06           les bx, ptr [bp + 6]                     
  021b  26807f1805       cmp byte ptr es:[bx + 0x18], 5           
  0220  7503             jne 0x225                                
  0222  e9d401           jmp 0x3f9                                
  0225  26807f1a00       cmp byte ptr es:[bx + 0x1a], 0           
  022a  752a             jne 0x256                                
  022c  0bff             or di, di                                
  022e  7503             jne 0x233                                
  0230  e9c601           jmp 0x3f9                                
  0233  666a32           push 0x32                                
  0236  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  023b  83c404           add sp, 4                                
  023e  52               push dx                                  
  023f  50               push ax                                  
  0240  90               nop                                      
  0241  0e               push cs                                  
  0242  e88415           call 0x17c9                              
  0245  83c404           add sp, 4                                
  0248  666a00           push 0                                   
  024b  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  0250  83c404           add sp, 4                                
  0253  e9a301           jmp 0x3f9                                
  0256  0bff             or di, di                                
  0258  745d             je 0x2b7                                 
  025a  c45e06           les bx, ptr [bp + 6]                     
  025d  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  0261  98               cwde                                     
  0262  c1e004           shl ax, 4                                
  0265  05670f           add ax, 0xf67                            
  0268  68042c           push 0x2c04                              
  026b  50               push ax                                  
  026c  c41e5e5e         les bx, ptr [0x5e5e]                     
  0270  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0274  98               cwde                                     
  0275  6bc014           imul ax, ax, 0x14                        
  0278  052302           add ax, 0x223                            
  027b  68042c           push 0x2c04                              
  027e  50               push ax                                  
  027f  666a33           push 0x33                                
  0282  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0287  83c404           add sp, 4                                
  028a  52               push dx                                  
  028b  50               push ax                                  
  028c  1e               push ds                                  
  028d  68385c           push 0x5c38                              
  0290  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0295  83c410           add sp, 0x10                             
  0298  1e               push ds                                  
  0299  68385c           push 0x5c38                              
  029c  90               nop                                      
  029d  0e               push cs                                  
  029e  e82815           call 0x17c9                              
  02a1  83c404           add sp, 4                                
  02a4  666a00           push 0                                   
  02a7  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  02ac  83c404           add sp, 4                                
  02af  6a01             push 1                                   
  02b1  9a2f00ba30       lcall 0x30ba, 0x2f                       -> ovl58:01a9
  02b6  59               pop cx                                   
  02b7  66ff7606         push dword ptr [bp + 6]                  
  02bb  90               nop                                      
  02bc  0e               push cs                                  
  02bd  e8ed04           call 0x7ad                               
  02c0  83c404           add sp, 4                                
  02c3  0bc0             or ax, ax                                
  02c5  7503             jne 0x2ca                                
  02c7  e90001           jmp 0x3ca                                
  02ca  c41e5e5e         les bx, ptr [0x5e5e]                     
  02ce  268a470a         mov al, byte ptr es:[bx + 0xa]           
  02d2  98               cwde                                     
  02d3  6bc014           imul ax, ax, 0x14                        
  02d6  052302           add ax, 0x223                            
  02d9  68042c           push 0x2c04                              
  02dc  50               push ax                                  
  02dd  6668feff0000     push 0xfffe                              
  02e3  6a01             push 1                                   
  02e5  b8042c           mov ax, 0x2c04                           
  02e8  8ec0             mov es, ax                               
  02ea  26ff361001       push word ptr es:[0x110]                 
  02ef  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  02f4  83c40c           add sp, 0xc                              
  02f7  b8042c           mov ax, 0x2c04                           
  02fa  8ec0             mov es, ax                               
  02fc  268b1e1001       mov bx, word ptr es:[0x110]              
  0301  6bdb50           imul bx, bx, 0x50                        
  0304  8ec0             mov es, ax                               
  0306  26a11001         mov ax, word ptr es:[0x110]              
  030a  6bc00a           imul ax, ax, 0xa                         
  030d  03d8             add bx, ax                               
  030f  b8042c           mov ax, 0x2c04                           
  0312  8ec0             mov es, ax                               
  0314  26ff876711       inc word ptr es:[bx + 0x1167]            
  0319  66ff365e5e       push dword ptr [0x5e5e]                  
  031e  666a00           push 0                                   
  0321  6a02             push 2                                   
  0323  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  0328  83c40a           add sp, 0xa                              
  032b  33f6             xor si, si                               
  032d  eb2e             jmp 0x35d                                
  032f  8bde             mov bx, si                               
  0331  d1e3             shl bx, 1                                
  0333  83bffc4b08       cmp word ptr [bx + 0x4bfc], 8            
  0338  7d22             jge 0x35c                                
  033a  b8042c           mov ax, 0x2c04                           
  033d  8ec0             mov es, ax                               
  033f  268b1e1001       mov bx, word ptr es:[0x110]              
  0344  6bdb50           imul bx, bx, 0x50                        
  0347  8ec0             mov es, ax                               
  0349  26a11001         mov ax, word ptr es:[0x110]              
  034d  6bc00a           imul ax, ax, 0xa                         
  0350  03d8             add bx, ax                               
  0352  b8042c           mov ax, 0x2c04                           
  0355  8ec0             mov es, ax                               
  0357  26ff876b11       inc word ptr es:[bx + 0x116b]            
  035c  46               inc si                                   
  035d  3b362e48         cmp si, word ptr [0x482e]                
  0361  7ccc             jl 0x32f                                 
  0363  c41e5e5e         les bx, ptr [0x5e5e]                     
  0367  268b07           mov ax, word ptr es:[bx]                 
  036a  8946fa           mov word ptr [bp - 6], ax                
  036d  268b4702         mov ax, word ptr es:[bx + 2]             
  0371  8946f8           mov word ptr [bp - 8], ax                
  0374  50               push ax                                  
  0375  ff76fa           push word ptr [bp - 6]                   
  0378  ff36605e         push word ptr [0x5e60]                   
  037c  53               push bx                                  
  037d  9a39002430       lcall 0x3024, 0x39                       -> ovl36:16cd
  0382  83c408           add sp, 8                                
  0385  66ff365e5e       push dword ptr [0x5e5e]                  
  038a  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  038f  83c404           add sp, 4                                
  0392  66c7065e5e000000 mov dword ptr [0x5e5e], 0                
  039b  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  03a0  0bff             or di, di                                
  03a2  7503             jne 0x3a7                                
  03a4  e90204           jmp 0x7a9                                
  03a7  666833000100     push 0x10033                             
  03ad  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03b2  83c404           add sp, 4                                
  03b5  52               push dx                                  
  03b6  50               push ax                                  
  03b7  90               nop                                      
  03b8  0e               push cs                                  
  03b9  e80d14           call 0x17c9                              
  03bc  83c404           add sp, 4                                
  03bf  6a00             push 0                                   
  03c1  90               nop                                      
  03c2  0e               push cs                                  
  03c3  e84c14           call 0x1812                              
  03c6  59               pop cx                                   
  03c7  e9df03           jmp 0x7a9                                
  03ca  0bff             or di, di                                
  03cc  7423             je 0x3f1                                 
  03ce  666833000200     push 0x20033                             
  03d4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03d9  83c404           add sp, 4                                
  03dc  52               push dx                                  
  03dd  50               push ax                                  
  03de  90               nop                                      
  03df  0e               push cs                                  
  03e0  e8e613           call 0x17c9                              
  03e3  83c404           add sp, 4                                
  03e6  666a00           push 0                                   
  03e9  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  03ee  83c404           add sp, 4                                
  03f1  c45e06           les bx, ptr [bp + 6]                     
  03f4  26c6471a00       mov byte ptr es:[bx + 0x1a], 0           
  03f9  c45e06           les bx, ptr [bp + 6]                     
  03fc  268a4718         mov al, byte ptr es:[bx + 0x18]          
  0400  98               cwde                                     
  0401  3d0200           cmp ax, 2                                
  0404  7413             je 0x419                                 
  0406  3d0400           cmp ax, 4                                
  0409  7503             jne 0x40e                                
  040b  e98f01           jmp 0x59d                                
  040e  3d0500           cmp ax, 5                                
  0411  7503             jne 0x416                                
  0413  e94302           jmp 0x659                                
  0416  e99003           jmp 0x7a9                                
  0419  0bff             or di, di                                
  041b  7503             jne 0x420                                
  041d  e9b700           jmp 0x4d7                                
  0420  c45e06           les bx, ptr [bp + 6]                     
  0423  268a4719         mov al, byte ptr es:[bx + 0x19]          
  0427  98               cwde                                     
  0428  6bc01d           imul ax, ax, 0x1d                        
  042b  05e90c           add ax, 0xce9                            
  042e  68042c           push 0x2c04                              
  0431  50               push ax                                  
  0432  c41e5e5e         les bx, ptr [0x5e5e]                     
  0436  268a470a         mov al, byte ptr es:[bx + 0xa]           
  043a  98               cwde                                     
  043b  6bc014           imul ax, ax, 0x14                        
  043e  052302           add ax, 0x223                            
  0441  68042c           push 0x2c04                              
  0444  50               push ax                                  
  0445  666a34           push 0x34                                
  0448  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  044d  83c404           add sp, 4                                
  0450  52               push dx                                  
  0451  50               push ax                                  
  0452  1e               push ds                                  
  0453  68385c           push 0x5c38                              
  0456  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  045b  83c410           add sp, 0x10                             
  045e  1e               push ds                                  
  045f  68385c           push 0x5c38                              
  0462  90               nop                                      
  0463  0e               push cs                                  
  0464  e86213           call 0x17c9                              
  0467  83c404           add sp, 4                                
  046a  6a01             push 1                                   
  046c  90               nop                                      
  046d  0e               push cs                                  
  046e  e8a113           call 0x1812                              
  0471  59               pop cx                                   
  0472  c45e06           les bx, ptr [bp + 6]                     
  0475  268a4719         mov al, byte ptr es:[bx + 0x19]          
  0479  98               cwde                                     
  047a  6bc01d           imul ax, ax, 0x1d                        
  047d  ba042c           mov dx, 0x2c04                           
  0480  8bd8             mov bx, ax                               
  0482  8ec2             mov es, dx                               
  0484  26c687ff0c01     mov byte ptr es:[bx + 0xcff], 1          
  048a  c45e06           les bx, ptr [bp + 6]                     
  048d  268a4719         mov al, byte ptr es:[bx + 0x19]          
  0491  98               cwde                                     
  0492  6bc01d           imul ax, ax, 0x1d                        
  0495  ba042c           mov dx, 0x2c04                           
  0498  8bd8             mov bx, ax                               
  049a  8ec2             mov es, dx                               
  049c  26c787000d0000   mov word ptr es:[bx + 0xd00], 0          
  04a3  c45e06           les bx, ptr [bp + 6]                     
  04a6  268a4719         mov al, byte ptr es:[bx + 0x19]          
  04aa  98               cwde                                     
  04ab  6bc01d           imul ax, ax, 0x1d                        
  04ae  ba042c           mov dx, 0x2c04                           
  04b1  8b5e0a           mov bx, word ptr [bp + 0xa]              
  04b4  8ec2             mov es, dx                               
  04b6  93               xchg bx, ax                              
  04b7  268987020d       mov word ptr es:[bx + 0xd02], ax         
  04bc  c45e06           les bx, ptr [bp + 6]                     
  04bf  268a4719         mov al, byte ptr es:[bx + 0x19]          
  04c3  98               cwde                                     
  04c4  6bc01d           imul ax, ax, 0x1d                        
  04c7  ba042c           mov dx, 0x2c04                           
  04ca  8b5e0c           mov bx, word ptr [bp + 0xc]              
  04cd  8ec2             mov es, dx                               
  04cf  93               xchg bx, ax                              
  04d0  268987040d       mov word ptr es:[bx + 0xd04], ax         
  04d5  eb70             jmp 0x547                                
  04d7  c45e06           les bx, ptr [bp + 6]                     
  04da  268a4719         mov al, byte ptr es:[bx + 0x19]          
  04de  98               cwde                                     
  04df  6bc01d           imul ax, ax, 0x1d                        
  04e2  ba042c           mov dx, 0x2c04                           
  04e5  8bd8             mov bx, ax                               
  04e7  8ec2             mov es, dx                               
  04e9  26c687ff0c03     mov byte ptr es:[bx + 0xcff], 3          
  04ef  66ff365e5e       push dword ptr [0x5e5e]                  
  04f4  9a4400620b       lcall 0xb62, 0x44                        -> 0b62:0044
  04f9  83c404           add sp, 4                                
  04fc  c45e06           les bx, ptr [bp + 6]                     
  04ff  50               push ax                                  
  0500  268a4719         mov al, byte ptr es:[bx + 0x19]          
  0504  98               cwde                                     
  0505  6bc01d           imul ax, ax, 0x1d                        
  0508  ba042c           mov dx, 0x2c04                           
  050b  8bd8             mov bx, ax                               
  050d  8ec2             mov es, dx                               
  050f  58               pop ax                                   
  0510  268987000d       mov word ptr es:[bx + 0xd00], ax         
  0515  c45e06           les bx, ptr [bp + 6]                     
  0518  268a4719         mov al, byte ptr es:[bx + 0x19]          
  051c  98               cwde                                     
  051d  6bc01d           imul ax, ax, 0x1d                        
  0520  ba042c           mov dx, 0x2c04                           
  0523  8bd8             mov bx, ax                               
  0525  8ec2             mov es, dx                               
  0527  26c787020d0000   mov word ptr es:[bx + 0xd02], 0          
  052e  c45e06           les bx, ptr [bp + 6]                     
  0531  268a4719         mov al, byte ptr es:[bx + 0x19]          
  0535  98               cwde                                     
  0536  6bc01d           imul ax, ax, 0x1d                        
  0539  ba042c           mov dx, 0x2c04                           
  053c  8bd8             mov bx, ax                               
  053e  8ec2             mov es, dx                               
  0540  26c787040d0000   mov word ptr es:[bx + 0xd04], 0          
  0547  c41e5e5e         les bx, ptr [0x5e5e]                     
  054b  268a470a         mov al, byte ptr es:[bx + 0xa]           
  054f  98               cwde                                     
  0550  6bc014           imul ax, ax, 0x14                        
  0553  052302           add ax, 0x223                            
  0556  68042c           push 0x2c04                              
  0559  50               push ax                                  
  055a  6a00             push 0                                   
  055c  c45e06           les bx, ptr [bp + 6]                     
  055f  268a4719         mov al, byte ptr es:[bx + 0x19]          
  0563  98               cwde                                     
  0564  50               push ax                                  
  0565  6a06             push 6                                   
  0567  b8042c           mov ax, 0x2c04                           
  056a  8ec0             mov es, ax                               
  056c  26ff361001       push word ptr es:[0x110]                 
  0571  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  0576  83c40c           add sp, 0xc                              
  0579  8b5e0c           mov bx, word ptr [bp + 0xc]              
  057c  69dbe000         imul bx, bx, 0xe0                        
  0580  8b460a           mov ax, word ptr [bp + 0xa]              
  0583  d1e0             shl ax, 1                                
  0585  03d8             add bx, ax                               
  0587  b81d1e           mov ax, 0x1e1d                           
  058a  8ec0             mov es, ax                               
  058c  26808f010040     or byte ptr es:[bx + 1], 0x40            
  0592  c45e06           les bx, ptr [bp + 6]                     
  0595  26c6471800       mov byte ptr es:[bx + 0x18], 0           
  059a  e90c02           jmp 0x7a9                                
  059d  c45e06           les bx, ptr [bp + 6]                     
  05a0  26837f1b00       cmp word ptr es:[bx + 0x1b], 0           
  05a5  7412             je 0x5b9                                 
  05a7  6668e803e803     push 0x3e803e8                           
  05ad  6a03             push 3                                   
  05af  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  05b4  83c406           add sp, 6                                
  05b7  eb10             jmp 0x5c9                                
  05b9  6668f401f401     push 0x1f401f4                           
  05bf  6a03             push 3                                   
  05c1  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  05c6  83c406           add sp, 6                                
  05c9  8bc8             mov cx, ax                               
  05cb  8b5e0c           mov bx, word ptr [bp + 0xc]              
  05ce  69dbe000         imul bx, bx, 0xe0                        
  05d2  8b460a           mov ax, word ptr [bp + 0xa]              
  05d5  d1e0             shl ax, 1                                
  05d7  03d8             add bx, ax                               
  05d9  b81d1e           mov ax, 0x1e1d                           
  05dc  8ec0             mov es, ax                               
  05de  26808f010040     or byte ptr es:[bx + 1], 0x40            
  05e4  b8042c           mov ax, 0x2c04                           
  05e7  8ec0             mov es, ax                               
  05e9  268b1e1001       mov bx, word ptr es:[0x110]              
  05ee  6bdb14           imul bx, bx, 0x14                        
  05f1  b8042c           mov ax, 0x2c04                           
  05f4  8ec0             mov es, ax                               
  05f6  26018f8501       add word ptr es:[bx + 0x185], cx         
  05fb  0bff             or di, di                                
  05fd  7441             je 0x640                                 
  05ff  51               push cx                                  
  0600  c41e5e5e         les bx, ptr [0x5e5e]                     
  0604  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0608  98               cwde                                     
  0609  6bc014           imul ax, ax, 0x14                        
  060c  052302           add ax, 0x223                            
  060f  68042c           push 0x2c04                              
  0612  50               push ax                                  
  0613  666a35           push 0x35                                
  0616  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  061b  83c404           add sp, 4                                
  061e  52               push dx                                  
  061f  50               push ax                                  
  0620  1e               push ds                                  
  0621  68385c           push 0x5c38                              
  0624  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0629  83c40e           add sp, 0xe                              
  062c  1e               push ds                                  
  062d  68385c           push 0x5c38                              
  0630  90               nop                                      
  0631  0e               push cs                                  
  0632  e89411           call 0x17c9                              
  0635  83c404           add sp, 4                                
  0638  6a00             push 0                                   
  063a  90               nop                                      
  063b  0e               push cs                                  
  063c  e8d311           call 0x1812                              
  063f  59               pop cx                                   
  0640  c41e5e5e         les bx, ptr [0x5e5e]                     
  0644  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0648  98               cwde                                     
  0649  6bc014           imul ax, ax, 0x14                        
  064c  052302           add ax, 0x223                            
  064f  68042c           push 0x2c04                              
  0652  50               push ax                                  
  0653  666a66           push 0x66                                
  0656  e93c01           jmp 0x795                                
  0659  8b5e0c           mov bx, word ptr [bp + 0xc]              
  065c  69dbe000         imul bx, bx, 0xe0                        
  0660  8b460a           mov ax, word ptr [bp + 0xa]              
  0663  d1e0             shl ax, 1                                
  0665  03d8             add bx, ax                               
  0667  b81d1e           mov ax, 0x1e1d                           
  066a  8ec0             mov es, ax                               
  066c  26808f010040     or byte ptr es:[bx + 1], 0x40            
  0672  666a02           push 2                                   
  0675  6a01             push 1                                   
  0677  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  067c  83c406           add sp, 6                                
  067f  8946fe           mov word ptr [bp - 2], ax                
  0682  c45e06           les bx, ptr [bp + 6]                     
  0685  26837f1b00       cmp word ptr es:[bx + 0x1b], 0           
  068a  7404             je 0x690                                 
  068c  8346fe02         add word ptr [bp - 2], 2                 
  0690  837efe01         cmp word ptr [bp - 2], 1                 
  0694  7e45             jle 0x6db                                
  0696  c41e5e5e         les bx, ptr [0x5e5e]                     
  069a  268a470a         mov al, byte ptr es:[bx + 0xa]           
  069e  98               cwde                                     
  069f  6bc014           imul ax, ax, 0x14                        
  06a2  052302           add ax, 0x223                            
  06a5  68042c           push 0x2c04                              
  06a8  50               push ax                                  
  06a9  c45e06           les bx, ptr [bp + 6]                     
  06ac  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  06b0  98               cwde                                     
  06b1  50               push ax                                  
  06b2  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  06b7  59               pop cx                                   
  06b8  52               push dx                                  
  06b9  50               push ax                                  
  06ba  ff76fe           push word ptr [bp - 2]                   
  06bd  666836000100     push 0x10036                             
  06c3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  06c8  83c404           add sp, 4                                
  06cb  52               push dx                                  
  06cc  50               push ax                                  
  06cd  1e               push ds                                  
  06ce  68385c           push 0x5c38                              
  06d1  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  06d6  83c412           add sp, 0x12                             
  06d9  eb3d             jmp 0x718                                
  06db  c41e5e5e         les bx, ptr [0x5e5e]                     
  06df  268a470a         mov al, byte ptr es:[bx + 0xa]           
  06e3  98               cwde                                     
  06e4  6bc014           imul ax, ax, 0x14                        
  06e7  052302           add ax, 0x223                            
  06ea  68042c           push 0x2c04                              
  06ed  50               push ax                                  
  06ee  c45e06           les bx, ptr [bp + 6]                     
  06f1  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  06f5  98               cwde                                     
  06f6  50               push ax                                  
  06f7  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  06fc  59               pop cx                                   
  06fd  52               push dx                                  
  06fe  50               push ax                                  
  06ff  666a36           push 0x36                                
  0702  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0707  83c404           add sp, 4                                
  070a  52               push dx                                  
  070b  50               push ax                                  
  070c  1e               push ds                                  
  070d  68385c           push 0x5c38                              
  0710  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0715  83c410           add sp, 0x10                             
  0718  0bff             or di, di                                
  071a  7414             je 0x730                                 
  071c  1e               push ds                                  
  071d  68385c           push 0x5c38                              
  0720  90               nop                                      
  0721  0e               push cs                                  
  0722  e8a410           call 0x17c9                              
  0725  83c404           add sp, 4                                
  0728  6a00             push 0                                   
  072a  90               nop                                      
  072b  0e               push cs                                  
  072c  e8e310           call 0x1812                              
  072f  59               pop cx                                   
  0730  8b5e0c           mov bx, word ptr [bp + 0xc]              
  0733  69dbe000         imul bx, bx, 0xe0                        
  0737  8b460a           mov ax, word ptr [bp + 0xa]              
  073a  d1e0             shl ax, 1                                
  073c  03d8             add bx, ax                               
  073e  b81d1e           mov ax, 0x1e1d                           
  0741  8ec0             mov es, ax                               
  0743  26808f010040     or byte ptr es:[bx + 1], 0x40            
  0749  c45e06           les bx, ptr [bp + 6]                     
  074c  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  0750  98               cwde                                     
  0751  8946fc           mov word ptr [bp - 4], ax                
  0754  33f6             xor si, si                               
  0756  eb22             jmp 0x77a                                
  0758  ff760c           push word ptr [bp + 0xc]                 
  075b  ff760a           push word ptr [bp + 0xa]                 
  075e  ff76fc           push word ptr [bp - 4]                   
  0761  90               nop                                      
  0762  0e               push cs                                  
  0763  e8800b           call 0x12e6                              
  0766  83c406           add sp, 6                                
  0769  8956f4           mov word ptr [bp - 0xc], dx              
  076c  8946f2           mov word ptr [bp - 0xe], ax              
  076f  52               push dx                                  
  0770  50               push ax                                  
  0771  9ae202620b       lcall 0xb62, 0x2e2                       -> 0b62:02e2
  0776  83c404           add sp, 4                                
  0779  46               inc si                                   
  077a  3b76fe           cmp si, word ptr [bp - 2]                
  077d  7cd9             jl 0x758                                 
  077f  c41e5e5e         les bx, ptr [0x5e5e]                     
  0783  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0787  98               cwde                                     
  0788  6bc014           imul ax, ax, 0x14                        
  078b  052302           add ax, 0x223                            
  078e  68042c           push 0x2c04                              
  0791  50               push ax                                  
  0792  666a64           push 0x64                                
  0795  6a06             push 6                                   
  0797  b8042c           mov ax, 0x2c04                           
  079a  8ec0             mov es, ax                               
  079c  26ff361001       push word ptr es:[0x110]                 
  07a1  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  07a6  83c40c           add sp, 0xc                              
  07a9  5f               pop di                                   
  07aa  5e               pop si                                   
  07ab  c9               leave                                    
  07ac  cb               retf                                     

ovl34_07ad:  ; ENTRY
  07ad  55               push bp                                  
  07ae  8bec             mov bp, sp                               
  07b0  83ec04           sub sp, 4                                
  07b3  56               push si                                  
  07b4  57               push di                                  
  07b5  66ff365e5e       push dword ptr [0x5e5e]                  
  07ba  666a00           push 0                                   
  07bd  6a02             push 2                                   
  07bf  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  07c4  83c40a           add sp, 0xa                              
  07c7  33f6             xor si, si                               
  07c9  33d2             xor dx, dx                               
  07cb  eb31             jmp 0x7fe                                
  07cd  8bda             mov bx, dx                               
  07cf  d1e3             shl bx, 1                                
  07d1  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  07d5  6bdb1d           imul bx, bx, 0x1d                        
  07d8  b8042c           mov ax, 0x2c04                           
  07db  8ec0             mov es, ax                               
  07dd  2680bffd0c01     cmp byte ptr es:[bx + 0xcfd], 1          
  07e3  7518             jne 0x7fd                                
  07e5  8bda             mov bx, dx                               
  07e7  d1e3             shl bx, 1                                
  07e9  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  07ed  6bdb1d           imul bx, bx, 0x1d                        
  07f0  b8042c           mov ax, 0x2c04                           
  07f3  8ec0             mov es, ax                               
  07f5  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  07fa  98               cwde                                     
  07fb  03f0             add si, ax                               
  07fd  42               inc dx                                   
  07fe  3b162e48         cmp dx, word ptr [0x482e]                
  0802  7cc9             jl 0x7cd                                 
  0804  33ff             xor di, di                               
  0806  b8042c           mov ax, 0x2c04                           
  0809  8ec0             mov es, ax                               
  080b  268b168101       mov dx, word ptr es:[0x181]              
  0810  eb32             jmp 0x844                                
  0812  8bda             mov bx, dx                               
  0814  6bdb16           imul bx, bx, 0x16                        
  0817  b81d1e           mov ax, 0x1e1d                           
  081a  8ec0             mov es, ax                               
  081c  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  0821  c41e5e5e         les bx, ptr [0x5e5e]                     
  0825  263b07           cmp ax, word ptr es:[bx]                 
  0828  751a             jne 0x844                                
  082a  8bda             mov bx, dx                               
  082c  6bdb16           imul bx, bx, 0x16                        
  082f  b81d1e           mov ax, 0x1e1d                           
  0832  8ec0             mov es, ax                               
  0834  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0839  c41e5e5e         les bx, ptr [0x5e5e]                     
  083d  263b4702         cmp ax, word ptr es:[bx + 2]             
  0841  7501             jne 0x844                                
  0843  47               inc di                                   
  0844  8bc2             mov ax, dx                               
  0846  4a               dec dx                                   
  0847  0bc0             or ax, ax                                
  0849  75c7             jne 0x812                                
  084b  666a64           push 0x64                                
  084e  6a01             push 1                                   
  0850  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0855  83c406           add sp, 6                                
  0858  8946fc           mov word ptr [bp - 4], ax                
  085b  c41e5e5e         les bx, ptr [0x5e5e]                     
  085f  268a4708         mov al, byte ptr es:[bx + 8]             
  0863  98               cwde                                     
  0864  03c6             add ax, si                               
  0866  c45e06           les bx, ptr [bp + 6]                     
  0869  50               push ax                                  
  086a  268a471a         mov al, byte ptr es:[bx + 0x1a]          
  086e  98               cwde                                     
  086f  d1e0             shl ax, 1                                
  0871  ba042c           mov dx, 0x2c04                           
  0874  8bd8             mov bx, ax                               
  0876  8ec2             mov es, dx                               
  0878  58               pop ax                                   
  0879  262b870710       sub ax, word ptr es:[bx + 0x1007]        
  087e  6bc005           imul ax, ax, 5                           
  0881  8bd7             mov dx, di                               
  0883  6bd203           imul dx, dx, 3                           
  0886  03d0             add dx, ax                               
  0888  83c25a           add dx, 0x5a                             
  088b  8956fe           mov word ptr [bp - 2], dx                
  088e  8b46fc           mov ax, word ptr [bp - 4]                
  0891  3b46fe           cmp ax, word ptr [bp - 2]                
  0894  7e05             jle 0x89b                                
  0896  b80100           mov ax, 1                                
  0899  eb02             jmp 0x89d                                
  089b  33c0             xor ax, ax                               
  089d  5f               pop di                                   
  089e  5e               pop si                                   
  089f  c9               leave                                    
  08a0  cb               retf                                     

ovl34_08a1:  ; ENTRY
  08a1  55               push bp                                  
  08a2  8bec             mov bp, sp                               
  08a4  83ec0c           sub sp, 0xc                              
  08a7  56               push si                                  
  08a8  57               push di                                  
  08a9  c746faffff       mov word ptr [bp - 6], 0xffff            
  08ae  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  08b3  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  08b8  c746f4ffff       mov word ptr [bp - 0xc], 0xffff          
  08bd  33f6             xor si, si                               
  08bf  eb3d             jmp 0x8fe                                
  08c1  8bde             mov bx, si                               
  08c3  6bdb1f           imul bx, bx, 0x1f                        
  08c6  b8042c           mov ax, 0x2c04                           
  08c9  8ec0             mov es, ax                               
  08cb  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  08d1  752a             jne 0x8fd                                
  08d3  837efa00         cmp word ptr [bp - 6], 0                 
  08d7  7d05             jge 0x8de                                
  08d9  8976fa           mov word ptr [bp - 6], si                
  08dc  eb1f             jmp 0x8fd                                
  08de  837ef800         cmp word ptr [bp - 8], 0                 
  08e2  7d05             jge 0x8e9                                
  08e4  8976f8           mov word ptr [bp - 8], si                
  08e7  eb14             jmp 0x8fd                                
  08e9  837ef600         cmp word ptr [bp - 0xa], 0               
  08ed  7d05             jge 0x8f4                                
  08ef  8976f6           mov word ptr [bp - 0xa], si              
  08f2  eb09             jmp 0x8fd                                
  08f4  837ef400         cmp word ptr [bp - 0xc], 0               
  08f8  7d03             jge 0x8fd                                
  08fa  8976f4           mov word ptr [bp - 0xc], si              
  08fd  46               inc si                                   
  08fe  b8042c           mov ax, 0x2c04                           
  0901  8ec0             mov es, ax                               
  0903  2639360f08       cmp word ptr es:[0x80f], si              
  0908  7fb7             jg 0x8c1                                 
  090a  33ff             xor di, di                               
  090c  33f6             xor si, si                               
  090e  e91801           jmp 0xa29                                
  0911  833eda2b00       cmp word ptr [0x2bda], 0                 
  0916  7415             je 0x92d                                 
  0918  8bde             mov bx, si                               
  091a  c1e302           shl bx, 2                                
  091d  8b87405e         mov ax, word ptr [bx + 0x5e40]           
  0921  8b973e5e         mov dx, word ptr [bx + 0x5e3e]           
  0925  8946fe           mov word ptr [bp - 2], ax                
  0928  8956fc           mov word ptr [bp - 4], dx                
  092b  eb08             jmp 0x935                                
  092d  66a1625e         mov eax, dword ptr [0x5e62]              
  0931  668946fc         mov dword ptr [bp - 4], eax              
  0935  66837efc00       cmp dword ptr [bp - 4], 0                
  093a  7503             jne 0x93f                                
  093c  e9e900           jmp 0xa28                                
  093f  8b4606           mov ax, word ptr [bp + 6]                
  0942  3b46fa           cmp ax, word ptr [bp - 6]                
  0945  7532             jne 0x979                                
  0947  c45efc           les bx, ptr [bp - 4]                     
  094a  26f7470c0200     test word ptr es:[bx + 0xc], 2           
  0950  7403             je 0x955                                 
  0952  e9cc00           jmp 0xa21                                
  0955  6a01             push 1                                   
  0957  ff76fe           push word ptr [bp - 2]                   
  095a  53               push bx                                  
  095b  9a0500620b       lcall 0xb62, 5                           -> 0b62:0005
  0960  83c406           add sp, 6                                
  0963  c45efc           les bx, ptr [bp - 4]                     
  0966  26834f0c02       or word ptr es:[bx + 0xc], 2             
  096b  47               inc di                                   
  096c  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  0971  7403             je 0x976                                 
  0973  e9ab00           jmp 0xa21                                
  0976  e99a00           jmp 0xa13                                
  0979  8b4606           mov ax, word ptr [bp + 6]                
  097c  3b46f8           cmp ax, word ptr [bp - 8]                
  097f  752e             jne 0x9af                                
  0981  c45efc           les bx, ptr [bp - 4]                     
  0984  26f7470c0400     test word ptr es:[bx + 0xc], 4           
  098a  7403             je 0x98f                                 
  098c  e99200           jmp 0xa21                                
  098f  6a01             push 1                                   
  0991  ff76fe           push word ptr [bp - 2]                   
  0994  53               push bx                                  
  0995  9a0500620b       lcall 0xb62, 5                           -> 0b62:0005
  099a  83c406           add sp, 6                                
  099d  c45efc           les bx, ptr [bp - 4]                     
  09a0  26834f0c04       or word ptr es:[bx + 0xc], 4             
  09a5  47               inc di                                   
  09a6  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  09ab  7574             jne 0xa21                                
  09ad  eb64             jmp 0xa13                                
  09af  8b4606           mov ax, word ptr [bp + 6]                
  09b2  3b46f6           cmp ax, word ptr [bp - 0xa]              
  09b5  752b             jne 0x9e2                                
  09b7  c45efc           les bx, ptr [bp - 4]                     
  09ba  26f7470c0800     test word ptr es:[bx + 0xc], 8           
  09c0  755f             jne 0xa21                                
  09c2  6a01             push 1                                   
  09c4  ff76fe           push word ptr [bp - 2]                   
  09c7  53               push bx                                  
  09c8  9a0500620b       lcall 0xb62, 5                           -> 0b62:0005
  09cd  83c406           add sp, 6                                
  09d0  c45efc           les bx, ptr [bp - 4]                     
  09d3  26834f0c08       or word ptr es:[bx + 0xc], 8             
  09d8  47               inc di                                   
  09d9  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  09de  7541             jne 0xa21                                
  09e0  eb31             jmp 0xa13                                
  09e2  8b4606           mov ax, word ptr [bp + 6]                
  09e5  3b46f4           cmp ax, word ptr [bp - 0xc]              
  09e8  7537             jne 0xa21                                
  09ea  c45efc           les bx, ptr [bp - 4]                     
  09ed  26f7470c1000     test word ptr es:[bx + 0xc], 0x10        
  09f3  752c             jne 0xa21                                
  09f5  6a01             push 1                                   
  09f7  ff76fe           push word ptr [bp - 2]                   
  09fa  53               push bx                                  
  09fb  9a0500620b       lcall 0xb62, 5                           -> 0b62:0005
  0a00  83c406           add sp, 6                                
  0a03  c45efc           les bx, ptr [bp - 4]                     
  0a06  26834f0c10       or word ptr es:[bx + 0xc], 0x10          
  0a0b  47               inc di                                   
  0a0c  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  0a11  750e             jne 0xa21                                
  0a13  6a01             push 1                                   
  0a15  66ff76fc         push dword ptr [bp - 4]                  
  0a19  9a61007330       lcall 0x3073, 0x61                       -> ovl47:04f1
  0a1e  83c406           add sp, 6                                
  0a21  833eda2b00       cmp word ptr [0x2bda], 0                 
  0a26  7409             je 0xa31                                 
  0a28  46               inc si                                   
  0a29  83fe08           cmp si, 8                                
  0a2c  7d03             jge 0xa31                                
  0a2e  e9e0fe           jmp 0x911                                
  0a31  0bff             or di, di                                
  0a33  751b             jne 0xa50                                
  0a35  666a37           push 0x37                                
  0a38  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0a3d  83c404           add sp, 4                                
  0a40  52               push dx                                  
  0a41  50               push ax                                  
  0a42  1e               push ds                                  
  0a43  68385c           push 0x5c38                              
  0a46  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0a4b  83c408           add sp, 8                                
  0a4e  eb27             jmp 0xa77                                
  0a50  83ff01           cmp di, 1                                
  0a53  7505             jne 0xa5a                                
  0a55  666a38           push 0x38                                
  0a58  ebde             jmp 0xa38                                
  0a5a  57               push di                                  
  0a5b  666838000100     push 0x10038                             
  0a61  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0a66  83c404           add sp, 4                                
  0a69  52               push dx                                  
  0a6a  50               push ax                                  
  0a6b  1e               push ds                                  
  0a6c  68385c           push 0x5c38                              
  0a6f  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0a74  83c40a           add sp, 0xa                              
  0a77  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  0a7c  0bc0             or ax, ax                                
  0a7e  751c             jne 0xa9c                                
  0a80  666838000200     push 0x20038                             
  0a86  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0a8b  83c404           add sp, 4                                
  0a8e  52               push dx                                  
  0a8f  50               push ax                                  
  0a90  1e               push ds                                  
  0a91  68385c           push 0x5c38                              
  0a94  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  0a99  83c408           add sp, 8                                
  0a9c  5f               pop di                                   
  0a9d  5e               pop si                                   
  0a9e  c9               leave                                    
  0a9f  cb               retf                                     

ovl34_0aa0:  ; ENTRY
  0aa0  55               push bp                                  
  0aa1  8bec             mov bp, sp                               
  0aa3  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0aa8  90               nop                                      
  0aa9  0e               push cs                                  
  0aaa  e8630b           call 0x1610                              
  0aad  6a06             push 6                                   
  0aaf  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  0ab4  59               pop cx                                   
  0ab5  6aff             push -1                                  
  0ab7  90               nop                                      
  0ab8  0e               push cs                                  
  0ab9  e89f0c           call 0x175b                              
  0abc  59               pop cx                                   
  0abd  c41e5e5e         les bx, ptr [0x5e5e]                     
  0ac1  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0ac5  98               cwde                                     
  0ac6  6bc014           imul ax, ax, 0x14                        
  0ac9  052302           add ax, 0x223                            
  0acc  68042c           push 0x2c04                              
  0acf  50               push ax                                  
  0ad0  666a3a           push 0x3a                                
  0ad3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0ad8  83c404           add sp, 4                                
  0adb  52               push dx                                  
  0adc  50               push ax                                  
  0add  1e               push ds                                  
  0ade  68385c           push 0x5c38                              
  0ae1  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0ae6  83c40c           add sp, 0xc                              
  0ae9  1e               push ds                                  
  0aea  68385c           push 0x5c38                              
  0aed  90               nop                                      
  0aee  0e               push cs                                  
  0aef  e8d70c           call 0x17c9                              
  0af2  83c404           add sp, 4                                
  0af5  6a00             push 0                                   
  0af7  9a2f00ba30       lcall 0x30ba, 0x2f                       -> ovl58:01a9
  0afc  59               pop cx                                   
  0afd  6a0a             push 0xa                                 
  0aff  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  0b04  59               pop cx                                   
  0b05  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0b0a  ff7606           push word ptr [bp + 6]                   
  0b0d  90               nop                                      
  0b0e  0e               push cs                                  
  0b0f  e85d09           call 0x146f                              
  0b12  59               pop cx                                   
  0b13  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0b18  5d               pop bp                                   
  0b19  cb               retf                                     

ovl34_0b1a:  ; ENTRY
  0b1a  55               push bp                                  
  0b1b  8bec             mov bp, sp                               
  0b1d  56               push si                                  
  0b1e  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0b23  6668f401f401     push 0x1f401f4                           
  0b29  6a03             push 3                                   
  0b2b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0b30  83c406           add sp, 6                                
  0b33  8bf0             mov si, ax                               
  0b35  b8042c           mov ax, 0x2c04                           
  0b38  8ec0             mov es, ax                               
  0b3a  268b1e1001       mov bx, word ptr es:[0x110]              
  0b3f  6bdb14           imul bx, bx, 0x14                        
  0b42  b8042c           mov ax, 0x2c04                           
  0b45  8ec0             mov es, ax                               
  0b47  2601b78501       add word ptr es:[bx + 0x185], si         
  0b4c  666a3b           push 0x3b                                
  0b4f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0b54  83c404           add sp, 4                                
  0b57  52               push dx                                  
  0b58  50               push ax                                  
  0b59  90               nop                                      
  0b5a  0e               push cs                                  
  0b5b  e8770a           call 0x15d5                              
  0b5e  83c404           add sp, 4                                
  0b61  56               push si                                  
  0b62  66683b000100     push 0x1003b                             
  0b68  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0b6d  83c404           add sp, 4                                
  0b70  52               push dx                                  
  0b71  50               push ax                                  
  0b72  1e               push ds                                  
  0b73  68385c           push 0x5c38                              
  0b76  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0b7b  83c40a           add sp, 0xa                              
  0b7e  1e               push ds                                  
  0b7f  68385c           push 0x5c38                              
  0b82  90               nop                                      
  0b83  0e               push cs                                  
  0b84  e84e0a           call 0x15d5                              
  0b87  83c404           add sp, 4                                
  0b8a  6668f0001700     push 0x1700f0                            
  0b90  666808001601     push 0x1160008                           
  0b96  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0b9b  83c408           add sp, 8                                
  0b9e  681801           push 0x118                               
  0ba1  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0ba6  59               pop cx                                   
  0ba7  681901           push 0x119                               
  0baa  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0baf  59               pop cx                                   
  0bb0  681701           push 0x117                               
  0bb3  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0bb8  59               pop cx                                   
  0bb9  66681a010100     push 0x1011a                             
  0bbf  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0bc4  83c404           add sp, 4                                
  0bc7  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0bcc  5e               pop si                                   
  0bcd  5d               pop bp                                   
  0bce  cb               retf                                     

ovl34_0bcf:  ; ENTRY
  0bcf  55               push bp                                  
  0bd0  8bec             mov bp, sp                               
  0bd2  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0bd7  666a00           push 0                                   
  0bda  666801000100     push 0x10001                             
  0be0  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0be5  83c408           add sp, 8                                
  0be8  666a00           push 0                                   
  0beb  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  0bf0  83c404           add sp, 4                                
  0bf3  5d               pop bp                                   
  0bf4  cb               retf                                     

ovl34_0bf5:  ; ENTRY
  0bf5  55               push bp                                  
  0bf6  8bec             mov bp, sp                               
  0bf8  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0bfd  681a01           push 0x11a                               
  0c00  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0c05  59               pop cx                                   
  0c06  666818010200     push 0x20118                             
  0c0c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0c11  83c404           add sp, 4                                
  0c14  666819010200     push 0x20119                             
  0c1a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0c1f  83c404           add sp, 4                                
  0c22  666817010200     push 0x20117                             
  0c28  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0c2d  83c404           add sp, 4                                
  0c30  90               nop                                      
  0c31  0e               push cs                                  
  0c32  e8db09           call 0x1610                              
  0c35  6a00             push 0                                   
  0c37  1e               push ds                                  
  0c38  68760c           push 0xc76                                ; "Items"
  0c3b  681430           push 0x3014                              
  0c3e  685200           push 0x52                                
  0c41  9a20009030       lcall 0x3090, 0x20                       -> ovl51:0000
  0c46  83c40a           add sp, 0xa                              
  0c49  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0c4e  5d               pop bp                                   
  0c4f  cb               retf                                     

ovl34_0c50:  ; ENTRY
  0c50  55               push bp                                  
  0c51  8bec             mov bp, sp                               
  0c53  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0c58  666817010200     push 0x20117                             
  0c5e  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0c63  83c404           add sp, 4                                
  0c66  666818010200     push 0x20118                             
  0c6c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0c71  83c404           add sp, 4                                
  0c74  666819010200     push 0x20119                             
  0c7a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0c7f  83c404           add sp, 4                                
  0c82  6a0f             push 0xf                                 
  0c84  9aed07a908       lcall 0x8a9, 0x7ed                       -> 08a9:07ed
  0c89  59               pop cx                                   
  0c8a  666a3c           push 0x3c                                
  0c8d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0c92  83c404           add sp, 4                                
  0c95  52               push dx                                  
  0c96  50               push ax                                  
  0c97  90               nop                                      
  0c98  0e               push cs                                  
  0c99  e83909           call 0x15d5                              
  0c9c  83c404           add sp, 4                                
  0c9f  66683c000100     push 0x1003c                             
  0ca5  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0caa  83c404           add sp, 4                                
  0cad  52               push dx                                  
  0cae  50               push ax                                  
  0caf  90               nop                                      
  0cb0  0e               push cs                                  
  0cb1  e82109           call 0x15d5                              
  0cb4  83c404           add sp, 4                                
  0cb7  66683c000200     push 0x2003c                             
  0cbd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0cc2  83c404           add sp, 4                                
  0cc5  52               push dx                                  
  0cc6  50               push ax                                  
  0cc7  90               nop                                      
  0cc8  0e               push cs                                  
  0cc9  e80909           call 0x15d5                              
  0ccc  83c404           add sp, 4                                
  0ccf  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0cd4  5d               pop bp                                   
  0cd5  cb               retf                                     

ovl34_0cd6:  ; ENTRY
  0cd6  55               push bp                                  
  0cd7  8bec             mov bp, sp                               
  0cd9  83ec10           sub sp, 0x10                             
  0cdc  56               push si                                  
  0cdd  57               push di                                  
  0cde  666805000800     push 0x80005                             
  0ce4  6a01             push 1                                   
  0ce6  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0ceb  83c406           add sp, 6                                
  0cee  8b5606           mov dx, word ptr [bp + 6]                
  0cf1  2bd0             sub dx, ax                               
  0cf3  8956f8           mov word ptr [bp - 8], dx                
  0cf6  666805000800     push 0x80005                             
  0cfc  6a01             push 1                                   
  0cfe  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0d03  83c406           add sp, 6                                
  0d06  8b5608           mov dx, word ptr [bp + 8]                
  0d09  2bd0             sub dx, ax                               
  0d0b  8956fa           mov word ptr [bp - 6], dx                
  0d0e  66680a000f00     push 0xf000a                             
  0d14  6a01             push 1                                   
  0d16  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0d1b  83c406           add sp, 6                                
  0d1e  8946fc           mov word ptr [bp - 4], ax                
  0d21  66680a000f00     push 0xf000a                             
  0d27  6a01             push 1                                   
  0d29  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0d2e  83c406           add sp, 6                                
  0d31  8946fe           mov word ptr [bp - 2], ax                
  0d34  837ef800         cmp word ptr [bp - 8], 0                 
  0d38  7d05             jge 0xd3f                                
  0d3a  c746f80000       mov word ptr [bp - 8], 0                 
  0d3f  837efa00         cmp word ptr [bp - 6], 0                 
  0d43  7d05             jge 0xd4a                                
  0d45  c746fa0000       mov word ptr [bp - 6], 0                 
  0d4a  8b46f8           mov ax, word ptr [bp - 8]                
  0d4d  0346fc           add ax, word ptr [bp - 4]                
  0d50  3d7000           cmp ax, 0x70                             
  0d53  7c0a             jl 0xd5f                                 
  0d55  b87000           mov ax, 0x70                             
  0d58  2b46f8           sub ax, word ptr [bp - 8]                
  0d5b  48               dec ax                                   
  0d5c  8946fc           mov word ptr [bp - 4], ax                
  0d5f  8b46fa           mov ax, word ptr [bp - 6]                
  0d62  0346fe           add ax, word ptr [bp - 2]                
  0d65  3d9c00           cmp ax, 0x9c                             
  0d68  7c0a             jl 0xd74                                 
  0d6a  b89c00           mov ax, 0x9c                             
  0d6d  2b46fa           sub ax, word ptr [bp - 6]                
  0d70  48               dec ax                                   
  0d71  8946fe           mov word ptr [bp - 2], ax                
  0d74  8b46f8           mov ax, word ptr [bp - 8]                
  0d77  d1e0             shl ax, 1                                
  0d79  055000           add ax, 0x50                             
  0d7c  8946f0           mov word ptr [bp - 0x10], ax             
  0d7f  8b46fa           mov ax, word ptr [bp - 6]                
  0d82  d1e0             shl ax, 1                                
  0d84  053c00           add ax, 0x3c                             
  0d87  8946f2           mov word ptr [bp - 0xe], ax              
  0d8a  8b46fc           mov ax, word ptr [bp - 4]                
  0d8d  d1e0             shl ax, 1                                
  0d8f  8946f4           mov word ptr [bp - 0xc], ax              
  0d92  8b46fe           mov ax, word ptr [bp - 2]                
  0d95  d1e0             shl ax, 1                                
  0d97  8946f6           mov word ptr [bp - 0xa], ax              
  0d9a  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0d9f  8b76f8           mov si, word ptr [bp - 8]                
  0da2  eb25             jmp 0xdc9                                
  0da4  8b7efa           mov di, word ptr [bp - 6]                
  0da7  eb15             jmp 0xdbe                                
  0da9  57               push di                                  
  0daa  56               push si                                  
  0dab  b8042c           mov ax, 0x2c04                           
  0dae  8ec0             mov es, ax                               
  0db0  26ff361001       push word ptr es:[0x110]                 
  0db5  9a8e00f930       lcall 0x30f9, 0x8e                       -> ovl64:1298
  0dba  83c406           add sp, 6                                
  0dbd  47               inc di                                   
  0dbe  8b46fa           mov ax, word ptr [bp - 6]                
  0dc1  0346fe           add ax, word ptr [bp - 2]                
  0dc4  3bc7             cmp ax, di                               
  0dc6  7fe1             jg 0xda9                                 
  0dc8  46               inc si                                   
  0dc9  8b46f8           mov ax, word ptr [bp - 8]                
  0dcc  0346fc           add ax, word ptr [bp - 4]                
  0dcf  3bc6             cmp ax, si                               
  0dd1  7fd1             jg 0xda4                                 
  0dd3  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0dd8  b8042c           mov ax, 0x2c04                           
  0ddb  8ec0             mov es, ax                               
  0ddd  268b1e1001       mov bx, word ptr es:[0x110]              
  0de2  d1e3             shl bx, 1                                
  0de4  b8042c           mov ax, 0x2c04                           
  0de7  8ec0             mov es, ax                               
  0de9  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0def  7403             je 0xdf4                                 
  0df1  e98d00           jmp 0xe81                                
  0df4  b8042c           mov ax, 0x2c04                           
  0df7  8ec0             mov es, ax                               
  0df9  26ff361001       push word ptr es:[0x110]                 
  0dfe  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  0e03  59               pop cx                                   
  0e04  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0e09  6a0f             push 0xf                                 
  0e0b  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0e10  59               pop cx                                   
  0e11  16               push ss                                  
  0e12  8d46f0           lea ax, [bp - 0x10]                      
  0e15  50               push ax                                  
  0e16  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0e1b  83c404           add sp, 4                                
  0e1e  6a0a             push 0xa                                 
  0e20  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  0e25  59               pop cx                                   
  0e26  666a00           push 0                                   
  0e29  666801000100     push 0x10001                             
  0e2f  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0e34  83c408           add sp, 8                                
  0e37  6668f0001700     push 0x1700f0                            
  0e3d  666808001601     push 0x1160008                           
  0e43  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  0e48  83c408           add sp, 8                                
  0e4b  681801           push 0x118                               
  0e4e  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0e53  59               pop cx                                   
  0e54  681901           push 0x119                               
  0e57  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0e5c  59               pop cx                                   
  0e5d  681701           push 0x117                               
  0e60  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0e65  59               pop cx                                   
  0e66  6a0f             push 0xf                                 
  0e68  9a3908a908       lcall 0x8a9, 0x839                       -> 08a9:0839
  0e6d  59               pop cx                                   
  0e6e  66681a010100     push 0x1011a                             
  0e74  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0e79  83c404           add sp, 4                                
  0e7c  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0e81  5f               pop di                                   
  0e82  5e               pop si                                   
  0e83  c9               leave                                    
  0e84  cb               retf                                     

ovl34_0e85:  ; ENTRY
  0e85  55               push bp                                  
  0e86  8bec             mov bp, sp                               
  0e88  81ec8400         sub sp, 0x84                             
  0e8c  56               push si                                  
  0e8d  57               push di                                  
  0e8e  8b7606           mov si, word ptr [bp + 6]                
  0e91  6a0a             push 0xa                                 
  0e93  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0e98  59               pop cx                                   
  0e99  c7066a160100     mov word ptr [0x166a], 1                 
  0e9f  0bf6             or si, si                                
  0ea1  7d48             jge 0xeeb                                
  0ea3  681a01           push 0x11a                               
  0ea6  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0eab  59               pop cx                                   
  0eac  833e2e4800       cmp word ptr [0x482e], 0                 
  0eb1  7e04             jle 0xeb7                                
  0eb3  6a01             push 1                                   
  0eb5  eb02             jmp 0xeb9                                
  0eb7  6a02             push 2                                   
  0eb9  681701           push 0x117                               
  0ebc  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0ec1  83c404           add sp, 4                                
  0ec4  666818010100     push 0x10118                             
  0eca  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0ecf  83c404           add sp, 4                                
  0ed2  b8042c           mov ax, 0x2c04                           
  0ed5  8ec0             mov es, ax                               
  0ed7  26833e240100     cmp word ptr es:[0x124], 0               
  0edd  7408             je 0xee7                                 
  0edf  6a01             push 1                                   
  0ee1  681901           push 0x119                               
  0ee4  e9f303           jmp 0x12da                               
  0ee7  6a02             push 2                                   
  0ee9  ebf6             jmp 0xee1                                
  0eeb  8bde             mov bx, si                               
  0eed  d1e3             shl bx, 1                                
  0eef  8b87fc4b         mov ax, word ptr [bx + 0x4bfc]           
  0ef3  8946fe           mov word ptr [bp - 2], ax                
  0ef6  837efeff         cmp word ptr [bp - 2], -1                
  0efa  7403             je 0xeff                                 
  0efc  e90801           jmp 0x1007                               
  0eff  66683e000200     push 0x2003e                             
  0f05  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f0a  83c404           add sp, 4                                
  0f0d  52               push dx                                  
  0f0e  50               push ax                                  
  0f0f  90               nop                                      
  0f10  0e               push cs                                  
  0f11  e8c106           call 0x15d5                              
  0f14  83c404           add sp, 4                                
  0f17  66683e000100     push 0x1003e                             
  0f1d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f22  83c404           add sp, 4                                
  0f25  52               push dx                                  
  0f26  50               push ax                                  
  0f27  90               nop                                      
  0f28  0e               push cs                                  
  0f29  e8a906           call 0x15d5                              
  0f2c  83c404           add sp, 4                                
  0f2f  33f6             xor si, si                               
  0f31  33ff             xor di, di                               
  0f33  c746fc1027       mov word ptr [bp - 4], 0x2710            
  0f38  e9b800           jmp 0xff3                                
  0f3b  8bde             mov bx, si                               
  0f3d  6bdb1f           imul bx, bx, 0x1f                        
  0f40  b8042c           mov ax, 0x2c04                           
  0f43  8ec0             mov es, ax                               
  0f45  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  0f4b  7503             jne 0xf50                                
  0f4d  e9a200           jmp 0xff2                                
  0f50  8bde             mov bx, si                               
  0f52  6bdb1f           imul bx, bx, 0x1f                        
  0f55  b8042c           mov ax, 0x2c04                           
  0f58  ba042c           mov dx, 0x2c04                           
  0f5b  8ec2             mov es, dx                               
  0f5d  268a0e1001       mov cl, byte ptr es:[0x110]              
  0f62  ba0100           mov dx, 1                                
  0f65  d3e2             shl dx, cl                               
  0f67  8ec0             mov es, ax                               
  0f69  2685972e08       test word ptr es:[bx + 0x82e], dx        
  0f6e  7403             je 0xf73                                 
  0f70  e97f00           jmp 0xff2                                
  0f73  ff362841         push word ptr [0x4128]                   
  0f77  ff362a41         push word ptr [0x412a]                   
  0f7b  8bde             mov bx, si                               
  0f7d  6bdb1f           imul bx, bx, 0x1f                        
  0f80  b8042c           mov ax, 0x2c04                           
  0f83  8ec0             mov es, ax                               
  0f85  26ffb71308       push word ptr es:[bx + 0x813]            
  0f8a  8bde             mov bx, si                               
  0f8c  6bdb1f           imul bx, bx, 0x1f                        
  0f8f  b8042c           mov ax, 0x2c04                           
  0f92  8ec0             mov es, ax                               
  0f94  26ffb71108       push word ptr es:[bx + 0x811]            
  0f99  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0f9e  83c408           add sp, 8                                
  0fa1  3d2300           cmp ax, 0x23                             
  0fa4  7d4c             jge 0xff2                                
  0fa6  8bde             mov bx, si                               
  0fa8  6bdb1f           imul bx, bx, 0x1f                        
  0fab  b8042c           mov ax, 0x2c04                           
  0fae  8ec0             mov es, ax                               
  0fb0  2680bf290804     cmp byte ptr es:[bx + 0x829], 4          
  0fb6  753a             jne 0xff2                                
  0fb8  ff362841         push word ptr [0x4128]                   
  0fbc  ff362a41         push word ptr [0x412a]                   
  0fc0  8bde             mov bx, si                               
  0fc2  6bdb1f           imul bx, bx, 0x1f                        
  0fc5  b8042c           mov ax, 0x2c04                           
  0fc8  8ec0             mov es, ax                               
  0fca  26ffb71308       push word ptr es:[bx + 0x813]            
  0fcf  8bde             mov bx, si                               
  0fd1  6bdb1f           imul bx, bx, 0x1f                        
  0fd4  b8042c           mov ax, 0x2c04                           
  0fd7  8ec0             mov es, ax                               
  0fd9  26ffb71108       push word ptr es:[bx + 0x811]            
  0fde  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0fe3  83c408           add sp, 8                                
  0fe6  8bd0             mov dx, ax                               
  0fe8  3b56fc           cmp dx, word ptr [bp - 4]                
  0feb  7d05             jge 0xff2                                
  0fed  8bfe             mov di, si                               
  0fef  8956fc           mov word ptr [bp - 4], dx                
  0ff2  46               inc si                                   
  0ff3  b8042c           mov ax, 0x2c04                           
  0ff6  8ec0             mov es, ax                               
  0ff8  2639360f08       cmp word ptr es:[0x80f], si              
  0ffd  7e03             jle 0x1002                               
  0fff  e939ff           jmp 0xf3b                                
  1002  8bf7             mov si, di                               
  1004  e98201           jmp 0x1189                               
  1007  837efefe         cmp word ptr [bp - 2], -2                
  100b  7403             je 0x1010                                
  100d  e90601           jmp 0x1116                               
  1010  66683e000300     push 0x3003e                             
  1016  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  101b  83c404           add sp, 4                                
  101e  52               push dx                                  
  101f  50               push ax                                  
  1020  90               nop                                      
  1021  0e               push cs                                  
  1022  e8b005           call 0x15d5                              
  1025  83c404           add sp, 4                                
  1028  66683e000100     push 0x1003e                             
  102e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1033  83c404           add sp, 4                                
  1036  52               push dx                                  
  1037  50               push ax                                  
  1038  90               nop                                      
  1039  0e               push cs                                  
  103a  e89805           call 0x15d5                              
  103d  83c404           add sp, 4                                
  1040  33f6             xor si, si                               
  1042  33ff             xor di, di                               
  1044  c746fc1027       mov word ptr [bp - 4], 0x2710            
  1049  e9b800           jmp 0x1104                               
  104c  8bde             mov bx, si                               
  104e  6bdb1f           imul bx, bx, 0x1f                        
  1051  b8042c           mov ax, 0x2c04                           
  1054  8ec0             mov es, ax                               
  1056  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  105c  7503             jne 0x1061                               
  105e  e9a200           jmp 0x1103                               
  1061  8bde             mov bx, si                               
  1063  6bdb1f           imul bx, bx, 0x1f                        
  1066  b8042c           mov ax, 0x2c04                           
  1069  ba042c           mov dx, 0x2c04                           
  106c  8ec2             mov es, dx                               
  106e  268a0e1001       mov cl, byte ptr es:[0x110]              
  1073  ba0100           mov dx, 1                                
  1076  d3e2             shl dx, cl                               
  1078  8ec0             mov es, ax                               
  107a  2685972e08       test word ptr es:[bx + 0x82e], dx        
  107f  7403             je 0x1084                                
  1081  e97f00           jmp 0x1103                               
  1084  ff362841         push word ptr [0x4128]                   
  1088  ff362a41         push word ptr [0x412a]                   
  108c  8bde             mov bx, si                               
  108e  6bdb1f           imul bx, bx, 0x1f                        
  1091  b8042c           mov ax, 0x2c04                           
  1094  8ec0             mov es, ax                               
  1096  26ffb71308       push word ptr es:[bx + 0x813]            
  109b  8bde             mov bx, si                               
  109d  6bdb1f           imul bx, bx, 0x1f                        
  10a0  b8042c           mov ax, 0x2c04                           
  10a3  8ec0             mov es, ax                               
  10a5  26ffb71108       push word ptr es:[bx + 0x811]            
  10aa  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  10af  83c408           add sp, 8                                
  10b2  3d2300           cmp ax, 0x23                             
  10b5  7d4c             jge 0x1103                               
  10b7  8bde             mov bx, si                               
  10b9  6bdb1f           imul bx, bx, 0x1f                        
  10bc  b8042c           mov ax, 0x2c04                           
  10bf  8ec0             mov es, ax                               
  10c1  2680bf290805     cmp byte ptr es:[bx + 0x829], 5          
  10c7  753a             jne 0x1103                               
  10c9  ff362841         push word ptr [0x4128]                   
  10cd  ff362a41         push word ptr [0x412a]                   
  10d1  8bde             mov bx, si                               
  10d3  6bdb1f           imul bx, bx, 0x1f                        
  10d6  b8042c           mov ax, 0x2c04                           
  10d9  8ec0             mov es, ax                               
  10db  26ffb71308       push word ptr es:[bx + 0x813]            
  10e0  8bde             mov bx, si                               
  10e2  6bdb1f           imul bx, bx, 0x1f                        
  10e5  b8042c           mov ax, 0x2c04                           
  10e8  8ec0             mov es, ax                               
  10ea  26ffb71108       push word ptr es:[bx + 0x811]            
  10ef  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  10f4  83c408           add sp, 8                                
  10f7  8bd0             mov dx, ax                               
  10f9  3b56fc           cmp dx, word ptr [bp - 4]                
  10fc  7d05             jge 0x1103                               
  10fe  8bfe             mov di, si                               
  1100  8956fc           mov word ptr [bp - 4], dx                
  1103  46               inc si                                   
  1104  b8042c           mov ax, 0x2c04                           
  1107  8ec0             mov es, ax                               
  1109  2639360f08       cmp word ptr es:[0x80f], si              
  110e  7e03             jle 0x1113                               
  1110  e939ff           jmp 0x104c                               
  1113  e9ecfe           jmp 0x1002                               
  1116  8b46fe           mov ax, word ptr [bp - 2]                
  1119  6bc01d           imul ax, ax, 0x1d                        
  111c  05e90c           add ax, 0xce9                            
  111f  68042c           push 0x2c04                              
  1122  50               push ax                                  
  1123  666a3e           push 0x3e                                
  1126  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  112b  83c404           add sp, 4                                
  112e  52               push dx                                  
  112f  50               push ax                                  
  1130  16               push ss                                  
  1131  8d867cff         lea ax, [bp - 0x84]                      
  1135  50               push ax                                  
  1136  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  113b  83c40c           add sp, 0xc                              
  113e  16               push ss                                  
  113f  8d867cff         lea ax, [bp - 0x84]                      
  1143  50               push ax                                  
  1144  90               nop                                      
  1145  0e               push cs                                  
  1146  e88c04           call 0x15d5                              
  1149  83c404           add sp, 4                                
  114c  66683e000100     push 0x1003e                             
  1152  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1157  83c404           add sp, 4                                
  115a  52               push dx                                  
  115b  50               push ax                                  
  115c  90               nop                                      
  115d  0e               push cs                                  
  115e  e87404           call 0x15d5                              
  1161  83c404           add sp, 4                                
  1164  33f6             xor si, si                               
  1166  eb15             jmp 0x117d                               
  1168  8bde             mov bx, si                               
  116a  6bdb1f           imul bx, bx, 0x1f                        
  116d  b8042c           mov ax, 0x2c04                           
  1170  8ec0             mov es, ax                               
  1172  268a872a08       mov al, byte ptr es:[bx + 0x82a]         
  1177  3a46fe           cmp al, byte ptr [bp - 2]                
  117a  740d             je 0x1189                                
  117c  46               inc si                                   
  117d  b8042c           mov ax, 0x2c04                           
  1180  8ec0             mov es, ax                               
  1182  2639360f08       cmp word ptr es:[0x80f], si              
  1187  7fdf             jg 0x1168                                
  1189  8bde             mov bx, si                               
  118b  6bdb1f           imul bx, bx, 0x1f                        
  118e  b8042c           mov ax, 0x2c04                           
  1191  ba042c           mov dx, 0x2c04                           
  1194  8ec2             mov es, dx                               
  1196  268a0e1001       mov cl, byte ptr es:[0x110]              
  119b  ba0100           mov dx, 1                                
  119e  d3e2             shl dx, cl                               
  11a0  8ec0             mov es, ax                               
  11a2  2609972e08       or word ptr es:[bx + 0x82e], dx          
  11a7  8bde             mov bx, si                               
  11a9  6bdb1f           imul bx, bx, 0x1f                        
  11ac  b8042c           mov ax, 0x2c04                           
  11af  8ec0             mov es, ax                               
  11b1  26ffb71308       push word ptr es:[bx + 0x813]            
  11b6  8bde             mov bx, si                               
  11b8  6bdb1f           imul bx, bx, 0x1f                        
  11bb  b8042c           mov ax, 0x2c04                           
  11be  8ec0             mov es, ax                               
  11c0  26ffb71108       push word ptr es:[bx + 0x811]            
  11c5  b8042c           mov ax, 0x2c04                           
  11c8  8ec0             mov es, ax                               
  11ca  26ff361001       push word ptr es:[0x110]                 
  11cf  9a8e00f930       lcall 0x30f9, 0x8e                       -> ovl64:1298
  11d4  83c406           add sp, 6                                
  11d7  b8042c           mov ax, 0x2c04                           
  11da  8ec0             mov es, ax                               
  11dc  26ff361001       push word ptr es:[0x110]                 
  11e1  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  11e6  59               pop cx                                   
  11e7  b8042c           mov ax, 0x2c04                           
  11ea  8ec0             mov es, ax                               
  11ec  26ff361001       push word ptr es:[0x110]                 
  11f1  9a39001d30       lcall 0x301d, 0x39                       -> ovl35:09f2
  11f6  59               pop cx                                   
  11f7  666a00           push 0                                   
  11fa  666800000100     push 0x10000                             
  1200  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  1205  83c408           add sp, 8                                
  1208  8bc6             mov ax, si                               
  120a  6bc01f           imul ax, ax, 0x1f                        
  120d  051508           add ax, 0x815                            
  1210  68042c           push 0x2c04                              
  1213  50               push ax                                  
  1214  66683e000700     push 0x7003e                             
  121a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  121f  83c404           add sp, 4                                
  1222  52               push dx                                  
  1223  50               push ax                                  
  1224  1e               push ds                                  
  1225  68385c           push 0x5c38                              
  1228  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  122d  83c40c           add sp, 0xc                              
  1230  1e               push ds                                  
  1231  68385c           push 0x5c38                              
  1234  90               nop                                      
  1235  0e               push cs                                  
  1236  e89c03           call 0x15d5                              
  1239  83c404           add sp, 4                                
  123c  6a08             push 8                                   
  123e  56               push si                                  
  123f  9a5700e830       lcall 0x30e8, 0x57                       -> ovl62:0806
  1244  83c404           add sp, 4                                
  1247  6a08             push 8                                   
  1249  56               push si                                  
  124a  9a6600e830       lcall 0x30e8, 0x66                       -> ovl62:0868
  124f  83c404           add sp, 4                                
  1252  6a08             push 8                                   
  1254  8bde             mov bx, si                               
  1256  6bdb1f           imul bx, bx, 0x1f                        
  1259  b8042c           mov ax, 0x2c04                           
  125c  8ec0             mov es, ax                               
  125e  26ffb71308       push word ptr es:[bx + 0x813]            
  1263  8bde             mov bx, si                               
  1265  6bdb1f           imul bx, bx, 0x1f                        
  1268  b8042c           mov ax, 0x2c04                           
  126b  8ec0             mov es, ax                               
  126d  26ffb71108       push word ptr es:[bx + 0x811]            
  1272  c41e5e5e         les bx, ptr [0x5e5e]                     
  1276  26ff7702         push word ptr es:[bx + 2]                
  127a  26ff37           push word ptr es:[bx]                    
  127d  9a7f00e830       lcall 0x30e8, 0x7f                       -> ovl62:0a3f
  1282  83c40a           add sp, 0xa                              
  1285  6a01             push 1                                   
  1287  c41e5e5e         les bx, ptr [0x5e5e]                     
  128b  26ff7702         push word ptr es:[bx + 2]                
  128f  26ff37           push word ptr es:[bx]                    
  1292  9a4300f230       lcall 0x30f2, 0x43                       -> ovl63:1f5f
  1297  83c406           add sp, 6                                
  129a  666a00           push 0                                   
  129d  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  12a2  83c404           add sp, 4                                
  12a5  6668f0001700     push 0x1700f0                            
  12ab  666808001601     push 0x1160008                           
  12b1  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  12b6  83c408           add sp, 8                                
  12b9  681801           push 0x118                               
  12bc  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  12c1  59               pop cx                                   
  12c2  681901           push 0x119                               
  12c5  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  12ca  59               pop cx                                   
  12cb  681701           push 0x117                               
  12ce  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  12d3  59               pop cx                                   
  12d4  66681a010100     push 0x1011a                             
  12da  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  12df  83c404           add sp, 4                                
  12e2  5f               pop di                                   
  12e3  5e               pop si                                   
  12e4  c9               leave                                    
  12e5  cb               retf                                     

ovl34_12e6:  ; ENTRY
  12e6  55               push bp                                  
  12e7  8bec             mov bp, sp                               
  12e9  83ec48           sub sp, 0x48                             
  12ec  56               push si                                  
  12ed  57               push di                                  
  12ee  c746f60a00       mov word ptr [bp - 0xa], 0xa             
  12f3  16               push ss                                  
  12f4  8d46b8           lea ax, [bp - 0x48]                      
  12f7  50               push ax                                  
  12f8  ff7606           push word ptr [bp + 6]                   
  12fb  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  1300  83c406           add sp, 6                                
  1303  8b7608           mov si, word ptr [bp + 8]                
  1306  8b7e0a           mov di, word ptr [bp + 0xa]              
  1309  c746fa0000       mov word ptr [bp - 6], 0                 
  130e  e98700           jmp 0x1398                               
  1311  16               push ss                                  
  1312  8d46f8           lea ax, [bp - 8]                         
  1315  50               push ax                                  
  1316  57               push di                                  
  1317  56               push si                                  
  1318  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  131d  83c408           add sp, 8                                
  1320  837ef808         cmp word ptr [bp - 8], 8                 
  1324  7d2b             jge 0x1351                               
  1326  8bdf             mov bx, di                               
  1328  69dbe000         imul bx, bx, 0xe0                        
  132c  8bc6             mov ax, si                               
  132e  d1e0             shl ax, 1                                
  1330  03d8             add bx, ax                               
  1332  b81d1e           mov ax, 0x1e1d                           
  1335  8ec0             mov es, ax                               
  1337  268a870100       mov al, byte ptr es:[bx + 1]             
  133c  250f00           and ax, 0xf                              
  133f  ba042c           mov dx, 0x2c04                           
  1342  8ec2             mov es, dx                               
  1344  263b061001       cmp ax, word ptr es:[0x110]              
  1349  7442             je 0x138d                                
  134b  837ef800         cmp word ptr [bp - 8], 0                 
  134f  743c             je 0x138d                                
  1351  66680300feff     push 0xfffe0003                          
  1357  6a01             push 1                                   
  1359  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  135e  83c406           add sp, 6                                
  1361  8bd6             mov dx, si                               
  1363  03d0             add dx, ax                               
  1365  8bf2             mov si, dx                               
  1367  66680300feff     push 0xfffe0003                          
  136d  6a01             push 1                                   
  136f  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1374  83c406           add sp, 6                                
  1377  8bd7             mov dx, di                               
  1379  03d0             add dx, ax                               
  137b  8bfa             mov di, dx                               
  137d  ff4ef6           dec word ptr [bp - 0xa]                  
  1380  837ef600         cmp word ptr [bp - 0xa], 0               
  1384  7512             jne 0x1398                               
  1386  33d2             xor dx, dx                               
  1388  33c0             xor ax, ax                               
  138a  e9a300           jmp 0x1430                               
  138d  c746fa0100       mov word ptr [bp - 6], 1                 
  1392  897608           mov word ptr [bp + 8], si                
  1395  897e0a           mov word ptr [bp + 0xa], di              
  1398  837efa00         cmp word ptr [bp - 6], 0                 
  139c  7503             jne 0x13a1                               
  139e  e970ff           jmp 0x1311                               
  13a1  9a0903620b       lcall 0xb62, 0x309                       -> 0b62:0309
  13a6  8956fe           mov word ptr [bp - 2], dx                
  13a9  8946fc           mov word ptr [bp - 4], ax                
  13ac  c45efc           les bx, ptr [bp - 4]                     
  13af  8b4608           mov ax, word ptr [bp + 8]                
  13b2  268907           mov word ptr es:[bx], ax                 
  13b5  8b460a           mov ax, word ptr [bp + 0xa]              
  13b8  26894702         mov word ptr es:[bx + 2], ax             
  13bc  8a4606           mov al, byte ptr [bp + 6]                
  13bf  26884704         mov byte ptr es:[bx + 4], al             
  13c3  b8042c           mov ax, 0x2c04                           
  13c6  06               push es                                  
  13c7  8ec0             mov es, ax                               
  13c9  26a01001         mov al, byte ptr es:[0x110]              
  13cd  07               pop es                                   
  13ce  26884705         mov byte ptr es:[bx + 5], al             
  13d2  8e46fe           mov es, word ptr [bp - 2]                
  13d5  8a46d4           mov al, byte ptr [bp - 0x2c]             
  13d8  26884706         mov byte ptr es:[bx + 6], al             
  13dc  26884707         mov byte ptr es:[bx + 7], al             
  13e0  8a46ce           mov al, byte ptr [bp - 0x32]             
  13e3  26884708         mov byte ptr es:[bx + 8], al             
  13e7  26c6470900       mov byte ptr es:[bx + 9], 0              
  13ec  26c6470a00       mov byte ptr es:[bx + 0xa], 0            
  13f1  26c6470b00       mov byte ptr es:[bx + 0xb], 0            
  13f6  52               push dx                                  
  13f7  53               push bx                                  
  13f8  9ae202620b       lcall 0xb62, 0x2e2                       -> 0b62:02e2
  13fd  83c404           add sp, 4                                
  1400  b8042c           mov ax, 0x2c04                           
  1403  8ec0             mov es, ax                               
  1405  26a11001         mov ax, word ptr es:[0x110]              
  1409  250f00           and ax, 0xf                              
  140c  8b5e0a           mov bx, word ptr [bp + 0xa]              
  140f  69dbe000         imul bx, bx, 0xe0                        
  1413  8b5608           mov dx, word ptr [bp + 8]                
  1416  d1e2             shl dx, 1                                
  1418  03da             add bx, dx                               
  141a  ba1d1e           mov dx, 0x1e1d                           
  141d  8ec2             mov es, dx                               
  141f  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  1425  2608870100       or byte ptr es:[bx + 1], al              
  142a  8b56fe           mov dx, word ptr [bp - 2]                
  142d  8b46fc           mov ax, word ptr [bp - 4]                
  1430  5f               pop di                                   
  1431  5e               pop si                                   
  1432  c9               leave                                    
  1433  cb               retf                                     

ovl34_1434:  ; ENTRY
  1434  55               push bp                                  
  1435  8bec             mov bp, sp                               
  1437  833ec62800       cmp word ptr [0x28c6], 0                 
  143c  740a             je 0x1448                                
  143e  6a00             push 0                                   
  1440  9a2000cc30       lcall 0x30cc, 0x20                       -> ovl60:0000
  1445  59               pop cx                                   
  1446  eb25             jmp 0x146d                               
  1448  833e862a00       cmp word ptr [0x2a86], 0                 
  144d  740d             je 0x145c                                
  144f  666a00           push 0                                   
  1452  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  1457  83c404           add sp, 4                                
  145a  eb11             jmp 0x146d                               
  145c  666800000100     push 0x10000                             
  1462  666a00           push 0                                   
  1465  9a2f00ab30       lcall 0x30ab, 0x2f                       -> ovl57:0000
  146a  83c408           add sp, 8                                
  146d  5d               pop bp                                   
  146e  cb               retf                                     

ovl34_146f:  ; ENTRY
  146f  55               push bp                                  
  1470  8bec             mov bp, sp                               
  1472  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1477  6a02             push 2                                   
  1479  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  147e  59               pop cx                                   
  147f  666800000300     push 0x30000                             
  1485  666801000f00     push 0xf0001                             
  148b  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1490  83c408           add sp, 8                                
  1493  1e               push ds                                  
  1494  687c0c           push 0xc7c                                ; "A Sage!"
  1497  6668b0013e00     push 0x3e01b0                            
  149d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  14a2  83c408           add sp, 8                                
  14a5  666800000300     push 0x30000                             
  14ab  666802000f00     push 0xf0002                             
  14b1  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  14b6  83c408           add sp, 8                                
  14b9  666a3f           push 0x3f                                
  14bc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  14c1  83c404           add sp, 4                                
  14c4  52               push dx                                  
  14c5  50               push ax                                  
  14c6  6668b0017800     push 0x7801b0                            
  14cc  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  14d1  83c408           add sp, 8                                
  14d4  66683f000100     push 0x1003f                             
  14da  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  14df  83c404           add sp, 4                                
  14e2  52               push dx                                  
  14e3  50               push ax                                  
  14e4  6668b0018c00     push 0x8c01b0                            
  14ea  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  14ef  83c408           add sp, 8                                
  14f2  66683f000200     push 0x2003f                             
  14f8  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  14fd  83c404           add sp, 4                                
  1500  52               push dx                                  
  1501  50               push ax                                  
  1502  6668b001a000     push 0xa001b0                            
  1508  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  150d  83c408           add sp, 8                                
  1510  66683f000300     push 0x3003f                             
  1516  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  151b  83c404           add sp, 4                                
  151e  52               push dx                                  
  151f  50               push ax                                  
  1520  6668b001b400     push 0xb401b0                            
  1526  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  152b  83c408           add sp, 8                                
  152e  66683f000400     push 0x4003f                             
  1534  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1539  83c404           add sp, 4                                
  153c  52               push dx                                  
  153d  50               push ax                                  
  153e  6668b001c800     push 0xc801b0                            
  1544  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1549  83c408           add sp, 8                                
  154c  c7062641f000     mov word ptr [0x4126], 0xf0              
  1552  6a0a             push 0xa                                 
  1554  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1559  59               pop cx                                   
  155a  c7066a160100     mov word ptr [0x166a], 1                 
  1560  681a01           push 0x11a                               
  1563  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  1568  59               pop cx                                   
  1569  833e2e4800       cmp word ptr [0x482e], 0                 
  156e  7e04             jle 0x1574                               
  1570  6a01             push 1                                   
  1572  eb02             jmp 0x1576                               
  1574  6a02             push 2                                   
  1576  681701           push 0x117                               
  1579  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  157e  83c404           add sp, 4                                
  1581  666818010100     push 0x10118                             
  1587  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  158c  83c404           add sp, 4                                
  158f  6a0f             push 0xf                                 
  1591  9a3908a908       lcall 0x8a9, 0x839                       -> 08a9:0839
  1596  59               pop cx                                   
  1597  b8042c           mov ax, 0x2c04                           
  159a  8ec0             mov es, ax                               
  159c  26833e240100     cmp word ptr es:[0x124], 0               
  15a2  7404             je 0x15a8                                
  15a4  6a01             push 1                                   
  15a6  eb02             jmp 0x15aa                               
  15a8  6a02             push 2                                   
  15aa  681901           push 0x119                               
  15ad  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  15b2  83c404           add sp, 4                                
  15b5  ff7606           push word ptr [bp + 6]                   
  15b8  666a00           push 0                                   
  15bb  9a3900f230       lcall 0x30f2, 0x39                       -> ovl63:05e4
  15c0  83c406           add sp, 6                                
  15c3  666a00           push 0                                   
  15c6  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  15cb  83c404           add sp, 4                                
  15ce  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  15d3  5d               pop bp                                   
  15d4  cb               retf                                     

ovl34_15d5:  ; ENTRY
  15d5  55               push bp                                  
  15d6  8bec             mov bp, sp                               
  15d8  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  15dd  666800000300     push 0x30000                             
  15e3  666802000f00     push 0xf0002                             
  15e9  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  15ee  83c408           add sp, 8                                
  15f1  66ff7606         push dword ptr [bp + 6]                  
  15f5  ff362641         push word ptr [0x4126]                   
  15f9  68b001           push 0x1b0                               
  15fc  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1601  83c408           add sp, 8                                
  1604  8306264114       add word ptr [0x4126], 0x14              
  1609  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  160e  5d               pop bp                                   
  160f  cb               retf                                     

ovl34_1610:  ; ENTRY
  1610  55               push bp                                  
  1611  8bec             mov bp, sp                               
  1613  83ec04           sub sp, 4                                
  1616  56               push si                                  
  1617  57               push di                                  
  1618  33f6             xor si, si                               
  161a  c746fe0000       mov word ptr [bp - 2], 0                 
  161f  c746fc0000       mov word ptr [bp - 4], 0                 
  1624  33ff             xor di, di                               
  1626  e91b01           jmp 0x1744                               
  1629  8bdf             mov bx, di                               
  162b  6bdb1f           imul bx, bx, 0x1f                        
  162e  b8042c           mov ax, 0x2c04                           
  1631  8ec0             mov es, ax                               
  1633  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  1639  7503             jne 0x163e                               
  163b  e90501           jmp 0x1743                               
  163e  8bdf             mov bx, di                               
  1640  6bdb1f           imul bx, bx, 0x1f                        
  1643  b8042c           mov ax, 0x2c04                           
  1646  ba042c           mov dx, 0x2c04                           
  1649  8ec2             mov es, dx                               
  164b  268a0e1001       mov cl, byte ptr es:[0x110]              
  1650  ba0100           mov dx, 1                                
  1653  d3e2             shl dx, cl                               
  1655  8ec0             mov es, ax                               
  1657  2685972e08       test word ptr es:[bx + 0x82e], dx        
  165c  7403             je 0x1661                                
  165e  e9e200           jmp 0x1743                               
  1661  ff362841         push word ptr [0x4128]                   
  1665  ff362a41         push word ptr [0x412a]                   
  1669  8bdf             mov bx, di                               
  166b  6bdb1f           imul bx, bx, 0x1f                        
  166e  b8042c           mov ax, 0x2c04                           
  1671  8ec0             mov es, ax                               
  1673  26ffb71308       push word ptr es:[bx + 0x813]            
  1678  8bdf             mov bx, di                               
  167a  6bdb1f           imul bx, bx, 0x1f                        
  167d  b8042c           mov ax, 0x2c04                           
  1680  8ec0             mov es, ax                               
  1682  26ffb71108       push word ptr es:[bx + 0x811]            
  1687  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  168c  83c408           add sp, 8                                
  168f  3d2300           cmp ax, 0x23                             
  1692  7c03             jl 0x1697                                
  1694  e9ac00           jmp 0x1743                               
  1697  8bdf             mov bx, di                               
  1699  6bdb1f           imul bx, bx, 0x1f                        
  169c  b8042c           mov ax, 0x2c04                           
  169f  8ec0             mov es, ax                               
  16a1  2680bf290804     cmp byte ptr es:[bx + 0x829], 4          
  16a7  751e             jne 0x16c7                               
  16a9  837efe00         cmp word ptr [bp - 2], 0                 
  16ad  7403             je 0x16b2                                
  16af  e99100           jmp 0x1743                               
  16b2  c746fe0100       mov word ptr [bp - 2], 1                 
  16b7  8bde             mov bx, si                               
  16b9  d1e3             shl bx, 1                                
  16bb  c787fc4bffff     mov word ptr [bx + 0x4bfc], 0xffff       
  16c1  1e               push ds                                  
  16c2  68840c           push 0xc84                                ; "Gold"
  16c5  eb69             jmp 0x1730                               
  16c7  8bdf             mov bx, di                               
  16c9  6bdb1f           imul bx, bx, 0x1f                        
  16cc  b8042c           mov ax, 0x2c04                           
  16cf  8ec0             mov es, ax                               
  16d1  2680bf290805     cmp byte ptr es:[bx + 0x829], 5          
  16d7  751b             jne 0x16f4                               
  16d9  837efc00         cmp word ptr [bp - 4], 0                 
  16dd  7564             jne 0x1743                               
  16df  c746fc0100       mov word ptr [bp - 4], 1                 
  16e4  8bde             mov bx, si                               
  16e6  d1e3             shl bx, 1                                
  16e8  c787fc4bfeff     mov word ptr [bx + 0x4bfc], 0xfffe       
  16ee  1e               push ds                                  
  16ef  68890c           push 0xc89                                ; "Allies"
  16f2  eb3c             jmp 0x1730                               
  16f4  8bdf             mov bx, di                               
  16f6  6bdb1f           imul bx, bx, 0x1f                        
  16f9  b8042c           mov ax, 0x2c04                           
  16fc  8ec0             mov es, ax                               
  16fe  2680bf290802     cmp byte ptr es:[bx + 0x829], 2          
  1704  753d             jne 0x1743                               
  1706  8bdf             mov bx, di                               
  1708  6bdb1f           imul bx, bx, 0x1f                        
  170b  b8042c           mov ax, 0x2c04                           
  170e  8ec0             mov es, ax                               
  1710  268a872a08       mov al, byte ptr es:[bx + 0x82a]         
  1715  98               cwde                                     
  1716  8bde             mov bx, si                               
  1718  d1e3             shl bx, 1                                
  171a  8987fc4b         mov word ptr [bx + 0x4bfc], ax           
  171e  8bde             mov bx, si                               
  1720  d1e3             shl bx, 1                                
  1722  8b87fc4b         mov ax, word ptr [bx + 0x4bfc]           
  1726  6bc01d           imul ax, ax, 0x1d                        
  1729  05e90c           add ax, 0xce9                            
  172c  68042c           push 0x2c04                              
  172f  50               push ax                                  
  1730  8bc6             mov ax, si                               
  1732  c1e005           shl ax, 5                                
  1735  053c48           add ax, 0x483c                           
  1738  1e               push ds                                  
  1739  50               push ax                                  
  173a  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  173f  83c408           add sp, 8                                
  1742  46               inc si                                   
  1743  47               inc di                                   
  1744  b8042c           mov ax, 0x2c04                           
  1747  8ec0             mov es, ax                               
  1749  26393e0f08       cmp word ptr es:[0x80f], di              
  174e  7e03             jle 0x1753                               
  1750  e9d6fe           jmp 0x1629                               
  1753  89362e48         mov word ptr [0x482e], si                
  1757  5f               pop di                                   
  1758  5e               pop si                                   
  1759  c9               leave                                    
  175a  cb               retf                                     

ovl34_175b:  ; ENTRY
  175b  55               push bp                                  
  175c  8bec             mov bp, sp                               
  175e  6a04             push 4                                   
  1760  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1765  59               pop cx                                   
  1766  666800000300     push 0x30000                             
  176c  666801000f00     push 0xf0001                             
  1772  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1777  83c408           add sp, 8                                
  177a  1e               push ds                                  
  177b  68900c           push 0xc90                                ; "Searching"
  177e  66ff36500c       push dword ptr [0xc50]                   
  1783  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1788  83c408           add sp, 8                                
  178b  66ff36680c       push dword ptr [0xc68]                   
  1790  b8600c           mov ax, 0xc60                            
  1793  8cda             mov dx, ds                               
  1795  b90800           mov cx, 8                                
  1798  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  179d  6a23             push 0x23                                
  179f  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  17a4  83c40e           add sp, 0xe                              
  17a7  6a00             push 0                                   
  17a9  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  17ae  59               pop cx                                   
  17af  1e               push ds                                  
  17b0  686c0c           push 0xc6c                               
  17b3  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  17b8  83c404           add sp, 4                                
  17bb  c706740c0100     mov word ptr [0xc74], 1                  
  17c1  c7066a160100     mov word ptr [0x166a], 1                 
  17c7  5d               pop bp                                   
  17c8  cb               retf                                     

ovl34_17c9:  ; ENTRY
  17c9  55               push bp                                  
  17ca  8bec             mov bp, sp                               
  17cc  666800000300     push 0x30000                             
  17d2  666802000f00     push 0xf0002                             
  17d8  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  17dd  83c408           add sp, 8                                
  17e0  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  17e5  66ff7606         push dword ptr [bp + 6]                  
  17e9  8b1e740c         mov bx, word ptr [0xc74]                 
  17ed  c1e302           shl bx, 2                                
  17f0  ffb7520c         push word ptr [bx + 0xc52]               
  17f4  8b1e740c         mov bx, word ptr [0xc74]                 
  17f8  c1e302           shl bx, 2                                
  17fb  ffb7500c         push word ptr [bx + 0xc50]               
  17ff  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1804  83c408           add sp, 8                                
  1807  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  180c  ff06740c         inc word ptr [0xc74]                     
  1810  5d               pop bp                                   
  1811  cb               retf                                     

ovl34_1812:  ; ENTRY
  1812  55               push bp                                  
  1813  8bec             mov bp, sp                               
  1815  c7066a160100     mov word ptr [0x166a], 1                 
  181b  6a0d             push 0xd                                 
  181d  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1822  59               pop cx                                   
  1823  837e0600         cmp word ptr [bp + 6], 0                 
  1827  741e             je 0x1847                                
  1829  666824012501     push 0x1250124                           
  182f  9a0100be07       lcall 0x7be, 1                           -> 07be:0001
  1834  83c404           add sp, 4                                
  1837  666825010100     push 0x10125                             
  183d  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1842  83c404           add sp, 4                                
  1845  eb17             jmp 0x185e                               
  1847  666825012401     push 0x1240125                           
  184d  9a0100be07       lcall 0x7be, 1                           -> 07be:0001
  1852  83c404           add sp, 4                                
  1855  682501           push 0x125                               
  1858  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  185d  59               pop cx                                   
  185e  666824010100     push 0x10124                             
  1864  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1869  83c404           add sp, 4                                
  186c  5d               pop bp                                   
  186d  cb               retf                                     

ovl34_186e:  ; ENTRY
  186e  55               push bp                                  
  186f  8bec             mov bp, sp                               
  1871  83ec02           sub sp, 2                                
  1874  56               push si                                  
  1875  b8042c           mov ax, 0x2c04                           
  1878  8ec0             mov es, ax                               
  187a  268b368101       mov si, word ptr es:[0x181]              
  187f  eb1d             jmp 0x189e                               
  1881  8bc6             mov ax, si                               
  1883  6bc016           imul ax, ax, 0x16                        
  1886  ba1d1e           mov dx, 0x1e1d                           
  1889  bb0000           mov bx, 0                                
  188c  03d8             add bx, ax                               
  188e  81c38088         add bx, 0x8880                           
  1892  3b16605e         cmp dx, word ptr [0x5e60]                
  1896  7506             jne 0x189e                               
  1898  3b1e5e5e         cmp bx, word ptr [0x5e5e]                
  189c  7407             je 0x18a5                                
  189e  8bc6             mov ax, si                               
  18a0  4e               dec si                                   
  18a1  0bc0             or ax, ax                                
  18a3  75dc             jne 0x1881                               
  18a5  666a00           push 0                                   
  18a8  c41e5e5e         les bx, ptr [0x5e5e]                     
  18ac  26ff7702         push word ptr es:[bx + 2]                
  18b0  26ff37           push word ptr es:[bx]                    
  18b3  6a03             push 3                                   
  18b5  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  18ba  83c40a           add sp, 0xa                              
  18bd  33c9             xor cx, cx                               
  18bf  eb2c             jmp 0x18ed                               
  18c1  8bd9             mov bx, cx                               
  18c3  d1e3             shl bx, 1                                
  18c5  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  18c9  6bdb1d           imul bx, bx, 0x1d                        
  18cc  b8042c           mov ax, 0x2c04                           
  18cf  8ec0             mov es, ax                               
  18d1  2689b7000d       mov word ptr es:[bx + 0xd00], si         
  18d6  8bd9             mov bx, cx                               
  18d8  d1e3             shl bx, 1                                
  18da  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  18de  6bdb1d           imul bx, bx, 0x1d                        
  18e1  b8042c           mov ax, 0x2c04                           
  18e4  8ec0             mov es, ax                               
  18e6  26c687ff0c03     mov byte ptr es:[bx + 0xcff], 3          
  18ec  41               inc cx                                   
  18ed  3b0e2e48         cmp cx, word ptr [0x482e]                
  18f1  7cce             jl 0x18c1                                
  18f3  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  18f8  16               push ss                                  
  18f9  8d46fe           lea ax, [bp - 2]                         
  18fc  50               push ax                                  
  18fd  c41e5e5e         les bx, ptr [0x5e5e]                     
  1901  26ff7702         push word ptr es:[bx + 2]                
  1905  26ff37           push word ptr es:[bx]                    
  1908  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  190d  83c408           add sp, 8                                
  1910  8916645e         mov word ptr [0x5e64], dx                
  1914  a3625e           mov word ptr [0x5e62], ax                
  1917  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  191d  7408             je 0x1927                                
  191f  66a15e5e         mov eax, dword ptr [0x5e5e]              
  1923  66a3625e         mov dword ptr [0x5e62], eax              
  1927  6a00             push 0                                   
  1929  ff76fe           push word ptr [bp - 2]                   
  192c  9aec09620b       lcall 0xb62, 0x9ec                       -> 0b62:09ec
  1931  83c404           add sp, 4                                
  1934  66ff36625e       push dword ptr [0x5e62]                  
  1939  9a3e001931       lcall 0x3119, 0x3e                       -> ovl67:06eb
  193e  83c404           add sp, 4                                
  1941  666800000100     push 0x10000                             
  1947  6a01             push 1                                   
  1949  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  194e  83c406           add sp, 6                                
  1951  666a00           push 0                                   
  1954  666a00           push 0                                   
  1957  6a03             push 3                                   
  1959  9a3e005b2f       lcall 0x2f5b, 0x3e                       -> ovl01:1ded
  195e  83c40a           add sp, 0xa                              
  1961  5e               pop si                                   
  1962  c9               leave                                    
  1963  cb               retf                                     

ovl34_1964:  ; ENTRY
  1964  55               push bp                                  
  1965  8bec             mov bp, sp                               
  1967  83ec02           sub sp, 2                                
  196a  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  196f  16               push ss                                  
  1970  8d46fe           lea ax, [bp - 2]                         
  1973  50               push ax                                  
  1974  ff362841         push word ptr [0x4128]                   
  1978  ff362a41         push word ptr [0x412a]                   
  197c  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  1981  83c408           add sp, 8                                
  1984  8916645e         mov word ptr [0x5e64], dx                
  1988  a3625e           mov word ptr [0x5e62], ax                
  198b  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  1991  7408             je 0x199b                                
  1993  66a15e5e         mov eax, dword ptr [0x5e5e]              
  1997  66a3625e         mov dword ptr [0x5e62], eax              
  199b  837efe00         cmp word ptr [bp - 2], 0                 
  199f  7e1a             jle 0x19bb                               
  19a1  6a00             push 0                                   
  19a3  ff76fe           push word ptr [bp - 2]                   
  19a6  9aec09620b       lcall 0xb62, 0x9ec                       -> 0b62:09ec
  19ab  83c404           add sp, 4                                
  19ae  66ff36625e       push dword ptr [0x5e62]                  
  19b3  9a3e001931       lcall 0x3119, 0x3e                       -> ovl67:06eb
  19b8  83c404           add sp, 4                                
  19bb  666800000100     push 0x10000                             
  19c1  6a01             push 1                                   
  19c3  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  19c8  83c406           add sp, 6                                
  19cb  c9               leave                                    
  19cc  cb               retf                                     
