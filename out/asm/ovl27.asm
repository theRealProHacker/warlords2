; ovl27 stub 2fe8 file_off 0x52830 size 0x16d0

ovl27_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec04           sub sp, 4                                
  0006  56               push si                                  
  0007  57               push di                                  
  0008  beffff           mov si, 0xffff                           
  000b  33ff             xor di, di                               
  000d  c746fc0000       mov word ptr [bp - 4], 0                 
  0012  c41eee40         les bx, ptr [0x40ee]                     
  0016  26833f00         cmp word ptr es:[bx], 0                  
  001a  7503             jne 0x1f                                 
  001c  e99801           jmp 0x1b7                                
  001f  b8042c           mov ax, 0x2c04                           
  0022  8ec0             mov es, ax                               
  0024  268b0e7b15       mov cx, word ptr es:[0x157b]             
  0029  eb39             jmp 0x64                                 
  002b  8bd9             mov bx, cx                               
  002d  6bdb41           imul bx, bx, 0x41                        
  0030  b8042c           mov ax, 0x2c04                           
  0033  8ec0             mov es, ax                               
  0035  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  003a  98               cwde                                     
  003b  ba042c           mov dx, 0x2c04                           
  003e  8ec2             mov es, dx                               
  0040  263b061001       cmp ax, word ptr es:[0x110]              
  0045  751d             jne 0x64                                 
  0047  c41eee40         les bx, ptr [0x40ee]                     
  004b  03d9             add bx, cx                               
  004d  26807f5605       cmp byte ptr es:[bx + 0x56], 5           
  0052  740d             je 0x61                                  
  0054  8b1eee40         mov bx, word ptr [0x40ee]                
  0058  03d9             add bx, cx                               
  005a  26807f5608       cmp byte ptr es:[bx + 0x56], 8           
  005f  7503             jne 0x64                                 
  0061  ff46fc           inc word ptr [bp - 4]                    
  0064  8bc1             mov ax, cx                               
  0066  49               dec cx                                   
  0067  0bc0             or ax, ax                                
  0069  75c0             jne 0x2b                                 
  006b  ba0400           mov dx, 4                                
  006e  eb14             jmp 0x84                                 
  0070  8bc2             mov ax, dx                               
  0072  6bc05c           imul ax, ax, 0x5c                        
  0075  c41eee40         les bx, ptr [0x40ee]                     
  0079  03d8             add bx, ax                               
  007b  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0081  7401             je 0x84                                  
  0083  47               inc di                                   
  0084  8bc2             mov ax, dx                               
  0086  4a               dec dx                                   
  0087  0bc0             or ax, ax                                
  0089  75e5             jne 0x70                                 
  008b  c41eee40         les bx, ptr [0x40ee]                     
  008f  2639bf4a02       cmp word ptr es:[bx + 0x24a], di         
  0094  7f03             jg 0x99                                  
  0096  e91e01           jmp 0x1b7                                
  0099  837efc00         cmp word ptr [bp - 4], 0                 
  009d  7503             jne 0xa2                                 
  009f  e91501           jmp 0x1b7                                
  00a2  0bff             or di, di                                
  00a4  7409             je 0xaf                                  
  00a6  837efc03         cmp word ptr [bp - 4], 3                 
  00aa  7d03             jge 0xaf                                 
  00ac  e90801           jmp 0x1b7                                
  00af  c41eee40         les bx, ptr [0x40ee]                     
  00b3  268b974a02       mov dx, word ptr es:[bx + 0x24a]         
  00b8  eb15             jmp 0xcf                                 
  00ba  8bc2             mov ax, dx                               
  00bc  6bc05c           imul ax, ax, 0x5c                        
  00bf  c41eee40         les bx, ptr [0x40ee]                     
  00c3  03d8             add bx, ax                               
  00c5  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  00cb  7502             jne 0xcf                                 
  00cd  8bf2             mov si, dx                               
  00cf  8bc2             mov ax, dx                               
  00d1  4a               dec dx                                   
  00d2  0bc0             or ax, ax                                
  00d4  75e4             jne 0xba                                 
  00d6  83feff           cmp si, -1                               
  00d9  7503             jne 0xde                                 
  00db  e9d900           jmp 0x1b7                                
  00de  56               push si                                  
  00df  90               nop                                      
  00e0  0e               push cs                                  
  00e1  e8d607           call 0x8ba                               
  00e4  59               pop cx                                   
  00e5  6a00             push 0                                   
  00e7  90               nop                                      
  00e8  0e               push cs                                  
  00e9  e8180d           call 0xe04                               
  00ec  59               pop cx                                   
  00ed  8bf8             mov di, ax                               
  00ef  83ffff           cmp di, -1                               
  00f2  7503             jne 0xf7                                 
  00f4  e9c000           jmp 0x1b7                                
  00f7  8bc6             mov ax, si                               
  00f9  6bc05c           imul ax, ax, 0x5c                        
  00fc  8b16ee40         mov dx, word ptr [0x40ee]                
  0100  03d0             add dx, ax                               
  0102  81c27202         add dx, 0x272                            
  0106  ff36f040         push word ptr [0x40f0]                   
  010a  52               push dx                                  
  010b  8bc6             mov ax, si                               
  010d  6bc05c           imul ax, ax, 0x5c                        
  0110  8b16ee40         mov dx, word ptr [0x40ee]                
  0114  03d0             add dx, ax                               
  0116  81c25a02         add dx, 0x25a                            
  011a  ff36f040         push word ptr [0x40f0]                   
  011e  52               push dx                                  
  011f  57               push di                                  
  0120  56               push si                                  
  0121  90               nop                                      
  0122  0e               push cs                                  
  0123  e89500           call 0x1bb                               
  0126  83c40c           add sp, 0xc                              
  0129  8946fe           mov word ptr [bp - 2], ax                
  012c  3dffff           cmp ax, 0xffff                           
  012f  7509             jne 0x13a                                
  0131  56               push si                                  
  0132  90               nop                                      
  0133  0e               push cs                                  
  0134  e88307           call 0x8ba                               
  0137  59               pop cx                                   
  0138  eb7d             jmp 0x1b7                                
  013a  8bc6             mov ax, si                               
  013c  6bc05c           imul ax, ax, 0x5c                        
  013f  c41eee40         les bx, ptr [0x40ee]                     
  0143  03d8             add bx, ax                               
  0145  26c7874c020100   mov word ptr es:[bx + 0x24c], 1          
  014c  8bc6             mov ax, si                               
  014e  6bc05c           imul ax, ax, 0x5c                        
  0151  8b1eee40         mov bx, word ptr [0x40ee]                
  0155  03d8             add bx, ax                               
  0157  2689bf4e02       mov word ptr es:[bx + 0x24e], di         
  015c  8bc6             mov ax, si                               
  015e  6bc05c           imul ax, ax, 0x5c                        
  0161  8b1eee40         mov bx, word ptr [0x40ee]                
  0165  03d8             add bx, ax                               
  0167  8b46fe           mov ax, word ptr [bp - 2]                
  016a  2689875002       mov word ptr es:[bx + 0x250], ax         
  016f  8b1eee40         mov bx, word ptr [0x40ee]                
  0173  035efe           add bx, word ptr [bp - 2]                
  0176  26c6475607       mov byte ptr es:[bx + 0x56], 7           
  017b  56               push si                                  
  017c  90               nop                                      
  017d  0e               push cs                                  
  017e  e81f05           call 0x6a0                               
  0181  59               pop cx                                   
  0182  b8042c           mov ax, 0x2c04                           
  0185  8ec0             mov es, ax                               
  0187  268b1e1001       mov bx, word ptr es:[0x110]              
  018c  c1e303           shl bx, 3                                
  018f  03df             add bx, di                               
  0191  b8042c           mov ax, 0x2c04                           
  0194  8ec0             mov es, ax                               
  0196  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  019c  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  01a2  ff76fe           push word ptr [bp - 2]                   
  01a5  90               nop                                      
  01a6  0e               push cs                                  
  01a7  e89406           call 0x83e                               
  01aa  59               pop cx                                   
  01ab  56               push si                                  
  01ac  90               nop                                      
  01ad  0e               push cs                                  
  01ae  e81908           call 0x9ca                               
  01b1  59               pop cx                                   
  01b2  9a2000c52f       lcall 0x2fc5, 0x20                       -> ovl21:01b3
  01b7  5f               pop di                                   
  01b8  5e               pop si                                   
  01b9  c9               leave                                    
  01ba  cb               retf                                     

ovl27_01bb:  ; ENTRY
  01bb  55               push bp                                  
  01bc  8bec             mov bp, sp                               
  01be  83ec04           sub sp, 4                                
  01c1  56               push si                                  
  01c2  57               push di                                  
  01c3  c746fcffff       mov word ptr [bp - 4], 0xffff            
  01c8  b90600           mov cx, 6                                
  01cb  eb1b             jmp 0x1e8                                
  01cd  8bc1             mov ax, cx                               
  01cf  d1e0             shl ax, 1                                
  01d1  c45e0e           les bx, ptr [bp + 0xe]                   
  01d4  03d8             add bx, ax                               
  01d6  b8ffff           mov ax, 0xffff                           
  01d9  268907           mov word ptr es:[bx], ax                 
  01dc  8bd1             mov dx, cx                               
  01de  d1e2             shl dx, 1                                
  01e0  c45e0a           les bx, ptr [bp + 0xa]                   
  01e3  03da             add bx, dx                               
  01e5  268907           mov word ptr es:[bx], ax                 
  01e8  8bc1             mov ax, cx                               
  01ea  49               dec cx                                   
  01eb  0bc0             or ax, ax                                
  01ed  75de             jne 0x1cd                                
  01ef  666a00           push 0                                   
  01f2  6a00             push 0                                   
  01f4  666858020000     push 0x258                               
  01fa  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  01ff  83c40a           add sp, 0xa                              
  0202  89160841         mov word ptr [0x4108], dx                
  0206  a30641           mov word ptr [0x4106], ax                
  0209  0bc2             or ax, dx                                
  020b  7506             jne 0x213                                
  020d  b8ffff           mov ax, 0xffff                           
  0210  e9e801           jmp 0x3fb                                
  0213  66ff360641       push dword ptr [0x4106]                  
  0218  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  021d  83c404           add sp, 4                                
  0220  89160441         mov word ptr [0x4104], dx                
  0224  a30241           mov word ptr [0x4102], ax                
  0227  ff7608           push word ptr [bp + 8]                   
  022a  90               nop                                      
  022b  0e               push cs                                  
  022c  e8a302           call 0x4d2                               
  022f  59               pop cx                                   
  0230  8bf8             mov di, ax                               
  0232  83ffff           cmp di, -1                               
  0235  7503             jne 0x23a                                
  0237  e9b101           jmp 0x3eb                                
  023a  b8042c           mov ax, 0x2c04                           
  023d  8ec0             mov es, ax                               
  023f  26ff361001       push word ptr es:[0x110]                 
  0244  57               push di                                  
  0245  90               nop                                      
  0246  0e               push cs                                  
  0247  e84003           call 0x58a                               
  024a  83c404           add sp, 4                                
  024d  c746fe1027       mov word ptr [bp - 2], 0x2710            
  0252  b8042c           mov ax, 0x2c04                           
  0255  8ec0             mov es, ax                               
  0257  268b367b15       mov si, word ptr es:[0x157b]             
  025c  eb6b             jmp 0x2c9                                
  025e  8bde             mov bx, si                               
  0260  6bdb41           imul bx, bx, 0x41                        
  0263  b8042c           mov ax, 0x2c04                           
  0266  8ec0             mov es, ax                               
  0268  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  026d  98               cwde                                     
  026e  ba042c           mov dx, 0x2c04                           
  0271  8ec2             mov es, dx                               
  0273  263b061001       cmp ax, word ptr es:[0x110]              
  0278  754f             jne 0x2c9                                
  027a  33c9             xor cx, cx                               
  027c  33d2             xor dx, dx                               
  027e  eb1a             jmp 0x29a                                
  0280  c41eee40         les bx, ptr [0x40ee]                     
  0284  03de             add bx, si                               
  0286  268a4756         mov al, byte ptr es:[bx + 0x56]          
  028a  b400             mov ah, 0                                
  028c  8bda             mov bx, dx                               
  028e  42               inc dx                                   
  028f  d1e3             shl bx, 1                                
  0291  3b874009         cmp ax, word ptr [bx + 0x940]            
  0295  7503             jne 0x29a                                
  0297  b90100           mov cx, 1                                
  029a  8bda             mov bx, dx                               
  029c  d1e3             shl bx, 1                                
  029e  83bf4009ff       cmp word ptr [bx + 0x940], -1            
  02a3  75db             jne 0x280                                
  02a5  0bc9             or cx, cx                                
  02a7  7420             je 0x2c9                                 
  02a9  8bc6             mov ax, si                               
  02ab  d1e0             shl ax, 1                                
  02ad  c41e0241         les bx, ptr [0x4102]                     
  02b1  03d8             add bx, ax                               
  02b3  26833f00         cmp word ptr es:[bx], 0                  
  02b7  7410             je 0x2c9                                 
  02b9  268b87c800       mov ax, word ptr es:[bx + 0xc8]          
  02be  3b46fe           cmp ax, word ptr [bp - 2]                
  02c1  7d06             jge 0x2c9                                
  02c3  8946fe           mov word ptr [bp - 2], ax                
  02c6  8976fc           mov word ptr [bp - 4], si                
  02c9  8bc6             mov ax, si                               
  02cb  4e               dec si                                   
  02cc  0bc0             or ax, ax                                
  02ce  758e             jne 0x25e                                
  02d0  837efcff         cmp word ptr [bp - 4], -1                
  02d4  7431             je 0x307                                 
  02d6  ff7608           push word ptr [bp + 8]                   
  02d9  ff76fc           push word ptr [bp - 4]                   
  02dc  90               nop                                      
  02dd  0e               push cs                                  
  02de  e8a902           call 0x58a                               
  02e1  83c404           add sp, 4                                
  02e4  66ff760e         push dword ptr [bp + 0xe]                
  02e8  66ff760a         push dword ptr [bp + 0xa]                
  02ec  ff7608           push word ptr [bp + 8]                   
  02ef  57               push di                                  
  02f0  90               nop                                      
  02f1  0e               push cs                                  
  02f2  e80a01           call 0x3ff                               
  02f5  83c40c           add sp, 0xc                              
  02f8  0bc0             or ax, ax                                
  02fa  7403             je 0x2ff                                 
  02fc  e9ec00           jmp 0x3eb                                
  02ff  c746fcffff       mov word ptr [bp - 4], 0xffff            
  0304  e9e400           jmp 0x3eb                                
  0307  c41eee40         les bx, ptr [0x40ee]                     
  030b  03df             add bx, di                               
  030d  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  0312  b400             mov ah, 0                                
  0314  a90100           test ax, 1                               
  0317  7403             je 0x31c                                 
  0319  e9cf00           jmp 0x3eb                                
  031c  c746fe1027       mov word ptr [bp - 2], 0x2710            
  0321  b8042c           mov ax, 0x2c04                           
  0324  8ec0             mov es, ax                               
  0326  268b367b15       mov si, word ptr es:[0x157b]             
  032b  e99f00           jmp 0x3cd                                
  032e  8bde             mov bx, si                               
  0330  6bdb41           imul bx, bx, 0x41                        
  0333  b8042c           mov ax, 0x2c04                           
  0336  8ec0             mov es, ax                               
  0338  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  033d  98               cwde                                     
  033e  ba042c           mov dx, 0x2c04                           
  0341  8ec2             mov es, dx                               
  0343  263b061001       cmp ax, word ptr es:[0x110]              
  0348  7403             je 0x34d                                 
  034a  e98000           jmp 0x3cd                                
  034d  33d2             xor dx, dx                               
  034f  33c9             xor cx, cx                               
  0351  eb1a             jmp 0x36d                                
  0353  c41eee40         les bx, ptr [0x40ee]                     
  0357  03de             add bx, si                               
  0359  268a4756         mov al, byte ptr es:[bx + 0x56]          
  035d  b400             mov ah, 0                                
  035f  8bda             mov bx, dx                               
  0361  42               inc dx                                   
  0362  d1e3             shl bx, 1                                
  0364  3b874c09         cmp ax, word ptr [bx + 0x94c]            
  0368  7503             jne 0x36d                                
  036a  b90100           mov cx, 1                                
  036d  8bda             mov bx, dx                               
  036f  d1e3             shl bx, 1                                
  0371  83bf4c09ff       cmp word ptr [bx + 0x94c], -1            
  0376  75db             jne 0x353                                
  0378  0bc9             or cx, cx                                
  037a  7451             je 0x3cd                                 
  037c  8bdf             mov bx, di                               
  037e  6bdb41           imul bx, bx, 0x41                        
  0381  b8042c           mov ax, 0x2c04                           
  0384  8ec0             mov es, ax                               
  0386  26ffb77f15       push word ptr es:[bx + 0x157f]           
  038b  8bdf             mov bx, di                               
  038d  6bdb41           imul bx, bx, 0x41                        
  0390  b8042c           mov ax, 0x2c04                           
  0393  8ec0             mov es, ax                               
  0395  26ffb77d15       push word ptr es:[bx + 0x157d]           
  039a  8bde             mov bx, si                               
  039c  6bdb41           imul bx, bx, 0x41                        
  039f  b8042c           mov ax, 0x2c04                           
  03a2  8ec0             mov es, ax                               
  03a4  26ffb77f15       push word ptr es:[bx + 0x157f]           
  03a9  8bde             mov bx, si                               
  03ab  6bdb41           imul bx, bx, 0x41                        
  03ae  b8042c           mov ax, 0x2c04                           
  03b1  8ec0             mov es, ax                               
  03b3  26ffb77d15       push word ptr es:[bx + 0x157d]           
  03b8  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  03bd  83c408           add sp, 8                                
  03c0  8bd0             mov dx, ax                               
  03c2  3b56fe           cmp dx, word ptr [bp - 2]                
  03c5  7d06             jge 0x3cd                                
  03c7  8976fc           mov word ptr [bp - 4], si                
  03ca  8956fe           mov word ptr [bp - 2], dx                
  03cd  8bc6             mov ax, si                               
  03cf  4e               dec si                                   
  03d0  0bc0             or ax, ax                                
  03d2  7403             je 0x3d7                                 
  03d4  e957ff           jmp 0x32e                                
  03d7  837efcff         cmp word ptr [bp - 4], -1                
  03db  740e             je 0x3eb                                 
  03dd  c45e0a           les bx, ptr [bp + 0xa]                   
  03e0  26893f           mov word ptr es:[bx], di                 
  03e3  c45e0e           les bx, ptr [bp + 0xe]                   
  03e6  26c7076400       mov word ptr es:[bx], 0x64               
  03eb  66ff360641       push dword ptr [0x4106]                  
  03f0  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  03f5  83c404           add sp, 4                                
  03f8  8b46fc           mov ax, word ptr [bp - 4]                
  03fb  5f               pop di                                   
  03fc  5e               pop si                                   
  03fd  c9               leave                                    
  03fe  cb               retf                                     

