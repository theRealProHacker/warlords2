; ovl65 stub 3108 file_off 0x7fff0 size 0x7db

ovl65_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  1e               push ds                                  
  0005  684a2f           push 0x2f4a                              
  0008  9acf091210       lcall 0x1012, 0x9cf                      -> 1012:09cf
  000d  83c404           add sp, 4                                
  0010  666820001300     push 0x130020                            
  0016  1e               push ds                                  
  0017  684a2f           push 0x2f4a                              
  001a  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  001f  83c408           add sp, 8                                
  0022  0bc0             or ax, ax                                
  0024  750c             jne 0x32                                 
  0026  1e               push ds                                  
  0027  68892f           push 0x2f89                               ; "Cannot allocate VBOX saveBM"
  002a  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  002f  83c404           add sp, 4                                
  0032  b8042c           mov ax, 0x2c04                           
  0035  8ec0             mov es, ax                               
  0037  26a17701         mov ax, word ptr es:[0x177]              
  003b  a3d067           mov word ptr [0x67d0], ax                
  003e  b8042c           mov ax, 0x2c04                           
  0041  8ec0             mov es, ax                               
  0043  26a17501         mov ax, word ptr es:[0x175]              
  0047  a3d267           mov word ptr [0x67d2], ax                
  004a  c706d4671200     mov word ptr [0x67d4], 0x12              
  0050  c706d6671300     mov word ptr [0x67d6], 0x13              
  0056  833e852f00       cmp word ptr [0x2f85], 0                 
  005b  7403             je 0x60                                  
  005d  e9fc00           jmp 0x15c                                
  0060  b8042c           mov ax, 0x2c04                           
  0063  8ec0             mov es, ax                               
  0065  268b1e6301       mov bx, word ptr es:[0x163]              
  006a  6bdb14           imul bx, bx, 0x14                        
  006d  b8042c           mov ax, 0x2c04                           
  0070  8ec0             mov es, ax                               
  0072  268b978901       mov dx, word ptr es:[bx + 0x189]         
  0077  b8042c           mov ax, 0x2c04                           
  007a  8ec0             mov es, ax                               
  007c  268b1e6301       mov bx, word ptr es:[0x163]              
  0081  6bdb14           imul bx, bx, 0x14                        
  0084  b8042c           mov ax, 0x2c04                           
  0087  8ec0             mov es, ax                               
  0089  268b8f8b01       mov cx, word ptr es:[bx + 0x18b]         
  008e  33f6             xor si, si                               
  0090  eb73             jmp 0x105                                
  0092  8bde             mov bx, si                               
  0094  d1e3             shl bx, 1                                
  0096  b8042c           mov ax, 0x2c04                           
  0099  8ec0             mov es, ax                               
  009b  268b9f6301       mov bx, word ptr es:[bx + 0x163]         
  00a0  d1e3             shl bx, 1                                
  00a2  b8042c           mov ax, 0x2c04                           
  00a5  8ec0             mov es, ax                               
  00a7  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  00ad  7455             je 0x104                                 
  00af  8bde             mov bx, si                               
  00b1  d1e3             shl bx, 1                                
  00b3  b8042c           mov ax, 0x2c04                           
  00b6  8ec0             mov es, ax                               
  00b8  268b9f6301       mov bx, word ptr es:[bx + 0x163]         
  00bd  d1e3             shl bx, 1                                
  00bf  b8042c           mov ax, 0x2c04                           
  00c2  8ec0             mov es, ax                               
  00c4  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  00ca  7538             jne 0x104                                
  00cc  8bde             mov bx, si                               
  00ce  d1e3             shl bx, 1                                
  00d0  b8042c           mov ax, 0x2c04                           
  00d3  8ec0             mov es, ax                               
  00d5  268b9f6301       mov bx, word ptr es:[bx + 0x163]         
  00da  6bdb14           imul bx, bx, 0x14                        
  00dd  b8042c           mov ax, 0x2c04                           
  00e0  8ec0             mov es, ax                               
  00e2  268b978901       mov dx, word ptr es:[bx + 0x189]         
  00e7  8bde             mov bx, si                               
  00e9  d1e3             shl bx, 1                                
  00eb  b8042c           mov ax, 0x2c04                           
  00ee  8ec0             mov es, ax                               
  00f0  268b9f6301       mov bx, word ptr es:[bx + 0x163]         
  00f5  6bdb14           imul bx, bx, 0x14                        
  00f8  b8042c           mov ax, 0x2c04                           
  00fb  8ec0             mov es, ax                               
  00fd  268b8f8b01       mov cx, word ptr es:[bx + 0x18b]         
  0102  eb06             jmp 0x10a                                
  0104  46               inc si                                   
  0105  83fe08           cmp si, 8                                
  0108  7c88             jl 0x92                                  
  010a  8bc2             mov ax, dx                               
  010c  05fcff           add ax, 0xfffc                           
  010f  7e07             jle 0x118                                
  0111  8bc2             mov ax, dx                               
  0113  05fcff           add ax, 0xfffc                           
  0116  eb02             jmp 0x11a                                
  0118  33c0             xor ax, ax                               
  011a  8bd0             mov dx, ax                               
  011c  8bc1             mov ax, cx                               
  011e  05fcff           add ax, 0xfffc                           
  0121  7e07             jle 0x12a                                
  0123  8bc1             mov ax, cx                               
  0125  05fcff           add ax, 0xfffc                           
  0128  eb02             jmp 0x12c                                
  012a  33c0             xor ax, ax                               
  012c  8bc8             mov cx, ax                               
  012e  83fa67           cmp dx, 0x67                             
  0131  7d04             jge 0x137                                
  0133  8bc2             mov ax, dx                               
  0135  eb03             jmp 0x13a                                
  0137  b86700           mov ax, 0x67                             
  013a  8bd0             mov dx, ax                               
  013c  81f99300         cmp cx, 0x93                             
  0140  7d04             jge 0x146                                
  0142  8bc1             mov ax, cx                               
  0144  eb03             jmp 0x149                                
  0146  b89300           mov ax, 0x93                             
  0149  8bc8             mov cx, ax                               
  014b  c706852f0100     mov word ptr [0x2f85], 1                 
  0151  8916d067         mov word ptr [0x67d0], dx                
  0155  890ed267         mov word ptr [0x67d2], cx                
  0159  e9a000           jmp 0x1fc                                
  015c  c706872f0100     mov word ptr [0x2f87], 1                 
  0162  66833e542f00     cmp dword ptr [0x2f54], 0                
  0168  7435             je 0x19f                                 
  016a  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  0170  752d             jne 0x19f                                
  0172  33f6             xor si, si                               
  0174  eb20             jmp 0x196                                
  0176  8bde             mov bx, si                               
  0178  c1e302           shl bx, 2                                
  017b  66ffb7542f       push dword ptr [bx + 0x2f54]             
  0180  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0185  83c404           add sp, 4                                
  0188  8bde             mov bx, si                               
  018a  c1e302           shl bx, 2                                
  018d  8997662f         mov word ptr [bx + 0x2f66], dx           
  0191  8987642f         mov word ptr [bx + 0x2f64], ax           
  0195  46               inc si                                   
  0196  a07e2f           mov al, byte ptr [0x2f7e]                
  0199  b400             mov ah, 0                                
  019b  3bc6             cmp ax, si                               
  019d  7fd7             jg 0x176                                 
  019f  666a00           push 0                                   
  01a2  1e               push ds                                  
  01a3  684a2f           push 0x2f4a                              
  01a6  666820001300     push 0x130020                            
  01ac  a1d267           mov ax, word ptr [0x67d2]                
  01af  d1e0             shl ax, 1                                
  01b1  051e00           add ax, 0x1e                             
  01b4  50               push ax                                  
  01b5  a1d067           mov ax, word ptr [0x67d0]                
  01b8  d1e0             shl ax, 1                                
  01ba  059001           add ax, 0x190                            
  01bd  25f8ff           and ax, 0xfff8                           
  01c0  50               push ax                                  
  01c1  1e               push ds                                  
  01c2  682a34           push 0x342a                              
  01c5  ff1ed469         lcall [0x69d4]                           
  01c9  83c414           add sp, 0x14                             
  01cc  66833e542f00     cmp dword ptr [0x2f54], 0                
  01d2  7428             je 0x1fc                                 
  01d4  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  01da  7520             jne 0x1fc                                
  01dc  33f6             xor si, si                               
  01de  eb13             jmp 0x1f3                                
  01e0  8bde             mov bx, si                               
  01e2  c1e302           shl bx, 2                                
  01e5  66ffb7542f       push dword ptr [bx + 0x2f54]             
  01ea  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  01ef  83c404           add sp, 4                                
  01f2  46               inc si                                   
  01f3  a07e2f           mov al, byte ptr [0x2f7e]                
  01f6  b400             mov ah, 0                                
  01f8  3bc6             cmp ax, si                               
  01fa  7fe4             jg 0x1e0                                 
  01fc  5e               pop si                                   
  01fd  5d               pop bp                                   
  01fe  cb               retf                                     

