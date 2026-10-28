; res_0b62 file_off 0xd620

res_0b62_0005:  ; ENTRY
  0005  55               push bp                                  
  0006  8bec             mov bp, sp                               
  0008  c45e06           les bx, ptr [bp + 6]                     
  000b  268a4708         mov al, byte ptr es:[bx + 8]             
  000f  02460a           add al, byte ptr [bp + 0xa]              
  0012  26884708         mov byte ptr es:[bx + 8], al             
  0016  26807f0809       cmp byte ptr es:[bx + 8], 9              
  001b  7e05             jle 0x22                                 
  001d  26c6470809       mov byte ptr es:[bx + 8], 9              
  0022  5d               pop bp                                   
  0023  cb               retf                                     

res_0b62_0024:  ; ENTRY
  0024  55               push bp                                  
  0025  8bec             mov bp, sp                               
  0027  8b5606           mov dx, word ptr [bp + 6]                
  002a  83fa0f           cmp dx, 0xf                              
  002d  7508             jne 0x37                                 
  002f  ba042c           mov dx, 0x2c04                           
  0032  b8f306           mov ax, 0x6f3                            
  0035  eb0b             jmp 0x42                                 
  0037  8bc2             mov ax, dx                               
  0039  6bc01d           imul ax, ax, 0x1d                        
  003c  ba042c           mov dx, 0x2c04                           
  003f  050b06           add ax, 0x60b                            
  0042  5d               pop bp                                   
  0043  cb               retf                                     

res_0b62_0044:  ; ENTRY
  0044  55               push bp                                  
  0045  8bec             mov bp, sp                               
  0047  b8042c           mov ax, 0x2c04                           
  004a  8ec0             mov es, ax                               
  004c  268b0e8101       mov cx, word ptr es:[0x181]              
  0051  eb1f             jmp 0x72                                 
  0053  8bc1             mov ax, cx                               
  0055  6bc016           imul ax, ax, 0x16                        
  0058  ba1d1e           mov dx, 0x1e1d                           
  005b  bb0000           mov bx, 0                                
  005e  81c38088         add bx, 0x8880                           
  0062  03c3             add ax, bx                               
  0064  3b5608           cmp dx, word ptr [bp + 8]                
  0067  7509             jne 0x72                                 
  0069  3b4606           cmp ax, word ptr [bp + 6]                
  006c  7504             jne 0x72                                 
  006e  8bc1             mov ax, cx                               
  0070  eb09             jmp 0x7b                                 
  0072  8bc1             mov ax, cx                               
  0074  49               dec cx                                   
  0075  0bc0             or ax, ax                                
  0077  75da             jne 0x53                                 
  0079  33c0             xor ax, ax                               
  007b  5d               pop bp                                   
  007c  cb               retf                                     

res_0b62_007d:  ; ENTRY
  007d  55               push bp                                  
  007e  8bec             mov bp, sp                               
  0080  83ec04           sub sp, 4                                
  0083  56               push si                                  
  0084  57               push di                                  
  0085  66c746fc00000000 mov dword ptr [bp - 4], 0                
  008d  33ff             xor di, di                               
  008f  c45e0a           les bx, ptr [bp + 0xa]                   
  0092  26c7070000       mov word ptr es:[bx], 0                  
  0097  ba0800           mov dx, 8                                
  009a  eb11             jmp 0xad                                 
  009c  8bda             mov bx, dx                               
  009e  c1e302           shl bx, 2                                
  00a1  c787205e0000     mov word ptr [bx + 0x5e20], 0            
  00a7  c7871e5e0000     mov word ptr [bx + 0x5e1e], 0            
  00ad  8bc2             mov ax, dx                               
  00af  4a               dec dx                                   
  00b0  0bc0             or ax, ax                                
  00b2  75e8             jne 0x9c                                 
  00b4  b8042c           mov ax, 0x2c04                           
  00b7  8ec0             mov es, ax                               
  00b9  268b0e8101       mov cx, word ptr es:[0x181]              
  00be  e9d200           jmp 0x193                                
  00c1  8bd9             mov bx, cx                               
  00c3  6bdb16           imul bx, bx, 0x16                        
  00c6  b81d1e           mov ax, 0x1e1d                           
  00c9  8ec0             mov es, ax                               
  00cb  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  00d0  3b4606           cmp ax, word ptr [bp + 6]                
  00d3  7403             je 0xd8                                  
  00d5  e9bb00           jmp 0x193                                
  00d8  8bd9             mov bx, cx                               
  00da  6bdb16           imul bx, bx, 0x16                        
  00dd  b81d1e           mov ax, 0x1e1d                           
  00e0  8ec0             mov es, ax                               
  00e2  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  00e7  3b4608           cmp ax, word ptr [bp + 8]                
  00ea  7403             je 0xef                                  
  00ec  e9a400           jmp 0x193                                
  00ef  c45e0a           les bx, ptr [bp + 0xa]                   
  00f2  26833f08         cmp word ptr es:[bx], 8                  
  00f6  7c03             jl 0xfb                                  
  00f8  e99800           jmp 0x193                                
  00fb  8bc1             mov ax, cx                               
  00fd  6bc016           imul ax, ax, 0x16                        
  0100  ba0000           mov dx, 0                                
  0103  81c28088         add dx, 0x8880                           
  0107  03c2             add ax, dx                               
  0109  c45e0a           les bx, ptr [bp + 0xa]                   
  010c  268b1f           mov bx, word ptr es:[bx]                 
  010f  c1e302           shl bx, 2                                
  0112  c787205e1d1e     mov word ptr [bx + 0x5e20], 0x1e1d       
  0118  89871e5e         mov word ptr [bx + 0x5e1e], ax           
  011c  8bd9             mov bx, cx                               
  011e  6bdb16           imul bx, bx, 0x16                        
  0121  b81d1e           mov ax, 0x1e1d                           
  0124  8ec0             mov es, ax                               
  0126  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  012b  98               cwde                                     
  012c  8bf0             mov si, ax                               
  012e  83fe0f           cmp si, 0xf                              
  0131  7503             jne 0x136                                
  0133  be0800           mov si, 8                                
  0136  66837efc00       cmp dword ptr [bp - 4], 0                
  013b  741e             je 0x15b                                 
  013d  c45efc           les bx, ptr [bp - 4]                     
  0140  268a4704         mov al, byte ptr es:[bx + 4]             
  0144  98               cwde                                     
  0145  8bde             mov bx, si                               
  0147  6bdb1d           imul bx, bx, 0x1d                        
  014a  03d8             add bx, ax                               
  014c  b8042c           mov ax, 0x2c04                           
  014f  8ec0             mov es, ax                               
  0151  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  0156  98               cwde                                     
  0157  3bc7             cmp ax, di                               
  0159  7e32             jle 0x18d                                
  015b  8bc1             mov ax, cx                               
  015d  6bc016           imul ax, ax, 0x16                        
  0160  ba0000           mov dx, 0                                
  0163  81c28088         add dx, 0x8880                           
  0167  03c2             add ax, dx                               
  0169  c746fe1d1e       mov word ptr [bp - 2], 0x1e1d            
  016e  8946fc           mov word ptr [bp - 4], ax                
  0171  c45efc           les bx, ptr [bp - 4]                     
  0174  268a4704         mov al, byte ptr es:[bx + 4]             
  0178  98               cwde                                     
  0179  8bde             mov bx, si                               
  017b  6bdb1d           imul bx, bx, 0x1d                        
  017e  03d8             add bx, ax                               
  0180  b8042c           mov ax, 0x2c04                           
  0183  8ec0             mov es, ax                               
  0185  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  018a  98               cwde                                     
  018b  8bf8             mov di, ax                               
  018d  c45e0a           les bx, ptr [bp + 0xa]                   
  0190  26ff07           inc word ptr es:[bx]                     
  0193  8bc1             mov ax, cx                               
  0195  49               dec cx                                   
  0196  0bc0             or ax, ax                                
  0198  7403             je 0x19d                                 
  019a  e924ff           jmp 0xc1                                 
  019d  8b56fe           mov dx, word ptr [bp - 2]                
  01a0  8b46fc           mov ax, word ptr [bp - 4]                
  01a3  5f               pop di                                   
  01a4  5e               pop si                                   
  01a5  c9               leave                                    
  01a6  cb               retf                                     

