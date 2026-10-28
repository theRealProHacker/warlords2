; ovl24 stub 2fd6 file_off 0x4fe60 size 0x110a

ovl24_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec02           sub sp, 2                                
  0006  56               push si                                  
  0007  57               push di                                  
  0008  beffff           mov si, 0xffff                           
  000b  c746feffff       mov word ptr [bp - 2], 0xffff            
  0010  33ff             xor di, di                               
  0012  e98200           jmp 0x97                                 
  0015  8bdf             mov bx, di                               
  0017  c1e302           shl bx, 2                                
  001a  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  001e  0b87405e         or ax, word ptr [bx + 0x5e40]            
  0022  7472             je 0x96                                  
  0024  b8042c           mov ax, 0x2c04                           
  0027  8ec0             mov es, ax                               
  0029  268b0e8101       mov cx, word ptr es:[0x181]              
  002e  eb22             jmp 0x52                                 
  0030  8bc1             mov ax, cx                               
  0032  6bc016           imul ax, ax, 0x16                        
  0035  ba1d1e           mov dx, 0x1e1d                           
  0038  bb0000           mov bx, 0                                
  003b  03d8             add bx, ax                               
  003d  81c38088         add bx, 0x8880                           
  0041  8bf7             mov si, di                               
  0043  c1e602           shl si, 2                                
  0046  3b94405e         cmp dx, word ptr [si + 0x5e40]           
  004a  7506             jne 0x52                                 
  004c  3b9c3e5e         cmp bx, word ptr [si + 0x5e3e]           
  0050  7407             je 0x59                                  
  0052  8bc1             mov ax, cx                               
  0054  49               dec cx                                   
  0055  0bc0             or ax, ax                                
  0057  75d7             jne 0x30                                 
  0059  8bdf             mov bx, di                               
  005b  c1e302           shl bx, 2                                
  005e  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0062  268b37           mov si, word ptr es:[bx]                 
  0065  8bdf             mov bx, di                               
  0067  c1e302           shl bx, 2                                
  006a  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  006e  268b4702         mov ax, word ptr es:[bx + 2]             
  0072  8946fe           mov word ptr [bp - 2], ax                
  0075  83f9ff           cmp cx, -1                               
  0078  740b             je 0x85                                  
  007a  6a00             push 0                                   
  007c  51               push cx                                  
  007d  90               nop                                      
  007e  0e               push cs                                  
  007f  e8dc00           call 0x15e                               
  0082  83c404           add sp, 4                                
  0085  8bdf             mov bx, di                               
  0087  c1e302           shl bx, 2                                
  008a  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  0090  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  0096  47               inc di                                   
  0097  83ff08           cmp di, 8                                
  009a  7d03             jge 0x9f                                 
  009c  e976ff           jmp 0x15                                 
  009f  6633c0           xor eax, eax                             
  00a2  66a35e5e         mov dword ptr [0x5e5e], eax              
  00a6  66a3625e         mov dword ptr [0x5e62], eax              
  00aa  837e0600         cmp word ptr [bp + 6], 0                 
  00ae  7411             je 0xc1                                  
  00b0  83feff           cmp si, -1                               
  00b3  740c             je 0xc1                                  
  00b5  ff76fe           push word ptr [bp - 2]                   
  00b8  56               push si                                  
  00b9  90               nop                                      
  00ba  0e               push cs                                  
  00bb  e8e30f           call 0x10a1                              
  00be  83c404           add sp, 4                                
  00c1  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  00c6  5f               pop di                                   
  00c7  5e               pop si                                   
  00c8  c9               leave                                    
  00c9  cb               retf                                     

ovl24_00ca:  ; ENTRY
  00ca  55               push bp                                  
  00cb  8bec             mov bp, sp                               
  00cd  83ec02           sub sp, 2                                
  00d0  56               push si                                  
  00d1  57               push di                                  
  00d2  bfffff           mov di, 0xffff                           
  00d5  c746feffff       mov word ptr [bp - 2], 0xffff            
  00da  be0800           mov si, 8                                
  00dd  eb58             jmp 0x137                                
  00df  8bc6             mov ax, si                               
  00e1  d1e0             shl ax, 1                                
  00e3  c45e06           les bx, ptr [bp + 6]                     
  00e6  03d8             add bx, ax                               
  00e8  26833fff         cmp word ptr es:[bx], -1                 
  00ec  7449             je 0x137                                 
  00ee  268b1f           mov bx, word ptr es:[bx]                 
  00f1  6bdb16           imul bx, bx, 0x16                        
  00f4  b81d1e           mov ax, 0x1e1d                           
  00f7  ba0000           mov dx, 0                                
  00fa  81c28088         add dx, 0x8880                           
  00fe  03da             add bx, dx                               
  0100  8ec0             mov es, ax                               
  0102  268b3f           mov di, word ptr es:[bx]                 
  0105  8bc6             mov ax, si                               
  0107  d1e0             shl ax, 1                                
  0109  c45e06           les bx, ptr [bp + 6]                     
  010c  03d8             add bx, ax                               
  010e  268b1f           mov bx, word ptr es:[bx]                 
  0111  6bdb16           imul bx, bx, 0x16                        
  0114  b81d1e           mov ax, 0x1e1d                           
  0117  8ec0             mov es, ax                               
  0119  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  011e  8946fe           mov word ptr [bp - 2], ax                
  0121  6a00             push 0                                   
  0123  8bc6             mov ax, si                               
  0125  d1e0             shl ax, 1                                
  0127  c45e06           les bx, ptr [bp + 6]                     
  012a  03d8             add bx, ax                               
  012c  26ff37           push word ptr es:[bx]                    
  012f  90               nop                                      
  0130  0e               push cs                                  
  0131  e82a00           call 0x15e                               
  0134  83c404           add sp, 4                                
  0137  8bc6             mov ax, si                               
  0139  4e               dec si                                   
  013a  0bc0             or ax, ax                                
  013c  75a1             jne 0xdf                                 
  013e  837e0a00         cmp word ptr [bp + 0xa], 0               
  0142  7411             je 0x155                                 
  0144  83ffff           cmp di, -1                               
  0147  740c             je 0x155                                 
  0149  ff76fe           push word ptr [bp - 2]                   
  014c  57               push di                                  
  014d  90               nop                                      
  014e  0e               push cs                                  
  014f  e84f0f           call 0x10a1                              
  0152  83c404           add sp, 4                                
  0155  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  015a  5f               pop di                                   
  015b  5e               pop si                                   
  015c  c9               leave                                    
  015d  cb               retf                                     

ovl24_015e:  ; ENTRY
  015e  55               push bp                                  
  015f  8bec             mov bp, sp                               
  0161  83ec02           sub sp, 2                                
  0164  56               push si                                  
  0165  57               push di                                  
  0166  8b7606           mov si, word ptr [bp + 6]                
  0169  8bde             mov bx, si                               
  016b  6bdb16           imul bx, bx, 0x16                        
  016e  b81d1e           mov ax, 0x1e1d                           
  0171  ba0000           mov dx, 0                                
  0174  81c28088         add dx, 0x8880                           
  0178  03da             add bx, dx                               
  017a  8ec0             mov es, ax                               
  017c  268b3f           mov di, word ptr es:[bx]                 
  017f  8bde             mov bx, si                               
  0181  6bdb16           imul bx, bx, 0x16                        
  0184  b81d1e           mov ax, 0x1e1d                           
  0187  8ec0             mov es, ax                               
  0189  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  018e  8946fe           mov word ptr [bp - 2], ax                
  0191  8bde             mov bx, si                               
  0193  6bdb16           imul bx, bx, 0x16                        
  0196  b81d1e           mov ax, 0x1e1d                           
  0199  8ec0             mov es, ax                               
  019b  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  01a1  751e             jne 0x1c1                                
  01a3  ff76fe           push word ptr [bp - 2]                   
  01a6  57               push di                                  
  01a7  8bc6             mov ax, si                               
  01a9  6bc016           imul ax, ax, 0x16                        
  01ac  ba0000           mov dx, 0                                
  01af  03d0             add dx, ax                               
  01b1  81c28088         add dx, 0x8880                           
  01b5  681d1e           push 0x1e1d                              
  01b8  52               push dx                                  
  01b9  9a39002430       lcall 0x3024, 0x39                       -> ovl36:16cd
  01be  83c408           add sp, 8                                
  01c1  8bc6             mov ax, si                               
  01c3  6bc016           imul ax, ax, 0x16                        
  01c6  ba0000           mov dx, 0                                
  01c9  03d0             add dx, ax                               
  01cb  81c28088         add dx, 0x8880                           
  01cf  681d1e           push 0x1e1d                              
  01d2  52               push dx                                  
  01d3  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  01d8  83c404           add sp, 4                                
  01db  837e0800         cmp word ptr [bp + 8], 0                 
  01df  740c             je 0x1ed                                 
  01e1  ff76fe           push word ptr [bp - 2]                   
  01e4  57               push di                                  
  01e5  90               nop                                      
  01e6  0e               push cs                                  
  01e7  e8b70e           call 0x10a1                              
  01ea  83c404           add sp, 4                                
  01ed  5f               pop di                                   
  01ee  5e               pop si                                   
  01ef  c9               leave                                    
  01f0  cb               retf                                     

ovl24_01f1:  ; ENTRY
  01f1  55               push bp                                  
  01f2  8bec             mov bp, sp                               
  01f4  56               push si                                  
  01f5  b8042c           mov ax, 0x2c04                           
  01f8  8ec0             mov es, ax                               
  01fa  268b367b15       mov si, word ptr es:[0x157b]             
  01ff  eb34             jmp 0x235                                
  0201  8bde             mov bx, si                               
  0203  6bdb41           imul bx, bx, 0x41                        
  0206  b8042c           mov ax, 0x2c04                           
  0209  8ec0             mov es, ax                               
  020b  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0210  ba042c           mov dx, 0x2c04                           
  0213  8ec2             mov es, dx                               
  0215  263a061001       cmp al, byte ptr es:[0x110]              
  021a  7519             jne 0x235                                
  021c  c41eee40         les bx, ptr [0x40ee]                     
  0220  03de             add bx, si                               
  0222  26f6871e0104     test byte ptr es:[bx + 0x11e], 4         
  0228  750b             jne 0x235                                
  022a  6a00             push 0                                   
  022c  56               push si                                  
  022d  90               nop                                      
  022e  0e               push cs                                  
  022f  e80d00           call 0x23f                               
  0232  83c404           add sp, 4                                
  0235  8bc6             mov ax, si                               
  0237  4e               dec si                                   
  0238  0bc0             or ax, ax                                
  023a  75c5             jne 0x201                                
  023c  5e               pop si                                   
  023d  5d               pop bp                                   
  023e  cb               retf                                     