ovl27_03ff:  ; ENTRY
  03ff  55               push bp                                  
  0400  8bec             mov bp, sp                               
  0402  83ec02           sub sp, 2                                
  0405  56               push si                                  
  0406  57               push di                                  
  0407  33c9             xor cx, cx                               
  0409  33f6             xor si, si                               
  040b  e98e00           jmp 0x49c                                
  040e  c746fe1027       mov word ptr [bp - 2], 0x2710            
  0413  bfffff           mov di, 0xffff                           
  0416  b8042c           mov ax, 0x2c04                           
  0419  8ec0             mov es, ax                               
  041b  268b167b15       mov dx, word ptr es:[0x157b]             
  0420  eb42             jmp 0x464                                
  0422  8bda             mov bx, dx                               
  0424  6bdb41           imul bx, bx, 0x41                        
  0427  b8042c           mov ax, 0x2c04                           
  042a  8ec0             mov es, ax                               
  042c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0431  98               cwde                                     
  0432  3b4608           cmp ax, word ptr [bp + 8]                
  0435  752d             jne 0x464                                
  0437  c41eee40         les bx, ptr [0x40ee]                     
  043b  03da             add bx, dx                               
  043d  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  0443  751f             jne 0x464                                
  0445  8bc2             mov ax, dx                               
  0447  d1e0             shl ax, 1                                
  0449  c41e0241         les bx, ptr [0x4102]                     
  044d  03d8             add bx, ax                               
  044f  26833f00         cmp word ptr es:[bx], 0                  
  0453  740f             je 0x464                                 
  0455  268b87c800       mov ax, word ptr es:[bx + 0xc8]          
  045a  3b46fe           cmp ax, word ptr [bp - 2]                
  045d  7d05             jge 0x464                                
  045f  8946fe           mov word ptr [bp - 2], ax                
  0462  8bfa             mov di, dx                               
  0464  8bc2             mov ax, dx                               
  0466  4a               dec dx                                   
  0467  0bc0             or ax, ax                                
  0469  75b7             jne 0x422                                
  046b  83ffff           cmp di, -1                               
  046e  7434             je 0x4a4                                 
  0470  8bc6             mov ax, si                               
  0472  d1e0             shl ax, 1                                
  0474  c45e0a           les bx, ptr [bp + 0xa]                   
  0477  03d8             add bx, ax                               
  0479  26893f           mov word ptr es:[bx], di                 
  047c  8bc6             mov ax, si                               
  047e  d1e0             shl ax, 1                                
  0480  c45e0e           les bx, ptr [bp + 0xe]                   
  0483  03d8             add bx, ax                               
  0485  8b46fe           mov ax, word ptr [bp - 2]                
  0488  268907           mov word ptr es:[bx], ax                 
  048b  8bc7             mov ax, di                               
  048d  d1e0             shl ax, 1                                
  048f  c41e0241         les bx, ptr [0x4102]                     
  0493  03d8             add bx, ax                               
  0495  26c7070000       mov word ptr es:[bx], 0                  
  049a  41               inc cx                                   
  049b  46               inc si                                   
  049c  83fe06           cmp si, 6                                
  049f  7d03             jge 0x4a4                                
  04a1  e96aff           jmp 0x40e                                
  04a4  0bc9             or cx, cx                                
  04a6  7524             jne 0x4cc                                
  04a8  c41eee40         les bx, ptr [0x40ee]                     
  04ac  03da             add bx, dx                               
  04ae  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  04b3  b400             mov ah, 0                                
  04b5  a90100           test ax, 1                               
  04b8  7512             jne 0x4cc                                
  04ba  c45e0a           les bx, ptr [bp + 0xa]                   
  04bd  8b4606           mov ax, word ptr [bp + 6]                
  04c0  268907           mov word ptr es:[bx], ax                 
  04c3  c45e0e           les bx, ptr [bp + 0xe]                   
  04c6  26c7076400       mov word ptr es:[bx], 0x64               
  04cb  41               inc cx                                   
  04cc  8bc1             mov ax, cx                               
  04ce  5f               pop di                                   
  04cf  5e               pop si                                   
  04d0  c9               leave                                    
  04d1  cb               retf                                     

ovl27_04d2:  ; ENTRY
  04d2  55               push bp                                  
  04d3  8bec             mov bp, sp                               
  04d5  83ec12           sub sp, 0x12                             
  04d8  56               push si                                  
  04d9  57               push di                                  
  04da  c746fe0000       mov word ptr [bp - 2], 0                 
  04df  c746fcffff       mov word ptr [bp - 4], 0xffff            
  04e4  b8042c           mov ax, 0x2c04                           
  04e7  8ec0             mov es, ax                               
  04e9  268b367b15       mov si, word ptr es:[0x157b]             
  04ee  e98800           jmp 0x579                                
  04f1  8bde             mov bx, si                               
  04f3  6bdb41           imul bx, bx, 0x41                        
  04f6  b8042c           mov ax, 0x2c04                           
  04f9  8ec0             mov es, ax                               
  04fb  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0500  98               cwde                                     
  0501  3b4606           cmp ax, word ptr [bp + 6]                
  0504  7573             jne 0x579                                
  0506  16               push ss                                  
  0507  8d46f0           lea ax, [bp - 0x10]                      
  050a  50               push ax                                  
  050b  16               push ss                                  
  050c  8d46f6           lea ax, [bp - 0xa]                       
  050f  50               push ax                                  
  0510  6a00             push 0                                   
  0512  56               push si                                  
  0513  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  0518  83c40c           add sp, 0xc                              
  051b  bf0100           mov di, 1                                
  051e  ba0600           mov dx, 6                                
  0521  eb2b             jmp 0x54e                                
  0523  8d46f6           lea ax, [bp - 0xa]                       
  0526  8bda             mov bx, dx                               
  0528  03d8             add bx, ax                               
  052a  368a07           mov al, byte ptr ss:[bx]                 
  052d  b400             mov ah, 0                                
  052f  8946ee           mov word ptr [bp - 0x12], ax             
  0532  3dff00           cmp ax, 0xff                             
  0535  7417             je 0x54e                                 
  0537  8b5eee           mov bx, word ptr [bp - 0x12]             
  053a  6bdb41           imul bx, bx, 0x41                        
  053d  b8042c           mov ax, 0x2c04                           
  0540  8ec0             mov es, ax                               
  0542  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0547  98               cwde                                     
  0548  3b4606           cmp ax, word ptr [bp + 6]                
  054b  7501             jne 0x54e                                
  054d  47               inc di                                   
  054e  8bc2             mov ax, dx                               
  0550  4a               dec dx                                   
  0551  0bc0             or ax, ax                                
  0553  75ce             jne 0x523                                
  0555  3b7efe           cmp di, word ptr [bp - 2]                
  0558  7f19             jg 0x573                                 
  055a  3b7efe           cmp di, word ptr [bp - 2]                
  055d  751a             jne 0x579                                
  055f  66680200ffff     push 0xffff0002                          
  0565  6a01             push 1                                   
  0567  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  056c  83c406           add sp, 6                                
  056f  0bc0             or ax, ax                                
  0571  7406             je 0x579                                 
  0573  897efe           mov word ptr [bp - 2], di                
  0576  8976fc           mov word ptr [bp - 4], si                
  0579  8bc6             mov ax, si                               
  057b  4e               dec si                                   
  057c  0bc0             or ax, ax                                
  057e  7403             je 0x583                                 
  0580  e96eff           jmp 0x4f1                                
  0583  8b46fc           mov ax, word ptr [bp - 4]                
  0586  5f               pop di                                   
  0587  5e               pop si                                   
  0588  c9               leave                                    
  0589  cb               retf                                     