res_0b62_01a7:  ; ENTRY
  01a7  55               push bp                                  
  01a8  8bec             mov bp, sp                               
  01aa  83ec06           sub sp, 6                                
  01ad  56               push si                                  
  01ae  57               push di                                  
  01af  8b7606           mov si, word ptr [bp + 6]                
  01b2  8b7e08           mov di, word ptr [bp + 8]                
  01b5  66c746fc00000000 mov dword ptr [bp - 4], 0                
  01bd  c746fa0000       mov word ptr [bp - 6], 0                 
  01c2  b8042c           mov ax, 0x2c04                           
  01c5  8ec0             mov es, ax                               
  01c7  268b0e8101       mov cx, word ptr es:[0x181]              
  01cc  eb3b             jmp 0x209                                
  01ce  8bd9             mov bx, cx                               
  01d0  6bdb16           imul bx, bx, 0x16                        
  01d3  b81d1e           mov ax, 0x1e1d                           
  01d6  8ec0             mov es, ax                               
  01d8  2639b78088       cmp word ptr es:[bx - 0x7780], si        
  01dd  752a             jne 0x209                                
  01df  8bd9             mov bx, cx                               
  01e1  6bdb16           imul bx, bx, 0x16                        
  01e4  b81d1e           mov ax, 0x1e1d                           
  01e7  8ec0             mov es, ax                               
  01e9  2639bf8288       cmp word ptr es:[bx - 0x777e], di        
  01ee  7519             jne 0x209                                
  01f0  ff46fa           inc word ptr [bp - 6]                    
  01f3  8bc1             mov ax, cx                               
  01f5  6bc016           imul ax, ax, 0x16                        
  01f8  ba0000           mov dx, 0                                
  01fb  81c28088         add dx, 0x8880                           
  01ff  03c2             add ax, dx                               
  0201  c746fe1d1e       mov word ptr [bp - 2], 0x1e1d            
  0206  8946fc           mov word ptr [bp - 4], ax                
  0209  8bc1             mov ax, cx                               
  020b  49               dec cx                                   
  020c  0bc0             or ax, ax                                
  020e  75be             jne 0x1ce                                
  0210  837efa00         cmp word ptr [bp - 6], 0                 
  0214  752e             jne 0x244                                
  0216  8bdf             mov bx, di                               
  0218  69dbe000         imul bx, bx, 0xe0                        
  021c  8bc6             mov ax, si                               
  021e  d1e0             shl ax, 1                                
  0220  03d8             add bx, ax                               
  0222  b81d1e           mov ax, 0x1e1d                           
  0225  8ec0             mov es, ax                               
  0227  2680a70100ef     and byte ptr es:[bx + 1], 0xef           
  022d  8bdf             mov bx, di                               
  022f  69dbe000         imul bx, bx, 0xe0                        
  0233  8bc6             mov ax, si                               
  0235  d1e0             shl ax, 1                                
  0237  03d8             add bx, ax                               
  0239  b81d1e           mov ax, 0x1e1d                           
  023c  8ec0             mov es, ax                               
  023e  2680a70100df     and byte ptr es:[bx + 1], 0xdf           
  0244  8b56fe           mov dx, word ptr [bp - 2]                
  0247  8b46fc           mov ax, word ptr [bp - 4]                
  024a  5f               pop di                                   
  024b  5e               pop si                                   
  024c  c9               leave                                    
  024d  cb               retf                                     
  024e  55               push bp                                  
  024f  8bec             mov bp, sp                               
  0251  83ec06           sub sp, 6                                
  0254  56               push si                                  
  0255  57               push di                                  
  0256  66c746fa00000000 mov dword ptr [bp - 6], 0                
  025e  33f6             xor si, si                               
  0260  c45e06           les bx, ptr [bp + 6]                     
  0263  268b4702         mov ax, word ptr es:[bx + 2]             
  0267  8946fe           mov word ptr [bp - 2], ax                
  026a  268b3f           mov di, word ptr es:[bx]                 
  026d  b8042c           mov ax, 0x2c04                           
  0270  8ec0             mov es, ax                               
  0272  268b0e8101       mov cx, word ptr es:[0x181]              
  0277  eb3c             jmp 0x2b5                                
  0279  8bd9             mov bx, cx                               
  027b  6bdb16           imul bx, bx, 0x16                        
  027e  b81d1e           mov ax, 0x1e1d                           
  0281  8ec0             mov es, ax                               
  0283  2639bf8088       cmp word ptr es:[bx - 0x7780], di        
  0288  752b             jne 0x2b5                                
  028a  8bd9             mov bx, cx                               
  028c  6bdb16           imul bx, bx, 0x16                        
  028f  b81d1e           mov ax, 0x1e1d                           
  0292  8ec0             mov es, ax                               
  0294  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0299  3b46fe           cmp ax, word ptr [bp - 2]                
  029c  7517             jne 0x2b5                                
  029e  46               inc si                                   
  029f  8bc1             mov ax, cx                               
  02a1  6bc016           imul ax, ax, 0x16                        
  02a4  ba0000           mov dx, 0                                
  02a7  81c28088         add dx, 0x8880                           
  02ab  03c2             add ax, dx                               
  02ad  c746fc1d1e       mov word ptr [bp - 4], 0x1e1d            
  02b2  8946fa           mov word ptr [bp - 6], ax                
  02b5  8bc1             mov ax, cx                               
  02b7  49               dec cx                                   
  02b8  0bc0             or ax, ax                                
  02ba  75bd             jne 0x279                                
  02bc  0bf6             or si, si                                
  02be  7518             jne 0x2d8                                
  02c0  8b5efe           mov bx, word ptr [bp - 2]                
  02c3  69dbe000         imul bx, bx, 0xe0                        
  02c7  8bc7             mov ax, di                               
  02c9  d1e0             shl ax, 1                                
  02cb  03d8             add bx, ax                               
  02cd  b81d1e           mov ax, 0x1e1d                           
  02d0  8ec0             mov es, ax                               
  02d2  2680a70100ef     and byte ptr es:[bx + 1], 0xef           
  02d8  8b56fc           mov dx, word ptr [bp - 4]                
  02db  8b46fa           mov ax, word ptr [bp - 6]                
  02de  5f               pop di                                   
  02df  5e               pop si                                   
  02e0  c9               leave                                    
  02e1  cb               retf                                     

res_0b62_02e2:  ; ENTRY
  02e2  55               push bp                                  
  02e3  8bec             mov bp, sp                               
  02e5  56               push si                                  
  02e6  c45e06           les bx, ptr [bp + 6]                     
  02e9  268b5f02         mov bx, word ptr es:[bx + 2]             
  02ed  69dbe000         imul bx, bx, 0xe0                        
  02f1  8b7606           mov si, word ptr [bp + 6]                
  02f4  268b04           mov ax, word ptr es:[si]                 
  02f7  d1e0             shl ax, 1                                
  02f9  03d8             add bx, ax                               
  02fb  b81d1e           mov ax, 0x1e1d                           
  02fe  8ec0             mov es, ax                               
  0300  26808f010010     or byte ptr es:[bx + 1], 0x10            
  0306  5e               pop si                                   
  0307  5d               pop bp                                   
  0308  cb               retf                                     

res_0b62_0309:  ; ENTRY
  0309  55               push bp                                  
  030a  8bec             mov bp, sp                               
  030c  83ec04           sub sp, 4                                
  030f  66c746fc00000000 mov dword ptr [bp - 4], 0                
  0317  33c9             xor cx, cx                               
  0319  eb2b             jmp 0x346                                
  031b  8bd9             mov bx, cx                               
  031d  6bdb16           imul bx, bx, 0x16                        
  0320  b81d1e           mov ax, 0x1e1d                           
  0323  8ec0             mov es, ax                               
  0325  2680bf8588ff     cmp byte ptr es:[bx - 0x777b], 0xff      
  032b  7518             jne 0x345                                
  032d  8bc1             mov ax, cx                               
  032f  6bc016           imul ax, ax, 0x16                        
  0332  ba0000           mov dx, 0                                
  0335  81c28088         add dx, 0x8880                           
  0339  03c2             add ax, dx                               
  033b  c746fe1d1e       mov word ptr [bp - 2], 0x1e1d            
  0340  8946fc           mov word ptr [bp - 4], ax                
  0343  eb07             jmp 0x34c                                
  0345  41               inc cx                                   
  0346  81f9e803         cmp cx, 0x3e8                            
  034a  7ccf             jl 0x31b                                 
  034c  66837efc00       cmp dword ptr [bp - 4], 0                
  0351  7506             jne 0x359                                
  0353  33d2             xor dx, dx                               
  0355  33c0             xor ax, ax                               
  0357  eb63             jmp 0x3bc                                
  0359  b8042c           mov ax, 0x2c04                           
  035c  8ec0             mov es, ax                               
  035e  26390e8101       cmp word ptr es:[0x181], cx              
  0363  7f0c             jg 0x371                                 
  0365  8bc1             mov ax, cx                               
  0367  40               inc ax                                   
  0368  ba042c           mov dx, 0x2c04                           
  036b  8ec2             mov es, dx                               
  036d  26a38101         mov word ptr es:[0x181], ax              
  0371  c45efc           les bx, ptr [bp - 4]                     
  0374  b8042c           mov ax, 0x2c04                           
  0377  06               push es                                  
  0378  8ec0             mov es, ax                               
  037a  26a01001         mov al, byte ptr es:[0x110]              
  037e  07               pop es                                   
  037f  26884705         mov byte ptr es:[bx + 5], al             
  0383  8e46fe           mov es, word ptr [bp - 2]                
  0386  26c7470c0000     mov word ptr es:[bx + 0xc], 0            
  038c  26834f0c01       or word ptr es:[bx + 0xc], 1             
  0391  2680670f01       and byte ptr es:[bx + 0xf], 1            
  0396  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  039b  26804f0e00       or byte ptr es:[bx + 0xe], 0             
  03a0  26c64710ff       mov byte ptr es:[bx + 0x10], 0xff        
  03a5  26c6471100       mov byte ptr es:[bx + 0x11], 0           
  03aa  26c74712ffff     mov word ptr es:[bx + 0x12], 0xffff      
  03b0  26c74714ffff     mov word ptr es:[bx + 0x14], 0xffff      
  03b6  8b56fe           mov dx, word ptr [bp - 2]                
  03b9  8b46fc           mov ax, word ptr [bp - 4]                
  03bc  c9               leave                                    
  03bd  cb               retf                                     

res_0b62_03be:  ; ENTRY
  03be  55               push bp                                  
  03bf  8bec             mov bp, sp                               
  03c1  c45e06           les bx, ptr [bp + 6]                     
  03c4  26c64704ff       mov byte ptr es:[bx + 4], 0xff           
  03c9  26c64705ff       mov byte ptr es:[bx + 5], 0xff           
  03ce  26c707ffff       mov word ptr es:[bx], 0xffff             
  03d3  26c74702ffff     mov word ptr es:[bx + 2], 0xffff         
  03d9  2680670e8f       and byte ptr es:[bx + 0xe], 0x8f         
  03de  b000             mov al, 0                                
  03e0  2680670f01       and byte ptr es:[bx + 0xf], 1            
  03e5  8bd0             mov dx, ax                               
  03e7  d0e0             shl al, 1                                
  03e9  2608470f         or byte ptr es:[bx + 0xf], al            
  03ed  83e20f           and dx, 0xf                              
  03f0  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  03f5  2608570e         or byte ptr es:[bx + 0xe], dl            
  03f9  26c64710ff       mov byte ptr es:[bx + 0x10], 0xff        
  03fe  26c6470700       mov byte ptr es:[bx + 7], 0              
  0403  5d               pop bp                                   
  0404  cb               retf                                     