ovl24_023f:  ; ENTRY
  023f  55               push bp                                  
  0240  8bec             mov bp, sp                               
  0242  81ecac00         sub sp, 0xac                             
  0246  56               push si                                  
  0247  57               push di                                  
  0248  8b5e06           mov bx, word ptr [bp + 6]                
  024b  6bdb41           imul bx, bx, 0x41                        
  024e  b8042c           mov ax, 0x2c04                           
  0251  8ec0             mov es, ax                               
  0253  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0258  8946fe           mov word ptr [bp - 2], ax                
  025b  8b5e06           mov bx, word ptr [bp + 6]                
  025e  6bdb41           imul bx, bx, 0x41                        
  0261  b8042c           mov ax, 0x2c04                           
  0264  8ec0             mov es, ax                               
  0266  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  026b  8946fc           mov word ptr [bp - 4], ax                
  026e  c746faffff       mov word ptr [bp - 6], 0xffff            
  0273  c746f80000       mov word ptr [bp - 8], 0                 
  0278  c746f60000       mov word ptr [bp - 0xa], 0               
  027d  c746f40000       mov word ptr [bp - 0xc], 0               
  0282  c746f20000       mov word ptr [bp - 0xe], 0               
  0287  c41eee40         les bx, ptr [0x40ee]                     
  028b  035e06           add bx, word ptr [bp + 6]                
  028e  268a878201       mov al, byte ptr es:[bx + 0x182]         
  0293  b400             mov ah, 0                                
  0295  8946ea           mov word ptr [bp - 0x16], ax             
  0298  c746e80000       mov word ptr [bp - 0x18], 0              
  029d  837e0600         cmp word ptr [bp + 6], 0                 
  02a1  7c0e             jl 0x2b1                                 
  02a3  b8042c           mov ax, 0x2c04                           
  02a6  8ec0             mov es, ax                               
  02a8  26a17b15         mov ax, word ptr es:[0x157b]             
  02ac  3b4606           cmp ax, word ptr [bp + 6]                
  02af  7f05             jg 0x2b6                                 
  02b1  33c0             xor ax, ax                               
  02b3  e98307           jmp 0xa39                                
  02b6  bf0800           mov di, 8                                
  02b9  eb0f             jmp 0x2ca                                
  02bb  8bdf             mov bx, di                               
  02bd  d1e3             shl bx, 1                                
  02bf  8d8654ff         lea ax, [bp - 0xac]                      
  02c3  03d8             add bx, ax                               
  02c5  36c707ffff       mov word ptr ss:[bx], 0xffff             
  02ca  8bc7             mov ax, di                               
  02cc  4f               dec di                                   
  02cd  0bc0             or ax, ax                                
  02cf  75ea             jne 0x2bb                                
  02d1  c41eee40         les bx, ptr [0x40ee]                     
  02d5  035e06           add bx, word ptr [bp + 6]                
  02d8  26808f1e0104     or byte ptr es:[bx + 0x11e], 4           
  02de  bf2000           mov di, 0x20                             
  02e1  eb1c             jmp 0x2ff                                
  02e3  8bdf             mov bx, di                               
  02e5  d1e3             shl bx, 1                                
  02e7  8d8664ff         lea ax, [bp - 0x9c]                      
  02eb  03d8             add bx, ax                               
  02ed  b8ffff           mov ax, 0xffff                           
  02f0  368907           mov word ptr ss:[bx], ax                 
  02f3  8bdf             mov bx, di                               
  02f5  d1e3             shl bx, 1                                
  02f7  8d56a4           lea dx, [bp - 0x5c]                      
  02fa  03da             add bx, dx                               
  02fc  368907           mov word ptr ss:[bx], ax                 
  02ff  8bc7             mov ax, di                               
  0301  4f               dec di                                   
  0302  0bc0             or ax, ax                                
  0304  75dd             jne 0x2e3                                
  0306  c41eee40         les bx, ptr [0x40ee]                     
  030a  035e06           add bx, word ptr [bp + 6]                
  030d  26c687820100     mov byte ptr es:[bx + 0x182], 0          
  0313  c746f00000       mov word ptr [bp - 0x10], 0              
  0318  b8042c           mov ax, 0x2c04                           
  031b  8ec0             mov es, ax                               
  031d  268b368101       mov si, word ptr es:[0x181]              
  0322  e98401           jmp 0x4a9                                
  0325  8bde             mov bx, si                               
  0327  6bdb16           imul bx, bx, 0x16                        
  032a  b81d1e           mov ax, 0x1e1d                           
  032d  8ec0             mov es, ax                               
  032f  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  0334  3b46fe           cmp ax, word ptr [bp - 2]                
  0337  7d03             jge 0x33c                                
  0339  e96d01           jmp 0x4a9                                
  033c  8bde             mov bx, si                               
  033e  6bdb16           imul bx, bx, 0x16                        
  0341  b81d1e           mov ax, 0x1e1d                           
  0344  8b56fe           mov dx, word ptr [bp - 2]                
  0347  42               inc dx                                   
  0348  8ec0             mov es, ax                               
  034a  2639978088       cmp word ptr es:[bx - 0x7780], dx        
  034f  7e03             jle 0x354                                
  0351  e95501           jmp 0x4a9                                
  0354  8bde             mov bx, si                               
  0356  6bdb16           imul bx, bx, 0x16                        
  0359  b81d1e           mov ax, 0x1e1d                           
  035c  8ec0             mov es, ax                               
  035e  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0363  3b46fc           cmp ax, word ptr [bp - 4]                
  0366  7d03             jge 0x36b                                
  0368  e93e01           jmp 0x4a9                                
  036b  8bde             mov bx, si                               
  036d  6bdb16           imul bx, bx, 0x16                        
  0370  b81d1e           mov ax, 0x1e1d                           
  0373  8b56fc           mov dx, word ptr [bp - 4]                
  0376  42               inc dx                                   
  0377  8ec0             mov es, ax                               
  0379  2639978288       cmp word ptr es:[bx - 0x777e], dx        
  037e  7e03             jle 0x383                                
  0380  e92601           jmp 0x4a9                                
  0383  8bde             mov bx, si                               
  0385  6bdb16           imul bx, bx, 0x16                        
  0388  b81d1e           mov ax, 0x1e1d                           
  038b  8ec0             mov es, ax                               
  038d  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0392  ba042c           mov dx, 0x2c04                           
  0395  8ec2             mov es, dx                               
  0397  263a061001       cmp al, byte ptr es:[0x110]              
  039c  740a             je 0x3a8                                 
  039e  6a01             push 1                                   
  03a0  56               push si                                  
  03a1  0e               push cs                                  
  03a2  e8b9fd           call 0x15e                               
  03a5  83c404           add sp, 4                                
  03a8  c41eee40         les bx, ptr [0x40ee]                     
  03ac  035e06           add bx, word ptr [bp + 6]                
  03af  26fe878201       inc byte ptr es:[bx + 0x182]             
  03b4  8bde             mov bx, si                               
  03b6  6bdb16           imul bx, bx, 0x16                        
  03b9  b81d1e           mov ax, 0x1e1d                           
  03bc  8ec0             mov es, ax                               
  03be  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  03c3  250f00           and ax, 0xf                              
  03c6  3d0100           cmp ax, 1                                
  03c9  7536             jne 0x401                                
  03cb  8bde             mov bx, si                               
  03cd  6bdb16           imul bx, bx, 0x16                        
  03d0  b81d1e           mov ax, 0x1e1d                           
  03d3  8ec0             mov es, ax                               
  03d5  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  03da  d1e8             shr ax, 1                                
  03dc  257f00           and ax, 0x7f                             
  03df  3b4606           cmp ax, word ptr [bp + 6]                
  03e2  751d             jne 0x401                                
  03e4  8bde             mov bx, si                               
  03e6  6bdb16           imul bx, bx, 0x16                        
  03e9  b81d1e           mov ax, 0x1e1d                           
  03ec  8ec0             mov es, ax                               
  03ee  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  03f4  8bde             mov bx, si                               
  03f6  6bdb16           imul bx, bx, 0x16                        
  03f9  8ec0             mov es, ax                               
  03fb  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  0401  8bde             mov bx, si                               
  0403  6bdb16           imul bx, bx, 0x16                        
  0406  b81d1e           mov ax, 0x1e1d                           
  0409  8ec0             mov es, ax                               
  040b  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0410  250f00           and ax, 0xf                              
  0413  0bc0             or ax, ax                                
  0415  7403             je 0x41a                                 
  0417  ff46f8           inc word ptr [bp - 8]                    
  041a  8bde             mov bx, si                               
  041c  6bdb16           imul bx, bx, 0x16                        
  041f  b81d1e           mov ax, 0x1e1d                           
  0422  8ec0             mov es, ax                               
  0424  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  042a  751d             jne 0x449                                
  042c  837ee808         cmp word ptr [bp - 0x18], 8              
  0430  7d17             jge 0x449                                
  0432  8b5ee8           mov bx, word ptr [bp - 0x18]             
  0435  d1e3             shl bx, 1                                
  0437  8d8654ff         lea ax, [bp - 0xac]                      
  043b  03d8             add bx, ax                               
  043d  368937           mov word ptr ss:[bx], si                 
  0440  ff46e8           inc word ptr [bp - 0x18]                 
  0443  ff46f6           inc word ptr [bp - 0xa]                  
  0446  8976fa           mov word ptr [bp - 6], si                
  0449  8bde             mov bx, si                               
  044b  6bdb16           imul bx, bx, 0x16                        
  044e  b81d1e           mov ax, 0x1e1d                           
  0451  8ec0             mov es, ax                               
  0453  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0458  98               cwde                                     
  0459  6bc006           imul ax, ax, 6                           
  045c  8bd8             mov bx, ax                               
  045e  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0463  7403             je 0x468                                 
  0465  ff46f2           inc word ptr [bp - 0xe]                  
  0468  8bde             mov bx, si                               
  046a  6bdb16           imul bx, bx, 0x16                        
  046d  b81d1e           mov ax, 0x1e1d                           
  0470  8ec0             mov es, ax                               
  0472  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0477  98               cwde                                     
  0478  6bc006           imul ax, ax, 6                           
  047b  8bd8             mov bx, ax                               
  047d  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  0482  7403             je 0x487                                 
  0484  ff46f4           inc word ptr [bp - 0xc]                  
  0487  837ef020         cmp word ptr [bp - 0x10], 0x20           
  048b  7c0c             jl 0x499                                 
  048d  6a00             push 0                                   
  048f  56               push si                                  
  0490  0e               push cs                                  
  0491  e8cafc           call 0x15e                               
  0494  83c404           add sp, 4                                
  0497  eb10             jmp 0x4a9                                
  0499  8b5ef0           mov bx, word ptr [bp - 0x10]             
  049c  d1e3             shl bx, 1                                
  049e  8d46a4           lea ax, [bp - 0x5c]                      
  04a1  03d8             add bx, ax                               
  04a3  368937           mov word ptr ss:[bx], si                 
  04a6  ff46f0           inc word ptr [bp - 0x10]                 
  04a9  8bc6             mov ax, si                               
  04ab  4e               dec si                                   
  04ac  0bc0             or ax, ax                                
  04ae  7403             je 0x4b3                                 
  04b0  e972fe           jmp 0x325                                
  04b3  837efaff         cmp word ptr [bp - 6], -1                
  04b7  7440             je 0x4f9                                 
  04b9  8b46fa           mov ax, word ptr [bp - 6]                
  04bc  6bc016           imul ax, ax, 0x16                        
  04bf  ba0000           mov dx, 0                                
  04c2  81c28088         add dx, 0x8880                           
  04c6  03c2             add ax, dx                               
  04c8  c706605e1d1e     mov word ptr [0x5e60], 0x1e1d            
  04ce  a35e5e           mov word ptr [0x5e5e], ax                
  04d1  8b5efa           mov bx, word ptr [bp - 6]                
  04d4  6bdb16           imul bx, bx, 0x16                        
  04d7  b81d1e           mov ax, 0x1e1d                           
  04da  8ec0             mov es, ax                               
  04dc  26ffb78288       push word ptr es:[bx - 0x777e]           
  04e1  8b5efa           mov bx, word ptr [bp - 6]                
  04e4  6bdb16           imul bx, bx, 0x16                        
  04e7  b81d1e           mov ax, 0x1e1d                           
  04ea  8ec0             mov es, ax                               
  04ec  26ffb78088       push word ptr es:[bx - 0x7780]           
  04f1  9a3400ef2f       lcall 0x2fef, 0x34                       -> ovl28:0427
  04f6  83c404           add sp, 4                                
  04f9  837ef601         cmp word ptr [bp - 0xa], 1               
  04fd  7e0e             jle 0x50d                                
  04ff  16               push ss                                  
  0500  8d8654ff         lea ax, [bp - 0xac]                      
  0504  50               push ax                                  
  0505  9a3900ef2f       lcall 0x2fef, 0x39                       -> ovl28:17db
  050a  83c404           add sp, 4                                
  050d  c41eee40         les bx, ptr [0x40ee]                     
  0511  035e06           add bx, word ptr [bp + 6]                
  0514  2680a71e01cf     and byte ptr es:[bx + 0x11e], 0xcf       
  051a  837ef600         cmp word ptr [bp - 0xa], 0               
  051e  740d             je 0x52d                                 
  0520  8b1eee40         mov bx, word ptr [0x40ee]                
  0524  035e06           add bx, word ptr [bp + 6]                
  0527  26808f1e0120     or byte ptr es:[bx + 0x11e], 0x20        
  052d  837ef400         cmp word ptr [bp - 0xc], 0               
  0531  740d             je 0x540                                 
  0533  c41eee40         les bx, ptr [0x40ee]                     
  0537  035e06           add bx, word ptr [bp + 6]                
  053a  26808f1e0110     or byte ptr es:[bx + 0x11e], 0x10        
  0540  837ef010         cmp word ptr [bp - 0x10], 0x10           
  0544  7e08             jle 0x54e                                
  0546  33c0             xor ax, ax                               
  0548  8946ea           mov word ptr [bp - 0x16], ax             
  054b  8946f8           mov word ptr [bp - 8], ax                
  054e  837ef802         cmp word ptr [bp - 8], 2                 
  0552  7e11             jle 0x565                                
  0554  c41eee40         les bx, ptr [0x40ee]                     
  0558  035e06           add bx, word ptr [bp + 6]                
  055b  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  0560  7403             je 0x565                                 
  0562  e9d104           jmp 0xa36                                
  0565  837e0800         cmp word ptr [bp + 8], 0                 
  0569  7552             jne 0x5bd                                
  056b  837ef600         cmp word ptr [bp - 0xa], 0               
  056f  754c             jne 0x5bd                                
  0571  c41eee40         les bx, ptr [0x40ee]                     
  0575  035e06           add bx, word ptr [bp + 6]                
  0578  268a878201       mov al, byte ptr es:[bx + 0x182]         
  057d  b400             mov ah, 0                                
  057f  3b46ea           cmp ax, word ptr [bp - 0x16]             
  0582  7539             jne 0x5bd                                
  0584  66680600ffff     push 0xffff0006                          
  058a  6a01             push 1                                   
  058c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0591  83c406           add sp, 6                                
  0594  0bc0             or ax, ax                                
  0596  7425             je 0x5bd                                 
  0598  8b5efc           mov bx, word ptr [bp - 4]                
  059b  69dbe000         imul bx, bx, 0xe0                        
  059f  8b46fe           mov ax, word ptr [bp - 2]                
  05a2  d1e0             shl ax, 1                                
  05a4  03d8             add bx, ax                               
  05a6  b81d1e           mov ax, 0x1e1d                           
  05a9  8ec0             mov es, ax                               
  05ab  268a87e300       mov al, byte ptr es:[bx + 0xe3]          
  05b0  c1e804           shr ax, 4                                
  05b3  250100           and ax, 1                                
  05b6  0bc0             or ax, ax                                
  05b8  7503             jne 0x5bd                                
  05ba  e97904           jmp 0xa36                                
  05bd  c41eee40         les bx, ptr [0x40ee]                     
  05c1  035e06           add bx, word ptr [bp + 6]                
  05c4  26c687e60100     mov byte ptr es:[bx + 0x1e6], 0          
  05ca  8b1eee40         mov bx, word ptr [0x40ee]                
  05ce  035e06           add bx, word ptr [bp + 6]                
  05d1  268a4756         mov al, byte ptr es:[bx + 0x56]          
  05d5  b400             mov ah, 0                                
  05d7  3d0400           cmp ax, 4                                
  05da  740a             je 0x5e6                                 
  05dc  3d0500           cmp ax, 5                                
  05df  7405             je 0x5e6                                 
  05e1  3d0800           cmp ax, 8                                
  05e4  7542             jne 0x628                                
  05e6  ff7606           push word ptr [bp + 6]                   
  05e9  90               nop                                      
  05ea  0e               push cs                                  
  05eb  e84f04           call 0xa3d                               
  05ee  59               pop cx                                   
  05ef  8946e6           mov word ptr [bp - 0x1a], ax             
  05f2  837ef002         cmp word ptr [bp - 0x10], 2              
  05f6  7d0e             jge 0x606                                
  05f8  c41eee40         les bx, ptr [0x40ee]                     
  05fc  035e06           add bx, word ptr [bp + 6]                
  05ff  26c6475604       mov byte ptr es:[bx + 0x56], 4           
  0604  eb22             jmp 0x628                                
  0606  8b46f0           mov ax, word ptr [bp - 0x10]             
  0609  3b46e6           cmp ax, word ptr [bp - 0x1a]             
  060c  7d0e             jge 0x61c                                
  060e  c41eee40         les bx, ptr [0x40ee]                     
  0612  035e06           add bx, word ptr [bp + 6]                
  0615  26c6475605       mov byte ptr es:[bx + 0x56], 5           
  061a  eb0c             jmp 0x628                                
  061c  c41eee40         les bx, ptr [0x40ee]                     
  0620  035e06           add bx, word ptr [bp + 6]                
  0623  26c6475608       mov byte ptr es:[bx + 0x56], 8           
  0628  16               push ss                                  
  0629  8d8664ff         lea ax, [bp - 0x9c]                      
  062d  50               push ax                                  
  062e  16               push ss                                  
  062f  8d46a4           lea ax, [bp - 0x5c]                      
  0632  50               push ax                                  
  0633  ff76f0           push word ptr [bp - 0x10]                
  0636  ff7606           push word ptr [bp + 6]                   
  0639  90               nop                                      
  063a  0e               push cs                                  
  063b  e81e05           call 0xb5c                               
  063e  83c40c           add sp, 0xc                              
  0641  8946ee           mov word ptr [bp - 0x12], ax             
  0644  837e0800         cmp word ptr [bp + 8], 0                 
  0648  7403             je 0x64d                                 
  064a  e9dd00           jmp 0x72a                                
  064d  b8042c           mov ax, 0x2c04                           
  0650  8ec0             mov es, ax                               
  0652  268b1e1001       mov bx, word ptr es:[0x110]              
  0657  6bdb14           imul bx, bx, 0x14                        
  065a  b8042c           mov ax, 0x2c04                           
  065d  8ec0             mov es, ax                               
  065f  2681bf85012c01   cmp word ptr es:[bx + 0x185], 0x12c      
  0666  7c03             jl 0x66b                                 
  0668  e9bf00           jmp 0x72a                                
  066b  b8042c           mov ax, 0x2c04                           
  066e  8ec0             mov es, ax                               
  0670  268b1e1001       mov bx, word ptr es:[0x110]              
  0675  d1e3             shl bx, 1                                
  0677  8ec0             mov es, ax                               
  0679  268b361001       mov si, word ptr es:[0x110]              
  067e  d1e6             shl si, 1                                
  0680  8b84da5d         mov ax, word ptr [si + 0x5dda]           
  0684  d1e0             shl ax, 1                                
  0686  3987ca5d         cmp word ptr [bx + 0x5dca], ax           
  068a  7c03             jl 0x68f                                 
  068c  e99b00           jmp 0x72a                                
  068f  c41eee40         les bx, ptr [0x40ee]                     
  0693  035e06           add bx, word ptr [bp + 6]                
  0696  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  069b  7503             jne 0x6a0                                
  069d  e98a00           jmp 0x72a                                
  06a0  8b1eee40         mov bx, word ptr [0x40ee]                
  06a4  035e06           add bx, word ptr [bp + 6]                
  06a7  2680bfba000a     cmp byte ptr es:[bx + 0xba], 0xa         
  06ad  767b             jbe 0x72a                                
  06af  8b46f6           mov ax, word ptr [bp - 0xa]              
  06b2  0346f4           add ax, word ptr [bp - 0xc]              
  06b5  050400           add ax, 4                                
  06b8  3b46f0           cmp ax, word ptr [bp - 0x10]             
  06bb  7d6d             jge 0x72a                                
  06bd  6aff             push -1                                  
  06bf  8b5e06           mov bx, word ptr [bp + 6]                
  06c2  6bdb41           imul bx, bx, 0x41                        
  06c5  b8042c           mov ax, 0x2c04                           
  06c8  8ec0             mov es, ax                               
  06ca  26ffb77f15       push word ptr es:[bx + 0x157f]           
  06cf  8b5e06           mov bx, word ptr [bp + 6]                
  06d2  6bdb41           imul bx, bx, 0x41                        
  06d5  b8042c           mov ax, 0x2c04                           
  06d8  8ec0             mov es, ax                               
  06da  26ffb77d15       push word ptr es:[bx + 0x157d]           
  06df  9a3400bd2f       lcall 0x2fbd, 0x34                       -> ovl20:0a3e
  06e4  83c406           add sp, 6                                
  06e7  3d0a00           cmp ax, 0xa                              
  06ea  7e3e             jle 0x72a                                
  06ec  8b7ef6           mov di, word ptr [bp - 0xa]              
  06ef  037ef4           add di, word ptr [bp - 0xc]              
  06f2  83c704           add di, 4                                
  06f5  eb2e             jmp 0x725                                
  06f7  8bdf             mov bx, di                               
  06f9  d1e3             shl bx, 1                                
  06fb  8d8664ff         lea ax, [bp - 0x9c]                      
  06ff  03d8             add bx, ax                               
  0701  368b37           mov si, word ptr ss:[bx]                 
  0704  8bc6             mov ax, si                               
  0706  3dffff           cmp ax, 0xffff                           
  0709  7419             je 0x724                                 
  070b  8bdf             mov bx, di                               
  070d  d1e3             shl bx, 1                                
  070f  8d8664ff         lea ax, [bp - 0x9c]                      
  0713  03d8             add bx, ax                               
  0715  36c707ffff       mov word ptr ss:[bx], 0xffff             
  071a  6a00             push 0                                   
  071c  56               push si                                  
  071d  0e               push cs                                  
  071e  e83dfa           call 0x15e                               
  0721  83c404           add sp, 4                                
  0724  47               inc di                                   
  0725  3b7ef0           cmp di, word ptr [bp - 0x10]             
  0728  7ccd             jl 0x6f7                                 
  072a  837ef018         cmp word ptr [bp - 0x10], 0x18           
  072e  7e38             jle 0x768                                
  0730  bf1800           mov di, 0x18                             
  0733  eb2e             jmp 0x763                                
  0735  8bdf             mov bx, di                               
  0737  d1e3             shl bx, 1                                
  0739  8d8664ff         lea ax, [bp - 0x9c]                      
  073d  03d8             add bx, ax                               
  073f  368b37           mov si, word ptr ss:[bx]                 
  0742  8bc6             mov ax, si                               
  0744  3dffff           cmp ax, 0xffff                           
  0747  7419             je 0x762                                 
  0749  8bdf             mov bx, di                               
  074b  d1e3             shl bx, 1                                
  074d  8d8664ff         lea ax, [bp - 0x9c]                      
  0751  03d8             add bx, ax                               
  0753  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0758  6a00             push 0                                   
  075a  56               push si                                  
  075b  0e               push cs                                  
  075c  e8fff9           call 0x15e                               
  075f  83c404           add sp, 4                                
  0762  47               inc di                                   
  0763  3b7ef0           cmp di, word ptr [bp - 0x10]             
  0766  7ccd             jl 0x735                                 
  0768  b8042c           mov ax, 0x2c04                           
  076b  8ec0             mov es, ax                               
  076d  26833e280100     cmp word ptr es:[0x128], 0               
  0773  740a             je 0x77f                                 
  0775  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  077a  3d0300           cmp ax, 3                                
  077d  7c12             jl 0x791                                 
  077f  837ef002         cmp word ptr [bp - 0x10], 2              
  0783  7d0c             jge 0x791                                
  0785  c41eee40         les bx, ptr [0x40ee]                     
  0789  035e06           add bx, word ptr [bp + 6]                
  078c  26c6475604       mov byte ptr es:[bx + 0x56], 4           
  0791  bf0400           mov di, 4                                
  0794  eb2b             jmp 0x7c1                                
  0796  8bdf             mov bx, di                               
  0798  d1e3             shl bx, 1                                
  079a  8b46fc           mov ax, word ptr [bp - 4]                
  079d  03871c08         add ax, word ptr [bx + 0x81c]            
  07a1  69c0e000         imul ax, ax, 0xe0                        
  07a5  8bdf             mov bx, di                               
  07a7  d1e3             shl bx, 1                                
  07a9  8b56fe           mov dx, word ptr [bp - 2]                
  07ac  03971408         add dx, word ptr [bx + 0x814]            
  07b0  d1e2             shl dx, 1                                
  07b2  03c2             add ax, dx                               
  07b4  ba1d1e           mov dx, 0x1e1d                           
  07b7  8bd8             mov bx, ax                               
  07b9  8ec2             mov es, dx                               
  07bb  2680a70100ef     and byte ptr es:[bx + 1], 0xef           
  07c1  8bc7             mov ax, di                               
  07c3  4f               dec di                                   
  07c4  0bc0             or ax, ax                                
  07c6  75ce             jne 0x796                                
  07c8  b8042c           mov ax, 0x2c04                           
  07cb  8ec0             mov es, ax                               
  07cd  26833e240100     cmp word ptr es:[0x124], 0               
  07d3  7503             jne 0x7d8                                
  07d5  e9ca00           jmp 0x8a2                                
  07d8  c41eee40         les bx, ptr [0x40ee]                     
  07dc  035e06           add bx, word ptr [bp + 6]                
  07df  26807f560b       cmp byte ptr es:[bx + 0x56], 0xb         
  07e4  7403             je 0x7e9                                 
  07e6  e9b900           jmp 0x8a2                                
  07e9  8b1eee40         mov bx, word ptr [0x40ee]                
  07ed  26837f2405       cmp word ptr es:[bx + 0x24], 5           
  07f2  7c03             jl 0x7f7                                 
  07f4  e9ab00           jmp 0x8a2                                
  07f7  8b46f2           mov ax, word ptr [bp - 0xe]              
  07fa  8946e6           mov word ptr [bp - 0x1a], ax             
  07fd  8b46f0           mov ax, word ptr [bp - 0x10]             
  0800  2b46f2           sub ax, word ptr [bp - 0xe]              
  0803  bb0200           mov bx, 2                                
  0806  2bd8             sub bx, ax                               
  0808  0bdb             or bx, bx                                
  080a  7e03             jle 0x80f                                
  080c  295ee6           sub word ptr [bp - 0x1a], bx             
  080f  b8042c           mov ax, 0x2c04                           
  0812  8ec0             mov es, ax                               
  0814  26833e280100     cmp word ptr es:[0x128], 0               
  081a  740f             je 0x82b                                 
  081c  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0821  3d0300           cmp ax, 3                                
  0824  7d05             jge 0x82b                                
  0826  c746e60100       mov word ptr [bp - 0x1a], 1              
  082b  33ff             xor di, di                               
  082d  eb6e             jmp 0x89d                                
  082f  837ee600         cmp word ptr [bp - 0x1a], 0              
  0833  7e67             jle 0x89c                                
  0835  8bdf             mov bx, di                               
  0837  d1e3             shl bx, 1                                
  0839  8d8664ff         lea ax, [bp - 0x9c]                      
  083d  03d8             add bx, ax                               
  083f  368b37           mov si, word ptr ss:[bx]                 
  0842  8bc6             mov ax, si                               
  0844  3dffff           cmp ax, 0xffff                           
  0847  7453             je 0x89c                                 
  0849  8bde             mov bx, si                               
  084b  6bdb16           imul bx, bx, 0x16                        
  084e  b81d1e           mov ax, 0x1e1d                           
  0851  8ec0             mov es, ax                               
  0853  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0858  98               cwde                                     
  0859  6bc006           imul ax, ax, 6                           
  085c  8bd8             mov bx, ax                               
  085e  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  0862  98               cwde                                     
  0863  0bc0             or ax, ax                                
  0865  7435             je 0x89c                                 
  0867  c41eee40         les bx, ptr [0x40ee]                     
  086b  26ff4724         inc word ptr es:[bx + 0x24]              
  086f  8bde             mov bx, si                               
  0871  6bdb16           imul bx, bx, 0x16                        
  0874  b81d1e           mov ax, 0x1e1d                           
  0877  8ec0             mov es, ax                               
  0879  26838f8c8820     or word ptr es:[bx - 0x7774], 0x20       
  087f  6aff             push -1                                  
  0881  56               push si                                  
  0882  9a3900bd2f       lcall 0x2fbd, 0x39                       -> ovl20:0e4b
  0887  83c404           add sp, 4                                
  088a  8bdf             mov bx, di                               
  088c  d1e3             shl bx, 1                                
  088e  8d8664ff         lea ax, [bp - 0x9c]                      
  0892  03d8             add bx, ax                               
  0894  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0899  ff4ee6           dec word ptr [bp - 0x1a]                 
  089c  47               inc di                                   
  089d  3b7ef0           cmp di, word ptr [bp - 0x10]             
  08a0  7c8d             jl 0x82f                                 
  08a2  c41eee40         les bx, ptr [0x40ee]                     
  08a6  035e06           add bx, word ptr [bp + 6]                
  08a9  26807f5603       cmp byte ptr es:[bx + 0x56], 3           
  08ae  740e             je 0x8be                                 
  08b0  8b1eee40         mov bx, word ptr [0x40ee]                
  08b4  035e06           add bx, word ptr [bp + 6]                
  08b7  26807f5602       cmp byte ptr es:[bx + 0x56], 2           
  08bc  750a             jne 0x8c8                                
  08be  b90100           mov cx, 1                                
  08c1  c746ec0800       mov word ptr [bp - 0x14], 8              
  08c6  eb20             jmp 0x8e8                                
  08c8  837eee00         cmp word ptr [bp - 0x12], 0              
  08cc  7404             je 0x8d2                                 
  08ce  33c0             xor ax, ax                               
  08d0  eb03             jmp 0x8d5                                
  08d2  b80100           mov ax, 1                                
  08d5  8bc8             mov cx, ax                               
  08d7  837eee00         cmp word ptr [bp - 0x12], 0              
  08db  7405             je 0x8e2                                 
  08dd  8b46ee           mov ax, word ptr [bp - 0x12]             
  08e0  eb03             jmp 0x8e5                                
  08e2  b80800           mov ax, 8                                
  08e5  8946ec           mov word ptr [bp - 0x14], ax             
  08e8  33ff             xor di, di                               
  08ea  e91901           jmp 0xa06                                
  08ed  8bdf             mov bx, di                               
  08ef  d1e3             shl bx, 1                                
  08f1  8d8664ff         lea ax, [bp - 0x9c]                      
  08f5  03d8             add bx, ax                               
  08f7  368b37           mov si, word ptr ss:[bx]                 
  08fa  8bc6             mov ax, si                               
  08fc  3dffff           cmp ax, 0xffff                           
  08ff  7503             jne 0x904                                
  0901  e90101           jmp 0xa05                                
  0904  0bc9             or cx, cx                                
  0906  750c             jne 0x914                                
  0908  c41eee40         les bx, ptr [0x40ee]                     
  090c  035e06           add bx, word ptr [bp + 6]                
  090f  26fe87e601       inc byte ptr es:[bx + 0x1e6]             
  0914  8bdf             mov bx, di                               
  0916  d1e3             shl bx, 1                                
  0918  8d8664ff         lea ax, [bp - 0x9c]                      
  091c  03d8             add bx, ax                               
  091e  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0923  8b5e06           mov bx, word ptr [bp + 6]                
  0926  6bdb41           imul bx, bx, 0x41                        
  0929  b8042c           mov ax, 0x2c04                           
  092c  8ec0             mov es, ax                               
  092e  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0933  8bd9             mov bx, cx                               
  0935  d1e3             shl bx, 1                                
  0937  03871408         add ax, word ptr [bx + 0x814]            
  093b  8946e6           mov word ptr [bp - 0x1a], ax             
  093e  8b5e06           mov bx, word ptr [bp + 6]                
  0941  6bdb41           imul bx, bx, 0x41                        
  0944  b8042c           mov ax, 0x2c04                           
  0947  8ec0             mov es, ax                               
  0949  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  094e  8bd9             mov bx, cx                               
  0950  d1e3             shl bx, 1                                
  0952  03871c08         add ax, word ptr [bx + 0x81c]            
  0956  8946e4           mov word ptr [bp - 0x1c], ax             
  0959  8bde             mov bx, si                               
  095b  6bdb16           imul bx, bx, 0x16                        
  095e  b81d1e           mov ax, 0x1e1d                           
  0961  ba0000           mov dx, 0                                
  0964  81c28088         add dx, 0x8880                           
  0968  03da             add bx, dx                               
  096a  8b56e6           mov dx, word ptr [bp - 0x1a]             
  096d  8ec0             mov es, ax                               
  096f  268917           mov word ptr es:[bx], dx                 
  0972  8bde             mov bx, si                               
  0974  6bdb16           imul bx, bx, 0x16                        
  0977  8b56e4           mov dx, word ptr [bp - 0x1c]             
  097a  8ec0             mov es, ax                               
  097c  2689978288       mov word ptr es:[bx - 0x777e], dx        
  0981  8bde             mov bx, si                               
  0983  6bdb16           imul bx, bx, 0x16                        
  0986  b81d1e           mov ax, 0x1e1d                           
  0989  baffff           mov dx, 0xffff                           
  098c  8ec0             mov es, ax                               
  098e  2689979488       mov word ptr es:[bx - 0x776c], dx        
  0993  8bc2             mov ax, dx                               
  0995  8bde             mov bx, si                               
  0997  6bdb16           imul bx, bx, 0x16                        
  099a  ba1d1e           mov dx, 0x1e1d                           
  099d  8ec2             mov es, dx                               
  099f  2689879288       mov word ptr es:[bx - 0x776e], ax        
  09a4  8bde             mov bx, si                               
  09a6  6bdb16           imul bx, bx, 0x16                        
  09a9  b81d1e           mov ax, 0x1e1d                           
  09ac  8ec0             mov es, ax                               
  09ae  26c687918800     mov byte ptr es:[bx - 0x776f], 0         
  09b4  8bde             mov bx, si                               
  09b6  6bdb16           imul bx, bx, 0x16                        
  09b9  8ec0             mov es, ax                               
  09bb  2680a78e888f     and byte ptr es:[bx - 0x7772], 0x8f      
  09c1  8bde             mov bx, si                               
  09c3  6bdb16           imul bx, bx, 0x16                        
  09c6  8a5606           mov dl, byte ptr [bp + 6]                
  09c9  8ec0             mov es, ax                               
  09cb  2688979088       mov byte ptr es:[bx - 0x7770], dl        
  09d0  8bde             mov bx, si                               
  09d2  6bdb16           imul bx, bx, 0x16                        
  09d5  8ec0             mov es, ax                               
  09d7  2683a78c88bf     and word ptr es:[bx - 0x7774], 0xffbf    
  09dd  8b5ee4           mov bx, word ptr [bp - 0x1c]             
  09e0  69dbe000         imul bx, bx, 0xe0                        
  09e4  8b46e6           mov ax, word ptr [bp - 0x1a]             
  09e7  d1e0             shl ax, 1                                
  09e9  03d8             add bx, ax                               
  09eb  b81d1e           mov ax, 0x1e1d                           
  09ee  8ec0             mov es, ax                               
  09f0  26808f010010     or byte ptr es:[bx + 1], 0x10            
  09f6  ff4eec           dec word ptr [bp - 0x14]                 
  09f9  837eec00         cmp word ptr [bp - 0x14], 0              
  09fd  7506             jne 0xa05                                
  09ff  41               inc cx                                   
  0a00  c746ec0800       mov word ptr [bp - 0x14], 8              
  0a05  47               inc di                                   
  0a06  3b7ef0           cmp di, word ptr [bp - 0x10]             
  0a09  7d03             jge 0xa0e                                
  0a0b  e9dffe           jmp 0x8ed                                
  0a0e  8b5e06           mov bx, word ptr [bp + 6]                
  0a11  6bdb41           imul bx, bx, 0x41                        
  0a14  b8042c           mov ax, 0x2c04                           
  0a17  8ec0             mov es, ax                               
  0a19  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0a1e  8b5e06           mov bx, word ptr [bp + 6]                
  0a21  6bdb41           imul bx, bx, 0x41                        
  0a24  b8042c           mov ax, 0x2c04                           
  0a27  8ec0             mov es, ax                               
  0a29  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0a2e  90               nop                                      
  0a2f  0e               push cs                                  
  0a30  e86e06           call 0x10a1                              
  0a33  83c404           add sp, 4                                
  0a36  b80100           mov ax, 1                                
  0a39  5f               pop di                                   
  0a3a  5e               pop si                                   
  0a3b  c9               leave                                    
  0a3c  cb               retf                                     