ovl65_01ff:  ; ENTRY
  01ff  55               push bp                                  
  0200  8bec             mov bp, sp                               
  0202  833e872f00       cmp word ptr [0x2f87], 0                 
  0207  7504             jne 0x20d                                
  0209  0e               push cs                                  
  020a  e8f3fd           call 0                                   
  020d  1e               push ds                                  
  020e  684a2f           push 0x2f4a                              
  0211  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0216  83c404           add sp, 4                                
  0219  c706852f0000     mov word ptr [0x2f85], 0                 
  021f  c706872f0000     mov word ptr [0x2f87], 0                 
  0225  5d               pop bp                                   
  0226  cb               retf                                     

ovl65_0227:  ; ENTRY
  0227  55               push bp                                  
  0228  8bec             mov bp, sp                               
  022a  83ec0c           sub sp, 0xc                              
  022d  56               push si                                  
  022e  57               push di                                  
  022f  833e872f00       cmp word ptr [0x2f87], 0                 
  0234  7504             jne 0x23a                                
  0236  0e               push cs                                  
  0237  e8c6fd           call 0                                   
  023a  a1d067           mov ax, word ptr [0x67d0]                
  023d  8946fe           mov word ptr [bp - 2], ax                
  0240  a1d267           mov ax, word ptr [0x67d2]                
  0243  8946fc           mov word ptr [bp - 4], ax                
  0246  8b4606           mov ax, word ptr [bp + 6]                
  0249  05fcff           add ax, 0xfffc                           
  024c  7e08             jle 0x256                                
  024e  8b4606           mov ax, word ptr [bp + 6]                
  0251  05fcff           add ax, 0xfffc                           
  0254  eb02             jmp 0x258                                
  0256  33c0             xor ax, ax                               
  0258  8946fa           mov word ptr [bp - 6], ax                
  025b  8b4608           mov ax, word ptr [bp + 8]                
  025e  05fcff           add ax, 0xfffc                           
  0261  7e08             jle 0x26b                                
  0263  8b4608           mov ax, word ptr [bp + 8]                
  0266  05fcff           add ax, 0xfffc                           
  0269  eb02             jmp 0x26d                                
  026b  33c0             xor ax, ax                               
  026d  8946f8           mov word ptr [bp - 8], ax                
  0270  837efa67         cmp word ptr [bp - 6], 0x67              
  0274  7d05             jge 0x27b                                
  0276  8b46fa           mov ax, word ptr [bp - 6]                
  0279  eb03             jmp 0x27e                                
  027b  b86700           mov ax, 0x67                             
  027e  8946fa           mov word ptr [bp - 6], ax                
  0281  817ef89300       cmp word ptr [bp - 8], 0x93              
  0286  7d05             jge 0x28d                                
  0288  8b46f8           mov ax, word ptr [bp - 8]                
  028b  eb03             jmp 0x290                                
  028d  b89300           mov ax, 0x93                             
  0290  8946f8           mov word ptr [bp - 8], ax                
  0293  8b76fe           mov si, word ptr [bp - 2]                
  0296  8b7efc           mov di, word ptr [bp - 4]                
  0299  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  029e  e97802           jmp 0x519                                
  02a1  3b76fa           cmp si, word ptr [bp - 6]                
  02a4  7f18             jg 0x2be                                 
  02a6  8b46fa           mov ax, word ptr [bp - 6]                
  02a9  2bc6             sub ax, si                               
  02ab  3d0800           cmp ax, 8                                
  02ae  7d07             jge 0x2b7                                
  02b0  8b46fa           mov ax, word ptr [bp - 6]                
  02b3  2bc6             sub ax, si                               
  02b5  eb03             jmp 0x2ba                                
  02b7  b80800           mov ax, 8                                
  02ba  03f0             add si, ax                               
  02bc  eb16             jmp 0x2d4                                
  02be  8bc6             mov ax, si                               
  02c0  2b46fa           sub ax, word ptr [bp - 6]                
  02c3  3d0800           cmp ax, 8                                
  02c6  7d07             jge 0x2cf                                
  02c8  8bc6             mov ax, si                               
  02ca  2b46fa           sub ax, word ptr [bp - 6]                
  02cd  eb03             jmp 0x2d2                                
  02cf  b80800           mov ax, 8                                
  02d2  2bf0             sub si, ax                               
  02d4  3b7ef8           cmp di, word ptr [bp - 8]                
  02d7  7f18             jg 0x2f1                                 
  02d9  8b46f8           mov ax, word ptr [bp - 8]                
  02dc  2bc7             sub ax, di                               
  02de  3d0800           cmp ax, 8                                
  02e1  7d07             jge 0x2ea                                
  02e3  8b46f8           mov ax, word ptr [bp - 8]                
  02e6  2bc7             sub ax, di                               
  02e8  eb03             jmp 0x2ed                                
  02ea  b80800           mov ax, 8                                
  02ed  03f8             add di, ax                               
  02ef  eb16             jmp 0x307                                
  02f1  8bc7             mov ax, di                               
  02f3  2b46f8           sub ax, word ptr [bp - 8]                
  02f6  3d0800           cmp ax, 8                                
  02f9  7d07             jge 0x302                                
  02fb  8bc7             mov ax, di                               
  02fd  2b46f8           sub ax, word ptr [bp - 8]                
  0300  eb03             jmp 0x305                                
  0302  b80800           mov ax, 8                                
  0305  2bf8             sub di, ax                               
  0307  66833e542f00     cmp dword ptr [0x2f54], 0                
  030d  743d             je 0x34c                                 
  030f  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  0315  7535             jne 0x34c                                
  0317  c746f60000       mov word ptr [bp - 0xa], 0               
  031c  eb24             jmp 0x342                                
  031e  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0321  c1e302           shl bx, 2                                
  0324  66ffb7542f       push dword ptr [bx + 0x2f54]             
  0329  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  032e  83c404           add sp, 4                                
  0331  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0334  c1e302           shl bx, 2                                
  0337  8997662f         mov word ptr [bx + 0x2f66], dx           
  033b  8987642f         mov word ptr [bx + 0x2f64], ax           
  033f  ff46f6           inc word ptr [bp - 0xa]                  
  0342  a07e2f           mov al, byte ptr [0x2f7e]                
  0345  b400             mov ah, 0                                
  0347  3b46f6           cmp ax, word ptr [bp - 0xa]              
  034a  7fd2             jg 0x31e                                 
  034c  a1d267           mov ax, word ptr [0x67d2]                
  034f  d1e0             shl ax, 1                                
  0351  051e00           add ax, 0x1e                             
  0354  50               push ax                                  
  0355  a1d067           mov ax, word ptr [0x67d0]                
  0358  d1e0             shl ax, 1                                
  035a  059001           add ax, 0x190                            
  035d  25f8ff           and ax, 0xfff8                           
  0360  50               push ax                                  
  0361  1e               push ds                                  
  0362  682a34           push 0x342a                              
  0365  666820001300     push 0x130020                            
  036b  666a00           push 0                                   
  036e  1e               push ds                                  
  036f  684a2f           push 0x2f4a                              
  0372  ff1ed469         lcall [0x69d4]                           
  0376  83c414           add sp, 0x14                             
  0379  66833e542f00     cmp dword ptr [0x2f54], 0                
  037f  742f             je 0x3b0                                 
  0381  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  0387  7527             jne 0x3b0                                
  0389  c746f60000       mov word ptr [bp - 0xa], 0               
  038e  eb16             jmp 0x3a6                                
  0390  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0393  c1e302           shl bx, 2                                
  0396  66ffb7542f       push dword ptr [bx + 0x2f54]             
  039b  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  03a0  83c404           add sp, 4                                
  03a3  ff46f6           inc word ptr [bp - 0xa]                  
  03a6  a07e2f           mov al, byte ptr [0x2f7e]                
  03a9  b400             mov ah, 0                                
  03ab  3b46f6           cmp ax, word ptr [bp - 0xa]              
  03ae  7fe0             jg 0x390                                 
  03b0  66833e542f00     cmp dword ptr [0x2f54], 0                
  03b6  743d             je 0x3f5                                 
  03b8  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  03be  7535             jne 0x3f5                                
  03c0  c746f60000       mov word ptr [bp - 0xa], 0               
  03c5  eb24             jmp 0x3eb                                
  03c7  8b5ef6           mov bx, word ptr [bp - 0xa]              
  03ca  c1e302           shl bx, 2                                
  03cd  66ffb7542f       push dword ptr [bx + 0x2f54]             
  03d2  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  03d7  83c404           add sp, 4                                
  03da  8b5ef6           mov bx, word ptr [bp - 0xa]              
  03dd  c1e302           shl bx, 2                                
  03e0  8997662f         mov word ptr [bx + 0x2f66], dx           
  03e4  8987642f         mov word ptr [bx + 0x2f64], ax           
  03e8  ff46f6           inc word ptr [bp - 0xa]                  
  03eb  a07e2f           mov al, byte ptr [0x2f7e]                
  03ee  b400             mov ah, 0                                
  03f0  3b46f6           cmp ax, word ptr [bp - 0xa]              
  03f3  7fd2             jg 0x3c7                                 
  03f5  666a00           push 0                                   
  03f8  1e               push ds                                  
  03f9  684a2f           push 0x2f4a                              
  03fc  666820001300     push 0x130020                            
  0402  8bc7             mov ax, di                               
  0404  d1e0             shl ax, 1                                
  0406  051e00           add ax, 0x1e                             
  0409  50               push ax                                  
  040a  8bc6             mov ax, si                               
  040c  d1e0             shl ax, 1                                
  040e  059001           add ax, 0x190                            
  0411  25f8ff           and ax, 0xfff8                           
  0414  50               push ax                                  
  0415  1e               push ds                                  
  0416  682a34           push 0x342a                              
  0419  ff1ed469         lcall [0x69d4]                           
  041d  83c414           add sp, 0x14                             
  0420  66833e542f00     cmp dword ptr [0x2f54], 0                
  0426  742f             je 0x457                                 
  0428  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  042e  7527             jne 0x457                                
  0430  c746f60000       mov word ptr [bp - 0xa], 0               
  0435  eb16             jmp 0x44d                                
  0437  8b5ef6           mov bx, word ptr [bp - 0xa]              
  043a  c1e302           shl bx, 2                                
  043d  66ffb7542f       push dword ptr [bx + 0x2f54]             
  0442  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0447  83c404           add sp, 4                                
  044a  ff46f6           inc word ptr [bp - 0xa]                  
  044d  a07e2f           mov al, byte ptr [0x2f7e]                
  0450  b400             mov ah, 0                                
  0452  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0455  7fe0             jg 0x437                                 
  0457  8936d067         mov word ptr [0x67d0], si                
  045b  893ed267         mov word ptr [0x67d2], di                
  045f  8bc6             mov ax, si                               
  0461  d1e0             shl ax, 1                                
  0463  059001           add ax, 0x190                            
  0466  8946f6           mov word ptr [bp - 0xa], ax              
  0469  8bc7             mov ax, di                               
  046b  d1e0             shl ax, 1                                
  046d  051e00           add ax, 0x1e                             
  0470  8946f4           mov word ptr [bp - 0xc], ax              
  0473  6a0f             push 0xf                                 
  0475  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  047a  59               pop cx                                   
  047b  6a12             push 0x12                                
  047d  ff76f4           push word ptr [bp - 0xc]                 
  0480  ff76f6           push word ptr [bp - 0xa]                 
  0483  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0488  83c406           add sp, 6                                
  048b  6a12             push 0x12                                
  048d  8b46f4           mov ax, word ptr [bp - 0xc]              
  0490  40               inc ax                                   
  0491  50               push ax                                  
  0492  ff76f6           push word ptr [bp - 0xa]                 
  0495  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  049a  83c406           add sp, 6                                
  049d  6a12             push 0x12                                
  049f  8b46f4           mov ax, word ptr [bp - 0xc]              
  04a2  051000           add ax, 0x10                             
  04a5  50               push ax                                  
  04a6  ff76f6           push word ptr [bp - 0xa]                 
  04a9  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  04ae  83c406           add sp, 6                                
  04b1  6a12             push 0x12                                
  04b3  8b46f4           mov ax, word ptr [bp - 0xc]              
  04b6  051100           add ax, 0x11                             
  04b9  50               push ax                                  
  04ba  ff76f6           push word ptr [bp - 0xa]                 
  04bd  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  04c2  83c406           add sp, 6                                
  04c5  6a12             push 0x12                                
  04c7  ff76f4           push word ptr [bp - 0xc]                 
  04ca  ff76f6           push word ptr [bp - 0xa]                 
  04cd  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  04d2  83c406           add sp, 6                                
  04d5  6a12             push 0x12                                
  04d7  ff76f4           push word ptr [bp - 0xc]                 
  04da  8b46f6           mov ax, word ptr [bp - 0xa]              
  04dd  40               inc ax                                   
  04de  50               push ax                                  
  04df  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  04e4  83c406           add sp, 6                                
  04e7  6a12             push 0x12                                
  04e9  ff76f4           push word ptr [bp - 0xc]                 
  04ec  8b46f6           mov ax, word ptr [bp - 0xa]              
  04ef  051000           add ax, 0x10                             
  04f2  50               push ax                                  
  04f3  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  04f8  83c406           add sp, 6                                
  04fb  6a12             push 0x12                                
  04fd  ff76f4           push word ptr [bp - 0xc]                 
  0500  8b46f6           mov ax, word ptr [bp - 0xa]              
  0503  051100           add ax, 0x11                             
  0506  50               push ax                                  
  0507  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  050c  83c406           add sp, 6                                
  050f  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  0514  9a0a00680e       lcall 0xe68, 0xa                         -> 0e68:000a
  0519  3b76fa           cmp si, word ptr [bp - 6]                
  051c  7403             je 0x521                                 
  051e  e980fd           jmp 0x2a1                                
  0521  3b7ef8           cmp di, word ptr [bp - 8]                
  0524  7403             je 0x529                                 
  0526  e978fd           jmp 0x2a1                                
  0529  b8042c           mov ax, 0x2c04                           
  052c  8b5606           mov dx, word ptr [bp + 6]                
  052f  8ec0             mov es, ax                               
  0531  2689167d01       mov word ptr es:[0x17d], dx              
  0536  8b5608           mov dx, word ptr [bp + 8]                
  0539  8ec0             mov es, ax                               
  053b  2689167f01       mov word ptr es:[0x17f], dx              
  0540  8b4608           mov ax, word ptr [bp + 8]                
  0543  05fcff           add ax, 0xfffc                           
  0546  7d04             jge 0x54c                                
  0548  33c0             xor ax, ax                               
  054a  eb06             jmp 0x552                                
  054c  8b4608           mov ax, word ptr [bp + 8]                
  054f  05fcff           add ax, 0xfffc                           
  0552  ba042c           mov dx, 0x2c04                           
  0555  8ec2             mov es, dx                               
  0557  26a37501         mov word ptr es:[0x175], ax              
  055b  b8042c           mov ax, 0x2c04                           
  055e  8ec0             mov es, ax                               
  0560  26813e75019300   cmp word ptr es:[0x175], 0x93            
  0567  7e05             jle 0x56e                                
  0569  b89300           mov ax, 0x93                             
  056c  eb09             jmp 0x577                                
  056e  b8042c           mov ax, 0x2c04                           
  0571  8ec0             mov es, ax                               
  0573  26a17501         mov ax, word ptr es:[0x175]              
  0577  ba042c           mov dx, 0x2c04                           
  057a  8ec2             mov es, dx                               
  057c  26a37501         mov word ptr es:[0x175], ax              
  0580  8b4606           mov ax, word ptr [bp + 6]                
  0583  05fcff           add ax, 0xfffc                           
  0586  7d04             jge 0x58c                                
  0588  33c0             xor ax, ax                               
  058a  eb06             jmp 0x592                                
  058c  8b4606           mov ax, word ptr [bp + 6]                
  058f  05fcff           add ax, 0xfffc                           
  0592  ba042c           mov dx, 0x2c04                           
  0595  8ec2             mov es, dx                               
  0597  26a37701         mov word ptr es:[0x177], ax              
  059b  b8042c           mov ax, 0x2c04                           
  059e  8ec0             mov es, ax                               
  05a0  26833e770167     cmp word ptr es:[0x177], 0x67            
  05a6  7e05             jle 0x5ad                                
  05a8  b86700           mov ax, 0x67                             
  05ab  eb09             jmp 0x5b6                                
  05ad  b8042c           mov ax, 0x2c04                           
  05b0  8ec0             mov es, ax                               
  05b2  26a17701         mov ax, word ptr es:[0x177]              
  05b6  ba042c           mov dx, 0x2c04                           
  05b9  8ec2             mov es, dx                               
  05bb  26a37701         mov word ptr es:[0x177], ax              
  05bf  b8042c           mov ax, 0x2c04                           
  05c2  8ec0             mov es, ax                               
  05c4  26a17701         mov ax, word ptr es:[0x177]              
  05c8  050800           add ax, 8                                
  05cb  8ec2             mov es, dx                               
  05cd  26a37b01         mov word ptr es:[0x17b], ax              
  05d1  b8042c           mov ax, 0x2c04                           
  05d4  8ec0             mov es, ax                               
  05d6  26a17501         mov ax, word ptr es:[0x175]              
  05da  050800           add ax, 8                                
  05dd  8ec2             mov es, dx                               
  05df  26a37901         mov word ptr es:[0x179], ax              
  05e3  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  05e8  5f               pop di                                   
  05e9  5e               pop si                                   
  05ea  c9               leave                                    
  05eb  cb               retf                                     