ovl27_058a:  ; ENTRY
  058a  55               push bp                                  
  058b  8bec             mov bp, sp                               
  058d  83ec12           sub sp, 0x12                             
  0590  56               push si                                  
  0591  57               push di                                  
  0592  b8042c           mov ax, 0x2c04                           
  0595  8ec0             mov es, ax                               
  0597  268b367b15       mov si, word ptr es:[0x157b]             
  059c  eb19             jmp 0x5b7                                
  059e  8bc6             mov ax, si                               
  05a0  d1e0             shl ax, 1                                
  05a2  c41e0241         les bx, ptr [0x4102]                     
  05a6  03d8             add bx, ax                               
  05a8  33c0             xor ax, ax                               
  05aa  2689879001       mov word ptr es:[bx + 0x190], ax         
  05af  268987c800       mov word ptr es:[bx + 0xc8], ax          
  05b4  268907           mov word ptr es:[bx], ax                 
  05b7  8bc6             mov ax, si                               
  05b9  4e               dec si                                   
  05ba  0bc0             or ax, ax                                
  05bc  75e0             jne 0x59e                                
  05be  8b4606           mov ax, word ptr [bp + 6]                
  05c1  d1e0             shl ax, 1                                
  05c3  c41e0241         les bx, ptr [0x4102]                     
  05c7  03d8             add bx, ax                               
  05c9  26c7070100       mov word ptr es:[bx], 1                  
  05ce  c746f20000       mov word ptr [bp - 0xe], 0               
  05d3  b8042c           mov ax, 0x2c04                           
  05d6  8ec0             mov es, ax                               
  05d8  268b367b15       mov si, word ptr es:[0x157b]             
  05dd  e9a900           jmp 0x689                                
  05e0  8bc6             mov ax, si                               
  05e2  d1e0             shl ax, 1                                
  05e4  c41e0241         les bx, ptr [0x4102]                     
  05e8  03d8             add bx, ax                               
  05ea  26833f00         cmp word ptr es:[bx], 0                  
  05ee  7503             jne 0x5f3                                
  05f0  e99600           jmp 0x689                                
  05f3  2683bf900100     cmp word ptr es:[bx + 0x190], 0          
  05f9  7403             je 0x5fe                                 
  05fb  e98b00           jmp 0x689                                
  05fe  c746f20100       mov word ptr [bp - 0xe], 1               
  0603  268b87c800       mov ax, word ptr es:[bx + 0xc8]          
  0608  8946f0           mov word ptr [bp - 0x10], ax             
  060b  26c78790010100   mov word ptr es:[bx + 0x190], 1          
  0612  16               push ss                                  
  0613  8d46f4           lea ax, [bp - 0xc]                       
  0616  50               push ax                                  
  0617  16               push ss                                  
  0618  8d46fa           lea ax, [bp - 6]                         
  061b  50               push ax                                  
  061c  6a00             push 0                                   
  061e  56               push si                                  
  061f  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  0624  83c40c           add sp, 0xc                              
  0627  bf0600           mov di, 6                                
  062a  eb56             jmp 0x682                                
  062c  8a43fa           mov al, byte ptr [bp + di - 6]           
  062f  b400             mov ah, 0                                
  0631  8bc8             mov cx, ax                               
  0633  3dff00           cmp ax, 0xff                             
  0636  744a             je 0x682                                 
  0638  8a43f4           mov al, byte ptr [bp + di - 0xc]         
  063b  b400             mov ah, 0                                
  063d  8b56f0           mov dx, word ptr [bp - 0x10]             
  0640  03d0             add dx, ax                               
  0642  8956ee           mov word ptr [bp - 0x12], dx             
  0645  8bc1             mov ax, cx                               
  0647  d1e0             shl ax, 1                                
  0649  c41e0241         les bx, ptr [0x4102]                     
  064d  03d8             add bx, ax                               
  064f  26833f00         cmp word ptr es:[bx], 0                  
  0653  7507             jne 0x65c                                
  0655  26c7070100       mov word ptr es:[bx], 1                  
  065a  eb14             jmp 0x670                                
  065c  8bc1             mov ax, cx                               
  065e  d1e0             shl ax, 1                                
  0660  c41e0241         les bx, ptr [0x4102]                     
  0664  03d8             add bx, ax                               
  0666  268b87c800       mov ax, word ptr es:[bx + 0xc8]          
  066b  3b46ee           cmp ax, word ptr [bp - 0x12]             
  066e  7e12             jle 0x682                                
  0670  8bc1             mov ax, cx                               
  0672  d1e0             shl ax, 1                                
  0674  c41e0241         les bx, ptr [0x4102]                     
  0678  03d8             add bx, ax                               
  067a  8b46ee           mov ax, word ptr [bp - 0x12]             
  067d  268987c800       mov word ptr es:[bx + 0xc8], ax          
  0682  8bc7             mov ax, di                               
  0684  4f               dec di                                   
  0685  0bc0             or ax, ax                                
  0687  75a3             jne 0x62c                                
  0689  8bc6             mov ax, si                               
  068b  4e               dec si                                   
  068c  0bc0             or ax, ax                                
  068e  7403             je 0x693                                 
  0690  e94dff           jmp 0x5e0                                
  0693  837ef200         cmp word ptr [bp - 0xe], 0               
  0697  7403             je 0x69c                                 
  0699  e932ff           jmp 0x5ce                                
  069c  5f               pop di                                   
  069d  5e               pop si                                   
  069e  c9               leave                                    
  069f  cb               retf                                     

ovl27_06a0:  ; ENTRY
  06a0  55               push bp                                  
  06a1  8bec             mov bp, sp                               
  06a3  56               push si                                  
  06a4  57               push di                                  
  06a5  8b7e06           mov di, word ptr [bp + 6]                
  06a8  b8042c           mov ax, 0x2c04                           
  06ab  8ec0             mov es, ax                               
  06ad  268b1e1001       mov bx, word ptr es:[0x110]              
  06b2  d1e3             shl bx, 1                                
  06b4  b8042c           mov ax, 0x2c04                           
  06b7  8ec0             mov es, ax                               
  06b9  268b8fc000       mov cx, word ptr es:[bx + 0xc0]          
  06be  c41eee40         les bx, ptr [0x40ee]                     
  06c2  268b4702         mov ax, word ptr es:[bx + 2]             
  06c6  26f76f2c         imul word ptr es:[bx + 0x2c]             
  06ca  8bf0             mov si, ax                               
  06cc  b8042c           mov ax, 0x2c04                           
  06cf  8ec0             mov es, ax                               
  06d1  268b1e1001       mov bx, word ptr es:[0x110]              
  06d6  d1e3             shl bx, 1                                
  06d8  b8042c           mov ax, 0x2c04                           
  06db  8ec0             mov es, ax                               
  06dd  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  06e3  750a             jne 0x6ef                                
  06e5  c41eee40         les bx, ptr [0x40ee]                     
  06e9  2603772e         add si, word ptr es:[bx + 0x2e]          
  06ed  eb2a             jmp 0x719                                
  06ef  83f902           cmp cx, 2                                
  06f2  750a             jne 0x6fe                                
  06f4  c41eee40         les bx, ptr [0x40ee]                     
  06f8  26037730         add si, word ptr es:[bx + 0x30]          
  06fc  eb1b             jmp 0x719                                
  06fe  83f901           cmp cx, 1                                
  0701  750a             jne 0x70d                                
  0703  c41eee40         les bx, ptr [0x40ee]                     
  0707  26037732         add si, word ptr es:[bx + 0x32]          
  070b  eb0c             jmp 0x719                                
  070d  0bc9             or cx, cx                                
  070f  7508             jne 0x719                                
  0711  c41eee40         les bx, ptr [0x40ee]                     
  0715  26037734         add si, word ptr es:[bx + 0x34]          
  0719  8bc7             mov ax, di                               
  071b  6bc05c           imul ax, ax, 0x5c                        
  071e  c41eee40         les bx, ptr [0x40ee]                     
  0722  03d8             add bx, ax                               
  0724  26c787a6020000   mov word ptr es:[bx + 0x2a6], 0          
  072b  8b1eee40         mov bx, word ptr [0x40ee]                
  072f  26837f2600       cmp word ptr es:[bx + 0x26], 0           
  0734  742e             je 0x764                                 
  0736  6668e8030000     push 0x3e8                               
  073c  6a01             push 1                                   
  073e  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0743  83c406           add sp, 6                                
  0746  c41eee40         les bx, ptr [0x40ee]                     
  074a  268b5726         mov dx, word ptr es:[bx + 0x26]          
  074e  03d6             add dx, si                               
  0750  3bc2             cmp ax, dx                               
  0752  7d10             jge 0x764                                
  0754  8bc7             mov ax, di                               
  0756  6bc05c           imul ax, ax, 0x5c                        
  0759  03d8             add bx, ax                               
  075b  26838fa60201     or word ptr es:[bx + 0x2a6], 1           
  0761  e99000           jmp 0x7f4                                
  0764  b8042c           mov ax, 0x2c04                           
  0767  8ec0             mov es, ax                               
  0769  268b1e1001       mov bx, word ptr es:[0x110]              
  076e  6bdb14           imul bx, bx, 0x14                        
  0771  b8042c           mov ax, 0x2c04                           
  0774  8ec0             mov es, ax                               
  0776  2683bf850164     cmp word ptr es:[bx + 0x185], 0x64       
  077c  7d08             jge 0x786                                
  077e  c41eee40         les bx, ptr [0x40ee]                     
  0782  26037736         add si, word ptr es:[bx + 0x36]          
  0786  c41eee40         les bx, ptr [0x40ee]                     
  078a  26837f2800       cmp word ptr es:[bx + 0x28], 0           
  078f  742d             je 0x7be                                 
  0791  6668e8030000     push 0x3e8                               
  0797  6a01             push 1                                   
  0799  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  079e  83c406           add sp, 6                                
  07a1  c41eee40         les bx, ptr [0x40ee]                     
  07a5  268b5728         mov dx, word ptr es:[bx + 0x28]          
  07a9  03d6             add dx, si                               
  07ab  3bc2             cmp ax, dx                               
  07ad  7d0f             jge 0x7be                                
  07af  8bc7             mov ax, di                               
  07b1  6bc05c           imul ax, ax, 0x5c                        
  07b4  03d8             add bx, ax                               
  07b6  26838fa60202     or word ptr es:[bx + 0x2a6], 2           
  07bc  eb36             jmp 0x7f4                                
  07be  c41eee40         les bx, ptr [0x40ee]                     
  07c2  26837f2a00       cmp word ptr es:[bx + 0x2a], 0           
  07c7  742b             je 0x7f4                                 
  07c9  6668e8030000     push 0x3e8                               
  07cf  6a01             push 1                                   
  07d1  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  07d6  83c406           add sp, 6                                
  07d9  c41eee40         les bx, ptr [0x40ee]                     
  07dd  268b572a         mov dx, word ptr es:[bx + 0x2a]          
  07e1  03d6             add dx, si                               
  07e3  3bc2             cmp ax, dx                               
  07e5  7d0d             jge 0x7f4                                
  07e7  8bc7             mov ax, di                               
  07e9  6bc05c           imul ax, ax, 0x5c                        
  07ec  03d8             add bx, ax                               
  07ee  26838fa60204     or word ptr es:[bx + 0x2a6], 4           
  07f4  5f               pop di                                   
  07f5  5e               pop si                                   
  07f6  5d               pop bp                                   
  07f7  cb               retf                                     

ovl27_07f8:  ; ENTRY
  07f8  55               push bp                                  
  07f9  8bec             mov bp, sp                               
  07fb  c41eee40         les bx, ptr [0x40ee]                     
  07ff  268b974a02       mov dx, word ptr es:[bx + 0x24a]         
  0804  eb2d             jmp 0x833                                
  0806  8bc2             mov ax, dx                               
  0808  6bc05c           imul ax, ax, 0x5c                        
  080b  c41eee40         les bx, ptr [0x40ee]                     
  080f  03d8             add bx, ax                               
  0811  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0817  741a             je 0x833                                 
  0819  8bc2             mov ax, dx                               
  081b  6bc05c           imul ax, ax, 0x5c                        
  081e  8b1eee40         mov bx, word ptr [0x40ee]                
  0822  03d8             add bx, ax                               
  0824  268b875002       mov ax, word ptr es:[bx + 0x250]         
  0829  3b4606           cmp ax, word ptr [bp + 6]                
  082c  7505             jne 0x833                                
  082e  b80100           mov ax, 1                                
  0831  eb09             jmp 0x83c                                
  0833  8bc2             mov ax, dx                               
  0835  4a               dec dx                                   
  0836  0bc0             or ax, ax                                
  0838  75cc             jne 0x806                                
  083a  33c0             xor ax, ax                               
  083c  5d               pop bp                                   
  083d  cb               retf                                     

ovl27_083e:  ; ENTRY
  083e  55               push bp                                  
  083f  8bec             mov bp, sp                               
  0841  56               push si                                  
  0842  8b7606           mov si, word ptr [bp + 6]                
  0845  c41eee40         les bx, ptr [0x40ee]                     
  0849  268b974a02       mov dx, word ptr es:[bx + 0x24a]         
  084e  eb60             jmp 0x8b0                                
  0850  8bc2             mov ax, dx                               
  0852  6bc05c           imul ax, ax, 0x5c                        
  0855  c41eee40         les bx, ptr [0x40ee]                     
  0859  03d8             add bx, ax                               
  085b  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0861  744d             je 0x8b0                                 
  0863  b90400           mov cx, 4                                
  0866  eb41             jmp 0x8a9                                
  0868  8bc2             mov ax, dx                               
  086a  6bc05c           imul ax, ax, 0x5c                        
  086d  c41eee40         les bx, ptr [0x40ee]                     
  0871  03d8             add bx, ax                               
  0873  8bc1             mov ax, cx                               
  0875  d1e0             shl ax, 1                                
  0877  03d8             add bx, ax                               
  0879  2639b75202       cmp word ptr es:[bx + 0x252], si         
  087e  7529             jne 0x8a9                                
  0880  8bc2             mov ax, dx                               
  0882  6bc05c           imul ax, ax, 0x5c                        
  0885  8b1eee40         mov bx, word ptr [0x40ee]                
  0889  03d8             add bx, ax                               
  088b  8bc1             mov ax, cx                               
  088d  d1e0             shl ax, 1                                
  088f  03d8             add bx, ax                               
  0891  26c7875202ffff   mov word ptr es:[bx + 0x252], 0xffff     
  0898  8bde             mov bx, si                               
  089a  6bdb41           imul bx, bx, 0x41                        
  089d  b8042c           mov ax, 0x2c04                           
  08a0  8ec0             mov es, ax                               
  08a2  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  08a9  8bc1             mov ax, cx                               
  08ab  49               dec cx                                   
  08ac  0bc0             or ax, ax                                
  08ae  75b8             jne 0x868                                
  08b0  8bc2             mov ax, dx                               
  08b2  4a               dec dx                                   
  08b3  0bc0             or ax, ax                                
  08b5  7599             jne 0x850                                
  08b7  5e               pop si                                   
  08b8  5d               pop bp                                   
  08b9  cb               retf                                     