ovl24_0a3d:  ; ENTRY
  0a3d  55               push bp                                  
  0a3e  8bec             mov bp, sp                               
  0a40  83ec12           sub sp, 0x12                             
  0a43  56               push si                                  
  0a44  57               push di                                  
  0a45  c746fe0000       mov word ptr [bp - 2], 0                 
  0a4a  c746fc0000       mov word ptr [bp - 4], 0                 
  0a4f  c746fa0200       mov word ptr [bp - 6], 2                 
  0a54  16               push ss                                  
  0a55  8d46ee           lea ax, [bp - 0x12]                      
  0a58  50               push ax                                  
  0a59  16               push ss                                  
  0a5a  8d46f4           lea ax, [bp - 0xc]                       
  0a5d  50               push ax                                  
  0a5e  6a00             push 0                                   
  0a60  ff7606           push word ptr [bp + 6]                   
  0a63  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  0a68  83c40c           add sp, 0xc                              
  0a6b  bf0600           mov di, 6                                
  0a6e  e9b500           jmp 0xb26                                
  0a71  8a43f4           mov al, byte ptr [bp + di - 0xc]         
  0a74  b400             mov ah, 0                                
  0a76  8bc8             mov cx, ax                               
  0a78  3dff00           cmp ax, 0xff                             
  0a7b  7503             jne 0xa80                                
  0a7d  e9a600           jmp 0xb26                                
  0a80  8bd9             mov bx, cx                               
  0a82  6bdb41           imul bx, bx, 0x41                        
  0a85  b8042c           mov ax, 0x2c04                           
  0a88  8ec0             mov es, ax                               
  0a8a  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  0a90  7503             jne 0xa95                                
  0a92  e99100           jmp 0xb26                                
  0a95  8bd9             mov bx, cx                               
  0a97  6bdb41           imul bx, bx, 0x41                        
  0a9a  8ec0             mov es, ax                               
  0a9c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0aa1  98               cwde                                     
  0aa2  ba042c           mov dx, 0x2c04                           
  0aa5  8ec2             mov es, dx                               
  0aa7  263b061001       cmp ax, word ptr es:[0x110]              
  0aac  7478             je 0xb26                                 
  0aae  8bd9             mov bx, cx                               
  0ab0  6bdb41           imul bx, bx, 0x41                        
  0ab3  b8042c           mov ax, 0x2c04                           
  0ab6  8ec0             mov es, ax                               
  0ab8  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0abd  69dbe000         imul bx, bx, 0xe0                        
  0ac1  8bf1             mov si, cx                               
  0ac3  6bf641           imul si, si, 0x41                        
  0ac6  b8042c           mov ax, 0x2c04                           
  0ac9  8ec0             mov es, ax                               
  0acb  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0ad0  d1e0             shl ax, 1                                
  0ad2  03d8             add bx, ax                               
  0ad4  b81d1e           mov ax, 0x1e1d                           
  0ad7  8ec0             mov es, ax                               
  0ad9  268a9f0000       mov bl, byte ptr es:[bx]                 
  0ade  81e3ff00         and bx, 0xff                             
  0ae2  b8042c           mov ax, 0x2c04                           
  0ae5  8ec0             mov es, ax                               
  0ae7  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0aed  7537             jne 0xb26                                
  0aef  ff46fe           inc word ptr [bp - 2]                    
  0af2  8bd9             mov bx, cx                               
  0af4  6bdb41           imul bx, bx, 0x41                        
  0af7  b8042c           mov ax, 0x2c04                           
  0afa  8ec0             mov es, ax                               
  0afc  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0b01  98               cwde                                     
  0b02  ba042c           mov dx, 0x2c04                           
  0b05  8ec2             mov es, dx                               
  0b07  268b1e1001       mov bx, word ptr es:[0x110]              
  0b0c  c1e303           shl bx, 3                                
  0b0f  03d8             add bx, ax                               
  0b11  b8042c           mov ax, 0x2c04                           
  0b14  8ec0             mov es, ax                               
  0b16  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0b1b  250300           and ax, 3                                
  0b1e  3d0200           cmp ax, 2                                
  0b21  7503             jne 0xb26                                
  0b23  ff46fc           inc word ptr [bp - 4]                    
  0b26  8bc7             mov ax, di                               
  0b28  4f               dec di                                   
  0b29  0bc0             or ax, ax                                
  0b2b  7403             je 0xb30                                 
  0b2d  e941ff           jmp 0xa71                                
  0b30  837efc00         cmp word ptr [bp - 4], 0                 
  0b34  7407             je 0xb3d                                 
  0b36  c746fa0800       mov word ptr [bp - 6], 8                 
  0b3b  eb18             jmp 0xb55                                
  0b3d  837efe01         cmp word ptr [bp - 2], 1                 
  0b41  7e07             jle 0xb4a                                
  0b43  c746fa0400       mov word ptr [bp - 6], 4                 
  0b48  eb0b             jmp 0xb55                                
  0b4a  837efe00         cmp word ptr [bp - 2], 0                 
  0b4e  7405             je 0xb55                                 
  0b50  c746fa0300       mov word ptr [bp - 6], 3                 
  0b55  8b46fa           mov ax, word ptr [bp - 6]                
  0b58  5f               pop di                                   
  0b59  5e               pop si                                   
  0b5a  c9               leave                                    
  0b5b  cb               retf                                     