res_0b62_0405:  ; ENTRY
  0405  55               push bp                                  
  0406  8bec             mov bp, sp                               
  0408  83ec0e           sub sp, 0xe                              
  040b  56               push si                                  
  040c  57               push di                                  
  040d  c746f80000       mov word ptr [bp - 8], 0                 
  0412  c70678110000     mov word ptr [0x1178], 0                 
  0418  66a1e02b         mov eax, dword ptr [0x2be0]              
  041c  66a3dc2b         mov dword ptr [0x2bdc], eax              
  0420  9a8e00c130       lcall 0x30c1, 0x8e                       -> ovl59:0a7c
  0425  0bc0             or ax, ax                                
  0427  750e             jne 0x437                                
  0429  1e               push ds                                  
  042a  68e02b           push 0x2be0                              
  042d  6a00             push 0                                   
  042f  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  0434  83c406           add sp, 6                                
  0437  16               push ss                                  
  0438  8d46fa           lea ax, [bp - 6]                         
  043b  50               push ax                                  
  043c  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0441  83c404           add sp, 4                                
  0444  8b46fa           mov ax, word ptr [bp - 6]                
  0447  05f0ff           add ax, 0xfff0                           
  044a  bb2800           mov bx, 0x28                             
  044d  99               cdq                                      
  044e  f7fb             idiv bx                                  
  0450  ba042c           mov dx, 0x2c04                           
  0453  8ec2             mov es, dx                               
  0455  268b367701       mov si, word ptr es:[0x177]              
  045a  03f0             add si, ax                               
  045c  8b46fc           mov ax, word ptr [bp - 4]                
  045f  05e2ff           add ax, 0xffe2                           
  0462  99               cdq                                      
  0463  f7fb             idiv bx                                  
  0465  ba042c           mov dx, 0x2c04                           
  0468  8ec2             mov es, dx                               
  046a  268b3e7501       mov di, word ptr es:[0x175]              
  046f  03f8             add di, ax                               
  0471  66833e625e00     cmp dword ptr [0x5e62], 0                
  0477  740f             je 0x488                                 
  0479  c41e625e         les bx, ptr [0x5e62]                     
  047d  263937           cmp word ptr es:[bx], si                 
  0480  7506             jne 0x488                                
  0482  26397f02         cmp word ptr es:[bx + 2], di             
  0486  7405             je 0x48d                                 
  0488  c746f80100       mov word ptr [bp - 8], 1                 
  048d  837ef800         cmp word ptr [bp - 8], 0                 
  0491  7525             jne 0x4b8                                
  0493  66ff36e02b       push dword ptr [0x2be0]                  
  0498  66ff36dc2b       push dword ptr [0x2bdc]                  
  049d  9acd01a908       lcall 0x8a9, 0x1cd                       -> 08a9:01cd
  04a2  83c408           add sp, 8                                
  04a5  0bc0             or ax, ax                                
  04a7  740f             je 0x4b8                                 
  04a9  833e721100       cmp word ptr [0x1172], 0                 
  04ae  7508             jne 0x4b8                                
  04b0  9a25000c31       lcall 0x310c, 0x25                       -> ovl66:0a55
  04b5  e98a01           jmp 0x642                                
  04b8  16               push ss                                  
  04b9  8d46fe           lea ax, [bp - 2]                         
  04bc  50               push ax                                  
  04bd  57               push di                                  
  04be  56               push si                                  
  04bf  0e               push cs                                  
  04c0  e8bafb           call 0x7d                                
  04c3  83c408           add sp, 8                                
  04c6  6a00             push 0                                   
  04c8  ff76fe           push word ptr [bp - 2]                   
  04cb  90               nop                                      
  04cc  0e               push cs                                  
  04cd  e81c05           call 0x9ec                               
  04d0  83c404           add sp, 4                                
  04d3  66a11e5e         mov eax, dword ptr [0x5e1e]              
  04d7  66a3625e         mov dword ptr [0x5e62], eax              
  04db  66ff36625e       push dword ptr [0x5e62]                  
  04e0  9a3e001931       lcall 0x3119, 0x3e                       -> ovl67:06eb
  04e5  83c404           add sp, 4                                
  04e8  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  04ed  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  04f2  b8042c           mov ax, 0x2c04                           
  04f5  8ec0             mov es, ax                               
  04f7  26833e2e0100     cmp word ptr es:[0x12e], 0               
  04fd  7503             jne 0x502                                
  04ff  e94001           jmp 0x642                                
  0502  8ec0             mov es, ax                               
  0504  26a03401         mov al, byte ptr es:[0x134]              
  0508  c1e803           shr ax, 3                                
  050b  250100           and ax, 1                                
  050e  0bc0             or ax, ax                                
  0510  7523             jne 0x535                                
  0512  b8042c           mov ax, 0x2c04                           
  0515  8ec0             mov es, ax                               
  0517  26800e340108     or byte ptr es:[0x134], 8                
  051d  666819000300     push 0x30019                             
  0523  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0528  83c404           add sp, 4                                
  052b  52               push dx                                  
  052c  50               push ax                                  
  052d  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  0532  83c404           add sp, 4                                
  0535  b8042c           mov ax, 0x2c04                           
  0538  8ec0             mov es, ax                               
  053a  26a03401         mov al, byte ptr es:[0x134]              
  053e  c1e804           shr ax, 4                                
  0541  250100           and ax, 1                                
  0544  0bc0             or ax, ax                                
  0546  7403             je 0x54b                                 
  0548  e98400           jmp 0x5cf                                
  054b  33ff             xor di, di                               
  054d  eb7b             jmp 0x5ca                                
  054f  8bdf             mov bx, di                               
  0551  d1e3             shl bx, 1                                
  0553  c436625e         les si, ptr [0x5e62]                     
  0557  268b04           mov ax, word ptr es:[si]                 
  055a  03874c2b         add ax, word ptr [bx + 0x2b4c]           
  055e  8946f6           mov word ptr [bp - 0xa], ax              
  0561  8b1e625e         mov bx, word ptr [0x5e62]                
  0565  268b4702         mov ax, word ptr es:[bx + 2]             
  0569  8bdf             mov bx, di                               
  056b  d1e3             shl bx, 1                                
  056d  03875c2b         add ax, word ptr [bx + 0x2b5c]           
  0571  8946f4           mov word ptr [bp - 0xc], ax              
  0574  50               push ax                                  
  0575  ff76f6           push word ptr [bp - 0xa]                 
  0578  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  057d  83c404           add sp, 4                                
  0580  8946f2           mov word ptr [bp - 0xe], ax              
  0583  0bc0             or ax, ax                                
  0585  7c42             jl 0x5c9                                 
  0587  8b5ef2           mov bx, word ptr [bp - 0xe]              
  058a  6bdb41           imul bx, bx, 0x41                        
  058d  b8042c           mov ax, 0x2c04                           
  0590  8ec0             mov es, ax                               
  0592  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0597  98               cwde                                     
  0598  ba042c           mov dx, 0x2c04                           
  059b  8ec2             mov es, dx                               
  059d  263b061001       cmp ax, word ptr es:[0x110]              
  05a2  7425             je 0x5c9                                 
  05a4  b8042c           mov ax, 0x2c04                           
  05a7  8ec0             mov es, ax                               
  05a9  26800e340110     or byte ptr es:[0x134], 0x10             
  05af  666819000400     push 0x40019                             
  05b5  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  05ba  83c404           add sp, 4                                
  05bd  52               push dx                                  
  05be  50               push ax                                  
  05bf  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  05c4  83c404           add sp, 4                                
  05c7  eb06             jmp 0x5cf                                
  05c9  47               inc di                                   
  05ca  83ff08           cmp di, 8                                
  05cd  7c80             jl 0x54f                                 
  05cf  b8042c           mov ax, 0x2c04                           
  05d2  8ec0             mov es, ax                               
  05d4  26a03401         mov al, byte ptr es:[0x134]              
  05d8  c1e807           shr ax, 7                                
  05db  250100           and ax, 1                                
  05de  0bc0             or ax, ax                                
  05e0  7560             jne 0x642                                
  05e2  c41e625e         les bx, ptr [0x5e62]                     
  05e6  268b5f02         mov bx, word ptr es:[bx + 2]             
  05ea  69dbe000         imul bx, bx, 0xe0                        
  05ee  8b36625e         mov si, word ptr [0x5e62]                
  05f2  268b04           mov ax, word ptr es:[si]                 
  05f5  d1e0             shl ax, 1                                
  05f7  03d8             add bx, ax                               
  05f9  b81d1e           mov ax, 0x1e1d                           
  05fc  8ec0             mov es, ax                               
  05fe  268a9f0000       mov bl, byte ptr es:[bx]                 
  0603  81e3ff00         and bx, 0xff                             
  0607  b8042c           mov ax, 0x2c04                           
  060a  8ec0             mov es, ax                               
  060c  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  0612  752e             jne 0x642                                
  0614  c41e625e         les bx, ptr [0x5e62]                     
  0618  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  061d  7523             jne 0x642                                
  061f  b8042c           mov ax, 0x2c04                           
  0622  8ec0             mov es, ax                               
  0624  26800e340180     or byte ptr es:[0x134], 0x80             
  062a  666819000500     push 0x50019                             
  0630  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0635  83c404           add sp, 4                                
  0638  52               push dx                                  
  0639  50               push ax                                  
  063a  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  063f  83c404           add sp, 4                                
  0642  c70672110100     mov word ptr [0x1172], 1                 
  0648  5f               pop di                                   
  0649  5e               pop si                                   
  064a  c9               leave                                    
  064b  cb               retf                                     
  064c  55               push bp                                  
  064d  8bec             mov bp, sp                               
  064f  83ec04           sub sp, 4                                
  0652  b8042c           mov ax, 0x2c04                           
  0655  8ec0             mov es, ax                               
  0657  268b0e8101       mov cx, word ptr es:[0x181]              
  065c  eb56             jmp 0x6b4                                
  065e  8bc1             mov ax, cx                               
  0660  6bc016           imul ax, ax, 0x16                        
  0663  ba0000           mov dx, 0                                
  0666  81c28088         add dx, 0x8880                           
  066a  03c2             add ax, dx                               
  066c  c746fe1d1e       mov word ptr [bp - 2], 0x1e1d            
  0671  8946fc           mov word ptr [bp - 4], ax                
  0674  c45efc           les bx, ptr [bp - 4]                     
  0677  268b07           mov ax, word ptr es:[bx]                 
  067a  3b4606           cmp ax, word ptr [bp + 6]                
  067d  7535             jne 0x6b4                                
  067f  268b4702         mov ax, word ptr es:[bx + 2]             
  0683  3b4608           cmp ax, word ptr [bp + 8]                
  0686  752c             jne 0x6b4                                
  0688  837e0a64         cmp word ptr [bp + 0xa], 0x64            
  068c  751a             jne 0x6a8                                
  068e  26807f0405       cmp byte ptr es:[bx + 4], 5              
  0693  741f             je 0x6b4                                 
  0695  26807f0408       cmp byte ptr es:[bx + 4], 8              
  069a  7418             je 0x6b4                                 
  069c  26807f0409       cmp byte ptr es:[bx + 4], 9              
  06a1  7411             je 0x6b4                                 
  06a3  b80100           mov ax, 1                                
  06a6  eb15             jmp 0x6bd                                
  06a8  c45efc           les bx, ptr [bp - 4]                     
  06ab  268a4704         mov al, byte ptr es:[bx + 4]             
  06af  3a460a           cmp al, byte ptr [bp + 0xa]              
  06b2  74ef             je 0x6a3                                 
  06b4  8bc1             mov ax, cx                               
  06b6  49               dec cx                                   
  06b7  0bc0             or ax, ax                                
  06b9  75a3             jne 0x65e                                
  06bb  33c0             xor ax, ax                               
  06bd  c9               leave                                    
  06be  cb               retf                                     