ovl65_05ec:  ; ENTRY
  05ec  55               push bp                                  
  05ed  8bec             mov bp, sp                               
  05ef  56               push si                                  
  05f0  833e872f00       cmp word ptr [0x2f87], 0                 
  05f5  7504             jne 0x5fb                                
  05f7  0e               push cs                                  
  05f8  e805fa           call 0                                   
  05fb  66833e542f00     cmp dword ptr [0x2f54], 0                
  0601  7435             je 0x638                                 
  0603  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  0609  752d             jne 0x638                                
  060b  33f6             xor si, si                               
  060d  eb20             jmp 0x62f                                
  060f  8bde             mov bx, si                               
  0611  c1e302           shl bx, 2                                
  0614  66ffb7542f       push dword ptr [bx + 0x2f54]             
  0619  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  061e  83c404           add sp, 4                                
  0621  8bde             mov bx, si                               
  0623  c1e302           shl bx, 2                                
  0626  8997662f         mov word ptr [bx + 0x2f66], dx           
  062a  8987642f         mov word ptr [bx + 0x2f64], ax           
  062e  46               inc si                                   
  062f  a07e2f           mov al, byte ptr [0x2f7e]                
  0632  b400             mov ah, 0                                
  0634  3bc6             cmp ax, si                               
  0636  7fd7             jg 0x60f                                 
  0638  a1d267           mov ax, word ptr [0x67d2]                
  063b  d1e0             shl ax, 1                                
  063d  051e00           add ax, 0x1e                             
  0640  50               push ax                                  
  0641  a1d067           mov ax, word ptr [0x67d0]                
  0644  d1e0             shl ax, 1                                
  0646  059001           add ax, 0x190                            
  0649  25f8ff           and ax, 0xfff8                           
  064c  50               push ax                                  
  064d  1e               push ds                                  
  064e  682a34           push 0x342a                              
  0651  666820001300     push 0x130020                            
  0657  666a00           push 0                                   
  065a  1e               push ds                                  
  065b  684a2f           push 0x2f4a                              
  065e  ff1ed469         lcall [0x69d4]                           
  0662  83c414           add sp, 0x14                             
  0665  66833e542f00     cmp dword ptr [0x2f54], 0                
  066b  7428             je 0x695                                 
  066d  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  0673  7520             jne 0x695                                
  0675  33f6             xor si, si                               
  0677  eb13             jmp 0x68c                                
  0679  8bde             mov bx, si                               
  067b  c1e302           shl bx, 2                                
  067e  66ffb7542f       push dword ptr [bx + 0x2f54]             
  0683  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0688  83c404           add sp, 4                                
  068b  46               inc si                                   
  068c  a07e2f           mov al, byte ptr [0x2f7e]                
  068f  b400             mov ah, 0                                
  0691  3bc6             cmp ax, si                               
  0693  7fe4             jg 0x679                                 
  0695  5e               pop si                                   
  0696  5d               pop bp                                   
  0697  cb               retf                                     

