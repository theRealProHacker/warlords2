; ovl17 stub 2fac file_off 0x47c20 size 0x95b

ovl17_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec1e           sub sp, 0x1e                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  833e360603       cmp word ptr [0x636], 3                  
  000d  7c03             jl 0x12                                  
  000f  e98606           jmp 0x698                                
  0012  8b7e06           mov di, word ptr [bp + 6]                
  0015  a13606           mov ax, word ptr [0x636]                 
  0018  8946fe           mov word ptr [bp - 2], ax                
  001b  ff063606         inc word ptr [0x636]                     
  001f  8b5efe           mov bx, word ptr [bp - 2]                
  0022  d1e3             shl bx, 1                                
  0024  89bfb23f         mov word ptr [bx + 0x3fb2], di           
  0028  c1e003           shl ax, 3                                
  002b  05c43f           add ax, 0x3fc4                           
  002e  1e               push ds                                  
  002f  50               push ax                                  
  0030  8bc7             mov ax, di                               
  0032  c1e003           shl ax, 3                                
  0035  05a806           add ax, 0x6a8                            
  0038  1e               push ds                                  
  0039  50               push ax                                  
  003a  b90800           mov cx, 8                                
  003d  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0042  8b5efe           mov bx, word ptr [bp - 2]                
  0045  c1e303           shl bx, 3                                
  0048  83afc43f10       sub word ptr [bx + 0x3fc4], 0x10         
  004d  8b5efe           mov bx, word ptr [bp - 2]                
  0050  c1e303           shl bx, 3                                
  0053  ff8fc63f         dec word ptr [bx + 0x3fc6]               
  0057  8b5efe           mov bx, word ptr [bp - 2]                
  005a  c1e303           shl bx, 3                                
  005d  8387c83f20       add word ptr [bx + 0x3fc8], 0x20         
  0062  8b5efe           mov bx, word ptr [bp - 2]                
  0065  c1e303           shl bx, 3                                
  0068  8387ca3f04       add word ptr [bx + 0x3fca], 4            
  006d  8bdf             mov bx, di                               
  006f  c1e302           shl bx, 2                                
  0072  668b873806       mov eax, dword ptr [bx + 0x638]          
  0077  8b5efe           mov bx, word ptr [bp - 2]                
  007a  c1e302           shl bx, 2                                
  007d  668987b83f       mov dword ptr [bx + 0x3fb8], eax         
  0082  8b5efe           mov bx, word ptr [bp - 2]                
  0085  c1e302           shl bx, 2                                
  0088  83afb83f10       sub word ptr [bx + 0x3fb8], 0x10         
  008d  8b5efe           mov bx, word ptr [bp - 2]                
  0090  c1e302           shl bx, 2                                
  0093  ff8fba3f         dec word ptr [bx + 0x3fba]               
  0097  8b5efe           mov bx, word ptr [bp - 2]                
  009a  c1e303           shl bx, 3                                
  009d  ffb7ca3f         push word ptr [bx + 0x3fca]              
  00a1  8b5efe           mov bx, word ptr [bp - 2]                
  00a4  c1e303           shl bx, 3                                
  00a7  ffb7c83f         push word ptr [bx + 0x3fc8]              
  00ab  8b46fe           mov ax, word ptr [bp - 2]                
  00ae  6bc03b           imul ax, ax, 0x3b                        
  00b1  05dc3f           add ax, 0x3fdc                           
  00b4  1e               push ds                                  
  00b5  50               push ax                                  
  00b6  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  00bb  83c408           add sp, 8                                
  00be  0bc0             or ax, ax                                
  00c0  7503             jne 0xc5                                 
  00c2  e9d305           jmp 0x698                                
  00c5  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  00ca  8b5efe           mov bx, word ptr [bp - 2]                
  00cd  6bdb3b           imul bx, bx, 0x3b                        
  00d0  8b87e63f         mov ax, word ptr [bx + 0x3fe6]           
  00d4  0b87e83f         or ax, word ptr [bx + 0x3fe8]            
  00d8  745a             je 0x134                                 
  00da  8b5efe           mov bx, word ptr [bp - 2]                
  00dd  6bdb3b           imul bx, bx, 0x3b                        
  00e0  f78711400a00     test word ptr [bx + 0x4011], 0xa         
  00e6  754c             jne 0x134                                
  00e8  c746e80000       mov word ptr [bp - 0x18], 0              
  00ed  eb34             jmp 0x123                                
  00ef  8b5efe           mov bx, word ptr [bp - 2]                
  00f2  6bdb3b           imul bx, bx, 0x3b                        
  00f5  8b46e8           mov ax, word ptr [bp - 0x18]             
  00f8  c1e002           shl ax, 2                                
  00fb  03d8             add bx, ax                               
  00fd  66ffb7e63f       push dword ptr [bx + 0x3fe6]             
  0102  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0107  83c404           add sp, 4                                
  010a  8b5efe           mov bx, word ptr [bp - 2]                
  010d  6bdb3b           imul bx, bx, 0x3b                        
  0110  8b76e8           mov si, word ptr [bp - 0x18]             
  0113  c1e602           shl si, 2                                
  0116  03de             add bx, si                               
  0118  8997f83f         mov word ptr [bx + 0x3ff8], dx           
  011c  8987f63f         mov word ptr [bx + 0x3ff6], ax           
  0120  ff46e8           inc word ptr [bp - 0x18]                 
  0123  8b5efe           mov bx, word ptr [bp - 2]                
  0126  6bdb3b           imul bx, bx, 0x3b                        
  0129  8a871040         mov al, byte ptr [bx + 0x4010]           
  012d  b400             mov ah, 0                                
  012f  3b46e8           cmp ax, word ptr [bp - 0x18]             
  0132  7fbb             jg 0xef                                  
  0134  666a00           push 0                                   
  0137  8b46fe           mov ax, word ptr [bp - 2]                
  013a  6bc03b           imul ax, ax, 0x3b                        
  013d  05dc3f           add ax, 0x3fdc                           
  0140  1e               push ds                                  
  0141  50               push ax                                  
  0142  8b5efe           mov bx, word ptr [bp - 2]                
  0145  c1e303           shl bx, 3                                
  0148  ffb7ca3f         push word ptr [bx + 0x3fca]              
  014c  8b5efe           mov bx, word ptr [bp - 2]                
  014f  c1e303           shl bx, 3                                
  0152  ffb7c83f         push word ptr [bx + 0x3fc8]              
  0156  8b5efe           mov bx, word ptr [bp - 2]                
  0159  c1e303           shl bx, 3                                
  015c  ffb7c63f         push word ptr [bx + 0x3fc6]              
  0160  8b5efe           mov bx, word ptr [bp - 2]                
  0163  c1e303           shl bx, 3                                
  0166  ffb7c43f         push word ptr [bx + 0x3fc4]              
  016a  1e               push ds                                  
  016b  682a34           push 0x342a                              
  016e  ff1ed469         lcall [0x69d4]                           
  0172  83c414           add sp, 0x14                             
  0175  8b5efe           mov bx, word ptr [bp - 2]                
  0178  6bdb3b           imul bx, bx, 0x3b                        
  017b  8b87e63f         mov ax, word ptr [bx + 0x3fe6]           
  017f  0b87e83f         or ax, word ptr [bx + 0x3fe8]            
  0183  743d             je 0x1c2                                 
  0185  8b5efe           mov bx, word ptr [bp - 2]                
  0188  6bdb3b           imul bx, bx, 0x3b                        
  018b  f78711400a00     test word ptr [bx + 0x4011], 0xa         
  0191  752f             jne 0x1c2                                
  0193  33f6             xor si, si                               
  0195  eb1b             jmp 0x1b2                                
  0197  8b5efe           mov bx, word ptr [bp - 2]                
  019a  6bdb3b           imul bx, bx, 0x3b                        
  019d  8bc6             mov ax, si                               
  019f  c1e002           shl ax, 2                                
  01a2  03d8             add bx, ax                               
  01a4  66ffb7e63f       push dword ptr [bx + 0x3fe6]             
  01a9  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  01ae  83c404           add sp, 4                                
  01b1  46               inc si                                   
  01b2  8b5efe           mov bx, word ptr [bp - 2]                
  01b5  6bdb3b           imul bx, bx, 0x3b                        
  01b8  8a871040         mov al, byte ptr [bx + 0x4010]           
  01bc  b400             mov ah, 0                                
  01be  3bc6             cmp ax, si                               
  01c0  7fd5             jg 0x197                                 
  01c2  8d46f6           lea ax, [bp - 0xa]                       
  01c5  16               push ss                                  
  01c6  50               push ax                                  
  01c7  8bc7             mov ax, di                               
  01c9  c1e003           shl ax, 3                                
  01cc  05a806           add ax, 0x6a8                            
  01cf  1e               push ds                                  
  01d0  50               push ax                                  
  01d1  b90800           mov cx, 8                                
  01d4  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  01d9  33c0             xor ax, ax                               
  01db  8946f6           mov word ptr [bp - 0xa], ax              
  01de  8946f8           mov word ptr [bp - 8], ax                
  01e1  8bdf             mov bx, di                               
  01e3  c1e302           shl bx, 2                                
  01e6  668b873806       mov eax, dword ptr [bx + 0x638]          
  01eb  668946ea         mov dword ptr [bp - 0x16], eax           
  01ef  83ff02           cmp di, 2                                
  01f2  750c             jne 0x200                                
  01f4  a18c2a           mov ax, word ptr [0x2a8c]                
  01f7  0146f6           add word ptr [bp - 0xa], ax              
  01fa  2946fa           sub word ptr [bp - 6], ax                
  01fd  0146ea           add word ptr [bp - 0x16], ax             
  0200  83ff06           cmp di, 6                                
  0203  7403             je 0x208                                 
  0205  e9e902           jmp 0x4f1                                
  0208  be1c00           mov si, 0x1c                             
  020b  56               push si                                  
  020c  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0211  59               pop cx                                   
  0212  56               push si                                  
  0213  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  0218  59               pop cx                                   
  0219  8bdf             mov bx, di                               
  021b  c1e303           shl bx, 3                                
  021e  ffb7ae06         push word ptr [bx + 0x6ae]               
  0222  8bdf             mov bx, di                               
  0224  c1e303           shl bx, 3                                
  0227  ffb7ac06         push word ptr [bx + 0x6ac]               
  022b  666a00           push 0                                   
  022e  16               push ss                                  
  022f  8d46e2           lea ax, [bp - 0x1e]                      
  0232  50               push ax                                  
  0233  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0238  83c40c           add sp, 0xc                              
  023b  b8042c           mov ax, 0x2c04                           
  023e  8ec0             mov es, ax                               
  0240  268b1e1001       mov bx, word ptr es:[0x110]              
  0245  d1e3             shl bx, 1                                
  0247  b8042c           mov ax, 0x2c04                           
  024a  8ec0             mov es, ax                               
  024c  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0251  66ff76e4         push dword ptr [bp - 0x1c]               
  0255  ff76e2           push word ptr [bp - 0x1e]                
  0258  1e               push ds                                  
  0259  689358           push 0x5893                              
  025c  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0261  83c40c           add sp, 0xc                              
  0264  b8042c           mov ax, 0x2c04                           
  0267  8ec0             mov es, ax                               
  0269  268b1e1001       mov bx, word ptr es:[0x110]              
  026e  d1e3             shl bx, 1                                
  0270  b8042c           mov ax, 0x2c04                           
  0273  8ec0             mov es, ax                               
  0275  26ffb7b000       push word ptr es:[bx + 0xb0]             
  027a  ff76e6           push word ptr [bp - 0x1a]                
  027d  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0280  0346e8           add ax, word ptr [bp - 0x18]             
  0283  48               dec ax                                   
  0284  50               push ax                                  
  0285  ff76e2           push word ptr [bp - 0x1e]                
  0288  1e               push ds                                  
  0289  689358           push 0x5893                              
  028c  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0291  83c40c           add sp, 0xc                              
  0294  b8042c           mov ax, 0x2c04                           
  0297  8ec0             mov es, ax                               
  0299  268b1e1001       mov bx, word ptr es:[0x110]              
  029e  d1e3             shl bx, 1                                
  02a0  b8042c           mov ax, 0x2c04                           
  02a3  8ec0             mov es, ax                               
  02a5  26ffb7b000       push word ptr es:[bx + 0xb0]             
  02aa  ff76e8           push word ptr [bp - 0x18]                
  02ad  66ff76e2         push dword ptr [bp - 0x1e]               
  02b1  1e               push ds                                  
  02b2  689358           push 0x5893                              
  02b5  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  02ba  83c40c           add sp, 0xc                              
  02bd  b8042c           mov ax, 0x2c04                           
  02c0  8ec0             mov es, ax                               
  02c2  268b1e1001       mov bx, word ptr es:[0x110]              
  02c7  d1e3             shl bx, 1                                
  02c9  b8042c           mov ax, 0x2c04                           
  02cc  8ec0             mov es, ax                               
  02ce  26ffb7b000       push word ptr es:[bx + 0xb0]             
  02d3  ff76e8           push word ptr [bp - 0x18]                
  02d6  ff76e4           push word ptr [bp - 0x1c]                
  02d9  8b46e2           mov ax, word ptr [bp - 0x1e]             
  02dc  0346e6           add ax, word ptr [bp - 0x1a]             
  02df  48               dec ax                                   
  02e0  50               push ax                                  
  02e1  1e               push ds                                  
  02e2  689358           push 0x5893                              
  02e5  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  02ea  83c40c           add sp, 0xc                              
  02ed  8346e20a         add word ptr [bp - 0x1e], 0xa            
  02f1  8346e40a         add word ptr [bp - 0x1c], 0xa            
  02f5  836ee614         sub word ptr [bp - 0x1a], 0x14           
  02f9  836ee814         sub word ptr [bp - 0x18], 0x14           
  02fd  b8042c           mov ax, 0x2c04                           
  0300  8ec0             mov es, ax                               
  0302  268b1e1001       mov bx, word ptr es:[0x110]              
  0307  d1e3             shl bx, 1                                
  0309  b8042c           mov ax, 0x2c04                           
  030c  8ec0             mov es, ax                               
  030e  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0313  66ff76e4         push dword ptr [bp - 0x1c]               
  0317  ff76e2           push word ptr [bp - 0x1e]                
  031a  1e               push ds                                  
  031b  689358           push 0x5893                              
  031e  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0323  83c40c           add sp, 0xc                              
  0326  b8042c           mov ax, 0x2c04                           
  0329  8ec0             mov es, ax                               
  032b  268b1e1001       mov bx, word ptr es:[0x110]              
  0330  d1e3             shl bx, 1                                
  0332  b8042c           mov ax, 0x2c04                           
  0335  8ec0             mov es, ax                               
  0337  26ffb7b000       push word ptr es:[bx + 0xb0]             
  033c  ff76e6           push word ptr [bp - 0x1a]                
  033f  8b46e4           mov ax, word ptr [bp - 0x1c]             
  0342  0346e8           add ax, word ptr [bp - 0x18]             
  0345  48               dec ax                                   
  0346  50               push ax                                  
  0347  ff76e2           push word ptr [bp - 0x1e]                
  034a  1e               push ds                                  
  034b  689358           push 0x5893                              
  034e  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0353  83c40c           add sp, 0xc                              
  0356  b8042c           mov ax, 0x2c04                           
  0359  8ec0             mov es, ax                               
  035b  268b1e1001       mov bx, word ptr es:[0x110]              
  0360  d1e3             shl bx, 1                                
  0362  b8042c           mov ax, 0x2c04                           
  0365  8ec0             mov es, ax                               
  0367  26ffb7b000       push word ptr es:[bx + 0xb0]             
  036c  ff76e8           push word ptr [bp - 0x18]                
  036f  66ff76e2         push dword ptr [bp - 0x1e]               
  0373  1e               push ds                                  
  0374  689358           push 0x5893                              
  0377  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  037c  83c40c           add sp, 0xc                              
  037f  b8042c           mov ax, 0x2c04                           
  0382  8ec0             mov es, ax                               
  0384  268b1e1001       mov bx, word ptr es:[0x110]              
  0389  d1e3             shl bx, 1                                
  038b  b8042c           mov ax, 0x2c04                           
  038e  8ec0             mov es, ax                               
  0390  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0395  ff76e8           push word ptr [bp - 0x18]                
  0398  ff76e4           push word ptr [bp - 0x1c]                
  039b  8b46e2           mov ax, word ptr [bp - 0x1e]             
  039e  0346e6           add ax, word ptr [bp - 0x1a]             
  03a1  48               dec ax                                   
  03a2  50               push ax                                  
  03a3  1e               push ds                                  
  03a4  689358           push 0x5893                              
  03a7  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  03ac  83c40c           add sp, 0xc                              
  03af  6a09             push 9                                   
  03b1  8bdf             mov bx, di                               
  03b3  c1e303           shl bx, 3                                
  03b6  8b87ac06         mov ax, word ptr [bx + 0x6ac]            
  03ba  05feff           add ax, 0xfffe                           
  03bd  50               push ax                                  
  03be  666801000100     push 0x10001                             
  03c4  16               push ss                                  
  03c5  8d46e2           lea ax, [bp - 0x1e]                      
  03c8  50               push ax                                  
  03c9  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  03ce  83c40c           add sp, 0xc                              
  03d1  b8042c           mov ax, 0x2c04                           
  03d4  8ec0             mov es, ax                               
  03d6  268b1e1001       mov bx, word ptr es:[0x110]              
  03db  d1e3             shl bx, 1                                
  03dd  b8042c           mov ax, 0x2c04                           
  03e0  8ec0             mov es, ax                               
  03e2  26ffb7a000       push word ptr es:[bx + 0xa0]             
  03e7  16               push ss                                  
  03e8  8d46e2           lea ax, [bp - 0x1e]                      
  03eb  50               push ax                                  
  03ec  1e               push ds                                  
  03ed  689358           push 0x5893                              
  03f0  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  03f5  83c40a           add sp, 0xa                              
  03f8  8bdf             mov bx, di                               
  03fa  c1e303           shl bx, 3                                
  03fd  8b87ae06         mov ax, word ptr [bx + 0x6ae]            
  0401  05feff           add ax, 0xfffe                           
  0404  50               push ax                                  
  0405  666801000900     push 0x90001                             
  040b  6a01             push 1                                   
  040d  16               push ss                                  
  040e  8d46e2           lea ax, [bp - 0x1e]                      
  0411  50               push ax                                  
  0412  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0417  83c40c           add sp, 0xc                              
  041a  b8042c           mov ax, 0x2c04                           
  041d  8ec0             mov es, ax                               
  041f  268b1e1001       mov bx, word ptr es:[0x110]              
  0424  d1e3             shl bx, 1                                
  0426  b8042c           mov ax, 0x2c04                           
  0429  8ec0             mov es, ax                               
  042b  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0430  16               push ss                                  
  0431  8d46e2           lea ax, [bp - 0x1e]                      
  0434  50               push ax                                  
  0435  1e               push ds                                  
  0436  689358           push 0x5893                              
  0439  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  043e  83c40a           add sp, 0xa                              
  0441  6a09             push 9                                   
  0443  8bdf             mov bx, di                               
  0445  c1e303           shl bx, 3                                
  0448  8b87ac06         mov ax, word ptr [bx + 0x6ac]            
  044c  05feff           add ax, 0xfffe                           
  044f  50               push ax                                  
  0450  8bdf             mov bx, di                               
  0452  c1e303           shl bx, 3                                
  0455  8b87ae06         mov ax, word ptr [bx + 0x6ae]            
  0459  05f6ff           add ax, 0xfff6                           
  045c  50               push ax                                  
  045d  6a01             push 1                                   
  045f  16               push ss                                  
  0460  8d46e2           lea ax, [bp - 0x1e]                      
  0463  50               push ax                                  
  0464  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0469  83c40c           add sp, 0xc                              
  046c  b8042c           mov ax, 0x2c04                           
  046f  8ec0             mov es, ax                               
  0471  268b1e1001       mov bx, word ptr es:[0x110]              
  0476  d1e3             shl bx, 1                                
  0478  b8042c           mov ax, 0x2c04                           
  047b  8ec0             mov es, ax                               
  047d  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0482  16               push ss                                  
  0483  8d46e2           lea ax, [bp - 0x1e]                      
  0486  50               push ax                                  
  0487  1e               push ds                                  
  0488  689358           push 0x5893                              
  048b  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  0490  83c40a           add sp, 0xa                              
  0493  8bdf             mov bx, di                               
  0495  c1e303           shl bx, 3                                
  0498  8b87ae06         mov ax, word ptr [bx + 0x6ae]            
  049c  05feff           add ax, 0xfffe                           
  049f  50               push ax                                  
  04a0  666801000900     push 0x90001                             
  04a6  8bdf             mov bx, di                               
  04a8  c1e303           shl bx, 3                                
  04ab  8b87ac06         mov ax, word ptr [bx + 0x6ac]            
  04af  05f6ff           add ax, 0xfff6                           
  04b2  50               push ax                                  
  04b3  16               push ss                                  
  04b4  8d46e2           lea ax, [bp - 0x1e]                      
  04b7  50               push ax                                  
  04b8  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  04bd  83c40c           add sp, 0xc                              
  04c0  b8042c           mov ax, 0x2c04                           
  04c3  8ec0             mov es, ax                               
  04c5  268b1e1001       mov bx, word ptr es:[0x110]              
  04ca  d1e3             shl bx, 1                                
  04cc  b8042c           mov ax, 0x2c04                           
  04cf  8ec0             mov es, ax                               
  04d1  26ffb7a000       push word ptr es:[bx + 0xa0]             
  04d6  16               push ss                                  
  04d7  8d46e2           lea ax, [bp - 0x1e]                      
  04da  50               push ax                                  
  04db  1e               push ds                                  
  04dc  689358           push 0x5893                              
  04df  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  04e4  83c40a           add sp, 0xa                              
  04e7  56               push si                                  
  04e8  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  04ed  59               pop cx                                   
  04ee  e9ab00           jmp 0x59c                                
  04f1  83ff08           cmp di, 8                                
  04f4  750b             jne 0x501                                
  04f6  66833edd4100     cmp dword ptr [0x41dd], 0                
  04fc  7403             je 0x501                                 
  04fe  e99800           jmp 0x599                                
  0501  83ff07           cmp di, 7                                
  0504  7506             jne 0x50c                                
  0506  be2000           mov si, 0x20                             
  0509  e99000           jmp 0x59c                                
  050c  83ff09           cmp di, 9                                
  050f  7506             jne 0x517                                
  0511  be2c00           mov si, 0x2c                             
  0514  e98500           jmp 0x59c                                
  0517  83ff0d           cmp di, 0xd                              
  051a  7505             jne 0x521                                
  051c  be4500           mov si, 0x45                             
  051f  eb7b             jmp 0x59c                                
  0521  83ff17           cmp di, 0x17                             
  0524  7505             jne 0x52b                                
  0526  be4600           mov si, 0x46                             
  0529  eb71             jmp 0x59c                                
  052b  83ff10           cmp di, 0x10                             
  052e  7505             jne 0x535                                
  0530  be3800           mov si, 0x38                             
  0533  eb67             jmp 0x59c                                
  0535  83ff11           cmp di, 0x11                             
  0538  7505             jne 0x53f                                
  053a  be3900           mov si, 0x39                             
  053d  eb5d             jmp 0x59c                                
  053f  83ff12           cmp di, 0x12                             
  0542  7505             jne 0x549                                
  0544  be3a00           mov si, 0x3a                             
  0547  eb53             jmp 0x59c                                
  0549  83ff13           cmp di, 0x13                             
  054c  7505             jne 0x553                                
  054e  be3b00           mov si, 0x3b                             
  0551  eb49             jmp 0x59c                                
  0553  83ff14           cmp di, 0x14                             
  0556  7505             jne 0x55d                                
  0558  be0c00           mov si, 0xc                              
  055b  eb3f             jmp 0x59c                                
  055d  83ff15           cmp di, 0x15                             
  0560  7505             jne 0x567                                
  0562  be0e00           mov si, 0xe                              
  0565  eb35             jmp 0x59c                                
  0567  83ff16           cmp di, 0x16                             
  056a  7505             jne 0x571                                
  056c  be0d00           mov si, 0xd                              
  056f  eb2b             jmp 0x59c                                
  0571  83ff18           cmp di, 0x18                             
  0574  7505             jne 0x57b                                
  0576  be4000           mov si, 0x40                             
  0579  eb21             jmp 0x59c                                
  057b  83ff19           cmp di, 0x19                             
  057e  7505             jne 0x585                                
  0580  be4100           mov si, 0x41                             
  0583  eb17             jmp 0x59c                                
  0585  83ff1a           cmp di, 0x1a                             
  0588  7505             jne 0x58f                                
  058a  be4200           mov si, 0x42                             
  058d  eb0d             jmp 0x59c                                
  058f  83ff1b           cmp di, 0x1b                             
  0592  7505             jne 0x599                                
  0594  be4300           mov si, 0x43                             
  0597  eb03             jmp 0x59c                                
  0599  be1900           mov si, 0x19                             
  059c  83ff0d           cmp di, 0xd                              
  059f  7405             je 0x5a6                                 
  05a1  83ff17           cmp di, 0x17                             
  05a4  751d             jne 0x5c3                                
  05a6  66ff76ea         push dword ptr [bp - 0x16]               
  05aa  8d46f6           lea ax, [bp - 0xa]                       
  05ad  8cd2             mov dx, ss                               
  05af  b90800           mov cx, 8                                
  05b2  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  05b7  56               push si                                  
  05b8  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  05bd  83c40e           add sp, 0xe                              
  05c0  e9ba00           jmp 0x67d                                
  05c3  66ff76ea         push dword ptr [bp - 0x16]               
  05c7  8d46f6           lea ax, [bp - 0xa]                       
  05ca  8cd2             mov dx, ss                               
  05cc  b90800           mov cx, 8                                
  05cf  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  05d4  56               push si                                  
  05d5  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  05da  83c40e           add sp, 0xe                              
  05dd  6a00             push 0                                   
  05df  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  05e4  59               pop cx                                   
  05e5  8d46ee           lea ax, [bp - 0x12]                      
  05e8  16               push ss                                  
  05e9  50               push ax                                  
  05ea  8bc7             mov ax, di                               
  05ec  c1e003           shl ax, 3                                
  05ef  05a806           add ax, 0x6a8                            
  05f2  1e               push ds                                  
  05f3  50               push ax                                  
  05f4  b90800           mov cx, 8                                
  05f7  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  05fc  ff4eee           dec word ptr [bp - 0x12]                 
  05ff  ff4ef0           dec word ptr [bp - 0x10]                 
  0602  8346f202         add word ptr [bp - 0xe], 2               
  0606  8346f402         add word ptr [bp - 0xc], 2               
  060a  16               push ss                                  
  060b  8d46ee           lea ax, [bp - 0x12]                      
  060e  50               push ax                                  
  060f  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0614  83c404           add sp, 4                                
  0617  ff76f2           push word ptr [bp - 0xe]                 
  061a  8b46f0           mov ax, word ptr [bp - 0x10]             
  061d  0346f4           add ax, word ptr [bp - 0xc]              
  0620  50               push ax                                  
  0621  8b46ee           mov ax, word ptr [bp - 0x12]             
  0624  050200           add ax, 2                                
  0627  50               push ax                                  
  0628  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  062d  83c406           add sp, 6                                
  0630  ff76f2           push word ptr [bp - 0xe]                 
  0633  8b46f0           mov ax, word ptr [bp - 0x10]             
  0636  0346f4           add ax, word ptr [bp - 0xc]              
  0639  40               inc ax                                   
  063a  50               push ax                                  
  063b  8b46ee           mov ax, word ptr [bp - 0x12]             
  063e  050200           add ax, 2                                
  0641  50               push ax                                  
  0642  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0647  83c406           add sp, 6                                
  064a  ff76f4           push word ptr [bp - 0xc]                 
  064d  8b46f0           mov ax, word ptr [bp - 0x10]             
  0650  050200           add ax, 2                                
  0653  50               push ax                                  
  0654  8b46ee           mov ax, word ptr [bp - 0x12]             
  0657  0346f2           add ax, word ptr [bp - 0xe]              
  065a  50               push ax                                  
  065b  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0660  83c406           add sp, 6                                
  0663  ff76f4           push word ptr [bp - 0xc]                 
  0666  8b46f0           mov ax, word ptr [bp - 0x10]             
  0669  050200           add ax, 2                                
  066c  50               push ax                                  
  066d  8b46ee           mov ax, word ptr [bp - 0x12]             
  0670  0346f2           add ax, word ptr [bp - 0xe]              
  0673  40               inc ax                                   
  0674  50               push ax                                  
  0675  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  067a  83c406           add sp, 6                                
  067d  83ff02           cmp di, 2                                
  0680  7511             jne 0x693                                
  0682  666a00           push 0                                   
  0685  666800000100     push 0x10000                             
  068b  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0690  83c408           add sp, 8                                
  0693  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0698  5f               pop di                                   
  0699  5e               pop si                                   
  069a  c9               leave                                    
  069b  cb               retf                                     