res_0b62_06bf:  ; ENTRY
  06bf  55               push bp                                  
  06c0  8bec             mov bp, sp                               
  06c2  83ec32           sub sp, 0x32                             
  06c5  56               push si                                  
  06c6  33f6             xor si, si                               
  06c8  66833e625e00     cmp dword ptr [0x5e62], 0                
  06ce  7503             jne 0x6d3                                
  06d0  e98400           jmp 0x757                                
  06d3  833eda2b00       cmp word ptr [0x2bda], 0                 
  06d8  7510             jne 0x6ea                                
  06da  c41e625e         les bx, ptr [0x5e62]                     
  06de  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  06e3  7523             jne 0x708                                
  06e5  be0100           mov si, 1                                
  06e8  eb1e             jmp 0x708                                
  06ea  33d2             xor dx, dx                               
  06ec  eb14             jmp 0x702                                
  06ee  8bda             mov bx, dx                               
  06f0  c1e302           shl bx, 2                                
  06f3  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  06f7  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  06fc  7503             jne 0x701                                
  06fe  be0100           mov si, 1                                
  0701  42               inc dx                                   
  0702  3b16fe5d         cmp dx, word ptr [0x5dfe]                
  0706  7ce6             jl 0x6ee                                 
  0708  1e               push ds                                  
  0709  68e42b           push 0x2be4                              
  070c  16               push ss                                  
  070d  8d46ce           lea ax, [bp - 0x32]                      
  0710  50               push ax                                  
  0711  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0716  83c408           add sp, 8                                
  0719  0bf6             or si, si                                
  071b  7411             je 0x72e                                 
  071d  1e               push ds                                  
  071e  68e52b           push 0x2be5                               ; "It contains heroes"
  0721  16               push ss                                  
  0722  8d46ce           lea ax, [bp - 0x32]                      
  0725  50               push ax                                  
  0726  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  072b  83c408           add sp, 8                                
  072e  68620b           push 0xb62                               
  0731  685a07           push 0x75a                               
  0734  68620b           push 0xb62                               
  0737  686a07           push 0x76a                               
  073a  16               push ss                                  
  073b  8d46ce           lea ax, [bp - 0x32]                      
  073e  50               push ax                                  
  073f  1e               push ds                                  
  0740  68262c           push 0x2c26                               ; "group?"
  0743  1e               push ds                                  
  0744  68112c           push 0x2c11                               ; "want to disband this"
  0747  1e               push ds                                  
  0748  68002c           push 0x2c00                               ; "Are you sure you"
  074b  1e               push ds                                  
  074c  68f82b           push 0x2bf8                               ; "Disband"
  074f  9a2500a530       lcall 0x30a5, 0x25                       -> ovl56:0088
  0754  83c41c           add sp, 0x1c                             
  0757  5e               pop si                                   
  0758  c9               leave                                    
  0759  cb               retf                                     
  075a  55               push bp                                  
  075b  8bec             mov bp, sp                               
  075d  666a00           push 0                                   
  0760  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  0765  83c404           add sp, 4                                
  0768  5d               pop bp                                   
  0769  cb               retf                                     
  076a  55               push bp                                  
  076b  8bec             mov bp, sp                               
  076d  56               push si                                  
  076e  57               push di                                  
  076f  833eda2b00       cmp word ptr [0x2bda], 0                 
  0774  752e             jne 0x7a4                                
  0776  c41e625e         les bx, ptr [0x5e62]                     
  077a  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  077f  7514             jne 0x795                                
  0781  26ff7702         push word ptr es:[bx + 2]                
  0785  26ff37           push word ptr es:[bx]                    
  0788  ff36645e         push word ptr [0x5e64]                   
  078c  53               push bx                                  
  078d  9a39002430       lcall 0x3024, 0x39                       -> ovl36:16cd
  0792  83c408           add sp, 8                                
  0795  66ff36625e       push dword ptr [0x5e62]                  
  079a  0e               push cs                                  
  079b  e820fc           call 0x3be                               
  079e  83c404           add sp, 4                                
  07a1  e9d900           jmp 0x87d                                
  07a4  33ff             xor di, di                               
  07a6  e9cc00           jmp 0x875                                
  07a9  8bdf             mov bx, di                               
  07ab  c1e302           shl bx, 2                                
  07ae  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  07b2  0b87405e         or ax, word ptr [bx + 0x5e40]            
  07b6  7503             jne 0x7bb                                
  07b8  e9b900           jmp 0x874                                
  07bb  8bdf             mov bx, di                               
  07bd  c1e302           shl bx, 2                                
  07c0  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  07c4  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  07c9  7403             je 0x7ce                                 
  07cb  e99500           jmp 0x863                                
  07ce  8bdf             mov bx, di                               
  07d0  c1e302           shl bx, 2                                
  07d3  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  07d7  26ff7702         push word ptr es:[bx + 2]                
  07db  8bdf             mov bx, di                               
  07dd  c1e302           shl bx, 2                                
  07e0  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  07e4  26ff37           push word ptr es:[bx]                    
  07e7  8bdf             mov bx, di                               
  07e9  c1e302           shl bx, 2                                
  07ec  66ffb73e5e       push dword ptr [bx + 0x5e3e]             
  07f1  9a39002430       lcall 0x3024, 0x39                       -> ovl36:16cd
  07f6  83c408           add sp, 8                                
  07f9  b8042c           mov ax, 0x2c04                           
  07fc  8ec0             mov es, ax                               
  07fe  268b1e1001       mov bx, word ptr es:[0x110]              
  0803  6bdb0c           imul bx, bx, 0xc                         
  0806  b8042c           mov ax, 0x2c04                           
  0809  8ec0             mov es, ax                               
  080b  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  0811  7450             je 0x863                                 
  0813  b8042c           mov ax, 0x2c04                           
  0816  8ec0             mov es, ax                               
  0818  268b1e1001       mov bx, word ptr es:[0x110]              
  081d  6bdb0c           imul bx, bx, 0xc                         
  0820  b8042c           mov ax, 0x2c04                           
  0823  8ec0             mov es, ax                               
  0825  268b870711       mov ax, word ptr es:[bx + 0x1107]        
  082a  6bc016           imul ax, ax, 0x16                        
  082d  ba1d1e           mov dx, 0x1e1d                           
  0830  bb0000           mov bx, 0                                
  0833  03d8             add bx, ax                               
  0835  81c38088         add bx, 0x8880                           
  0839  8bf7             mov si, di                               
  083b  c1e602           shl si, 2                                
  083e  3b94405e         cmp dx, word ptr [si + 0x5e40]           
  0842  751f             jne 0x863                                
  0844  3b9c3e5e         cmp bx, word ptr [si + 0x5e3e]           
  0848  7519             jne 0x863                                
  084a  b8042c           mov ax, 0x2c04                           
  084d  8ec0             mov es, ax                               
  084f  268b1e1001       mov bx, word ptr es:[0x110]              
  0854  6bdb0c           imul bx, bx, 0xc                         
  0857  b8042c           mov ax, 0x2c04                           
  085a  8ec0             mov es, ax                               
  085c  26c78703110000   mov word ptr es:[bx + 0x1103], 0         
  0863  8bdf             mov bx, di                               
  0865  c1e302           shl bx, 2                                
  0868  66ffb73e5e       push dword ptr [bx + 0x5e3e]             
  086d  0e               push cs                                  
  086e  e84dfb           call 0x3be                               
  0871  83c404           add sp, 4                                
  0874  47               inc di                                   
  0875  83ff08           cmp di, 8                                
  0878  7d03             jge 0x87d                                
  087a  e92cff           jmp 0x7a9                                
  087d  66c706625e000000 mov dword ptr [0x5e62], 0                
  0886  66c7065e5e000000 mov dword ptr [0x5e5e], 0                
  088f  c706da2b0000     mov word ptr [0x2bda], 0                 
  0895  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  089a  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  089f  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  08a4  666a00           push 0                                   
  08a7  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  08ac  83c404           add sp, 4                                
  08af  5f               pop di                                   
  08b0  5e               pop si                                   
  08b1  5d               pop bp                                   
  08b2  cb               retf                                     

res_0b62_08b3:  ; ENTRY
  08b3  55               push bp                                  
  08b4  8bec             mov bp, sp                               
  08b6  66833e625e00     cmp dword ptr [0x5e62], 0                
  08bc  7446             je 0x904                                 
  08be  66c706625e000000 mov dword ptr [0x5e62], 0                
  08c7  837e0800         cmp word ptr [bp + 8], 0                 
  08cb  7405             je 0x8d2                                 
  08cd  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  08d2  837e0600         cmp word ptr [bp + 6], 0                 
  08d6  7405             je 0x8dd                                 
  08d8  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  08dd  837e0a00         cmp word ptr [bp + 0xa], 0               
  08e1  b8042c           mov ax, 0x2c04                           
  08e4  8ec0             mov es, ax                               
  08e6  268b1e1001       mov bx, word ptr es:[0x110]              
  08eb  d1e3             shl bx, 1                                
  08ed  b8042c           mov ax, 0x2c04                           
  08f0  8ec0             mov es, ax                               
  08f2  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  08f8  750a             jne 0x904                                
  08fa  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  08ff  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  0904  5d               pop bp                                   
  0905  cb               retf                                     
  0906  55               push bp                                  
  0907  8bec             mov bp, sp                               
  0909  c45e06           les bx, ptr [bp + 6]                     
  090c  26833f00         cmp word ptr es:[bx], 0                  
  0910  750c             jne 0x91e                                
  0912  26837f0200       cmp word ptr es:[bx + 2], 0              
  0917  7505             jne 0x91e                                
  0919  b8ff00           mov ax, 0xff                             
  091c  eb08             jmp 0x926                                
  091e  c45e06           les bx, ptr [bp + 6]                     
  0921  268a4705         mov al, byte ptr es:[bx + 5]             
  0925  98               cwde                                     
  0926  5d               pop bp                                   
  0927  cb               retf                                     
  0928  55               push bp                                  
  0929  8bec             mov bp, sp                               
  092b  83ec02           sub sp, 2                                
  092e  56               push si                                  
  092f  33f6             xor si, si                               
  0931  33c9             xor cx, cx                               
  0933  eb11             jmp 0x946                                
  0935  8bc1             mov ax, cx                               
  0937  d1e0             shl ax, 1                                
  0939  c45e06           les bx, ptr [bp + 6]                     
  093c  03d8             add bx, ax                               
  093e  26833fff         cmp word ptr es:[bx], -1                 
  0942  7401             je 0x945                                 
  0944  46               inc si                                   
  0945  41               inc cx                                   
  0946  83f908           cmp cx, 8                                
  0949  7cea             jl 0x935                                 
  094b  83fe01           cmp si, 1                                
  094e  7e7b             jle 0x9cb                                
  0950  33c9             xor cx, cx                               
  0952  8bc1             mov ax, cx                               
  0954  d1e0             shl ax, 1                                
  0956  c45e06           les bx, ptr [bp + 6]                     
  0959  03d8             add bx, ax                               
  095b  268b1f           mov bx, word ptr es:[bx]                 
  095e  6bdb16           imul bx, bx, 0x16                        
  0961  b81d1e           mov ax, 0x1e1d                           
  0964  8ec0             mov es, ax                               
  0966  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  096b  8bd1             mov dx, cx                               
  096d  42               inc dx                                   
  096e  d1e2             shl dx, 1                                
  0970  c45e06           les bx, ptr [bp + 6]                     
  0973  03da             add bx, dx                               
  0975  268b1f           mov bx, word ptr es:[bx]                 
  0978  6bdb16           imul bx, bx, 0x16                        
  097b  ba1d1e           mov dx, 0x1e1d                           
  097e  8ec2             mov es, dx                               
  0980  263a878488       cmp al, byte ptr es:[bx - 0x777c]        
  0985  7d3c             jge 0x9c3                                
  0987  8bc1             mov ax, cx                               
  0989  d1e0             shl ax, 1                                
  098b  c45e06           les bx, ptr [bp + 6]                     
  098e  03d8             add bx, ax                               
  0990  268b07           mov ax, word ptr es:[bx]                 
  0993  8946fe           mov word ptr [bp - 2], ax                
  0996  8bc1             mov ax, cx                               
  0998  40               inc ax                                   
  0999  d1e0             shl ax, 1                                
  099b  8b5e06           mov bx, word ptr [bp + 6]                
  099e  03d8             add bx, ax                               
  09a0  268b07           mov ax, word ptr es:[bx]                 
  09a3  8bd1             mov dx, cx                               
  09a5  d1e2             shl dx, 1                                
  09a7  8b5e06           mov bx, word ptr [bp + 6]                
  09aa  03da             add bx, dx                               
  09ac  268907           mov word ptr es:[bx], ax                 
  09af  8bc1             mov ax, cx                               
  09b1  40               inc ax                                   
  09b2  d1e0             shl ax, 1                                
  09b4  8b5e06           mov bx, word ptr [bp + 6]                
  09b7  03d8             add bx, ax                               
  09b9  8b46fe           mov ax, word ptr [bp - 2]                
  09bc  268907           mov word ptr es:[bx], ax                 
  09bf  33c9             xor cx, cx                               
  09c1  eb01             jmp 0x9c4                                
  09c3  41               inc cx                                   
  09c4  8bc6             mov ax, si                               
  09c6  48               dec ax                                   
  09c7  3bc1             cmp ax, cx                               
  09c9  7f87             jg 0x952                                 
  09cb  5e               pop si                                   
  09cc  c9               leave                                    
  09cd  cb               retf                                     