ovl24_0b5c:  ; ENTRY
  0b5c  55               push bp                                  
  0b5d  8bec             mov bp, sp                               
  0b5f  83ec16           sub sp, 0x16                             
  0b62  56               push si                                  
  0b63  57               push di                                  
  0b64  837e080d         cmp word ptr [bp + 8], 0xd               
  0b68  7d0a             jge 0xb74                                
  0b6a  8b5e08           mov bx, word ptr [bp + 8]                
  0b6d  8a872408         mov al, byte ptr [bx + 0x824]            
  0b71  98               cwde                                     
  0b72  eb03             jmp 0xb77                                
  0b74  b80800           mov ax, 8                                
  0b77  8946fe           mov word ptr [bp - 2], ax                
  0b7a  c746f20000       mov word ptr [bp - 0xe], 0               
  0b7f  33c9             xor cx, cx                               
  0b81  c746f00000       mov word ptr [bp - 0x10], 0              
  0b86  c746ee0000       mov word ptr [bp - 0x12], 0              
  0b8b  c746ec0000       mov word ptr [bp - 0x14], 0              
  0b90  c41eee40         les bx, ptr [0x40ee]                     
  0b94  035e06           add bx, word ptr [bp + 6]                
  0b97  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  0b9c  7403             je 0xba1                                 
  0b9e  e93201           jmp 0xcd3                                
  0ba1  33f6             xor si, si                               
  0ba3  c746ea0000       mov word ptr [bp - 0x16], 0              
  0ba8  8b7e08           mov di, word ptr [bp + 8]                
  0bab  eb5d             jmp 0xc0a                                
  0bad  8bc7             mov ax, di                               
  0baf  d1e0             shl ax, 1                                
  0bb1  c45e0a           les bx, ptr [bp + 0xa]                   
  0bb4  03d8             add bx, ax                               
  0bb6  268b17           mov dx, word ptr es:[bx]                 
  0bb9  8bc2             mov ax, dx                               
  0bbb  3dffff           cmp ax, 0xffff                           
  0bbe  744a             je 0xc0a                                 
  0bc0  8bda             mov bx, dx                               
  0bc2  6bdb16           imul bx, bx, 0x16                        
  0bc5  b81d1e           mov ax, 0x1e1d                           
  0bc8  8ec0             mov es, ax                               
  0bca  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0bd0  7505             jne 0xbd7                                
  0bd2  ff46ea           inc word ptr [bp - 0x16]                 
  0bd5  eb33             jmp 0xc0a                                
  0bd7  8bda             mov bx, dx                               
  0bd9  6bdb16           imul bx, bx, 0x16                        
  0bdc  b81d1e           mov ax, 0x1e1d                           
  0bdf  8ec0             mov es, ax                               
  0be1  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0be6  98               cwde                                     
  0be7  6bc006           imul ax, ax, 6                           
  0bea  8bd8             mov bx, ax                               
  0bec  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0bf1  7417             je 0xc0a                                 
  0bf3  8bda             mov bx, dx                               
  0bf5  6bdb16           imul bx, bx, 0x16                        
  0bf8  b81d1e           mov ax, 0x1e1d                           
  0bfb  8ec0             mov es, ax                               
  0bfd  2680bf888804     cmp byte ptr es:[bx - 0x7778], 4         
  0c03  7d04             jge 0xc09                                
  0c05  0bf6             or si, si                                
  0c07  7501             jne 0xc0a                                
  0c09  46               inc si                                   
  0c0a  8bc7             mov ax, di                               
  0c0c  4f               dec di                                   
  0c0d  0bc0             or ax, ax                                
  0c0f  759c             jne 0xbad                                
  0c11  0bf6             or si, si                                
  0c13  7409             je 0xc1e                                 
  0c15  837eea00         cmp word ptr [bp - 0x16], 0              
  0c19  7403             je 0xc1e                                 
  0c1b  0376ea           add si, word ptr [bp - 0x16]             
  0c1e  83fe04           cmp si, 4                                
  0c21  7c06             jl 0xc29                                 
  0c23  837e0810         cmp word ptr [bp + 8], 0x10              
  0c27  7e0b             jle 0xc34                                
  0c29  83fe03           cmp si, 3                                
  0c2c  7c0b             jl 0xc39                                 
  0c2e  837e0808         cmp word ptr [bp + 8], 8                 
  0c32  7f05             jg 0xc39                                 
  0c34  c746ec0100       mov word ptr [bp - 0x14], 1              
  0c39  bf0400           mov di, 4                                
  0c3c  e98a00           jmp 0xcc9                                
  0c3f  8bc7             mov ax, di                               
  0c41  6bc05c           imul ax, ax, 0x5c                        
  0c44  c41eee40         les bx, ptr [0x40ee]                     
  0c48  03d8             add bx, ax                               
  0c4a  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0c50  7477             je 0xcc9                                 
  0c52  8bc7             mov ax, di                               
  0c54  6bc05c           imul ax, ax, 0x5c                        
  0c57  8b1eee40         mov bx, word ptr [0x40ee]                
  0c5b  03d8             add bx, ax                               
  0c5d  268b875002       mov ax, word ptr es:[bx + 0x250]         
  0c62  3b4606           cmp ax, word ptr [bp + 6]                
  0c65  7562             jne 0xcc9                                
  0c67  8bc7             mov ax, di                               
  0c69  6bc05c           imul ax, ax, 0x5c                        
  0c6c  8b1eee40         mov bx, word ptr [0x40ee]                
  0c70  03d8             add bx, ax                               
  0c72  26f787a6021000   test word ptr es:[bx + 0x2a6], 0x10      
  0c79  7407             je 0xc82                                 
  0c7b  c746f00c00       mov word ptr [bp - 0x10], 0xc            
  0c80  eb2e             jmp 0xcb0                                
  0c82  8bc7             mov ax, di                               
  0c84  6bc05c           imul ax, ax, 0x5c                        
  0c87  c41eee40         les bx, ptr [0x40ee]                     
  0c8b  03d8             add bx, ax                               
  0c8d  26f787a6020800   test word ptr es:[bx + 0x2a6], 8         
  0c94  7407             je 0xc9d                                 
  0c96  c746f01000       mov word ptr [bp - 0x10], 0x10           
  0c9b  eb13             jmp 0xcb0                                
  0c9d  8bc7             mov ax, di                               
  0c9f  6bc05c           imul ax, ax, 0x5c                        
  0ca2  c41eee40         les bx, ptr [0x40ee]                     
  0ca6  03d8             add bx, ax                               
  0ca8  268b87a402       mov ax, word ptr es:[bx + 0x2a4]         
  0cad  8946f0           mov word ptr [bp - 0x10], ax             
  0cb0  8bc7             mov ax, di                               
  0cb2  6bc05c           imul ax, ax, 0x5c                        
  0cb5  c41eee40         les bx, ptr [0x40ee]                     
  0cb9  03d8             add bx, ax                               
  0cbb  26f787a6022000   test word ptr es:[bx + 0x2a6], 0x20      
  0cc2  7405             je 0xcc9                                 
  0cc4  c746ec0100       mov word ptr [bp - 0x14], 1              
  0cc9  8bc7             mov ax, di                               
  0ccb  4f               dec di                                   
  0ccc  0bc0             or ax, ax                                
  0cce  7403             je 0xcd3                                 
  0cd0  e96cff           jmp 0xc3f                                
  0cd3  c41eee40         les bx, ptr [0x40ee]                     
  0cd7  035e06           add bx, word ptr [bp + 6]                
  0cda  268a87ba00       mov al, byte ptr es:[bx + 0xba]          
  0cdf  b400             mov ah, 0                                
  0ce1  bb0300           mov bx, 3                                
  0ce4  99               cdq                                      
  0ce5  f7fb             idiv bx                                  
  0ce7  2bd8             sub bx, ax                               
  0ce9  0bdb             or bx, bx                                
  0ceb  7e17             jle 0xd04                                
  0ced  3b5e08           cmp bx, word ptr [bp + 8]                
  0cf0  7d12             jge 0xd04                                
  0cf2  8b4608           mov ax, word ptr [bp + 8]                
  0cf5  2b46fe           sub ax, word ptr [bp - 2]                
  0cf8  3bc3             cmp ax, bx                               
  0cfa  7d08             jge 0xd04                                
  0cfc  8b4608           mov ax, word ptr [bp + 8]                
  0cff  2bc3             sub ax, bx                               
  0d01  8946fe           mov word ptr [bp - 2], ax                
  0d04  b8ffff           mov ax, 0xffff                           
  0d07  8946f6           mov word ptr [bp - 0xa], ax              
  0d0a  8946f8           mov word ptr [bp - 8], ax                
  0d0d  8946fa           mov word ptr [bp - 6], ax                
  0d10  8946fc           mov word ptr [bp - 4], ax                
  0d13  8b7e08           mov di, word ptr [bp + 8]                
  0d16  e90d02           jmp 0xf26                                
  0d19  8bc7             mov ax, di                               
  0d1b  d1e0             shl ax, 1                                
  0d1d  c45e0a           les bx, ptr [bp + 0xa]                   
  0d20  03d8             add bx, ax                               
  0d22  268b17           mov dx, word ptr es:[bx]                 
  0d25  8bc2             mov ax, dx                               
  0d27  3dffff           cmp ax, 0xffff                           
  0d2a  7503             jne 0xd2f                                
  0d2c  e9f701           jmp 0xf26                                
  0d2f  8bda             mov bx, dx                               
  0d31  6bdb16           imul bx, bx, 0x16                        
  0d34  b81d1e           mov ax, 0x1e1d                           
  0d37  8ec0             mov es, ax                               
  0d39  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  0d3e  98               cwde                                     
  0d3f  8bf0             mov si, ax                               
  0d41  8b46f2           mov ax, word ptr [bp - 0xe]              
  0d44  3b46fe           cmp ax, word ptr [bp - 2]                
  0d47  7c03             jl 0xd4c                                 
  0d49  e93601           jmp 0xe82                                
  0d4c  8bda             mov bx, dx                               
  0d4e  6bdb16           imul bx, bx, 0x16                        
  0d51  b81d1e           mov ax, 0x1e1d                           
  0d54  8ec0             mov es, ax                               
  0d56  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0d5b  98               cwde                                     
  0d5c  6bc006           imul ax, ax, 6                           
  0d5f  8bd8             mov bx, ax                               
  0d61  8a87c945         mov al, byte ptr [bx + 0x45c9]           
  0d65  98               cwde                                     
  0d66  8946f4           mov word ptr [bp - 0xc], ax              
  0d69  f7c10100         test cx, 1                               
  0d6d  7519             jne 0xd88                                
  0d6f  8bda             mov bx, dx                               
  0d71  6bdb16           imul bx, bx, 0x16                        
  0d74  b81d1e           mov ax, 0x1e1d                           
  0d77  8ec0             mov es, ax                               
  0d79  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0d7f  7507             jne 0xd88                                
  0d81  81c6e803         add si, 0x3e8                            
  0d85  e9fd00           jmp 0xe85                                
  0d88  8bda             mov bx, dx                               
  0d8a  6bdb16           imul bx, bx, 0x16                        
  0d8d  b81d1e           mov ax, 0x1e1d                           
  0d90  8ec0             mov es, ax                               
  0d92  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  0d97  98               cwde                                     
  0d98  3b46f0           cmp ax, word ptr [bp - 0x10]             
  0d9b  7d03             jge 0xda0                                
  0d9d  e9e500           jmp 0xe85                                
  0da0  f7c11000         test cx, 0x10                            
  0da4  7523             jne 0xdc9                                
  0da6  8bda             mov bx, dx                               
  0da8  6bdb16           imul bx, bx, 0x16                        
  0dab  b81d1e           mov ax, 0x1e1d                           
  0dae  8ec0             mov es, ax                               
  0db0  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0db5  98               cwde                                     
  0db6  6bc006           imul ax, ax, 6                           
  0db9  8bd8             mov bx, ax                               
  0dbb  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0dc0  7407             je 0xdc9                                 
  0dc2  81c68403         add si, 0x384                            
  0dc6  e9bc00           jmp 0xe85                                
  0dc9  837eec00         cmp word ptr [bp - 0x14], 0              
  0dcd  7403             je 0xdd2                                 
  0dcf  e9b300           jmp 0xe85                                
  0dd2  f7c10200         test cx, 2                               
  0dd6  750d             jne 0xde5                                
  0dd8  837ef402         cmp word ptr [bp - 0xc], 2               
  0ddc  7507             jne 0xde5                                
  0dde  81c62003         add si, 0x320                            
  0de2  e9a000           jmp 0xe85                                
  0de5  f7c10400         test cx, 4                               
  0de9  750d             jne 0xdf8                                
  0deb  837ef403         cmp word ptr [bp - 0xc], 3               
  0def  7507             jne 0xdf8                                
  0df1  81c6bc02         add si, 0x2bc                            
  0df5  e98d00           jmp 0xe85                                
  0df8  f7c18000         test cx, 0x80                            
  0dfc  7522             jne 0xe20                                
  0dfe  8bda             mov bx, dx                               
  0e00  6bdb16           imul bx, bx, 0x16                        
  0e03  b81d1e           mov ax, 0x1e1d                           
  0e06  8ec0             mov es, ax                               
  0e08  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0e0d  98               cwde                                     
  0e0e  6bc006           imul ax, ax, 6                           
  0e11  8bd8             mov bx, ax                               
  0e13  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  0e18  7406             je 0xe20                                 
  0e1a  81c65802         add si, 0x258                            
  0e1e  eb65             jmp 0xe85                                
  0e20  f7c10800         test cx, 8                               
  0e24  750c             jne 0xe32                                
  0e26  837ef401         cmp word ptr [bp - 0xc], 1               
  0e2a  7506             jne 0xe32                                
  0e2c  81c6f401         add si, 0x1f4                            
  0e30  eb53             jmp 0xe85                                
  0e32  f7c12000         test cx, 0x20                            
  0e36  7522             jne 0xe5a                                
  0e38  8bda             mov bx, dx                               
  0e3a  6bdb16           imul bx, bx, 0x16                        
  0e3d  b81d1e           mov ax, 0x1e1d                           
  0e40  8ec0             mov es, ax                               
  0e42  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0e47  98               cwde                                     
  0e48  6bc006           imul ax, ax, 6                           
  0e4b  8bd8             mov bx, ax                               
  0e4d  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  0e52  7406             je 0xe5a                                 
  0e54  81c69001         add si, 0x190                            
  0e58  eb2b             jmp 0xe85                                
  0e5a  f7c14000         test cx, 0x40                            
  0e5e  7525             jne 0xe85                                
  0e60  8bda             mov bx, dx                               
  0e62  6bdb16           imul bx, bx, 0x16                        
  0e65  b81d1e           mov ax, 0x1e1d                           
  0e68  8ec0             mov es, ax                               
  0e6a  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0e6f  98               cwde                                     
  0e70  6bc006           imul ax, ax, 6                           
  0e73  8bd8             mov bx, ax                               
  0e75  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  0e7a  7409             je 0xe85                                 
  0e7c  81c62c01         add si, 0x12c                            
  0e80  eb03             jmp 0xe85                                
  0e82  b9ff0f           mov cx, 0xfff                            
  0e85  f7c10100         test cx, 1                               
  0e89  7415             je 0xea0                                 
  0e8b  8bda             mov bx, dx                               
  0e8d  6bdb16           imul bx, bx, 0x16                        
  0e90  b81d1e           mov ax, 0x1e1d                           
  0e93  8ec0             mov es, ax                               
  0e95  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0e9b  7503             jne 0xea0                                
  0e9d  be0100           mov si, 1                                
  0ea0  f7c18000         test cx, 0x80                            
  0ea4  741f             je 0xec5                                 
  0ea6  8bda             mov bx, dx                               
  0ea8  6bdb16           imul bx, bx, 0x16                        
  0eab  b81d1e           mov ax, 0x1e1d                           
  0eae  8ec0             mov es, ax                               
  0eb0  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0eb5  98               cwde                                     
  0eb6  6bc006           imul ax, ax, 6                           
  0eb9  8bd8             mov bx, ax                               
  0ebb  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  0ec0  7403             je 0xec5                                 
  0ec2  be0200           mov si, 2                                
  0ec5  8bda             mov bx, dx                               
  0ec7  6bdb16           imul bx, bx, 0x16                        
  0eca  b81d1e           mov ax, 0x1e1d                           
  0ecd  8ec0             mov es, ax                               
  0ecf  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  0ed4  98               cwde                                     
  0ed5  3b46f0           cmp ax, word ptr [bp - 0x10]             
  0ed8  7c41             jl 0xf1b                                 
  0eda  837eec00         cmp word ptr [bp - 0x14], 0              
  0ede  742e             je 0xf0e                                 
  0ee0  8bda             mov bx, dx                               
  0ee2  6bdb16           imul bx, bx, 0x16                        
  0ee5  b81d1e           mov ax, 0x1e1d                           
  0ee8  8ec0             mov es, ax                               
  0eea  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0eef  98               cwde                                     
  0ef0  6bc006           imul ax, ax, 6                           
  0ef3  8bd8             mov bx, ax                               
  0ef5  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0efa  7512             jne 0xf0e                                
  0efc  8bda             mov bx, dx                               
  0efe  6bdb16           imul bx, bx, 0x16                        
  0f01  b81d1e           mov ax, 0x1e1d                           
  0f04  8ec0             mov es, ax                               
  0f06  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0f0c  750d             jne 0xf1b                                
  0f0e  3b76f6           cmp si, word ptr [bp - 0xa]              
  0f11  7e13             jle 0xf26                                
  0f13  8976f6           mov word ptr [bp - 0xa], si              
  0f16  897ef8           mov word ptr [bp - 8], di                
  0f19  eb0b             jmp 0xf26                                
  0f1b  3b76fa           cmp si, word ptr [bp - 6]                
  0f1e  7e06             jle 0xf26                                
  0f20  8976fa           mov word ptr [bp - 6], si                
  0f23  897efc           mov word ptr [bp - 4], di                
  0f26  8bc7             mov ax, di                               
  0f28  4f               dec di                                   
  0f29  0bc0             or ax, ax                                
  0f2b  7403             je 0xf30                                 
  0f2d  e9e9fd           jmp 0xd19                                
  0f30  837efcff         cmp word ptr [bp - 4], -1                
  0f34  7509             jne 0xf3f                                
  0f36  837ef8ff         cmp word ptr [bp - 8], -1                
  0f3a  7503             jne 0xf3f                                
  0f3c  e95101           jmp 0x1090                               
  0f3f  81f9ff0f         cmp cx, 0xfff                            
  0f43  7503             jne 0xf48                                
  0f45  e9e100           jmp 0x1029                               
  0f48  837ef8ff         cmp word ptr [bp - 8], -1                
  0f4c  7405             je 0xf53                                 
  0f4e  8b46f8           mov ax, word ptr [bp - 8]                
  0f51  eb03             jmp 0xf56                                
  0f53  8b46fc           mov ax, word ptr [bp - 4]                
  0f56  d1e0             shl ax, 1                                
  0f58  c45e0a           les bx, ptr [bp + 0xa]                   
  0f5b  03d8             add bx, ax                               
  0f5d  268b17           mov dx, word ptr es:[bx]                 
  0f60  8bda             mov bx, dx                               
  0f62  6bdb16           imul bx, bx, 0x16                        
  0f65  b81d1e           mov ax, 0x1e1d                           
  0f68  8ec0             mov es, ax                               
  0f6a  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0f6f  98               cwde                                     
  0f70  6bc006           imul ax, ax, 6                           
  0f73  8bd8             mov bx, ax                               
  0f75  8a87c945         mov al, byte ptr [bx + 0x45c9]           
  0f79  98               cwde                                     
  0f7a  8bf0             mov si, ax                               
  0f7c  8bda             mov bx, dx                               
  0f7e  6bdb16           imul bx, bx, 0x16                        
  0f81  b81d1e           mov ax, 0x1e1d                           
  0f84  8ec0             mov es, ax                               
  0f86  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0f8c  7506             jne 0xf94                                
  0f8e  83c901           or cx, 1                                 
  0f91  e99500           jmp 0x1029                               
  0f94  83fe02           cmp si, 2                                
  0f97  7503             jne 0xf9c                                
  0f99  83c902           or cx, 2                                 
  0f9c  83fe03           cmp si, 3                                
  0f9f  7503             jne 0xfa4                                
  0fa1  83c904           or cx, 4                                 
  0fa4  8bda             mov bx, dx                               
  0fa6  6bdb16           imul bx, bx, 0x16                        
  0fa9  b81d1e           mov ax, 0x1e1d                           
  0fac  8ec0             mov es, ax                               
  0fae  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0fb3  98               cwde                                     
  0fb4  6bc006           imul ax, ax, 6                           
  0fb7  8bd8             mov bx, ax                               
  0fb9  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0fbe  7403             je 0xfc3                                 
  0fc0  83c910           or cx, 0x10                              
  0fc3  8bda             mov bx, dx                               
  0fc5  6bdb16           imul bx, bx, 0x16                        
  0fc8  b81d1e           mov ax, 0x1e1d                           
  0fcb  8ec0             mov es, ax                               
  0fcd  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0fd2  98               cwde                                     
  0fd3  6bc006           imul ax, ax, 6                           
  0fd6  8bd8             mov bx, ax                               
  0fd8  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  0fdd  7404             je 0xfe3                                 
  0fdf  81c98000         or cx, 0x80                              
  0fe3  83fe01           cmp si, 1                                
  0fe6  7503             jne 0xfeb                                
  0fe8  83c908           or cx, 8                                 
  0feb  8bda             mov bx, dx                               
  0fed  6bdb16           imul bx, bx, 0x16                        
  0ff0  b81d1e           mov ax, 0x1e1d                           
  0ff3  8ec0             mov es, ax                               
  0ff5  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0ffa  98               cwde                                     
  0ffb  6bc006           imul ax, ax, 6                           
  0ffe  8bd8             mov bx, ax                               
  1000  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  1005  7403             je 0x100a                                
  1007  83c920           or cx, 0x20                              
  100a  8bda             mov bx, dx                               
  100c  6bdb16           imul bx, bx, 0x16                        
  100f  b81d1e           mov ax, 0x1e1d                           
  1012  8ec0             mov es, ax                               
  1014  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  1019  98               cwde                                     
  101a  6bc006           imul ax, ax, 6                           
  101d  8bd8             mov bx, ax                               
  101f  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  1024  7403             je 0x1029                                
  1026  83c940           or cx, 0x40                              
  1029  837ef8ff         cmp word ptr [bp - 8], -1                
  102d  7432             je 0x1061                                
  102f  8b46f8           mov ax, word ptr [bp - 8]                
  1032  d1e0             shl ax, 1                                
  1034  c45e0a           les bx, ptr [bp + 0xa]                   
  1037  03d8             add bx, ax                               
  1039  268b07           mov ax, word ptr es:[bx]                 
  103c  8b56f2           mov dx, word ptr [bp - 0xe]              
  103f  d1e2             shl dx, 1                                
  1041  c45e0e           les bx, ptr [bp + 0xe]                   
  1044  03da             add bx, dx                               
  1046  268907           mov word ptr es:[bx], ax                 
  1049  ff46f2           inc word ptr [bp - 0xe]                  
  104c  8b46f8           mov ax, word ptr [bp - 8]                
  104f  d1e0             shl ax, 1                                
  1051  c45e0a           les bx, ptr [bp + 0xa]                   
  1054  03d8             add bx, ax                               
  1056  26c707ffff       mov word ptr es:[bx], 0xffff             
  105b  ff46ee           inc word ptr [bp - 0x12]                 
  105e  e9a3fc           jmp 0xd04                                
  1061  8b46fc           mov ax, word ptr [bp - 4]                
  1064  d1e0             shl ax, 1                                
  1066  c45e0a           les bx, ptr [bp + 0xa]                   
  1069  03d8             add bx, ax                               
  106b  268b07           mov ax, word ptr es:[bx]                 
  106e  8b56f2           mov dx, word ptr [bp - 0xe]              
  1071  d1e2             shl dx, 1                                
  1073  c45e0e           les bx, ptr [bp + 0xe]                   
  1076  03da             add bx, dx                               
  1078  268907           mov word ptr es:[bx], ax                 
  107b  ff46f2           inc word ptr [bp - 0xe]                  
  107e  8b46fc           mov ax, word ptr [bp - 4]                
  1081  d1e0             shl ax, 1                                
  1083  c45e0a           les bx, ptr [bp + 0xa]                   
  1086  03d8             add bx, ax                               
  1088  26c707ffff       mov word ptr es:[bx], 0xffff             
  108d  e974fc           jmp 0xd04                                
  1090  8b46fe           mov ax, word ptr [bp - 2]                
  1093  3b46ee           cmp ax, word ptr [bp - 0x12]             
  1096  7d02             jge 0x109a                               
  1098  eb03             jmp 0x109d                               
  109a  8b46ee           mov ax, word ptr [bp - 0x12]             
  109d  5f               pop di                                   
  109e  5e               pop si                                   
  109f  c9               leave                                    
  10a0  cb               retf                                     