ovl27_08ba:  ; ENTRY
  08ba  55               push bp                                  
  08bb  8bec             mov bp, sp                               
  08bd  56               push si                                  
  08be  8b7606           mov si, word ptr [bp + 6]                
  08c1  8bc6             mov ax, si                               
  08c3  6bc05c           imul ax, ax, 0x5c                        
  08c6  c41eee40         les bx, ptr [0x40ee]                     
  08ca  03d8             add bx, ax                               
  08cc  26c7874c020000   mov word ptr es:[bx + 0x24c], 0          
  08d3  8bc6             mov ax, si                               
  08d5  6bc05c           imul ax, ax, 0x5c                        
  08d8  8b1eee40         mov bx, word ptr [0x40ee]                
  08dc  03d8             add bx, ax                               
  08de  b8ffff           mov ax, 0xffff                           
  08e1  2689874e02       mov word ptr es:[bx + 0x24e], ax         
  08e6  8bd6             mov dx, si                               
  08e8  6bd25c           imul dx, dx, 0x5c                        
  08eb  8b1eee40         mov bx, word ptr [0x40ee]                
  08ef  03da             add bx, dx                               
  08f1  2689875002       mov word ptr es:[bx + 0x250], ax         
  08f6  8bc6             mov ax, si                               
  08f8  6bc05c           imul ax, ax, 0x5c                        
  08fb  8b1eee40         mov bx, word ptr [0x40ee]                
  08ff  03d8             add bx, ax                               
  0901  33c0             xor ax, ax                               
  0903  268987a602       mov word ptr es:[bx + 0x2a6], ax         
  0908  8bd6             mov dx, si                               
  090a  6bd25c           imul dx, dx, 0x5c                        
  090d  8b1eee40         mov bx, word ptr [0x40ee]                
  0911  03da             add bx, dx                               
  0913  268987a402       mov word ptr es:[bx + 0x2a4], ax         
  0918  b90400           mov cx, 4                                
  091b  eb18             jmp 0x935                                
  091d  8bc6             mov ax, si                               
  091f  6bc05c           imul ax, ax, 0x5c                        
  0922  c41eee40         les bx, ptr [0x40ee]                     
  0926  03d8             add bx, ax                               
  0928  8bc1             mov ax, cx                               
  092a  d1e0             shl ax, 1                                
  092c  03d8             add bx, ax                               
  092e  26c7875202ffff   mov word ptr es:[bx + 0x252], 0xffff     
  0935  8bc1             mov ax, cx                               
  0937  49               dec cx                                   
  0938  0bc0             or ax, ax                                
  093a  75e1             jne 0x91d                                
  093c  b90600           mov cx, 6                                
  093f  eb5b             jmp 0x99c                                
  0941  8bc6             mov ax, si                               
  0943  6bc05c           imul ax, ax, 0x5c                        
  0946  c41eee40         les bx, ptr [0x40ee]                     
  094a  03d8             add bx, ax                               
  094c  8bc1             mov ax, cx                               
  094e  d1e0             shl ax, 1                                
  0950  03d8             add bx, ax                               
  0952  b8ffff           mov ax, 0xffff                           
  0955  2689877e02       mov word ptr es:[bx + 0x27e], ax         
  095a  8bd6             mov dx, si                               
  095c  6bd25c           imul dx, dx, 0x5c                        
  095f  8b1eee40         mov bx, word ptr [0x40ee]                
  0963  03da             add bx, dx                               
  0965  8bd1             mov dx, cx                               
  0967  d1e2             shl dx, 1                                
  0969  03da             add bx, dx                               
  096b  2689877202       mov word ptr es:[bx + 0x272], ax         
  0970  8bd6             mov dx, si                               
  0972  6bd25c           imul dx, dx, 0x5c                        
  0975  8b1eee40         mov bx, word ptr [0x40ee]                
  0979  03da             add bx, dx                               
  097b  8bd1             mov dx, cx                               
  097d  d1e2             shl dx, 1                                
  097f  03da             add bx, dx                               
  0981  2689879202       mov word ptr es:[bx + 0x292], ax         
  0986  8bd6             mov dx, si                               
  0988  6bd25c           imul dx, dx, 0x5c                        
  098b  8b1eee40         mov bx, word ptr [0x40ee]                
  098f  03da             add bx, dx                               
  0991  8bd1             mov dx, cx                               
  0993  d1e2             shl dx, 1                                
  0995  03da             add bx, dx                               
  0997  2689875a02       mov word ptr es:[bx + 0x25a], ax         
  099c  8bc1             mov ax, cx                               
  099e  49               dec cx                                   
  099f  0bc0             or ax, ax                                
  09a1  759e             jne 0x941                                
  09a3  b90400           mov cx, 4                                
  09a6  eb18             jmp 0x9c0                                
  09a8  8bc6             mov ax, si                               
  09aa  6bc05c           imul ax, ax, 0x5c                        
  09ad  c41eee40         les bx, ptr [0x40ee]                     
  09b1  03d8             add bx, ax                               
  09b3  8bc1             mov ax, cx                               
  09b5  d1e0             shl ax, 1                                
  09b7  03d8             add bx, ax                               
  09b9  26c7878a02ffff   mov word ptr es:[bx + 0x28a], 0xffff     
  09c0  8bc1             mov ax, cx                               
  09c2  49               dec cx                                   
  09c3  0bc0             or ax, ax                                
  09c5  75e1             jne 0x9a8                                
  09c7  5e               pop si                                   
  09c8  5d               pop bp                                   
  09c9  cb               retf                                     

ovl27_09ca:  ; ENTRY
  09ca  55               push bp                                  
  09cb  8bec             mov bp, sp                               
  09cd  83ec12           sub sp, 0x12                             
  09d0  56               push si                                  
  09d1  57               push di                                  
  09d2  8b4606           mov ax, word ptr [bp + 6]                
  09d5  6bc05c           imul ax, ax, 0x5c                        
  09d8  c41eee40         les bx, ptr [0x40ee]                     
  09dc  03d8             add bx, ax                               
  09de  268b874e02       mov ax, word ptr es:[bx + 0x24e]         
  09e3  8946fc           mov word ptr [bp - 4], ax                
  09e6  33f6             xor si, si                               
  09e8  e98300           jmp 0xa6e                                
  09eb  8b4606           mov ax, word ptr [bp + 6]                
  09ee  6bc05c           imul ax, ax, 0x5c                        
  09f1  c41eee40         les bx, ptr [0x40ee]                     
  09f5  03d8             add bx, ax                               
  09f7  8bc6             mov ax, si                               
  09f9  d1e0             shl ax, 1                                
  09fb  03d8             add bx, ax                               
  09fd  268b975a02       mov dx, word ptr es:[bx + 0x25a]         
  0a02  83faff           cmp dx, -1                               
  0a05  7466             je 0xa6d                                 
  0a07  c746ee0000       mov word ptr [bp - 0x12], 0              
  0a0c  16               push ss                                  
  0a0d  8d46f0           lea ax, [bp - 0x10]                      
  0a10  50               push ax                                  
  0a11  16               push ss                                  
  0a12  8d46f6           lea ax, [bp - 0xa]                       
  0a15  50               push ax                                  
  0a16  6a00             push 0                                   
  0a18  52               push dx                                  
  0a19  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  0a1e  83c40c           add sp, 0xc                              
  0a21  bf0600           mov di, 6                                
  0a24  eb26             jmp 0xa4c                                
  0a26  8a43f6           mov al, byte ptr [bp + di - 0xa]         
  0a29  b400             mov ah, 0                                
  0a2b  8946fe           mov word ptr [bp - 2], ax                
  0a2e  3dff00           cmp ax, 0xff                             
  0a31  7419             je 0xa4c                                 
  0a33  8b5efe           mov bx, word ptr [bp - 2]                
  0a36  6bdb41           imul bx, bx, 0x41                        
  0a39  b8042c           mov ax, 0x2c04                           
  0a3c  8ec0             mov es, ax                               
  0a3e  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0a43  98               cwde                                     
  0a44  3b46fc           cmp ax, word ptr [bp - 4]                
  0a47  7503             jne 0xa4c                                
  0a49  ff46ee           inc word ptr [bp - 0x12]                 
  0a4c  8bc7             mov ax, di                               
  0a4e  4f               dec di                                   
  0a4f  0bc0             or ax, ax                                
  0a51  75d3             jne 0xa26                                
  0a53  8b4606           mov ax, word ptr [bp + 6]                
  0a56  6bc05c           imul ax, ax, 0x5c                        
  0a59  c41eee40         les bx, ptr [0x40ee]                     
  0a5d  03d8             add bx, ax                               
  0a5f  8bc6             mov ax, si                               
  0a61  d1e0             shl ax, 1                                
  0a63  03d8             add bx, ax                               
  0a65  8b46ee           mov ax, word ptr [bp - 0x12]             
  0a68  2689877e02       mov word ptr es:[bx + 0x27e], ax         
  0a6d  46               inc si                                   
  0a6e  83fe06           cmp si, 6                                
  0a71  7d03             jge 0xa76                                
  0a73  e975ff           jmp 0x9eb                                
  0a76  5f               pop di                                   
  0a77  5e               pop si                                   
  0a78  c9               leave                                    
  0a79  cb               retf                                     

ovl27_0a7a:  ; ENTRY
  0a7a  55               push bp                                  
  0a7b  8bec             mov bp, sp                               
  0a7d  8b5606           mov dx, word ptr [bp + 6]                
  0a80  c41eee40         les bx, ptr [0x40ee]                     
  0a84  268b8f4a02       mov cx, word ptr es:[bx + 0x24a]         
  0a89  eb25             jmp 0xab0                                
  0a8b  8bc1             mov ax, cx                               
  0a8d  6bc05c           imul ax, ax, 0x5c                        
  0a90  c41eee40         les bx, ptr [0x40ee]                     
  0a94  03d8             add bx, ax                               
  0a96  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0a9c  7412             je 0xab0                                 
  0a9e  8bc1             mov ax, cx                               
  0aa0  6bc05c           imul ax, ax, 0x5c                        
  0aa3  8b1eee40         mov bx, word ptr [0x40ee]                
  0aa7  03d8             add bx, ax                               
  0aa9  2639975002       cmp word ptr es:[bx + 0x250], dx         
  0aae  7439             je 0xae9                                 
  0ab0  8bc1             mov ax, cx                               
  0ab2  49               dec cx                                   
  0ab3  0bc0             or ax, ax                                
  0ab5  75d4             jne 0xa8b                                
  0ab7  c41eee40         les bx, ptr [0x40ee]                     
  0abb  03da             add bx, dx                               
  0abd  26807f5608       cmp byte ptr es:[bx + 0x56], 8           
  0ac2  740d             je 0xad1                                 
  0ac4  8b1eee40         mov bx, word ptr [0x40ee]                
  0ac8  03da             add bx, dx                               
  0aca  26807f5605       cmp byte ptr es:[bx + 0x56], 5           
  0acf  7505             jne 0xad6                                
  0ad1  b80100           mov ax, 1                                
  0ad4  eb15             jmp 0xaeb                                
  0ad6  837e0800         cmp word ptr [bp + 8], 0                 
  0ada  740d             je 0xae9                                 
  0adc  c41eee40         les bx, ptr [0x40ee]                     
  0ae0  03da             add bx, dx                               
  0ae2  26807f5606       cmp byte ptr es:[bx + 0x56], 6           
  0ae7  74e8             je 0xad1                                 
  0ae9  33c0             xor ax, ax                               
  0aeb  5d               pop bp                                   
  0aec  cb               retf                                     

ovl27_0aed:  ; ENTRY
  0aed  55               push bp                                  
  0aee  8bec             mov bp, sp                               
  0af0  56               push si                                  
  0af1  b8042c           mov ax, 0x2c04                           
  0af4  8ec0             mov es, ax                               
  0af6  268b0e7b15       mov cx, word ptr es:[0x157b]             
  0afb  eb45             jmp 0xb42                                
  0afd  8bd9             mov bx, cx                               
  0aff  6bdb41           imul bx, bx, 0x41                        
  0b02  b8042c           mov ax, 0x2c04                           
  0b05  8ec0             mov es, ax                               
  0b07  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0b0c  98               cwde                                     
  0b0d  ba042c           mov dx, 0x2c04                           
  0b10  8ec2             mov es, dx                               
  0b12  263b061001       cmp ax, word ptr es:[0x110]              
  0b17  7529             jne 0xb42                                
  0b19  c41eee40         les bx, ptr [0x40ee]                     
  0b1d  03d9             add bx, cx                               
  0b1f  26807f5606       cmp byte ptr es:[bx + 0x56], 6           
  0b24  751c             jne 0xb42                                
  0b26  c41eee40         les bx, ptr [0x40ee]                     
  0b2a  03d9             add bx, cx                               
  0b2c  26c6475608       mov byte ptr es:[bx + 0x56], 8           
  0b31  8bd9             mov bx, cx                               
  0b33  6bdb41           imul bx, bx, 0x41                        
  0b36  b8042c           mov ax, 0x2c04                           
  0b39  8ec0             mov es, ax                               
  0b3b  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  0b42  8bc1             mov ax, cx                               
  0b44  49               dec cx                                   
  0b45  0bc0             or ax, ax                                
  0b47  75b4             jne 0xafd                                
  0b49  be0400           mov si, 4                                
  0b4c  eb1a             jmp 0xb68                                
  0b4e  8bc6             mov ax, si                               
  0b50  6bc05c           imul ax, ax, 0x5c                        
  0b53  c41eee40         les bx, ptr [0x40ee]                     
  0b57  03d8             add bx, ax                               
  0b59  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0b5f  7407             je 0xb68                                 
  0b61  56               push si                                  
  0b62  90               nop                                      
  0b63  0e               push cs                                  
  0b64  e80b00           call 0xb72                               
  0b67  59               pop cx                                   
  0b68  8bc6             mov ax, si                               
  0b6a  4e               dec si                                   
  0b6b  0bc0             or ax, ax                                
  0b6d  75df             jne 0xb4e                                
  0b6f  5e               pop si                                   
  0b70  5d               pop bp                                   
  0b71  cb               retf                                     