res_0b62_09ce:  ; ENTRY
  09ce  55               push bp                                  
  09cf  8bec             mov bp, sp                               
  09d1  833eda2b00       cmp word ptr [0x2bda], 0                 
  09d6  7412             je 0x9ea                                 
  09d8  6a00             push 0                                   
  09da  1e               push ds                                  
  09db  683e5e           push 0x5e3e                              
  09de  ff36fe5d         push word ptr [0x5dfe]                   
  09e2  90               nop                                      
  09e3  0e               push cs                                  
  09e4  e81c00           call 0xa03                               
  09e7  83c408           add sp, 8                                
  09ea  5d               pop bp                                   
  09eb  cb               retf                                     

res_0b62_09ec:  ; ENTRY
  09ec  55               push bp                                  
  09ed  8bec             mov bp, sp                               
  09ef  ff7608           push word ptr [bp + 8]                   
  09f2  1e               push ds                                  
  09f3  681e5e           push 0x5e1e                              
  09f6  ff7606           push word ptr [bp + 6]                   
  09f9  90               nop                                      
  09fa  0e               push cs                                  
  09fb  e80500           call 0xa03                               
  09fe  83c408           add sp, 8                                
  0a01  5d               pop bp                                   
  0a02  cb               retf                                     

res_0b62_0a03:  ; ENTRY
  0a03  55               push bp                                  
  0a04  8bec             mov bp, sp                               
  0a06  83ec16           sub sp, 0x16                             
  0a09  56               push si                                  
  0a0a  57               push di                                  
  0a0b  c746fa0000       mov word ptr [bp - 6], 0                 
  0a10  33c9             xor cx, cx                               
  0a12  eb7e             jmp 0xa92                                
  0a14  8bd9             mov bx, cx                               
  0a16  d1e3             shl bx, 1                                
  0a18  8d46ea           lea ax, [bp - 0x16]                      
  0a1b  03d8             add bx, ax                               
  0a1d  36c7070000       mov word ptr ss:[bx], 0                  
  0a22  33ff             xor di, di                               
  0a24  eb33             jmp 0xa59                                
  0a26  8bc1             mov ax, cx                               
  0a28  c1e002           shl ax, 2                                
  0a2b  c45e08           les bx, ptr [bp + 8]                     
  0a2e  03d8             add bx, ax                               
  0a30  268b4702         mov ax, word ptr es:[bx + 2]             
  0a34  268b17           mov dx, word ptr es:[bx]                 
  0a37  8bdf             mov bx, di                               
  0a39  c1e302           shl bx, 2                                
  0a3c  3b87405e         cmp ax, word ptr [bx + 0x5e40]           
  0a40  7516             jne 0xa58                                
  0a42  3b973e5e         cmp dx, word ptr [bx + 0x5e3e]           
  0a46  7510             jne 0xa58                                
  0a48  8bd9             mov bx, cx                               
  0a4a  d1e3             shl bx, 1                                
  0a4c  8d46ea           lea ax, [bp - 0x16]                      
  0a4f  03d8             add bx, ax                               
  0a51  36c7070100       mov word ptr ss:[bx], 1                  
  0a56  eb0e             jmp 0xa66                                
  0a58  47               inc di                                   
  0a59  3b3efe5d         cmp di, word ptr [0x5dfe]                
  0a5d  7d07             jge 0xa66                                
  0a5f  833eda2b00       cmp word ptr [0x2bda], 0                 
  0a64  75c0             jne 0xa26                                
  0a66  8bc1             mov ax, cx                               
  0a68  c1e002           shl ax, 2                                
  0a6b  c45e08           les bx, ptr [bp + 8]                     
  0a6e  03d8             add bx, ax                               
  0a70  268b4702         mov ax, word ptr es:[bx + 2]             
  0a74  268b17           mov dx, word ptr es:[bx]                 
  0a77  3b06645e         cmp ax, word ptr [0x5e64]                
  0a7b  7514             jne 0xa91                                
  0a7d  3b16625e         cmp dx, word ptr [0x5e62]                
  0a81  750e             jne 0xa91                                
  0a83  8bd9             mov bx, cx                               
  0a85  d1e3             shl bx, 1                                
  0a87  8d46ea           lea ax, [bp - 0x16]                      
  0a8a  03d8             add bx, ax                               
  0a8c  36c7070100       mov word ptr ss:[bx], 1                  
  0a91  41               inc cx                                   
  0a92  3b4e06           cmp cx, word ptr [bp + 6]                
  0a95  7d03             jge 0xa9a                                
  0a97  e97aff           jmp 0xa14                                
  0a9a  837e0600         cmp word ptr [bp + 6], 0                 
  0a9e  7e19             jle 0xab9                                
  0aa0  c45e08           les bx, ptr [bp + 8]                     
  0aa3  26c41f           les bx, ptr es:[bx]                      
  0aa6  268a4705         mov al, byte ptr es:[bx + 5]             
  0aaa  98               cwde                                     
  0aab  8946fa           mov word ptr [bp - 6], ax                
  0aae  837efa0f         cmp word ptr [bp - 6], 0xf               
  0ab2  7505             jne 0xab9                                
  0ab4  c746fa0800       mov word ptr [bp - 6], 8                 
  0ab9  b90100           mov cx, 1                                
  0abc  e91302           jmp 0xcd2                                
  0abf  8bc1             mov ax, cx                               
  0ac1  c1e002           shl ax, 2                                
  0ac4  c45e08           les bx, ptr [bp + 8]                     
  0ac7  03d8             add bx, ax                               
  0ac9  26c41f           les bx, ptr es:[bx]                      
  0acc  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0ad0  8bd1             mov dx, cx                               
  0ad2  4a               dec dx                                   
  0ad3  c1e202           shl dx, 2                                
  0ad6  c45e08           les bx, ptr [bp + 8]                     
  0ad9  03da             add bx, dx                               
  0adb  26c41f           les bx, ptr es:[bx]                      
  0ade  263a4711         cmp al, byte ptr es:[bx + 0x11]          
  0ae2  7318             jae 0xafc                                
  0ae4  8bd9             mov bx, cx                               
  0ae6  d1e3             shl bx, 1                                
  0ae8  8d46ea           lea ax, [bp - 0x16]                      
  0aeb  03d8             add bx, ax                               
  0aed  36833f00         cmp word ptr ss:[bx], 0                  
  0af1  7409             je 0xafc                                 
  0af3  837e0c00         cmp word ptr [bp + 0xc], 0               
  0af7  7403             je 0xafc                                 
  0af9  e99d00           jmp 0xb99                                
  0afc  8bc1             mov ax, cx                               
  0afe  c1e002           shl ax, 2                                
  0b01  c45e08           les bx, ptr [bp + 8]                     
  0b04  03d8             add bx, ax                               
  0b06  26c41f           les bx, ptr es:[bx]                      
  0b09  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0b0d  8bd1             mov dx, cx                               
  0b0f  4a               dec dx                                   
  0b10  c1e202           shl dx, 2                                
  0b13  c45e08           les bx, ptr [bp + 8]                     
  0b16  03da             add bx, dx                               
  0b18  26c41f           les bx, ptr es:[bx]                      
  0b1b  263a4711         cmp al, byte ptr es:[bx + 0x11]          
  0b1f  7778             ja 0xb99                                 
  0b21  8bc1             mov ax, cx                               
  0b23  c1e002           shl ax, 2                                
  0b26  c45e08           les bx, ptr [bp + 8]                     
  0b29  03d8             add bx, ax                               
  0b2b  26c41f           les bx, ptr es:[bx]                      
  0b2e  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0b32  8bd1             mov dx, cx                               
  0b34  4a               dec dx                                   
  0b35  c1e202           shl dx, 2                                
  0b38  c45e08           les bx, ptr [bp + 8]                     
  0b3b  03da             add bx, dx                               
  0b3d  26c41f           les bx, ptr es:[bx]                      
  0b40  263a4711         cmp al, byte ptr es:[bx + 0x11]          
  0b44  7403             je 0xb49                                 
  0b46  e98801           jmp 0xcd1                                
  0b49  8bc1             mov ax, cx                               
  0b4b  c1e002           shl ax, 2                                
  0b4e  c45e08           les bx, ptr [bp + 8]                     
  0b51  03d8             add bx, ax                               
  0b53  26c41f           les bx, ptr es:[bx]                      
  0b56  268a4704         mov al, byte ptr es:[bx + 4]             
  0b5a  98               cwde                                     
  0b5b  8b5efa           mov bx, word ptr [bp - 6]                
  0b5e  6bdb1d           imul bx, bx, 0x1d                        
  0b61  03d8             add bx, ax                               
  0b63  b8042c           mov ax, 0x2c04                           
  0b66  8ec0             mov es, ax                               
  0b68  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  0b6d  8bd1             mov dx, cx                               
  0b6f  4a               dec dx                                   
  0b70  c1e202           shl dx, 2                                
  0b73  c45e08           les bx, ptr [bp + 8]                     
  0b76  03da             add bx, dx                               
  0b78  26c41f           les bx, ptr es:[bx]                      
  0b7b  50               push ax                                  
  0b7c  268a4704         mov al, byte ptr es:[bx + 4]             
  0b80  98               cwde                                     
  0b81  8b5efa           mov bx, word ptr [bp - 6]                
  0b84  6bdb1d           imul bx, bx, 0x1d                        
  0b87  03d8             add bx, ax                               
  0b89  b8042c           mov ax, 0x2c04                           
  0b8c  8ec0             mov es, ax                               
  0b8e  58               pop ax                                   
  0b8f  263a870b06       cmp al, byte ptr es:[bx + 0x60b]         
  0b94  7f03             jg 0xb99                                 
  0b96  e93801           jmp 0xcd1                                
  0b99  8bf9             mov di, cx                               
  0b9b  eb53             jmp 0xbf0                                
  0b9d  8bc7             mov ax, di                               
  0b9f  c1e002           shl ax, 2                                
  0ba2  c45e08           les bx, ptr [bp + 8]                     
  0ba5  03d8             add bx, ax                               
  0ba7  268b4702         mov ax, word ptr es:[bx + 2]             
  0bab  268b17           mov dx, word ptr es:[bx]                 
  0bae  8946fe           mov word ptr [bp - 2], ax                
  0bb1  8956fc           mov word ptr [bp - 4], dx                
  0bb4  8bc7             mov ax, di                               
  0bb6  48               dec ax                                   
  0bb7  c1e002           shl ax, 2                                
  0bba  8b5e08           mov bx, word ptr [bp + 8]                
  0bbd  03d8             add bx, ax                               
  0bbf  268b4702         mov ax, word ptr es:[bx + 2]             
  0bc3  268b17           mov dx, word ptr es:[bx]                 
  0bc6  8bdf             mov bx, di                               
  0bc8  c1e302           shl bx, 2                                
  0bcb  8b7608           mov si, word ptr [bp + 8]                
  0bce  03f3             add si, bx                               
  0bd0  26894402         mov word ptr es:[si + 2], ax             
  0bd4  268914           mov word ptr es:[si], dx                 
  0bd7  8bc7             mov ax, di                               
  0bd9  48               dec ax                                   
  0bda  c1e002           shl ax, 2                                
  0bdd  8b5e08           mov bx, word ptr [bp + 8]                
  0be0  03d8             add bx, ax                               
  0be2  8b46fe           mov ax, word ptr [bp - 2]                
  0be5  8b56fc           mov dx, word ptr [bp - 4]                
  0be8  26894702         mov word ptr es:[bx + 2], ax             
  0bec  268917           mov word ptr es:[bx], dx                 
  0bef  4f               dec di                                   
  0bf0  0bff             or di, di                                
  0bf2  7f03             jg 0xbf7                                 
  0bf4  e9da00           jmp 0xcd1                                
  0bf7  8bc7             mov ax, di                               
  0bf9  c1e002           shl ax, 2                                
  0bfc  c45e08           les bx, ptr [bp + 8]                     
  0bff  03d8             add bx, ax                               
  0c01  26c41f           les bx, ptr es:[bx]                      
  0c04  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0c08  8bd7             mov dx, di                               
  0c0a  4a               dec dx                                   
  0c0b  c1e202           shl dx, 2                                
  0c0e  c45e08           les bx, ptr [bp + 8]                     
  0c11  03da             add bx, dx                               
  0c13  26c41f           les bx, ptr es:[bx]                      
  0c16  263a4711         cmp al, byte ptr es:[bx + 0x11]          
  0c1a  7318             jae 0xc34                                
  0c1c  8bdf             mov bx, di                               
  0c1e  d1e3             shl bx, 1                                
  0c20  8d46ea           lea ax, [bp - 0x16]                      
  0c23  03d8             add bx, ax                               
  0c25  36833f00         cmp word ptr ss:[bx], 0                  
  0c29  7409             je 0xc34                                 
  0c2b  837e0c00         cmp word ptr [bp + 0xc], 0               
  0c2f  7403             je 0xc34                                 
  0c31  e969ff           jmp 0xb9d                                
  0c34  8bc7             mov ax, di                               
  0c36  c1e002           shl ax, 2                                
  0c39  c45e08           les bx, ptr [bp + 8]                     
  0c3c  03d8             add bx, ax                               
  0c3e  26c41f           les bx, ptr es:[bx]                      
  0c41  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0c45  8bd7             mov dx, di                               
  0c47  4a               dec dx                                   
  0c48  c1e202           shl dx, 2                                
  0c4b  c45e08           les bx, ptr [bp + 8]                     
  0c4e  03da             add bx, dx                               
  0c50  26c41f           les bx, ptr es:[bx]                      
  0c53  263a4711         cmp al, byte ptr es:[bx + 0x11]          
  0c57  7603             jbe 0xc5c                                
  0c59  e941ff           jmp 0xb9d                                
  0c5c  8bc7             mov ax, di                               
  0c5e  c1e002           shl ax, 2                                
  0c61  c45e08           les bx, ptr [bp + 8]                     
  0c64  03d8             add bx, ax                               
  0c66  26c41f           les bx, ptr es:[bx]                      
  0c69  268a4711         mov al, byte ptr es:[bx + 0x11]          
  0c6d  8bd7             mov dx, di                               
  0c6f  4a               dec dx                                   
  0c70  c1e202           shl dx, 2                                
  0c73  c45e08           les bx, ptr [bp + 8]                     
  0c76  03da             add bx, dx                               
  0c78  26c41f           les bx, ptr es:[bx]                      
  0c7b  263a4711         cmp al, byte ptr es:[bx + 0x11]          
  0c7f  7550             jne 0xcd1                                
  0c81  8bc7             mov ax, di                               
  0c83  c1e002           shl ax, 2                                
  0c86  c45e08           les bx, ptr [bp + 8]                     
  0c89  03d8             add bx, ax                               
  0c8b  26c41f           les bx, ptr es:[bx]                      
  0c8e  268a4704         mov al, byte ptr es:[bx + 4]             
  0c92  98               cwde                                     
  0c93  8b5efa           mov bx, word ptr [bp - 6]                
  0c96  6bdb1d           imul bx, bx, 0x1d                        
  0c99  03d8             add bx, ax                               
  0c9b  b8042c           mov ax, 0x2c04                           
  0c9e  8ec0             mov es, ax                               
  0ca0  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  0ca5  8bd7             mov dx, di                               
  0ca7  4a               dec dx                                   
  0ca8  c1e202           shl dx, 2                                
  0cab  c45e08           les bx, ptr [bp + 8]                     
  0cae  03da             add bx, dx                               
  0cb0  26c41f           les bx, ptr es:[bx]                      
  0cb3  50               push ax                                  
  0cb4  268a4704         mov al, byte ptr es:[bx + 4]             
  0cb8  98               cwde                                     
  0cb9  8b5efa           mov bx, word ptr [bp - 6]                
  0cbc  6bdb1d           imul bx, bx, 0x1d                        
  0cbf  03d8             add bx, ax                               
  0cc1  b8042c           mov ax, 0x2c04                           
  0cc4  8ec0             mov es, ax                               
  0cc6  58               pop ax                                   
  0cc7  263a870b06       cmp al, byte ptr es:[bx + 0x60b]         
  0ccc  7e03             jle 0xcd1                                
  0cce  e9ccfe           jmp 0xb9d                                
  0cd1  41               inc cx                                   
  0cd2  3b4e06           cmp cx, word ptr [bp + 6]                
  0cd5  7d03             jge 0xcda                                
  0cd7  e9e5fd           jmp 0xabf                                
  0cda  5f               pop di                                   
  0cdb  5e               pop si                                   
  0cdc  c9               leave                                    
  0cdd  cb               retf                                     