ovl24_10a1:  ; ENTRY
  10a1  55               push bp                                  
  10a2  8bec             mov bp, sp                               
  10a4  8b5606           mov dx, word ptr [bp + 6]                
  10a7  8b4e08           mov cx, word ptr [bp + 8]                
  10aa  b8042c           mov ax, 0x2c04                           
  10ad  8ec0             mov es, ax                               
  10af  268b1e1001       mov bx, word ptr es:[0x110]              
  10b4  d1e3             shl bx, 1                                
  10b6  b8042c           mov ax, 0x2c04                           
  10b9  8ec0             mov es, ax                               
  10bb  2683bf470100     cmp word ptr es:[bx + 0x147], 0          
  10c1  7519             jne 0x10dc                               
  10c3  b8042c           mov ax, 0x2c04                           
  10c6  8ec0             mov es, ax                               
  10c8  268b1e1001       mov bx, word ptr es:[0x110]              
  10cd  d1e3             shl bx, 1                                
  10cf  b8042c           mov ax, 0x2c04                           
  10d2  8ec0             mov es, ax                               
  10d4  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  10da  742c             je 0x1108                                
  10dc  b8042c           mov ax, 0x2c04                           
  10df  8ec0             mov es, ax                               
  10e1  2639167701       cmp word ptr es:[0x177], dx              
  10e6  7f20             jg 0x1108                                
  10e8  8ec0             mov es, ax                               
  10ea  2639167b01       cmp word ptr es:[0x17b], dx              
  10ef  7c17             jl 0x1108                                
  10f1  8ec0             mov es, ax                               
  10f3  26390e7501       cmp word ptr es:[0x175], cx              
  10f8  7f0e             jg 0x1108                                
  10fa  8ec0             mov es, ax                               
  10fc  26390e7901       cmp word ptr es:[0x179], cx              
  1101  7c05             jl 0x1108                                
  1103  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  1108  5d               pop bp                                   
  1109  cb               retf                                     