ovl27_0b72:  ; ENTRY
  0b72  55               push bp                                  
  0b73  8bec             mov bp, sp                               
  0b75  83ec22           sub sp, 0x22                             
  0b78  56               push si                                  
  0b79  57               push di                                  
  0b7a  8b7e06           mov di, word ptr [bp + 6]                
  0b7d  8bc7             mov ax, di                               
  0b7f  6bc05c           imul ax, ax, 0x5c                        
  0b82  8b16f040         mov dx, word ptr [0x40f0]                
  0b86  8b1eee40         mov bx, word ptr [0x40ee]                
  0b8a  03d8             add bx, ax                               
  0b8c  81c35202         add bx, 0x252                            
  0b90  8956e4           mov word ptr [bp - 0x1c], dx             
  0b93  895ee2           mov word ptr [bp - 0x1e], bx             
  0b96  8bc7             mov ax, di                               
  0b98  6bc05c           imul ax, ax, 0x5c                        
  0b9b  c41eee40         les bx, ptr [0x40ee]                     
  0b9f  03d8             add bx, ax                               
  0ba1  26f787a6021000   test word ptr es:[bx + 0x2a6], 0x10      
  0ba8  7407             je 0xbb1                                 
  0baa  c746e00c00       mov word ptr [bp - 0x20], 0xc            
  0baf  eb2e             jmp 0xbdf                                
  0bb1  8bc7             mov ax, di                               
  0bb3  6bc05c           imul ax, ax, 0x5c                        
  0bb6  c41eee40         les bx, ptr [0x40ee]                     
  0bba  03d8             add bx, ax                               
  0bbc  26f787a6020800   test word ptr es:[bx + 0x2a6], 8         
  0bc3  7407             je 0xbcc                                 
  0bc5  c746e01000       mov word ptr [bp - 0x20], 0x10           
  0bca  eb13             jmp 0xbdf                                
  0bcc  8bc7             mov ax, di                               
  0bce  6bc05c           imul ax, ax, 0x5c                        
  0bd1  c41eee40         les bx, ptr [0x40ee]                     
  0bd5  03d8             add bx, ax                               
  0bd7  268b87a402       mov ax, word ptr es:[bx + 0x2a4]         
  0bdc  8946e0           mov word ptr [bp - 0x20], ax             
  0bdf  be0400           mov si, 4                                
  0be2  eb33             jmp 0xc17                                
  0be4  8bde             mov bx, si                               
  0be6  d1e3             shl bx, 1                                
  0be8  8d46e6           lea ax, [bp - 0x1a]                      
  0beb  03d8             add bx, ax                               
  0bed  b8ffff           mov ax, 0xffff                           
  0bf0  368907           mov word ptr ss:[bx], ax                 
  0bf3  8bde             mov bx, si                               
  0bf5  d1e3             shl bx, 1                                
  0bf7  8d56ee           lea dx, [bp - 0x12]                      
  0bfa  03da             add bx, dx                               
  0bfc  368907           mov word ptr ss:[bx], ax                 
  0bff  8bde             mov bx, si                               
  0c01  d1e3             shl bx, 1                                
  0c03  8d56f6           lea dx, [bp - 0xa]                       
  0c06  03da             add bx, dx                               
  0c08  368907           mov word ptr ss:[bx], ax                 
  0c0b  8bd6             mov dx, si                               
  0c0d  d1e2             shl dx, 1                                
  0c0f  c45ee2           les bx, ptr [bp - 0x1e]                  
  0c12  03da             add bx, dx                               
  0c14  268907           mov word ptr es:[bx], ax                 
  0c17  8bc6             mov ax, si                               
  0c19  4e               dec si                                   
  0c1a  0bc0             or ax, ax                                
  0c1c  75c6             jne 0xbe4                                
  0c1e  b8042c           mov ax, 0x2c04                           
  0c21  8ec0             mov es, ax                               
  0c23  268b367b15       mov si, word ptr es:[0x157b]             
  0c28  e99e01           jmp 0xdc9                                
  0c2b  8bde             mov bx, si                               
  0c2d  6bdb41           imul bx, bx, 0x41                        
  0c30  b8042c           mov ax, 0x2c04                           
  0c33  8ec0             mov es, ax                               
  0c35  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0c3a  98               cwde                                     
  0c3b  ba042c           mov dx, 0x2c04                           
  0c3e  8ec2             mov es, dx                               
  0c40  263b061001       cmp ax, word ptr es:[0x110]              
  0c45  7403             je 0xc4a                                 
  0c47  e97f01           jmp 0xdc9                                
  0c4a  6a00             push 0                                   
  0c4c  56               push si                                  
  0c4d  0e               push cs                                  
  0c4e  e829fe           call 0xa7a                               
  0c51  83c404           add sp, 4                                
  0c54  0bc0             or ax, ax                                
  0c56  7503             jne 0xc5b                                
  0c58  e96e01           jmp 0xdc9                                
  0c5b  8bc7             mov ax, di                               
  0c5d  6bc05c           imul ax, ax, 0x5c                        
  0c60  c41eee40         les bx, ptr [0x40ee]                     
  0c64  03d8             add bx, ax                               
  0c66  26f787a6021000   test word ptr es:[bx + 0x2a6], 0x10      
  0c6d  7415             je 0xc84                                 
  0c6f  8b1eee40         mov bx, word ptr [0x40ee]                
  0c73  03de             add bx, si                               
  0c75  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  0c7a  b400             mov ah, 0                                
  0c7c  a90800           test ax, 8                               
  0c7f  7503             jne 0xc84                                
  0c81  e94501           jmp 0xdc9                                
  0c84  8bc7             mov ax, di                               
  0c86  6bc05c           imul ax, ax, 0x5c                        
  0c89  c41eee40         les bx, ptr [0x40ee]                     
  0c8d  03d8             add bx, ax                               
  0c8f  26f787a6020800   test word ptr es:[bx + 0x2a6], 8         
  0c96  7415             je 0xcad                                 
  0c98  8b1eee40         mov bx, word ptr [0x40ee]                
  0c9c  03de             add bx, si                               
  0c9e  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  0ca3  b400             mov ah, 0                                
  0ca5  a98000           test ax, 0x80                            
  0ca8  7503             jne 0xcad                                
  0caa  e91c01           jmp 0xdc9                                
  0cad  8bc7             mov ax, di                               
  0caf  6bc05c           imul ax, ax, 0x5c                        
  0cb2  c41eee40         les bx, ptr [0x40ee]                     
  0cb6  03d8             add bx, ax                               
  0cb8  26f787a6022000   test word ptr es:[bx + 0x2a6], 0x20      
  0cbf  7415             je 0xcd6                                 
  0cc1  8b1eee40         mov bx, word ptr [0x40ee]                
  0cc5  03de             add bx, si                               
  0cc7  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  0ccc  b400             mov ah, 0                                
  0cce  a94000           test ax, 0x40                            
  0cd1  7503             jne 0xcd6                                
  0cd3  e9f300           jmp 0xdc9                                
  0cd6  8bc7             mov ax, di                               
  0cd8  6bc05c           imul ax, ax, 0x5c                        
  0cdb  c41eee40         les bx, ptr [0x40ee]                     
  0cdf  03d8             add bx, ax                               
  0ce1  26f787a6023800   test word ptr es:[bx + 0x2a6], 0x38      
  0ce8  7511             jne 0xcfb                                
  0cea  8b1eee40         mov bx, word ptr [0x40ee]                
  0cee  03de             add bx, si                               
  0cf0  26f6871e01c8     test byte ptr es:[bx + 0x11e], 0xc8       ; "Quest"
  0cf6  7403             je 0xcfb                                 
  0cf8  e9ce00           jmp 0xdc9                                
  0cfb  16               push ss                                  
  0cfc  8d46fe           lea ax, [bp - 2]                         
  0cff  50               push ax                                  
  0d00  56               push si                                  
  0d01  9a8400f72f       lcall 0x2ff7, 0x84                       -> ovl29:1a4d
  0d06  83c406           add sp, 6                                
  0d09  0bc0             or ax, ax                                
  0d0b  7503             jne 0xd10                                
  0d0d  e9b900           jmp 0xdc9                                
  0d10  8bde             mov bx, si                               
  0d12  6bdb41           imul bx, bx, 0x41                        
  0d15  035efe           add bx, word ptr [bp - 2]                
  0d18  b8042c           mov ax, 0x2c04                           
  0d1b  8ec0             mov es, ax                               
  0d1d  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0d22  98               cwde                                     
  0d23  3b46e0           cmp ax, word ptr [bp - 0x20]             
  0d26  7d03             jge 0xd2b                                
  0d28  e99e00           jmp 0xdc9                                
  0d2b  b9ffff           mov cx, 0xffff                           
  0d2e  c746de6400       mov word ptr [bp - 0x22], 0x64           
  0d33  33d2             xor dx, dx                               
  0d35  eb36             jmp 0xd6d                                
  0d37  8bc2             mov ax, dx                               
  0d39  d1e0             shl ax, 1                                
  0d3b  c45ee2           les bx, ptr [bp - 0x1e]                  
  0d3e  03d8             add bx, ax                               
  0d40  26833fff         cmp word ptr es:[bx], -1                 
  0d44  7504             jne 0xd4a                                
  0d46  8bca             mov cx, dx                               
  0d48  eb28             jmp 0xd72                                
  0d4a  8bda             mov bx, dx                               
  0d4c  d1e3             shl bx, 1                                
  0d4e  8d46f6           lea ax, [bp - 0xa]                       
  0d51  03d8             add bx, ax                               
  0d53  368b07           mov ax, word ptr ss:[bx]                 
  0d56  3b46de           cmp ax, word ptr [bp - 0x22]             
  0d59  7d11             jge 0xd6c                                
  0d5b  8bca             mov cx, dx                               
  0d5d  8bda             mov bx, dx                               
  0d5f  d1e3             shl bx, 1                                
  0d61  8d46f6           lea ax, [bp - 0xa]                       
  0d64  03d8             add bx, ax                               
  0d66  368b07           mov ax, word ptr ss:[bx]                 
  0d69  8946de           mov word ptr [bp - 0x22], ax             
  0d6c  42               inc dx                                   
  0d6d  83fa04           cmp dx, 4                                
  0d70  7cc5             jl 0xd37                                 
  0d72  83f9ff           cmp cx, -1                               
  0d75  7452             je 0xdc9                                 
  0d77  8bc1             mov ax, cx                               
  0d79  d1e0             shl ax, 1                                
  0d7b  c45ee2           les bx, ptr [bp - 0x1e]                  
  0d7e  03d8             add bx, ax                               
  0d80  26833fff         cmp word ptr es:[bx], -1                 
  0d84  7418             je 0xd9e                                 
  0d86  8bde             mov bx, si                               
  0d88  6bdb41           imul bx, bx, 0x41                        
  0d8b  035efe           add bx, word ptr [bp - 2]                
  0d8e  b8042c           mov ax, 0x2c04                           
  0d91  8ec0             mov es, ax                               
  0d93  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0d98  98               cwde                                     
  0d99  3b46de           cmp ax, word ptr [bp - 0x22]             
  0d9c  7c2b             jl 0xdc9                                 
  0d9e  8bc1             mov ax, cx                               
  0da0  d1e0             shl ax, 1                                
  0da2  c45ee2           les bx, ptr [bp - 0x1e]                  
  0da5  03d8             add bx, ax                               
  0da7  268937           mov word ptr es:[bx], si                 
  0daa  8bde             mov bx, si                               
  0dac  6bdb41           imul bx, bx, 0x41                        
  0daf  035efe           add bx, word ptr [bp - 2]                
  0db2  b8042c           mov ax, 0x2c04                           
  0db5  8ec0             mov es, ax                               
  0db7  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0dbc  98               cwde                                     
  0dbd  8bd9             mov bx, cx                               
  0dbf  d1e3             shl bx, 1                                
  0dc1  8d56f6           lea dx, [bp - 0xa]                       
  0dc4  03da             add bx, dx                               
  0dc6  368907           mov word ptr ss:[bx], ax                 
  0dc9  8bc6             mov ax, si                               
  0dcb  4e               dec si                                   
  0dcc  0bc0             or ax, ax                                
  0dce  7403             je 0xdd3                                 
  0dd0  e958fe           jmp 0xc2b                                
  0dd3  33f6             xor si, si                               
  0dd5  eb24             jmp 0xdfb                                
  0dd7  8bc6             mov ax, si                               
  0dd9  d1e0             shl ax, 1                                
  0ddb  c45ee2           les bx, ptr [bp - 0x1e]                  
  0dde  03d8             add bx, ax                               
  0de0  26833fff         cmp word ptr es:[bx], -1                 
  0de4  7414             je 0xdfa                                 
  0de6  06               push es                                  
  0de7  c406ee40         les ax, ptr [0x40ee]                     
  0deb  8cc2             mov dx, es                               
  0ded  07               pop es                                   
  0dee  260307           add ax, word ptr es:[bx]                 
  0df1  8bd8             mov bx, ax                               
  0df3  8ec2             mov es, dx                               
  0df5  26c6475606       mov byte ptr es:[bx + 0x56], 6           
  0dfa  46               inc si                                   
  0dfb  83fe04           cmp si, 4                                
  0dfe  7cd7             jl 0xdd7                                 
  0e00  5f               pop di                                   
  0e01  5e               pop si                                   
  0e02  c9               leave                                    
  0e03  cb               retf                                     