res_0b62_0cde:  ; ENTRY
  0cde  55               push bp                                  
  0cdf  8bec             mov bp, sp                               
  0ce1  81ecfe01         sub sp, 0x1fe                            
  0ce5  ba0200           mov dx, 2                                
  0ce8  eb10             jmp 0xcfa                                
  0cea  8bda             mov bx, dx                               
  0cec  d1e3             shl bx, 1                                
  0cee  8d8602fe         lea ax, [bp - 0x1fe]                     
  0cf2  03d8             add bx, ax                               
  0cf4  36c7070000       mov word ptr ss:[bx], 0                  
  0cf9  42               inc dx                                   
  0cfa  81faff00         cmp dx, 0xff                             
  0cfe  7cea             jl 0xcea                                 
  0d00  b8042c           mov ax, 0x2c04                           
  0d03  8ec0             mov es, ax                               
  0d05  268b0e8101       mov cx, word ptr es:[0x181]              
  0d0a  eb4e             jmp 0xd5a                                
  0d0c  8bd9             mov bx, cx                               
  0d0e  6bdb16           imul bx, bx, 0x16                        
  0d11  b81d1e           mov ax, 0x1e1d                           
  0d14  8ec0             mov es, ax                               
  0d16  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0d1b  98               cwde                                     
  0d1c  ba042c           mov dx, 0x2c04                           
  0d1f  8ec2             mov es, dx                               
  0d21  263b061001       cmp ax, word ptr es:[0x110]              
  0d26  7532             jne 0xd5a                                
  0d28  8bd9             mov bx, cx                               
  0d2a  6bdb16           imul bx, bx, 0x16                        
  0d2d  b81d1e           mov ax, 0x1e1d                           
  0d30  8ec0             mov es, ax                               
  0d32  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  0d38  7c20             jl 0xd5a                                 
  0d3a  8bd9             mov bx, cx                               
  0d3c  6bdb16           imul bx, bx, 0x16                        
  0d3f  b81d1e           mov ax, 0x1e1d                           
  0d42  8ec0             mov es, ax                               
  0d44  268a879188       mov al, byte ptr es:[bx - 0x776f]        
  0d49  b400             mov ah, 0                                
  0d4b  d1e0             shl ax, 1                                
  0d4d  8d9602fe         lea dx, [bp - 0x1fe]                     
  0d51  03c2             add ax, dx                               
  0d53  8bd8             mov bx, ax                               
  0d55  36c7070100       mov word ptr ss:[bx], 1                  
  0d5a  8bc1             mov ax, cx                               
  0d5c  49               dec cx                                   
  0d5d  0bc0             or ax, ax                                
  0d5f  75ab             jne 0xd0c                                
  0d61  ba0100           mov dx, 1                                
  0d64  eb15             jmp 0xd7b                                
  0d66  8bda             mov bx, dx                               
  0d68  d1e3             shl bx, 1                                
  0d6a  8d8602fe         lea ax, [bp - 0x1fe]                     
  0d6e  03d8             add bx, ax                               
  0d70  36833f00         cmp word ptr ss:[bx], 0                  
  0d74  7504             jne 0xd7a                                
  0d76  8bc2             mov ax, dx                               
  0d78  eb09             jmp 0xd83                                
  0d7a  42               inc dx                                   
  0d7b  81faff00         cmp dx, 0xff                             
  0d7f  7ce5             jl 0xd66                                 
  0d81  33c0             xor ax, ax                               
  0d83  c9               leave                                    
  0d84  cb               retf                                     