ovl17_069c:  ; ENTRY
  069c  55               push bp                                  
  069d  8bec             mov bp, sp                               
  069f  56               push si                                  
  06a0  833e360600       cmp word ptr [0x636], 0                  
  06a5  7e61             jle 0x708                                
  06a7  8b363606         mov si, word ptr [0x636]                 
  06ab  4e               dec si                                   
  06ac  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  06b1  8bde             mov bx, si                               
  06b3  c1e303           shl bx, 3                                
  06b6  ffb7c63f         push word ptr [bx + 0x3fc6]              
  06ba  8bde             mov bx, si                               
  06bc  c1e303           shl bx, 3                                
  06bf  ffb7c43f         push word ptr [bx + 0x3fc4]              
  06c3  1e               push ds                                  
  06c4  682a34           push 0x342a                              
  06c7  8bde             mov bx, si                               
  06c9  c1e303           shl bx, 3                                
  06cc  ffb7ca3f         push word ptr [bx + 0x3fca]              
  06d0  8bde             mov bx, si                               
  06d2  c1e303           shl bx, 3                                
  06d5  ffb7c83f         push word ptr [bx + 0x3fc8]              
  06d9  666a00           push 0                                   
  06dc  8bc6             mov ax, si                               
  06de  6bc03b           imul ax, ax, 0x3b                        
  06e1  05dc3f           add ax, 0x3fdc                           
  06e4  1e               push ds                                  
  06e5  50               push ax                                  
  06e6  ff1ed469         lcall [0x69d4]                           
  06ea  83c414           add sp, 0x14                             
  06ed  8bc6             mov ax, si                               
  06ef  6bc03b           imul ax, ax, 0x3b                        
  06f2  05dc3f           add ax, 0x3fdc                           
  06f5  1e               push ds                                  
  06f6  50               push ax                                  
  06f7  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  06fc  83c404           add sp, 4                                
  06ff  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0704  ff0e3606         dec word ptr [0x636]                     
  0708  5e               pop si                                   
  0709  5d               pop bp                                   
  070a  cb               retf                                     