ovl65_0698:  ; ENTRY
  0698  55               push bp                                  
  0699  8bec             mov bp, sp                               
  069b  56               push si                                  
  069c  57               push di                                  
  069d  833e872f00       cmp word ptr [0x2f87], 0                 
  06a2  7504             jne 0x6a8                                
  06a4  0e               push cs                                  
  06a5  e858f9           call 0                                   
  06a8  66833e542f00     cmp dword ptr [0x2f54], 0                
  06ae  7435             je 0x6e5                                 
  06b0  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  06b6  752d             jne 0x6e5                                
  06b8  33f6             xor si, si                               
  06ba  eb20             jmp 0x6dc                                
  06bc  8bde             mov bx, si                               
  06be  c1e302           shl bx, 2                                
  06c1  66ffb7542f       push dword ptr [bx + 0x2f54]             
  06c6  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  06cb  83c404           add sp, 4                                
  06ce  8bde             mov bx, si                               
  06d0  c1e302           shl bx, 2                                
  06d3  8997662f         mov word ptr [bx + 0x2f66], dx           
  06d7  8987642f         mov word ptr [bx + 0x2f64], ax           
  06db  46               inc si                                   
  06dc  a07e2f           mov al, byte ptr [0x2f7e]                
  06df  b400             mov ah, 0                                
  06e1  3bc6             cmp ax, si                               
  06e3  7fd7             jg 0x6bc                                 
  06e5  666a00           push 0                                   
  06e8  1e               push ds                                  
  06e9  684a2f           push 0x2f4a                              
  06ec  666820001300     push 0x130020                            
  06f2  a1d267           mov ax, word ptr [0x67d2]                
  06f5  d1e0             shl ax, 1                                
  06f7  051e00           add ax, 0x1e                             
  06fa  50               push ax                                  
  06fb  a1d067           mov ax, word ptr [0x67d0]                
  06fe  d1e0             shl ax, 1                                
  0700  059001           add ax, 0x190                            
  0703  25f8ff           and ax, 0xfff8                           
  0706  50               push ax                                  
  0707  1e               push ds                                  
  0708  682a34           push 0x342a                              
  070b  ff1ed469         lcall [0x69d4]                           
  070f  83c414           add sp, 0x14                             
  0712  66833e542f00     cmp dword ptr [0x2f54], 0                
  0718  7428             je 0x742                                 
  071a  f7067f2f0a00     test word ptr [0x2f7f], 0xa              
  0720  7520             jne 0x742                                
  0722  33f6             xor si, si                               
  0724  eb13             jmp 0x739                                
  0726  8bde             mov bx, si                               
  0728  c1e302           shl bx, 2                                
  072b  66ffb7542f       push dword ptr [bx + 0x2f54]             
  0730  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0735  83c404           add sp, 4                                
  0738  46               inc si                                   
  0739  a07e2f           mov al, byte ptr [0x2f7e]                
  073c  b400             mov ah, 0                                
  073e  3bc6             cmp ax, si                               
  0740  7fe4             jg 0x726                                 
  0742  8b36d067         mov si, word ptr [0x67d0]                
  0746  d1e6             shl si, 1                                
  0748  81c69001         add si, 0x190                            
  074c  8b3ed267         mov di, word ptr [0x67d2]                
  0750  d1e7             shl di, 1                                
  0752  83c71e           add di, 0x1e                             
  0755  6a0f             push 0xf                                 
  0757  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  075c  59               pop cx                                   
  075d  6a12             push 0x12                                
  075f  57               push di                                  
  0760  56               push si                                  
  0761  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0766  83c406           add sp, 6                                
  0769  6a12             push 0x12                                
  076b  8bc7             mov ax, di                               
  076d  40               inc ax                                   
  076e  50               push ax                                  
  076f  56               push si                                  
  0770  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0775  83c406           add sp, 6                                
  0778  6a12             push 0x12                                
  077a  8bc7             mov ax, di                               
  077c  051000           add ax, 0x10                             
  077f  50               push ax                                  
  0780  56               push si                                  
  0781  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0786  83c406           add sp, 6                                
  0789  6a12             push 0x12                                
  078b  8bc7             mov ax, di                               
  078d  051100           add ax, 0x11                             
  0790  50               push ax                                  
  0791  56               push si                                  
  0792  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0797  83c406           add sp, 6                                
  079a  6a12             push 0x12                                
  079c  57               push di                                  
  079d  56               push si                                  
  079e  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07a3  83c406           add sp, 6                                
  07a6  6a12             push 0x12                                
  07a8  57               push di                                  
  07a9  8bc6             mov ax, si                               
  07ab  40               inc ax                                   
  07ac  50               push ax                                  
  07ad  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07b2  83c406           add sp, 6                                
  07b5  6a12             push 0x12                                
  07b7  57               push di                                  
  07b8  8bc6             mov ax, si                               
  07ba  051000           add ax, 0x10                             
  07bd  50               push ax                                  
  07be  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07c3  83c406           add sp, 6                                
  07c6  6a12             push 0x12                                
  07c8  57               push di                                  
  07c9  8bc6             mov ax, si                               
  07cb  051100           add ax, 0x11                             
  07ce  50               push ax                                  
  07cf  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07d4  83c406           add sp, 6                                
  07d7  5f               pop di                                   
  07d8  5e               pop si                                   
  07d9  5d               pop bp                                   
  07da  cb               retf                                     