ovl27_0e04:  ; ENTRY
  0e04  55               push bp                                  
  0e05  8bec             mov bp, sp                               
  0e07  81ecce00         sub sp, 0xce                              ; "%s's Quest"
  0e0b  56               push si                                  
  0e0c  57               push di                                  
  0e0d  c746fe0200       mov word ptr [bp - 2], 2                 
  0e12  c746fc0400       mov word ptr [bp - 4], 4                 
  0e17  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  0e1c  b8042c           mov ax, 0x2c04                           
  0e1f  8ec0             mov es, ax                               
  0e21  268b1e1001       mov bx, word ptr es:[0x110]              
  0e26  6bdb14           imul bx, bx, 0x14                        
  0e29  b8042c           mov ax, 0x2c04                           
  0e2c  8ec0             mov es, ax                               
  0e2e  26ffb79501       push word ptr es:[bx + 0x195]            
  0e33  b8042c           mov ax, 0x2c04                           
  0e36  8ec0             mov es, ax                               
  0e38  268b1e1001       mov bx, word ptr es:[0x110]              
  0e3d  6bdb14           imul bx, bx, 0x14                        
  0e40  b8042c           mov ax, 0x2c04                           
  0e43  8ec0             mov es, ax                               
  0e45  26ffb79301       push word ptr es:[bx + 0x193]            
  0e4a  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0e4f  83c404           add sp, 4                                
  0e52  8946f4           mov word ptr [bp - 0xc], ax              
  0e55  b8042c           mov ax, 0x2c04                           
  0e58  8ec0             mov es, ax                               
  0e5a  268b1e1001       mov bx, word ptr es:[0x110]              
  0e5f  d1e3             shl bx, 1                                
  0e61  b8042c           mov ax, 0x2c04                           
  0e64  8ec0             mov es, ax                               
  0e66  268b87e310       mov ax, word ptr es:[bx + 0x10e3]        
  0e6b  8946f2           mov word ptr [bp - 0xe], ax              
  0e6e  bf0800           mov di, 8                                
  0e71  eb7e             jmp 0xef1                                
  0e73  8bdf             mov bx, di                               
  0e75  d1e3             shl bx, 1                                
  0e77  8d46a2           lea ax, [bp - 0x5e]                      
  0e7a  03d8             add bx, ax                               
  0e7c  33c0             xor ax, ax                               
  0e7e  368907           mov word ptr ss:[bx], ax                 
  0e81  8bdf             mov bx, di                               
  0e83  d1e3             shl bx, 1                                
  0e85  8d9642ff         lea dx, [bp - 0xbe]                      
  0e89  03da             add bx, dx                               
  0e8b  368907           mov word ptr ss:[bx], ax                 
  0e8e  8bdf             mov bx, di                               
  0e90  d1e3             shl bx, 1                                
  0e92  8d56d2           lea dx, [bp - 0x2e]                      
  0e95  03da             add bx, dx                               
  0e97  368907           mov word ptr ss:[bx], ax                 
  0e9a  8bdf             mov bx, di                               
  0e9c  d1e3             shl bx, 1                                
  0e9e  8d9672ff         lea dx, [bp - 0x8e]                      
  0ea2  03da             add bx, dx                               
  0ea4  368907           mov word ptr ss:[bx], ax                 
  0ea7  8bdf             mov bx, di                               
  0ea9  d1e3             shl bx, 1                                
  0eab  8d56b2           lea dx, [bp - 0x4e]                      
  0eae  03da             add bx, dx                               
  0eb0  368907           mov word ptr ss:[bx], ax                 
  0eb3  8bdf             mov bx, di                               
  0eb5  d1e3             shl bx, 1                                
  0eb7  8d56c2           lea dx, [bp - 0x3e]                      
  0eba  03da             add bx, dx                               
  0ebc  368907           mov word ptr ss:[bx], ax                 
  0ebf  8bdf             mov bx, di                               
  0ec1  d1e3             shl bx, 1                                
  0ec3  8d9652ff         lea dx, [bp - 0xae]                      
  0ec7  03da             add bx, dx                               
  0ec9  368907           mov word ptr ss:[bx], ax                 
  0ecc  666a0a           push 0xa                                 
  0ecf  6a01             push 1                                   
  0ed1  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0ed6  83c406           add sp, 6                                
  0ed9  8bdf             mov bx, di                               
  0edb  d1e3             shl bx, 1                                
  0edd  8d5692           lea dx, [bp - 0x6e]                      
  0ee0  03da             add bx, dx                               
  0ee2  368907           mov word ptr ss:[bx], ax                 
  0ee5  8bdf             mov bx, di                               
  0ee7  d1e3             shl bx, 1                                
  0ee9  8d4682           lea ax, [bp - 0x7e]                      
  0eec  03d8             add bx, ax                               
  0eee  36893f           mov word ptr ss:[bx], di                 
  0ef1  8bc7             mov ax, di                               
  0ef3  4f               dec di                                   
  0ef4  0bc0             or ax, ax                                
  0ef6  7403             je 0xefb                                 
  0ef8  e978ff           jmp 0xe73                                
  0efb  b8042c           mov ax, 0x2c04                           
  0efe  8ec0             mov es, ax                               
  0f00  268b367b15       mov si, word ptr es:[0x157b]             
  0f05  e92c01           jmp 0x1034                               
  0f08  8bde             mov bx, si                               
  0f0a  6bdb41           imul bx, bx, 0x41                        
  0f0d  b8042c           mov ax, 0x2c04                           
  0f10  8ec0             mov es, ax                               
  0f12  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  0f18  7503             jne 0xf1d                                
  0f1a  e91701           jmp 0x1034                               
  0f1d  8bde             mov bx, si                               
  0f1f  6bdb41           imul bx, bx, 0x41                        
  0f22  b8042c           mov ax, 0x2c04                           
  0f25  8ec0             mov es, ax                               
  0f27  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0f2c  98               cwde                                     
  0f2d  d1e0             shl ax, 1                                
  0f2f  8d56d2           lea dx, [bp - 0x2e]                      
  0f32  03c2             add ax, dx                               
  0f34  8bd8             mov bx, ax                               
  0f36  36ff07           inc word ptr ss:[bx]                     
  0f39  c41eee40         les bx, ptr [0x40ee]                     
  0f3d  03de             add bx, si                               
  0f3f  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  0f44  b400             mov ah, 0                                
  0f46  a90100           test ax, 1                               
  0f49  751c             jne 0xf67                                
  0f4b  8bde             mov bx, si                               
  0f4d  6bdb41           imul bx, bx, 0x41                        
  0f50  b8042c           mov ax, 0x2c04                           
  0f53  8ec0             mov es, ax                               
  0f55  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0f5a  98               cwde                                     
  0f5b  d1e0             shl ax, 1                                
  0f5d  8d56a2           lea dx, [bp - 0x5e]                      
  0f60  03c2             add ax, dx                               
  0f62  8bd8             mov bx, ax                               
  0f64  36ff07           inc word ptr ss:[bx]                     
  0f67  8bde             mov bx, si                               
  0f69  6bdb41           imul bx, bx, 0x41                        
  0f6c  b8042c           mov ax, 0x2c04                           
  0f6f  8ec0             mov es, ax                               
  0f71  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0f76  98               cwde                                     
  0f77  ba042c           mov dx, 0x2c04                           
  0f7a  8ec2             mov es, dx                               
  0f7c  263b061001       cmp ax, word ptr es:[0x110]              
  0f81  7403             je 0xf86                                 
  0f83  e9ae00           jmp 0x1034                               
  0f86  8bde             mov bx, si                               
  0f88  6bdb41           imul bx, bx, 0x41                        
  0f8b  b8042c           mov ax, 0x2c04                           
  0f8e  8ec0             mov es, ax                               
  0f90  2680bfac150f     cmp byte ptr es:[bx + 0x15ac], 0xf       
  0f96  741a             je 0xfb2                                 
  0f98  8bde             mov bx, si                               
  0f9a  6bdb41           imul bx, bx, 0x41                        
  0f9d  8ec0             mov es, ax                               
  0f9f  268a87ac15       mov al, byte ptr es:[bx + 0x15ac]        
  0fa4  b400             mov ah, 0                                
  0fa6  d1e0             shl ax, 1                                
  0fa8  8d56c2           lea dx, [bp - 0x3e]                      
  0fab  03c2             add ax, dx                               
  0fad  8bd8             mov bx, ax                               
  0faf  36ff07           inc word ptr ss:[bx]                     
  0fb2  16               push ss                                  
  0fb3  8d46e6           lea ax, [bp - 0x1a]                      
  0fb6  50               push ax                                  
  0fb7  16               push ss                                  
  0fb8  8d46ec           lea ax, [bp - 0x14]                      
  0fbb  50               push ax                                  
  0fbc  6a00             push 0                                   
  0fbe  56               push si                                  
  0fbf  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  0fc4  83c40c           add sp, 0xc                              
  0fc7  bf0600           mov di, 6                                
  0fca  eb61             jmp 0x102d                               
  0fcc  8a43ec           mov al, byte ptr [bp + di - 0x14]        
  0fcf  b400             mov ah, 0                                
  0fd1  8bc8             mov cx, ax                               
  0fd3  3dff00           cmp ax, 0xff                             
  0fd6  7455             je 0x102d                                
  0fd8  8bd9             mov bx, cx                               
  0fda  6bdb41           imul bx, bx, 0x41                        
  0fdd  b8042c           mov ax, 0x2c04                           
  0fe0  8ec0             mov es, ax                               
  0fe2  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0fe7  98               cwde                                     
  0fe8  ba042c           mov dx, 0x2c04                           
  0feb  8ec2             mov es, dx                               
  0fed  263b061001       cmp ax, word ptr es:[0x110]              
  0ff2  7439             je 0x102d                                
  0ff4  8bd9             mov bx, cx                               
  0ff6  6bdb41           imul bx, bx, 0x41                        
  0ff9  b8042c           mov ax, 0x2c04                           
  0ffc  8ec0             mov es, ax                               
  0ffe  268a87ac15       mov al, byte ptr es:[bx + 0x15ac]        
  1003  b400             mov ah, 0                                
  1005  ba042c           mov dx, 0x2c04                           
  1008  8ec2             mov es, dx                               
  100a  263b061001       cmp ax, word ptr es:[0x110]              
  100f  751c             jne 0x102d                               
  1011  8bde             mov bx, si                               
  1013  6bdb41           imul bx, bx, 0x41                        
  1016  b8042c           mov ax, 0x2c04                           
  1019  8ec0             mov es, ax                               
  101b  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1020  98               cwde                                     
  1021  d1e0             shl ax, 1                                
  1023  8d56b2           lea dx, [bp - 0x4e]                      
  1026  03c2             add ax, dx                               
  1028  8bd8             mov bx, ax                               
  102a  36ff07           inc word ptr ss:[bx]                     
  102d  8bc7             mov ax, di                               
  102f  4f               dec di                                   
  1030  0bc0             or ax, ax                                
  1032  7598             jne 0xfcc                                
  1034  8bc6             mov ax, si                               
  1036  4e               dec si                                   
  1037  0bc0             or ax, ax                                
  1039  7403             je 0x103e                                
  103b  e9cafe           jmp 0xf08                                
  103e  c746fa0000       mov word ptr [bp - 6], 0                 
  1043  c41eee40         les bx, ptr [0x40ee]                     
  1047  268bbf4a02       mov di, word ptr es:[bx + 0x24a]         
  104c  eb31             jmp 0x107f                               
  104e  8bc7             mov ax, di                               
  1050  6bc05c           imul ax, ax, 0x5c                        
  1053  c41eee40         les bx, ptr [0x40ee]                     
  1057  03d8             add bx, ax                               
  1059  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  105f  741e             je 0x107f                                
  1061  8bc7             mov ax, di                               
  1063  6bc05c           imul ax, ax, 0x5c                        
  1066  8b1eee40         mov bx, word ptr [0x40ee]                
  106a  03d8             add bx, ax                               
  106c  268b9f4e02       mov bx, word ptr es:[bx + 0x24e]         
  1071  d1e3             shl bx, 1                                
  1073  8d8652ff         lea ax, [bp - 0xae]                      
  1077  03d8             add bx, ax                               
  1079  36ff07           inc word ptr ss:[bx]                     
  107c  ff46fa           inc word ptr [bp - 6]                    
  107f  8bc7             mov ax, di                               
  1081  4f               dec di                                   
  1082  0bc0             or ax, ax                                
  1084  75c8             jne 0x104e                               
  1086  8b5ef4           mov bx, word ptr [bp - 0xc]              
  1089  6bdb41           imul bx, bx, 0x41                        
  108c  b8042c           mov ax, 0x2c04                           
  108f  8ec0             mov es, ax                               
  1091  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  1097  7439             je 0x10d2                                
  1099  8b5ef4           mov bx, word ptr [bp - 0xc]              
  109c  6bdb41           imul bx, bx, 0x41                        
  109f  8ec0             mov es, ax                               
  10a1  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  10a6  98               cwde                                     
  10a7  ba042c           mov dx, 0x2c04                           
  10aa  8ec2             mov es, dx                               
  10ac  263b061001       cmp ax, word ptr es:[0x110]              
  10b1  741f             je 0x10d2                                
  10b3  8b5ef4           mov bx, word ptr [bp - 0xc]              
  10b6  6bdb41           imul bx, bx, 0x41                        
  10b9  b8042c           mov ax, 0x2c04                           
  10bc  8ec0             mov es, ax                               
  10be  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  10c3  98               cwde                                     
  10c4  d1e0             shl ax, 1                                
  10c6  8d9642ff         lea dx, [bp - 0xbe]                      
  10ca  03c2             add ax, dx                               
  10cc  8bd8             mov bx, ax                               
  10ce  36830714         add word ptr ss:[bx], 0x14               
  10d2  c746f80000       mov word ptr [bp - 8], 0                 
  10d7  bf0800           mov di, 8                                
  10da  eb73             jmp 0x114f                               
  10dc  8bdf             mov bx, di                               
  10de  d1e3             shl bx, 1                                
  10e0  8d46d2           lea ax, [bp - 0x2e]                      
  10e3  03d8             add bx, ax                               
  10e5  36833f00         cmp word ptr ss:[bx], 0                  
  10e9  7464             je 0x114f                                
  10eb  b8042c           mov ax, 0x2c04                           
  10ee  8ec0             mov es, ax                               
  10f0  26393e1001       cmp word ptr es:[0x110], di              
  10f5  7403             je 0x10fa                                
  10f7  ff46f8           inc word ptr [bp - 8]                    
  10fa  8bdf             mov bx, di                               
  10fc  6bdb14           imul bx, bx, 0x14                        
  10ff  b8042c           mov ax, 0x2c04                           
  1102  8ec0             mov es, ax                               
  1104  26ffb79501       push word ptr es:[bx + 0x195]            
  1109  8bdf             mov bx, di                               
  110b  6bdb14           imul bx, bx, 0x14                        
  110e  b8042c           mov ax, 0x2c04                           
  1111  8ec0             mov es, ax                               
  1113  26ffb79301       push word ptr es:[bx + 0x193]            
  1118  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  111d  83c404           add sp, 4                                
  1120  8946e4           mov word ptr [bp - 0x1c], ax             
  1123  8b5ee4           mov bx, word ptr [bp - 0x1c]             
  1126  6bdb41           imul bx, bx, 0x41                        
  1129  b8042c           mov ax, 0x2c04                           
  112c  8ec0             mov es, ax                               
  112e  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1133  98               cwde                                     
  1134  ba042c           mov dx, 0x2c04                           
  1137  8ec2             mov es, dx                               
  1139  263b061001       cmp ax, word ptr es:[0x110]              
  113e  750f             jne 0x114f                               
  1140  8bdf             mov bx, di                               
  1142  d1e3             shl bx, 1                                
  1144  8d8672ff         lea ax, [bp - 0x8e]                      
  1148  03d8             add bx, ax                               
  114a  36c7070100       mov word ptr ss:[bx], 1                  
  114f  8bc7             mov ax, di                               
  1151  4f               dec di                                   
  1152  0bc0             or ax, ax                                
  1154  7586             jne 0x10dc                               
  1156  bf0800           mov di, 8                                
  1159  e9fa01           jmp 0x1356                               
  115c  8bdf             mov bx, di                               
  115e  d1e3             shl bx, 1                                
  1160  8d4692           lea ax, [bp - 0x6e]                      
  1163  03d8             add bx, ax                               
  1165  368b07           mov ax, word ptr ss:[bx]                 
  1168  8bdf             mov bx, di                               
  116a  d1e3             shl bx, 1                                
  116c  8d9642ff         lea dx, [bp - 0xbe]                      
  1170  03da             add bx, dx                               
  1172  360107           add word ptr ss:[bx], ax                 
  1175  8bdf             mov bx, di                               
  1177  d1e3             shl bx, 1                                
  1179  8d8672ff         lea ax, [bp - 0x8e]                      
  117d  03d8             add bx, ax                               
  117f  368b07           mov ax, word ptr ss:[bx]                 
  1182  6bc00f           imul ax, ax, 0xf                         
  1185  8bdf             mov bx, di                               
  1187  d1e3             shl bx, 1                                
  1189  03da             add bx, dx                               
  118b  360107           add word ptr ss:[bx], ax                 
  118e  8bdf             mov bx, di                               
  1190  d1e3             shl bx, 1                                
  1192  8d46c2           lea ax, [bp - 0x3e]                      
  1195  03d8             add bx, ax                               
  1197  368b07           mov ax, word ptr ss:[bx]                 
  119a  c1e002           shl ax, 2                                
  119d  8bdf             mov bx, di                               
  119f  d1e3             shl bx, 1                                
  11a1  03da             add bx, dx                               
  11a3  360107           add word ptr ss:[bx], ax                 
  11a6  8bdf             mov bx, di                               
  11a8  d1e3             shl bx, 1                                
  11aa  8d46b2           lea ax, [bp - 0x4e]                      
  11ad  03d8             add bx, ax                               
  11af  368b07           mov ax, word ptr ss:[bx]                 
  11b2  6bc006           imul ax, ax, 6                           
  11b5  8bdf             mov bx, di                               
  11b7  d1e3             shl bx, 1                                
  11b9  03da             add bx, dx                               
  11bb  360107           add word ptr ss:[bx], ax                 
  11be  8bdf             mov bx, di                               
  11c0  d1e3             shl bx, 1                                
  11c2  8d8642ff         lea ax, [bp - 0xbe]                      
  11c6  03d8             add bx, ax                               
  11c8  8bc7             mov ax, di                               
  11ca  d1e0             shl ax, 1                                
  11cc  c436ee40         les si, ptr [0x40ee]                     
  11d0  03f0             add si, ax                               
  11d2  268b84bc03       mov ax, word ptr es:[si + 0x3bc]         
  11d7  c1e002           shl ax, 2                                
  11da  360107           add word ptr ss:[bx], ax                 
  11dd  8bdf             mov bx, di                               
  11df  d1e3             shl bx, 1                                
  11e1  8d8642ff         lea ax, [bp - 0xbe]                      
  11e5  03d8             add bx, ax                               
  11e7  268b84cc03       mov ax, word ptr es:[si + 0x3cc]         
  11ec  360107           add word ptr ss:[bx], ax                 
  11ef  8bdf             mov bx, di                               
  11f1  d1e3             shl bx, 1                                
  11f3  8d8642ff         lea ax, [bp - 0xbe]                      
  11f7  03d8             add bx, ax                               
  11f9  268b84dc03       mov ax, word ptr es:[si + 0x3dc]         
  11fe  360107           add word ptr ss:[bx], ax                 
  1201  8bdf             mov bx, di                               
  1203  d1e3             shl bx, 1                                
  1205  8d8642ff         lea ax, [bp - 0xbe]                      
  1209  03d8             add bx, ax                               
  120b  268b84ec03       mov ax, word ptr es:[si + 0x3ec]         
  1210  d1e0             shl ax, 1                                
  1212  360107           add word ptr ss:[bx], ax                 
  1215  8bdf             mov bx, di                               
  1217  d1e3             shl bx, 1                                
  1219  8d8642ff         lea ax, [bp - 0xbe]                      
  121d  03d8             add bx, ax                               
  121f  268b84fc03       mov ax, word ptr es:[si + 0x3fc]         
  1224  d1e0             shl ax, 1                                
  1226  360107           add word ptr ss:[bx], ax                 
  1229  8bdf             mov bx, di                               
  122b  d1e3             shl bx, 1                                
  122d  8d8642ff         lea ax, [bp - 0xbe]                      
  1231  03d8             add bx, ax                               
  1233  268b840c04       mov ax, word ptr es:[si + 0x40c]         
  1238  d1e0             shl ax, 1                                
  123a  360107           add word ptr ss:[bx], ax                 
  123d  b8042c           mov ax, 0x2c04                           
  1240  8ec0             mov es, ax                               
  1242  268b1e1001       mov bx, word ptr es:[0x110]              
  1247  d1e3             shl bx, 1                                
  1249  b8042c           mov ax, 0x2c04                           
  124c  8ec0             mov es, ax                               
  124e  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1254  7515             jne 0x126b                               
  1256  8bdf             mov bx, di                               
  1258  d1e3             shl bx, 1                                
  125a  8d8642ff         lea ax, [bp - 0xbe]                      
  125e  03d8             add bx, ax                               
  1260  c436ee40         les si, ptr [0x40ee]                     
  1264  268b4418         mov ax, word ptr es:[si + 0x18]          
  1268  e98500           jmp 0x12f0                               
  126b  b8042c           mov ax, 0x2c04                           
  126e  8ec0             mov es, ax                               
  1270  268b1e1001       mov bx, word ptr es:[0x110]              
  1275  d1e3             shl bx, 1                                
  1277  b8042c           mov ax, 0x2c04                           
  127a  8ec0             mov es, ax                               
  127c  2683bfc00002     cmp word ptr es:[bx + 0xc0], 2           
  1282  7514             jne 0x1298                               
  1284  8bdf             mov bx, di                               
  1286  d1e3             shl bx, 1                                
  1288  8d8642ff         lea ax, [bp - 0xbe]                      
  128c  03d8             add bx, ax                               
  128e  c436ee40         les si, ptr [0x40ee]                     
  1292  268b441e         mov ax, word ptr es:[si + 0x1e]          
  1296  eb58             jmp 0x12f0                               
  1298  b8042c           mov ax, 0x2c04                           
  129b  8ec0             mov es, ax                               
  129d  268b1e1001       mov bx, word ptr es:[0x110]              
  12a2  d1e3             shl bx, 1                                
  12a4  b8042c           mov ax, 0x2c04                           
  12a7  8ec0             mov es, ax                               
  12a9  2683bfc00001     cmp word ptr es:[bx + 0xc0], 1           
  12af  7514             jne 0x12c5                               
  12b1  8bdf             mov bx, di                               
  12b3  d1e3             shl bx, 1                                
  12b5  8d8642ff         lea ax, [bp - 0xbe]                      
  12b9  03d8             add bx, ax                               
  12bb  c436ee40         les si, ptr [0x40ee]                     
  12bf  268b441a         mov ax, word ptr es:[si + 0x1a]          
  12c3  eb2b             jmp 0x12f0                               
  12c5  b8042c           mov ax, 0x2c04                           
  12c8  8ec0             mov es, ax                               
  12ca  268b1e1001       mov bx, word ptr es:[0x110]              
  12cf  d1e3             shl bx, 1                                
  12d1  b8042c           mov ax, 0x2c04                           
  12d4  8ec0             mov es, ax                               
  12d6  2683bfc00000     cmp word ptr es:[bx + 0xc0], 0           
  12dc  7515             jne 0x12f3                               
  12de  8bdf             mov bx, di                               
  12e0  d1e3             shl bx, 1                                
  12e2  8d8642ff         lea ax, [bp - 0xbe]                      
  12e6  03d8             add bx, ax                               
  12e8  c436ee40         les si, ptr [0x40ee]                     
  12ec  268b441c         mov ax, word ptr es:[si + 0x1c]          
  12f0  360107           add word ptr ss:[bx], ax                 
  12f3  8bdf             mov bx, di                               
  12f5  d1e3             shl bx, 1                                
  12f7  b8042c           mov ax, 0x2c04                           
  12fa  53               push bx                                  
  12fb  50               push ax                                  
  12fc  8b46f2           mov ax, word ptr [bp - 0xe]              
  12ff  07               pop es                                   
  1300  5b               pop bx                                   
  1301  262b87e310       sub ax, word ptr es:[bx + 0x10e3]        
  1306  99               cdq                                      
  1307  33c2             xor ax, dx                               
  1309  2bc2             sub ax, dx                               
  130b  bb0800           mov bx, 8                                
  130e  99               cdq                                      
  130f  f7fb             idiv bx                                  
  1311  8bdf             mov bx, di                               
  1313  d1e3             shl bx, 1                                
  1315  8d9642ff         lea dx, [bp - 0xbe]                      
  1319  03da             add bx, dx                               
  131b  360107           add word ptr ss:[bx], ax                 
  131e  8bdf             mov bx, di                               
  1320  d1e3             shl bx, 1                                
  1322  8d46d2           lea ax, [bp - 0x2e]                      
  1325  03d8             add bx, ax                               
  1327  b8042c           mov ax, 0x2c04                           
  132a  8ec0             mov es, ax                               
  132c  268b361001       mov si, word ptr es:[0x110]              
  1331  d1e6             shl si, 1                                
  1333  8d46d2           lea ax, [bp - 0x2e]                      
  1336  03f0             add si, ax                               
  1338  368b04           mov ax, word ptr ss:[si]                 
  133b  362b07           sub ax, word ptr ss:[bx]                 
  133e  99               cdq                                      
  133f  33c2             xor ax, dx                               
  1341  2bc2             sub ax, dx                               
  1343  bb0400           mov bx, 4                                
  1346  99               cdq                                      
  1347  f7fb             idiv bx                                  
  1349  8bdf             mov bx, di                               
  134b  d1e3             shl bx, 1                                
  134d  8d9642ff         lea dx, [bp - 0xbe]                      
  1351  03da             add bx, dx                               
  1353  360107           add word ptr ss:[bx], ax                 
  1356  8bc7             mov ax, di                               
  1358  4f               dec di                                   
  1359  0bc0             or ax, ax                                
  135b  7403             je 0x1360                                
  135d  e9fcfd           jmp 0x115c                               
  1360  33f6             xor si, si                               
  1362  bf0800           mov di, 8                                
  1365  eb44             jmp 0x13ab                               
  1367  8bdf             mov bx, di                               
  1369  d1e3             shl bx, 1                                
  136b  b8042c           mov ax, 0x2c04                           
  136e  8ec0             mov es, ax                               
  1370  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1376  7433             je 0x13ab                                
  1378  b8042c           mov ax, 0x2c04                           
  137b  8ec0             mov es, ax                               
  137d  26393e1001       cmp word ptr es:[0x110], di              
  1382  7427             je 0x13ab                                
  1384  b8042c           mov ax, 0x2c04                           
  1387  8ec0             mov es, ax                               
  1389  268b1e1001       mov bx, word ptr es:[0x110]              
  138e  c1e303           shl bx, 3                                
  1391  03df             add bx, di                               
  1393  b8042c           mov ax, 0x2c04                           
  1396  8ec0             mov es, ax                               
  1398  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  139d  c1e802           shr ax, 2                                
  13a0  250300           and ax, 3                                
  13a3  3d0200           cmp ax, 2                                
  13a6  7503             jne 0x13ab                               
  13a8  be0100           mov si, 1                                
  13ab  8bc7             mov ax, di                               
  13ad  4f               dec di                                   
  13ae  0bc0             or ax, ax                                
  13b0  75b5             jne 0x1367                               
  13b2  b8042c           mov ax, 0x2c04                           
  13b5  8ec0             mov es, ax                               
  13b7  26833e160100     cmp word ptr es:[0x116], 0               
  13bd  7503             jne 0x13c2                               
  13bf  e91901           jmp 0x14db                               
  13c2  8ec0             mov es, ax                               
  13c4  268b1e1001       mov bx, word ptr es:[0x110]              
  13c9  d1e3             shl bx, 1                                
  13cb  b8042c           mov ax, 0x2c04                           
  13ce  8ec0             mov es, ax                               
  13d0  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  13d6  7503             jne 0x13db                               
  13d8  e90001           jmp 0x14db                               
  13db  ba0800           mov dx, 8                                
  13de  eb0f             jmp 0x13ef                               
  13e0  8bda             mov bx, dx                               
  13e2  d1e3             shl bx, 1                                
  13e4  8d8632ff         lea ax, [bp - 0xce]                      
  13e8  03d8             add bx, ax                               
  13ea  36c7070000       mov word ptr ss:[bx], 0                  
  13ef  8bc2             mov ax, dx                               
  13f1  4a               dec dx                                   
  13f2  0bc0             or ax, ax                                
  13f4  75ea             jne 0x13e0                               
  13f6  bf0800           mov di, 8                                
  13f9  eb78             jmp 0x1473                               
  13fb  8bdf             mov bx, di                               
  13fd  d1e3             shl bx, 1                                
  13ff  b8042c           mov ax, 0x2c04                           
  1402  8ec0             mov es, ax                               
  1404  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  140a  7467             je 0x1473                                
  140c  8bdf             mov bx, di                               
  140e  d1e3             shl bx, 1                                
  1410  b8042c           mov ax, 0x2c04                           
  1413  8ec0             mov es, ax                               
  1415  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  141b  7456             je 0x1473                                
  141d  ba0800           mov dx, 8                                
  1420  eb4a             jmp 0x146c                               
  1422  8bda             mov bx, dx                               
  1424  d1e3             shl bx, 1                                
  1426  b8042c           mov ax, 0x2c04                           
  1429  8ec0             mov es, ax                               
  142b  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1431  7439             je 0x146c                                
  1433  8bda             mov bx, dx                               
  1435  d1e3             shl bx, 1                                
  1437  b8042c           mov ax, 0x2c04                           
  143a  8ec0             mov es, ax                               
  143c  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  1442  7428             je 0x146c                                
  1444  8bdf             mov bx, di                               
  1446  c1e303           shl bx, 3                                
  1449  03da             add bx, dx                               
  144b  b8042c           mov ax, 0x2c04                           
  144e  8ec0             mov es, ax                               
  1450  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1455  250300           and ax, 3                                
  1458  3d0200           cmp ax, 2                                
  145b  750f             jne 0x146c                               
  145d  8bdf             mov bx, di                               
  145f  d1e3             shl bx, 1                                
  1461  8d8632ff         lea ax, [bp - 0xce]                      
  1465  03d8             add bx, ax                               
  1467  36c7070100       mov word ptr ss:[bx], 1                  
  146c  8bc2             mov ax, dx                               
  146e  4a               dec dx                                   
  146f  0bc0             or ax, ax                                
  1471  75af             jne 0x1422                               
  1473  8bc7             mov ax, di                               
  1475  4f               dec di                                   
  1476  0bc0             or ax, ax                                
  1478  7581             jne 0x13fb                               
  147a  bf0800           mov di, 8                                
  147d  eb55             jmp 0x14d4                               
  147f  8bdf             mov bx, di                               
  1481  d1e3             shl bx, 1                                
  1483  b8042c           mov ax, 0x2c04                           
  1486  8ec0             mov es, ax                               
  1488  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  148e  7444             je 0x14d4                                
  1490  8bdf             mov bx, di                               
  1492  d1e3             shl bx, 1                                
  1494  b8042c           mov ax, 0x2c04                           
  1497  8ec0             mov es, ax                               
  1499  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  149f  7433             je 0x14d4                                
  14a1  b8042c           mov ax, 0x2c04                           
  14a4  8ec0             mov es, ax                               
  14a6  268b1e1001       mov bx, word ptr es:[0x110]              
  14ab  d1e3             shl bx, 1                                
  14ad  8d8632ff         lea ax, [bp - 0xce]                      
  14b1  03d8             add bx, ax                               
  14b3  36833f00         cmp word ptr ss:[bx], 0                  
  14b7  750c             jne 0x14c5                               
  14b9  8bdf             mov bx, di                               
  14bb  d1e3             shl bx, 1                                
  14bd  03d8             add bx, ax                               
  14bf  36833f00         cmp word ptr ss:[bx], 0                  
  14c3  740f             je 0x14d4                                
  14c5  8bdf             mov bx, di                               
  14c7  d1e3             shl bx, 1                                
  14c9  8d8642ff         lea ax, [bp - 0xbe]                      
  14cd  03d8             add bx, ax                               
  14cf  36c7070000       mov word ptr ss:[bx], 0                  
  14d4  8bc7             mov ax, di                               
  14d6  4f               dec di                                   
  14d7  0bc0             or ax, ax                                
  14d9  75a4             jne 0x147f                               
  14db  bf0800           mov di, 8                                
  14de  e9f800           jmp 0x15d9                               
  14e1  8bc7             mov ax, di                               
  14e3  d1e0             shl ax, 1                                
  14e5  c41eee40         les bx, ptr [0x40ee]                     
  14e9  03d8             add bx, ax                               
  14eb  268b87dc03       mov ax, word ptr es:[bx + 0x3dc]         
  14f0  260387fc03       add ax, word ptr es:[bx + 0x3fc]         
  14f5  8946e4           mov word ptr [bp - 0x1c], ax             
  14f8  b8042c           mov ax, 0x2c04                           
  14fb  8ec0             mov es, ax                               
  14fd  26833e280100     cmp word ptr es:[0x128], 0               
  1503  7405             je 0x150a                                
  1505  b80400           mov ax, 4                                
  1508  eb03             jmp 0x150d                               
  150a  b80800           mov ax, 8                                
  150d  8946e2           mov word ptr [bp - 0x1e], ax             
  1510  57               push di                                  
  1511  9a2a00b12f       lcall 0x2fb1, 0x2a                       -> ovl18:0a6e
  1516  59               pop cx                                   
  1517  0bc0             or ax, ax                                
  1519  740f             je 0x152a                                
  151b  8bdf             mov bx, di                               
  151d  d1e3             shl bx, 1                                
  151f  8d8642ff         lea ax, [bp - 0xbe]                      
  1523  03d8             add bx, ax                               
  1525  36c7070000       mov word ptr ss:[bx], 0                  
  152a  0bf6             or si, si                                
  152c  7432             je 0x1560                                
  152e  b8042c           mov ax, 0x2c04                           
  1531  8ec0             mov es, ax                               
  1533  268b1e1001       mov bx, word ptr es:[0x110]              
  1538  c1e303           shl bx, 3                                
  153b  03df             add bx, di                               
  153d  b8042c           mov ax, 0x2c04                           
  1540  8ec0             mov es, ax                               
  1542  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1547  c1e802           shr ax, 2                                
  154a  250300           and ax, 3                                
  154d  0bc0             or ax, ax                                
  154f  750f             jne 0x1560                               
  1551  8bdf             mov bx, di                               
  1553  d1e3             shl bx, 1                                
  1555  8d8642ff         lea ax, [bp - 0xbe]                      
  1559  03d8             add bx, ax                               
  155b  36c7070000       mov word ptr ss:[bx], 0                  
  1560  837efa00         cmp word ptr [bp - 6], 0                 
  1564  751e             jne 0x1584                               
  1566  8bdf             mov bx, di                               
  1568  d1e3             shl bx, 1                                
  156a  8d46a2           lea ax, [bp - 0x5e]                      
  156d  03d8             add bx, ax                               
  156f  36833f00         cmp word ptr ss:[bx], 0                  
  1573  750f             jne 0x1584                               
  1575  8bdf             mov bx, di                               
  1577  d1e3             shl bx, 1                                
  1579  8d8642ff         lea ax, [bp - 0xbe]                      
  157d  03d8             add bx, ax                               
  157f  36c7070000       mov word ptr ss:[bx], 0                  
  1584  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  1589  3b46e2           cmp ax, word ptr [bp - 0x1e]             
  158c  7d15             jge 0x15a3                               
  158e  837ee400         cmp word ptr [bp - 0x1c], 0              
  1592  750f             jne 0x15a3                               
  1594  8bdf             mov bx, di                               
  1596  d1e3             shl bx, 1                                
  1598  8d8642ff         lea ax, [bp - 0xbe]                      
  159c  03d8             add bx, ax                               
  159e  36c7070000       mov word ptr ss:[bx], 0                  
  15a3  837ef801         cmp word ptr [bp - 8], 1                 
  15a7  7e30             jle 0x15d9                               
  15a9  8bdf             mov bx, di                               
  15ab  d1e3             shl bx, 1                                
  15ad  8d46d2           lea ax, [bp - 0x2e]                      
  15b0  03d8             add bx, ax                               
  15b2  368b07           mov ax, word ptr ss:[bx]                 
  15b5  bb0400           mov bx, 4                                
  15b8  99               cdq                                      
  15b9  f7fb             idiv bx                                  
  15bb  8bdf             mov bx, di                               
  15bd  d1e3             shl bx, 1                                
  15bf  8d9652ff         lea dx, [bp - 0xae]                      
  15c3  03da             add bx, dx                               
  15c5  363b07           cmp ax, word ptr ss:[bx]                 
  15c8  7d0f             jge 0x15d9                               
  15ca  8bdf             mov bx, di                               
  15cc  d1e3             shl bx, 1                                
  15ce  8d8642ff         lea ax, [bp - 0xbe]                      
  15d2  03d8             add bx, ax                               
  15d4  36c7070000       mov word ptr ss:[bx], 0                  
  15d9  8bc7             mov ax, di                               
  15db  4f               dec di                                   
  15dc  0bc0             or ax, ax                                
  15de  7403             je 0x15e3                                
  15e0  e9fefe           jmp 0x14e1                               
  15e3  b8042c           mov ax, 0x2c04                           
  15e6  8ec0             mov es, ax                               
  15e8  268b1e1001       mov bx, word ptr es:[0x110]              
  15ed  d1e3             shl bx, 1                                
  15ef  8d8642ff         lea ax, [bp - 0xbe]                      
  15f3  03d8             add bx, ax                               
  15f5  33c0             xor ax, ax                               
  15f7  368907           mov word ptr ss:[bx], ax                 
  15fa  8bd0             mov dx, ax                               
  15fc  bf0800           mov di, 8                                
  15ff  eb2a             jmp 0x162b                               
  1601  8bdf             mov bx, di                               
  1603  d1e3             shl bx, 1                                
  1605  8d46d2           lea ax, [bp - 0x2e]                      
  1608  03d8             add bx, ax                               
  160a  36833f00         cmp word ptr ss:[bx], 0                  
  160e  741b             je 0x162b                                
  1610  8bdf             mov bx, di                               
  1612  d1e3             shl bx, 1                                
  1614  8d8642ff         lea ax, [bp - 0xbe]                      
  1618  03d8             add bx, ax                               
  161a  363917           cmp word ptr ss:[bx], dx                 
  161d  7e0c             jle 0x162b                               
  161f  8bdf             mov bx, di                               
  1621  d1e3             shl bx, 1                                
  1623  03d8             add bx, ax                               
  1625  368b17           mov dx, word ptr ss:[bx]                 
  1628  897ef6           mov word ptr [bp - 0xa], di              
  162b  8bc7             mov ax, di                               
  162d  4f               dec di                                   
  162e  0bc0             or ax, ax                                
  1630  75cf             jne 0x1601                               
  1632  8b5ef4           mov bx, word ptr [bp - 0xc]              
  1635  6bdb41           imul bx, bx, 0x41                        
  1638  b8042c           mov ax, 0x2c04                           
  163b  8ec0             mov es, ax                               
  163d  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  1643  7469             je 0x16ae                                
  1645  8b5ef4           mov bx, word ptr [bp - 0xc]              
  1648  6bdb41           imul bx, bx, 0x41                        
  164b  8ec0             mov es, ax                               
  164d  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1652  98               cwde                                     
  1653  ba042c           mov dx, 0x2c04                           
  1656  8ec2             mov es, dx                               
  1658  263b061001       cmp ax, word ptr es:[0x110]              
  165d  744f             je 0x16ae                                
  165f  33c9             xor cx, cx                               
  1661  c41eee40         les bx, ptr [0x40ee]                     
  1665  268bbf4a02       mov di, word ptr es:[bx + 0x24a]         
  166a  eb23             jmp 0x168f                               
  166c  8b5ef4           mov bx, word ptr [bp - 0xc]              
  166f  6bdb41           imul bx, bx, 0x41                        
  1672  b8042c           mov ax, 0x2c04                           
  1675  8ec0             mov es, ax                               
  1677  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  167c  98               cwde                                     
  167d  8bdf             mov bx, di                               
  167f  d1e3             shl bx, 1                                
  1681  8d9652ff         lea dx, [bp - 0xae]                      
  1685  03da             add bx, dx                               
  1687  363b07           cmp ax, word ptr ss:[bx]                 
  168a  7503             jne 0x168f                               
  168c  b90100           mov cx, 1                                
  168f  8bc7             mov ax, di                               
  1691  4f               dec di                                   
  1692  0bc0             or ax, ax                                
  1694  75d6             jne 0x166c                               
  1696  0bc9             or cx, cx                                
  1698  7514             jne 0x16ae                               
  169a  8b5ef4           mov bx, word ptr [bp - 0xc]              
  169d  6bdb41           imul bx, bx, 0x41                        
  16a0  b8042c           mov ax, 0x2c04                           
  16a3  8ec0             mov es, ax                               
  16a5  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  16aa  98               cwde                                     
  16ab  8946f6           mov word ptr [bp - 0xa], ax              
  16ae  837ef6ff         cmp word ptr [bp - 0xa], -1              
  16b2  7415             je 0x16c9                                
  16b4  8b5ef6           mov bx, word ptr [bp - 0xa]              
  16b7  d1e3             shl bx, 1                                
  16b9  8d46a2           lea ax, [bp - 0x5e]                      
  16bc  03d8             add bx, ax                               
  16be  36833f00         cmp word ptr ss:[bx], 0                  
  16c2  7505             jne 0x16c9                               
  16c4  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  16c9  8b46f6           mov ax, word ptr [bp - 0xa]              
  16cc  5f               pop di                                   
  16cd  5e               pop si                                   
  16ce  c9               leave                                    
  16cf  cb               retf                                     