ovl17_070b:  ; ENTRY
  070b  55               push bp                                  
  070c  8bec             mov bp, sp                               
  070e  83ec0c           sub sp, 0xc                              
  0711  56               push si                                  
  0712  57               push di                                  
  0713  8b7e06           mov di, word ptr [bp + 6]                
  0716  8b163606         mov dx, word ptr [0x636]                 
  071a  4a               dec dx                                   
  071b  0bd2             or dx, dx                                
  071d  7d03             jge 0x722                                
  071f  e9be00           jmp 0x7e0                                
  0722  8bda             mov bx, dx                               
  0724  d1e3             shl bx, 1                                
  0726  8bb7b23f         mov si, word ptr [bx + 0x3fb2]           
  072a  8bde             mov bx, si                               
  072c  c1e303           shl bx, 3                                
  072f  ffb7ae06         push word ptr [bx + 0x6ae]               
  0733  8bde             mov bx, si                               
  0735  c1e303           shl bx, 3                                
  0738  ffb7ac06         push word ptr [bx + 0x6ac]               
  073c  666a00           push 0                                   
  073f  16               push ss                                  
  0740  8d46f8           lea ax, [bp - 8]                         
  0743  50               push ax                                  
  0744  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0749  83c40c           add sp, 0xc                              
  074c  8bde             mov bx, si                               
  074e  c1e302           shl bx, 2                                
  0751  668b873806       mov eax, dword ptr [bx + 0x638]          
  0756  668946f4         mov dword ptr [bp - 0xc], eax            
  075a  83fe02           cmp si, 2                                
  075d  7405             je 0x764                                 
  075f  83fe0a           cmp si, 0xa                              
  0762  750c             jne 0x770                                
  0764  a18c2a           mov ax, word ptr [0x2a8c]                
  0767  0146f8           add word ptr [bp - 8], ax                
  076a  2946fc           sub word ptr [bp - 4], ax                
  076d  0146f4           add word ptr [bp - 0xc], ax              
  0770  017ef8           add word ptr [bp - 8], di                
  0773  8b460a           mov ax, word ptr [bp + 0xa]              
  0776  8946fc           mov word ptr [bp - 4], ax                
  0779  8b4608           mov ax, word ptr [bp + 8]                
  077c  0146fa           add word ptr [bp - 6], ax                
  077f  8b460c           mov ax, word ptr [bp + 0xc]              
  0782  8946fe           mov word ptr [bp - 2], ax                
  0785  017ef4           add word ptr [bp - 0xc], di              
  0788  8b4608           mov ax, word ptr [bp + 8]                
  078b  0146f6           add word ptr [bp - 0xa], ax              
  078e  83fe06           cmp si, 6                                
  0791  7505             jne 0x798                                
  0793  be1c00           mov si, 0x1c                             
  0796  eb2e             jmp 0x7c6                                
  0798  83fe08           cmp si, 8                                
  079b  7508             jne 0x7a5                                
  079d  66833edd4100     cmp dword ptr [0x41dd], 0                
  07a3  751e             jne 0x7c3                                
  07a5  83fe07           cmp si, 7                                
  07a8  7505             jne 0x7af                                
  07aa  be2000           mov si, 0x20                             
  07ad  eb17             jmp 0x7c6                                
  07af  83fe0d           cmp si, 0xd                              
  07b2  7505             jne 0x7b9                                
  07b4  be4500           mov si, 0x45                             
  07b7  eb0d             jmp 0x7c6                                
  07b9  83fe17           cmp si, 0x17                             
  07bc  7505             jne 0x7c3                                
  07be  be4600           mov si, 0x46                             
  07c1  eb03             jmp 0x7c6                                
  07c3  be1900           mov si, 0x19                             
  07c6  66ff76f4         push dword ptr [bp - 0xc]                
  07ca  8d46f8           lea ax, [bp - 8]                         
  07cd  8cd2             mov dx, ss                               
  07cf  b90800           mov cx, 8                                
  07d2  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  07d7  56               push si                                  
  07d8  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  07dd  83c40e           add sp, 0xe                              
  07e0  5f               pop di                                   
  07e1  5e               pop si                                   
  07e2  c9               leave                                    
  07e3  cb               retf                                     