res_0b62_0d85:  ; ENTRY
  0d85  55               push bp                                  
  0d86  8bec             mov bp, sp                               
  0d88  81ecfe01         sub sp, 0x1fe                            
  0d8c  56               push si                                  
  0d8d  be0200           mov si, 2                                
  0d90  eb10             jmp 0xda2                                
  0d92  8bde             mov bx, si                               
  0d94  d1e3             shl bx, 1                                
  0d96  8d8602fe         lea ax, [bp - 0x1fe]                     
  0d9a  03d8             add bx, ax                               
  0d9c  36c7070000       mov word ptr ss:[bx], 0                  
  0da1  46               inc si                                   
  0da2  81feff00         cmp si, 0xff                             
  0da6  7cea             jl 0xd92                                 
  0da8  b8042c           mov ax, 0x2c04                           
  0dab  8ec0             mov es, ax                               
  0dad  268b0e8101       mov cx, word ptr es:[0x181]              
  0db2  eb5b             jmp 0xe0f                                
  0db4  8bd9             mov bx, cx                               
  0db6  6bdb16           imul bx, bx, 0x16                        
  0db9  b81d1e           mov ax, 0x1e1d                           
  0dbc  8ec0             mov es, ax                               
  0dbe  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0dc3  98               cwde                                     
  0dc4  ba042c           mov dx, 0x2c04                           
  0dc7  8ec2             mov es, dx                               
  0dc9  263b061001       cmp ax, word ptr es:[0x110]              
  0dce  753f             jne 0xe0f                                
  0dd0  8bd9             mov bx, cx                               
  0dd2  6bdb16           imul bx, bx, 0x16                        
  0dd5  b81d1e           mov ax, 0x1e1d                           
  0dd8  8ec0             mov es, ax                               
  0dda  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  0de0  7c2d             jl 0xe0f                                 
  0de2  8bd9             mov bx, cx                               
  0de4  6bdb16           imul bx, bx, 0x16                        
  0de7  b81d1e           mov ax, 0x1e1d                           
  0dea  8ec0             mov es, ax                               
  0dec  2680bf918802     cmp byte ptr es:[bx - 0x776f], 2         
  0df2  721b             jb 0xe0f                                 
  0df4  8bd9             mov bx, cx                               
  0df6  6bdb16           imul bx, bx, 0x16                        
  0df9  8ec0             mov es, ax                               
  0dfb  268a879188       mov al, byte ptr es:[bx - 0x776f]        
  0e00  b400             mov ah, 0                                
  0e02  d1e0             shl ax, 1                                
  0e04  8d9602fe         lea dx, [bp - 0x1fe]                     
  0e08  03c2             add ax, dx                               
  0e0a  8bd8             mov bx, ax                               
  0e0c  36ff07           inc word ptr ss:[bx]                     
  0e0f  8bc1             mov ax, cx                               
  0e11  49               dec cx                                   
  0e12  0bc0             or ax, ax                                
  0e14  759e             jne 0xdb4                                
  0e16  be0200           mov si, 2                                
  0e19  eb77             jmp 0xe92                                
  0e1b  8bde             mov bx, si                               
  0e1d  d1e3             shl bx, 1                                
  0e1f  8d8602fe         lea ax, [bp - 0x1fe]                     
  0e23  03d8             add bx, ax                               
  0e25  36833f01         cmp word ptr ss:[bx], 1                  
  0e29  7566             jne 0xe91                                
  0e2b  b8042c           mov ax, 0x2c04                           
  0e2e  8ec0             mov es, ax                               
  0e30  268b0e8101       mov cx, word ptr es:[0x181]              
  0e35  eb53             jmp 0xe8a                                
  0e37  8bd9             mov bx, cx                               
  0e39  6bdb16           imul bx, bx, 0x16                        
  0e3c  b81d1e           mov ax, 0x1e1d                           
  0e3f  8ec0             mov es, ax                               
  0e41  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0e46  98               cwde                                     
  0e47  ba042c           mov dx, 0x2c04                           
  0e4a  8ec2             mov es, dx                               
  0e4c  263b061001       cmp ax, word ptr es:[0x110]              
  0e51  7537             jne 0xe8a                                
  0e53  8bd9             mov bx, cx                               
  0e55  6bdb16           imul bx, bx, 0x16                        
  0e58  b81d1e           mov ax, 0x1e1d                           
  0e5b  8ec0             mov es, ax                               
  0e5d  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  0e63  7c25             jl 0xe8a                                 
  0e65  8bd9             mov bx, cx                               
  0e67  6bdb16           imul bx, bx, 0x16                        
  0e6a  b81d1e           mov ax, 0x1e1d                           
  0e6d  8ec0             mov es, ax                               
  0e6f  268a879188       mov al, byte ptr es:[bx - 0x776f]        
  0e74  b400             mov ah, 0                                
  0e76  3bc6             cmp ax, si                               
  0e78  7510             jne 0xe8a                                
  0e7a  8bd9             mov bx, cx                               
  0e7c  6bdb16           imul bx, bx, 0x16                        
  0e7f  b81d1e           mov ax, 0x1e1d                           
  0e82  8ec0             mov es, ax                               
  0e84  26c687918800     mov byte ptr es:[bx - 0x776f], 0         
  0e8a  8bc1             mov ax, cx                               
  0e8c  49               dec cx                                   
  0e8d  0bc0             or ax, ax                                
  0e8f  75a6             jne 0xe37                                
  0e91  46               inc si                                   
  0e92  81feff00         cmp si, 0xff                             
  0e96  7c83             jl 0xe1b                                 
  0e98  5e               pop si                                   
  0e99  c9               leave                                    
  0e9a  cb               retf                                     

res_0b62_0e9b:  ; ENTRY
  0e9b  55               push bp                                  
  0e9c  8bec             mov bp, sp                               
  0e9e  5d               pop bp                                   
  0e9f  cb               retf                                     