ovl17_07e4:  ; ENTRY
  07e4  55               push bp                                  
  07e5  8bec             mov bp, sp                               
  07e7  83ec0c           sub sp, 0xc                              
  07ea  56               push si                                  
  07eb  57               push di                                  
  07ec  8b7e06           mov di, word ptr [bp + 6]                
  07ef  8b163606         mov dx, word ptr [0x636]                 
  07f3  4a               dec dx                                   
  07f4  0bd2             or dx, dx                                
  07f6  7d03             jge 0x7fb                                
  07f8  e9c000           jmp 0x8bb                                
  07fb  8bda             mov bx, dx                               
  07fd  d1e3             shl bx, 1                                
  07ff  8bb7b23f         mov si, word ptr [bx + 0x3fb2]           
  0803  8bde             mov bx, si                               
  0805  c1e303           shl bx, 3                                
  0808  ffb7ae06         push word ptr [bx + 0x6ae]               
  080c  8bde             mov bx, si                               
  080e  c1e303           shl bx, 3                                
  0811  ffb7ac06         push word ptr [bx + 0x6ac]               
  0815  666a00           push 0                                   
  0818  16               push ss                                  
  0819  8d46f8           lea ax, [bp - 8]                         
  081c  50               push ax                                  
  081d  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0822  83c40c           add sp, 0xc                              
  0825  8bde             mov bx, si                               
  0827  c1e302           shl bx, 2                                
  082a  668b873806       mov eax, dword ptr [bx + 0x638]          
  082f  668946f4         mov dword ptr [bp - 0xc], eax            
  0833  83fe02           cmp si, 2                                
  0836  7405             je 0x83d                                 
  0838  83fe0a           cmp si, 0xa                              
  083b  750c             jne 0x849                                
  083d  a18c2a           mov ax, word ptr [0x2a8c]                
  0840  0146f8           add word ptr [bp - 8], ax                
  0843  2946fc           sub word ptr [bp - 4], ax                
  0846  0146f4           add word ptr [bp - 0xc], ax              
  0849  017ef8           add word ptr [bp - 8], di                
  084c  8bc7             mov ax, di                               
  084e  03460a           add ax, word ptr [bp + 0xa]              
  0851  2946fc           sub word ptr [bp - 4], ax                
  0854  8b4608           mov ax, word ptr [bp + 8]                
  0857  0146fa           add word ptr [bp - 6], ax                
  085a  03460c           add ax, word ptr [bp + 0xc]              
  085d  2946fe           sub word ptr [bp - 2], ax                
  0860  017ef4           add word ptr [bp - 0xc], di              
  0863  8b4608           mov ax, word ptr [bp + 8]                
  0866  0146f6           add word ptr [bp - 0xa], ax              
  0869  83fe06           cmp si, 6                                
  086c  7505             jne 0x873                                
  086e  be1c00           mov si, 0x1c                             
  0871  eb2e             jmp 0x8a1                                
  0873  83fe08           cmp si, 8                                
  0876  7508             jne 0x880                                
  0878  66833edd4100     cmp dword ptr [0x41dd], 0                
  087e  751e             jne 0x89e                                
  0880  83fe07           cmp si, 7                                
  0883  7505             jne 0x88a                                
  0885  be2000           mov si, 0x20                             
  0888  eb17             jmp 0x8a1                                
  088a  83fe0d           cmp si, 0xd                              
  088d  7505             jne 0x894                                
  088f  be4500           mov si, 0x45                             
  0892  eb0d             jmp 0x8a1                                
  0894  83fe17           cmp si, 0x17                             
  0897  7505             jne 0x89e                                
  0899  be4600           mov si, 0x46                             
  089c  eb03             jmp 0x8a1                                
  089e  be1900           mov si, 0x19                             
  08a1  66ff76f4         push dword ptr [bp - 0xc]                
  08a5  8d46f8           lea ax, [bp - 8]                         
  08a8  8cd2             mov dx, ss                               
  08aa  b90800           mov cx, 8                                
  08ad  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  08b2  56               push si                                  
  08b3  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  08b8  83c40e           add sp, 0xe                              
  08bb  5f               pop di                                   
  08bc  5e               pop si                                   
  08bd  c9               leave                                    
  08be  cb               retf                                     