res_0b62_0ea0:  ; ENTRY
  0ea0  55               push bp                                  
  0ea1  8bec             mov bp, sp                               
  0ea3  83ec36           sub sp, 0x36                             
  0ea6  56               push si                                  
  0ea7  57               push di                                  
  0ea8  c746fa0000       mov word ptr [bp - 6], 0                 
  0ead  33f6             xor si, si                               
  0eaf  eb0f             jmp 0xec0                                
  0eb1  8bde             mov bx, si                               
  0eb3  d1e3             shl bx, 1                                
  0eb5  8d46ca           lea ax, [bp - 0x36]                      
  0eb8  03d8             add bx, ax                               
  0eba  36c7070100       mov word ptr ss:[bx], 1                  
  0ebf  46               inc si                                   
  0ec0  83fe08           cmp si, 8                                
  0ec3  7cec             jl 0xeb1                                 
  0ec5  8b5e08           mov bx, word ptr [bp + 8]                
  0ec8  69dbe000         imul bx, bx, 0xe0                        
  0ecc  8b4606           mov ax, word ptr [bp + 6]                
  0ecf  d1e0             shl ax, 1                                
  0ed1  03d8             add bx, ax                               
  0ed3  b81d1e           mov ax, 0x1e1d                           
  0ed6  8ec0             mov es, ax                               
  0ed8  268a9f0000       mov bl, byte ptr es:[bx]                 
  0edd  81e3ff00         and bx, 0xff                             
  0ee1  b8042c           mov ax, 0x2c04                           
  0ee4  8ec0             mov es, ax                               
  0ee6  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0eeb  98               cwde                                     
  0eec  8bd0             mov dx, ax                               
  0eee  837e0600         cmp word ptr [bp + 6], 0                 
  0ef2  7c32             jl 0xf26                                 
  0ef4  837e0800         cmp word ptr [bp + 8], 0                 
  0ef8  7c2c             jl 0xf26                                 
  0efa  83fa02           cmp dx, 2                                
  0efd  7427             je 0xf26                                 
  0eff  8b5e08           mov bx, word ptr [bp + 8]                
  0f02  69dbe000         imul bx, bx, 0xe0                        
  0f06  8b4606           mov ax, word ptr [bp + 6]                
  0f09  d1e0             shl ax, 1                                
  0f0b  03d8             add bx, ax                               
  0f0d  b81d1e           mov ax, 0x1e1d                           
  0f10  8ec0             mov es, ax                               
  0f12  268a870100       mov al, byte ptr es:[bx + 1]             
  0f17  c1e807           shr ax, 7                                
  0f1a  250100           and ax, 1                                
  0f1d  0bc0             or ax, ax                                
  0f1f  7505             jne 0xf26                                
  0f21  33c0             xor ax, ax                               
  0f23  e97d03           jmp 0x12a3                               
  0f26  837e0600         cmp word ptr [bp + 6], 0                 
  0f2a  7d03             jge 0xf2f                                
  0f2c  e90501           jmp 0x1034                               
  0f2f  837e0800         cmp word ptr [bp + 8], 0                 
  0f33  7d03             jge 0xf38                                
  0f35  e9fc00           jmp 0x1034                               
  0f38  33ff             xor di, di                               
  0f3a  b8042c           mov ax, 0x2c04                           
  0f3d  8ec0             mov es, ax                               
  0f3f  268b0e8101       mov cx, word ptr es:[0x181]              
  0f44  eb66             jmp 0xfac                                
  0f46  8bd9             mov bx, cx                               
  0f48  6bdb16           imul bx, bx, 0x16                        
  0f4b  b81d1e           mov ax, 0x1e1d                           
  0f4e  8ec0             mov es, ax                               
  0f50  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  0f55  3b4606           cmp ax, word ptr [bp + 6]                
  0f58  7552             jne 0xfac                                
  0f5a  8bd9             mov bx, cx                               
  0f5c  6bdb16           imul bx, bx, 0x16                        
  0f5f  b81d1e           mov ax, 0x1e1d                           
  0f62  8ec0             mov es, ax                               
  0f64  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0f69  3b4608           cmp ax, word ptr [bp + 8]                
  0f6c  753e             jne 0xfac                                
  0f6e  8bd9             mov bx, cx                               
  0f70  6bdb16           imul bx, bx, 0x16                        
  0f73  b81d1e           mov ax, 0x1e1d                           
  0f76  8ec0             mov es, ax                               
  0f78  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0f7d  98               cwde                                     
  0f7e  ba042c           mov dx, 0x2c04                           
  0f81  8ec2             mov es, dx                               
  0f83  263b061001       cmp ax, word ptr es:[0x110]              
  0f88  7522             jne 0xfac                                
  0f8a  8bc1             mov ax, cx                               
  0f8c  6bc016           imul ax, ax, 0x16                        
  0f8f  ba0000           mov dx, 0                                
  0f92  81c28088         add dx, 0x8880                           
  0f96  03c2             add ax, dx                               
  0f98  8bdf             mov bx, di                               
  0f9a  c1e302           shl bx, 2                                
  0f9d  8d56da           lea dx, [bp - 0x26]                      
  0fa0  03da             add bx, dx                               
  0fa2  36c747021d1e     mov word ptr ss:[bx + 2], 0x1e1d         
  0fa8  368907           mov word ptr ss:[bx], ax                 
  0fab  47               inc di                                   
  0fac  8bc1             mov ax, cx                               
  0fae  49               dec cx                                   
  0faf  0bc0             or ax, ax                                
  0fb1  7593             jne 0xf46                                
  0fb3  57               push di                                  
  0fb4  16               push ss                                  
  0fb5  8d46ca           lea ax, [bp - 0x36]                      
  0fb8  50               push ax                                  
  0fb9  16               push ss                                  
  0fba  8d46da           lea ax, [bp - 0x26]                      
  0fbd  50               push ax                                  
  0fbe  9afa078c0c       lcall 0xc8c, 0x7fa                       -> 0c8c:07fa
  0fc3  83c40a           add sp, 0xa                              
  0fc6  0bc0             or ax, ax                                
  0fc8  7403             je 0xfcd                                 
  0fca  e92202           jmp 0x11ef                               
  0fcd  33f6             xor si, si                               
  0fcf  eb5c             jmp 0x102d                               
  0fd1  8bde             mov bx, si                               
  0fd3  c1e302           shl bx, 2                                
  0fd6  8d46da           lea ax, [bp - 0x26]                      
  0fd9  03d8             add bx, ax                               
  0fdb  36c41f           les bx, ptr ss:[bx]                      
  0fde  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0fe4  7546             jne 0x102c                               
  0fe6  8bde             mov bx, si                               
  0fe8  c1e302           shl bx, 2                                
  0feb  03d8             add bx, ax                               
  0fed  368b1f           mov bx, word ptr ss:[bx]                 
  0ff0  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  0ff5  7435             je 0x102c                                
  0ff7  8bde             mov bx, si                               
  0ff9  c1e302           shl bx, 2                                
  0ffc  03d8             add bx, ax                               
  0ffe  368b1f           mov bx, word ptr ss:[bx]                 
  1001  268a4704         mov al, byte ptr es:[bx + 4]             
  1005  98               cwde                                     
  1006  6bc006           imul ax, ax, 6                           
  1009  8bd8             mov bx, ax                               
  100b  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  100f  98               cwde                                     
  1010  0bc0             or ax, ax                                
  1012  7518             jne 0x102c                               
  1014  ff46fa           inc word ptr [bp - 6]                    
  1017  8bde             mov bx, si                               
  1019  c1e302           shl bx, 2                                
  101c  8d46da           lea ax, [bp - 0x26]                      
  101f  03d8             add bx, ax                               
  1021  6636ff37         push dword ptr ss:[bx]                   
  1025  0e               push cs                                  
  1026  e895f3           call 0x3be                               
  1029  83c404           add sp, 4                                
  102c  46               inc si                                   
  102d  3bf7             cmp si, di                               
  102f  7ca0             jl 0xfd1                                 
  1031  e9bb01           jmp 0x11ef                               
  1034  b8042c           mov ax, 0x2c04                           
  1037  8ec0             mov es, ax                               
  1039  26a18101         mov ax, word ptr es:[0x181]              
  103d  8946fc           mov word ptr [bp - 4], ax                
  1040  e9a401           jmp 0x11e7                               
  1043  8b5efc           mov bx, word ptr [bp - 4]                
  1046  6bdb16           imul bx, bx, 0x16                        
  1049  b81d1e           mov ax, 0x1e1d                           
  104c  ba0000           mov dx, 0                                
  104f  81c28088         add dx, 0x8880                           
  1053  03da             add bx, dx                               
  1055  8ec0             mov es, ax                               
  1057  268b37           mov si, word ptr es:[bx]                 
  105a  8b5efc           mov bx, word ptr [bp - 4]                
  105d  6bdb16           imul bx, bx, 0x16                        
  1060  b81d1e           mov ax, 0x1e1d                           
  1063  8ec0             mov es, ax                               
  1065  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  106a  8946fe           mov word ptr [bp - 2], ax                
  106d  0bf6             or si, si                                
  106f  7d03             jge 0x1074                               
  1071  e97301           jmp 0x11e7                               
  1074  837efe00         cmp word ptr [bp - 2], 0                 
  1078  7d03             jge 0x107d                               
  107a  e96a01           jmp 0x11e7                               
  107d  8b5efc           mov bx, word ptr [bp - 4]                
  1080  6bdb16           imul bx, bx, 0x16                        
  1083  b81d1e           mov ax, 0x1e1d                           
  1086  8ec0             mov es, ax                               
  1088  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  108d  98               cwde                                     
  108e  ba042c           mov dx, 0x2c04                           
  1091  8ec2             mov es, dx                               
  1093  263b061001       cmp ax, word ptr es:[0x110]              
  1098  7403             je 0x109d                                
  109a  e94a01           jmp 0x11e7                               
  109d  8b5efe           mov bx, word ptr [bp - 2]                
  10a0  69dbe000         imul bx, bx, 0xe0                        
  10a4  8bc6             mov ax, si                               
  10a6  d1e0             shl ax, 1                                
  10a8  03d8             add bx, ax                               
  10aa  b81d1e           mov ax, 0x1e1d                           
  10ad  8ec0             mov es, ax                               
  10af  268a9f0000       mov bl, byte ptr es:[bx]                 
  10b4  81e3ff00         and bx, 0xff                             
  10b8  b8042c           mov ax, 0x2c04                           
  10bb  8ec0             mov es, ax                               
  10bd  268a871007       mov al, byte ptr es:[bx + 0x710]         
  10c2  98               cwde                                     
  10c3  8bd0             mov dx, ax                               
  10c5  0bf6             or si, si                                
  10c7  7c2f             jl 0x10f8                                
  10c9  837efe00         cmp word ptr [bp - 2], 0                 
  10cd  7c29             jl 0x10f8                                
  10cf  83fa02           cmp dx, 2                                
  10d2  7424             je 0x10f8                                
  10d4  8b5efe           mov bx, word ptr [bp - 2]                
  10d7  69dbe000         imul bx, bx, 0xe0                        
  10db  8bc6             mov ax, si                               
  10dd  d1e0             shl ax, 1                                
  10df  03d8             add bx, ax                               
  10e1  b81d1e           mov ax, 0x1e1d                           
  10e4  8ec0             mov es, ax                               
  10e6  268a870100       mov al, byte ptr es:[bx + 1]             
  10eb  c1e807           shr ax, 7                                
  10ee  250100           and ax, 1                                
  10f1  0bc0             or ax, ax                                
  10f3  7503             jne 0x10f8                               
  10f5  e9ef00           jmp 0x11e7                               
  10f8  33ff             xor di, di                               
  10fa  b8042c           mov ax, 0x2c04                           
  10fd  8ec0             mov es, ax                               
  10ff  268b0e8101       mov cx, word ptr es:[0x181]              
  1104  eb63             jmp 0x1169                               
  1106  8bd9             mov bx, cx                               
  1108  6bdb16           imul bx, bx, 0x16                        
  110b  b81d1e           mov ax, 0x1e1d                           
  110e  8ec0             mov es, ax                               
  1110  2639b78088       cmp word ptr es:[bx - 0x7780], si        
  1115  7552             jne 0x1169                               
  1117  8bd9             mov bx, cx                               
  1119  6bdb16           imul bx, bx, 0x16                        
  111c  b81d1e           mov ax, 0x1e1d                           
  111f  8ec0             mov es, ax                               
  1121  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  1126  3b46fe           cmp ax, word ptr [bp - 2]                
  1129  753e             jne 0x1169                               
  112b  8bd9             mov bx, cx                               
  112d  6bdb16           imul bx, bx, 0x16                        
  1130  b81d1e           mov ax, 0x1e1d                           
  1133  8ec0             mov es, ax                               
  1135  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  113a  98               cwde                                     
  113b  ba042c           mov dx, 0x2c04                           
  113e  8ec2             mov es, dx                               
  1140  263b061001       cmp ax, word ptr es:[0x110]              
  1145  7522             jne 0x1169                               
  1147  8bc1             mov ax, cx                               
  1149  6bc016           imul ax, ax, 0x16                        
  114c  ba0000           mov dx, 0                                
  114f  81c28088         add dx, 0x8880                           
  1153  03c2             add ax, dx                               
  1155  8bdf             mov bx, di                               
  1157  c1e302           shl bx, 2                                
  115a  8d56da           lea dx, [bp - 0x26]                      
  115d  03da             add bx, dx                               
  115f  36c747021d1e     mov word ptr ss:[bx + 2], 0x1e1d         
  1165  368907           mov word ptr ss:[bx], ax                 
  1168  47               inc di                                   
  1169  49               dec cx                                   
  116a  759a             jne 0x1106                               
  116c  57               push di                                  
  116d  16               push ss                                  
  116e  8d46ca           lea ax, [bp - 0x36]                      
  1171  50               push ax                                  
  1172  16               push ss                                  
  1173  8d46da           lea ax, [bp - 0x26]                      
  1176  50               push ax                                  
  1177  9afa078c0c       lcall 0xc8c, 0x7fa                       -> 0c8c:07fa
  117c  83c40a           add sp, 0xa                              
  117f  0bc0             or ax, ax                                
  1181  7564             jne 0x11e7                               
  1183  33f6             xor si, si                               
  1185  eb5c             jmp 0x11e3                               
  1187  8bde             mov bx, si                               
  1189  c1e302           shl bx, 2                                
  118c  8d46da           lea ax, [bp - 0x26]                      
  118f  03d8             add bx, ax                               
  1191  36c41f           les bx, ptr ss:[bx]                      
  1194  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  119a  7546             jne 0x11e2                               
  119c  8bde             mov bx, si                               
  119e  c1e302           shl bx, 2                                
  11a1  03d8             add bx, ax                               
  11a3  368b1f           mov bx, word ptr ss:[bx]                 
  11a6  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  11ab  7435             je 0x11e2                                
  11ad  8bde             mov bx, si                               
  11af  c1e302           shl bx, 2                                
  11b2  03d8             add bx, ax                               
  11b4  368b1f           mov bx, word ptr ss:[bx]                 
  11b7  268a4704         mov al, byte ptr es:[bx + 4]             
  11bb  98               cwde                                     
  11bc  6bc006           imul ax, ax, 6                           
  11bf  8bd8             mov bx, ax                               
  11c1  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  11c5  98               cwde                                     
  11c6  0bc0             or ax, ax                                
  11c8  7518             jne 0x11e2                               
  11ca  ff46fa           inc word ptr [bp - 6]                    
  11cd  8bde             mov bx, si                               
  11cf  c1e302           shl bx, 2                                
  11d2  8d46da           lea ax, [bp - 0x26]                      
  11d5  03d8             add bx, ax                               
  11d7  6636ff37         push dword ptr ss:[bx]                   
  11db  0e               push cs                                  
  11dc  e8dff1           call 0x3be                               
  11df  83c404           add sp, 4                                
  11e2  46               inc si                                   
  11e3  3bf7             cmp si, di                               
  11e5  7ca0             jl 0x1187                                
  11e7  ff4efc           dec word ptr [bp - 4]                    
  11ea  7403             je 0x11ef                                
  11ec  e954fe           jmp 0x1043                               
  11ef  837efa00         cmp word ptr [bp - 6], 0                 
  11f3  7f03             jg 0x11f8                                
  11f5  e99e00           jmp 0x1296                               
  11f8  9a3e00ba30       lcall 0x30ba, 0x3e                       -> ovl58:023d
  11fd  6633c0           xor eax, eax                             
  1200  66a35e5e         mov dword ptr [0x5e5e], eax              
  1204  66a3625e         mov dword ptr [0x5e62], eax              
  1208  33f6             xor si, si                               
  120a  eb12             jmp 0x121e                               
  120c  8bde             mov bx, si                               
  120e  c1e302           shl bx, 2                                
  1211  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  1217  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  121d  46               inc si                                   
  121e  83fe08           cmp si, 8                                
  1221  7ce9             jl 0x120c                                
  1223  33c0             xor ax, ax                               
  1225  a3da2b           mov word ptr [0x2bda], ax                
  1228  a3fe5d           mov word ptr [0x5dfe], ax                
  122b  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  1230  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  1235  837efa01         cmp word ptr [bp - 6], 1                 
  1239  7507             jne 0x1242                               
  123b  ff76fa           push word ptr [bp - 6]                   
  123e  6a02             push 2                                   
  1240  eb05             jmp 0x1247                               
  1242  ff76fa           push word ptr [bp - 6]                   
  1245  6a00             push 0                                   
  1247  68a800           push 0xa8                                
  124a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  124f  83c404           add sp, 4                                
  1252  52               push dx                                  
  1253  50               push ax                                  
  1254  1e               push ds                                  
  1255  68885c           push 0x5c88                              
  1258  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  125d  83c40a           add sp, 0xa                              
  1260  6668a8000100     push 0x100a8                             
  1266  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  126b  83c404           add sp, 4                                
  126e  52               push dx                                  
  126f  50               push ax                                  
  1270  1e               push ds                                  
  1271  68885c           push 0x5c88                              
  1274  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  1279  83c408           add sp, 8                                
  127c  837e0600         cmp word ptr [bp + 6], 0                 
  1280  7c14             jl 0x1296                                
  1282  837e0800         cmp word ptr [bp + 8], 0                 
  1286  7c0e             jl 0x1296                                
  1288  ff7608           push word ptr [bp + 8]                   
  128b  ff7606           push word ptr [bp + 6]                   
  128e  9a3e00f930       lcall 0x30f9, 0x3e                       -> ovl64:0629
  1293  83c404           add sp, 4                                
  1296  837efa00         cmp word ptr [bp - 6], 0                 
  129a  7e05             jle 0x12a1                               
  129c  b80100           mov ax, 1                                
  129f  eb02             jmp 0x12a3                               
  12a1  33c0             xor ax, ax                               
  12a3  5f               pop di                                   
  12a4  5e               pop si                                   
  12a5  c9               leave                                    
  12a6  cb               retf                                     
  12a7  55               push bp                                  