ovl17_08bf:  ; ENTRY
  08bf  55               push bp                                  
  08c0  8bec             mov bp, sp                               
  08c2  a13606           mov ax, word ptr [0x636]                 
  08c5  5d               pop bp                                   
  08c6  cb               retf                                     

ovl17_08c7:  ; ENTRY
  08c7  55               push bp                                  
  08c8  8bec             mov bp, sp                               
  08ca  83ec02           sub sp, 2                                
  08cd  8b163606         mov dx, word ptr [0x636]                 
  08d1  4a               dec dx                                   
  08d2  0bd2             or dx, dx                                
  08d4  7d05             jge 0x8db                                
  08d6  b89001           mov ax, 0x190                            
  08d9  eb19             jmp 0x8f4                                
  08db  8bda             mov bx, dx                               
  08dd  d1e3             shl bx, 1                                
  08df  8b87b23f         mov ax, word ptr [bx + 0x3fb2]           
  08e3  8946fe           mov word ptr [bp - 2], ax                
  08e6  837efe02         cmp word ptr [bp - 2], 2                 
  08ea  7505             jne 0x8f1                                
  08ec  b85000           mov ax, 0x50                             
  08ef  eb03             jmp 0x8f4                                
  08f1  b82000           mov ax, 0x20                             
  08f4  c9               leave                                    
  08f5  cb               retf                                     

ovl17_08f6:  ; ENTRY
  08f6  55               push bp                                  
  08f7  8bec             mov bp, sp                               
  08f9  c45e06           les bx, ptr [bp + 6]                     
  08fc  26c7070000       mov word ptr es:[bx], 0                  
  0901  c45e0a           les bx, ptr [bp + 0xa]                   
  0904  26c7070000       mov word ptr es:[bx], 0                  
  0909  8b163606         mov dx, word ptr [0x636]                 
  090d  4a               dec dx                                   
  090e  0bd2             or dx, dx                                
  0910  7c26             jl 0x938                                 
  0912  8bda             mov bx, dx                               
  0914  d1e3             shl bx, 1                                
  0916  8b97b23f         mov dx, word ptr [bx + 0x3fb2]           
  091a  8bda             mov bx, dx                               
  091c  c1e302           shl bx, 2                                
  091f  8b873806         mov ax, word ptr [bx + 0x638]            
  0923  c45e06           les bx, ptr [bp + 6]                     
  0926  268907           mov word ptr es:[bx], ax                 
  0929  8bda             mov bx, dx                               
  092b  c1e302           shl bx, 2                                
  092e  8b873a06         mov ax, word ptr [bx + 0x63a]            
  0932  c45e0a           les bx, ptr [bp + 0xa]                   
  0935  268907           mov word ptr es:[bx], ax                 
  0938  5d               pop bp                                   
  0939  cb               retf                                     

ovl17_093a:  ; ENTRY
  093a  55               push bp                                  
  093b  8bec             mov bp, sp                               
  093d  83ec02           sub sp, 2                                
  0940  8b163606         mov dx, word ptr [0x636]                 
  0944  4a               dec dx                                   
  0945  0bd2             or dx, dx                                
  0947  7d05             jge 0x94e                                
  0949  b8ffff           mov ax, 0xffff                           
  094c  eb0b             jmp 0x959                                
  094e  8bda             mov bx, dx                               
  0950  d1e3             shl bx, 1                                
  0952  8b87b23f         mov ax, word ptr [bx + 0x3fb2]           
  0956  8946fe           mov word ptr [bp - 2], ax                
  0959  c9               leave                                    
  095a  cb               retf                                     
