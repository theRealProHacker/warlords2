; ovl47 stub 3073 file_off 0x6a7c0 size 0x1b06

ovl47_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec04           sub sp, 4                                
  0006  56               push si                                  
  0007  57               push di                                  
  0008  33f6             xor si, si                               
  000a  33ff             xor di, di                               
  000c  c70610110000     mov word ptr [0x1110], 0                 
  0012  b8042c           mov ax, 0x2c04                           
  0015  8ec0             mov es, ax                               
  0017  26833e5d0100     cmp word ptr es:[0x15d], 0               
  001d  7403             je 0x22                                  
  001f  e9d401           jmp 0x1f6                                
  0022  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0027  3d0100           cmp ax, 1                                
  002a  754a             jne 0x76                                 
  002c  b8042c           mov ax, 0x2c04                           
  002f  8ec0             mov es, ax                               
  0031  268b1e1001       mov bx, word ptr es:[0x110]              
  0036  6bdb14           imul bx, bx, 0x14                        
  0039  b8042c           mov ax, 0x2c04                           
  003c  8ec0             mov es, ax                               
  003e  268b878901       mov ax, word ptr es:[bx + 0x189]         
  0043  a3ea44           mov word ptr [0x44ea], ax                
  0046  b8042c           mov ax, 0x2c04                           
  0049  8ec0             mov es, ax                               
  004b  268b1e1001       mov bx, word ptr es:[0x110]              
  0050  6bdb14           imul bx, bx, 0x14                        
  0053  b8042c           mov ax, 0x2c04                           
  0056  8ec0             mov es, ax                               
  0058  268b878b01       mov ax, word ptr es:[bx + 0x18b]         
  005d  a3e844           mov word ptr [0x44e8], ax                
  0060  50               push ax                                  
  0061  ff36ea44         push word ptr [0x44ea]                   
  0065  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  006a  83c404           add sp, 4                                
  006d  a3ec44           mov word ptr [0x44ec], ax                
  0070  b80100           mov ax, 1                                
  0073  e98201           jmp 0x1f8                                
  0076  c746fc0500       mov word ptr [bp - 4], 5                 
  007b  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  0080  b8042c           mov ax, 0x2c04                           
  0083  8ec0             mov es, ax                               
  0085  268b1e1001       mov bx, word ptr es:[0x110]              
  008a  d1e3             shl bx, 1                                
  008c  83bfea5d28       cmp word ptr [bx + 0x5dea], 0x28         
  0091  7c05             jl 0x98                                  
  0093  c746fc0600       mov word ptr [bp - 4], 6                 
  0098  c706e6440000     mov word ptr [0x44e6], 0                 
  009e  b8042c           mov ax, 0x2c04                           
  00a1  8ec0             mov es, ax                               
  00a3  268b0e8101       mov cx, word ptr es:[0x181]              
  00a8  eb35             jmp 0xdf                                 
  00aa  8bd9             mov bx, cx                               
  00ac  6bdb16           imul bx, bx, 0x16                        
  00af  b81d1e           mov ax, 0x1e1d                           
  00b2  8ec0             mov es, ax                               
  00b4  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  00ba  7523             jne 0xdf                                 
  00bc  46               inc si                                   
  00bd  8bd9             mov bx, cx                               
  00bf  6bdb16           imul bx, bx, 0x16                        
  00c2  b81d1e           mov ax, 0x1e1d                           
  00c5  8ec0             mov es, ax                               
  00c7  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  00cc  ba042c           mov dx, 0x2c04                           
  00cf  8ec2             mov es, dx                               
  00d1  263a061001       cmp al, byte ptr es:[0x110]              
  00d6  7507             jne 0xdf                                 
  00d8  c706e6440100     mov word ptr [0x44e6], 1                 
  00de  47               inc di                                   
  00df  8bc1             mov ax, cx                               
  00e1  49               dec cx                                   
  00e2  0bc0             or ax, ax                                
  00e4  75c4             jne 0xaa                                 
  00e6  83fe28           cmp si, 0x28                             
  00e9  7c03             jl 0xee                                  
  00eb  e90801           jmp 0x1f6                                
  00ee  3b7efc           cmp di, word ptr [bp - 4]                
  00f1  7c03             jl 0xf6                                  
  00f3  e90001           jmp 0x1f6                                
  00f6  833ee64400       cmp word ptr [0x44e6], 0                 
  00fb  7412             je 0x10f                                 
  00fd  66685802e803     push 0x3e80258                           
  0103  6a01             push 1                                   
  0105  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  010a  83c406           add sp, 6                                
  010d  eb10             jmp 0x11f                                
  010f  666890012c01     push 0x12c0190                           
  0115  6a01             push 1                                   
  0117  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  011c  83c406           add sp, 6                                
  011f  a31011           mov word ptr [0x1110], ax                
  0122  b8042c           mov ax, 0x2c04                           
  0125  8ec0             mov es, ax                               
  0127  268b1e1001       mov bx, word ptr es:[0x110]              
  012c  6bdb14           imul bx, bx, 0x14                        
  012f  b8042c           mov ax, 0x2c04                           
  0132  8ec0             mov es, ax                               
  0134  268b878501       mov ax, word ptr es:[bx + 0x185]         
  0139  3b061011         cmp ax, word ptr [0x1110]                
  013d  7d03             jge 0x142                                
  013f  e9b400           jmp 0x1f6                                
  0142  666a1e           push 0x1e                                
  0145  6a01             push 1                                   
  0147  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  014c  83c406           add sp, 6                                
  014f  3d0600           cmp ax, 6                                
  0152  7e03             jle 0x157                                
  0154  e99f00           jmp 0x1f6                                
  0157  beffff           mov si, 0xffff                           
  015a  6a00             push 0                                   
  015c  b8042c           mov ax, 0x2c04                           
  015f  8ec0             mov es, ax                               
  0161  268b1e1001       mov bx, word ptr es:[0x110]              
  0166  d1e3             shl bx, 1                                
  0168  ffb7ea5d         push word ptr [bx + 0x5dea]              
  016c  6a01             push 1                                   
  016e  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0173  83c406           add sp, 6                                
  0176  8946fe           mov word ptr [bp - 2], ax                
  0179  bf0100           mov di, 1                                
  017c  b8042c           mov ax, 0x2c04                           
  017f  8ec0             mov es, ax                               
  0181  268b1e1001       mov bx, word ptr es:[0x110]              
  0186  d1e3             shl bx, 1                                
  0188  8ec0             mov es, ax                               
  018a  26a17b15         mov ax, word ptr es:[0x157b]             
  018e  b90400           mov cx, 4                                
  0191  99               cdq                                      
  0192  f7f9             idiv cx                                  
  0194  3987ea5d         cmp word ptr [bx + 0x5dea], ax           
  0198  83feff           cmp si, -1                               
  019b  7536             jne 0x1d3                                
  019d  33c9             xor cx, cx                               
  019f  eb26             jmp 0x1c7                                
  01a1  8bd9             mov bx, cx                               
  01a3  6bdb41           imul bx, bx, 0x41                        
  01a6  b8042c           mov ax, 0x2c04                           
  01a9  8ec0             mov es, ax                               
  01ab  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  01b0  ba042c           mov dx, 0x2c04                           
  01b3  8ec2             mov es, dx                               
  01b5  263a061001       cmp al, byte ptr es:[0x110]              
  01ba  750a             jne 0x1c6                                
  01bc  8bf1             mov si, cx                               
  01be  8bc7             mov ax, di                               
  01c0  47               inc di                                   
  01c1  3b46fe           cmp ax, word ptr [bp - 2]                
  01c4  740d             je 0x1d3                                 
  01c6  41               inc cx                                   
  01c7  b8042c           mov ax, 0x2c04                           
  01ca  8ec0             mov es, ax                               
  01cc  26390e7b15       cmp word ptr es:[0x157b], cx             
  01d1  7fce             jg 0x1a1                                 
  01d3  83feff           cmp si, -1                               
  01d6  741e             je 0x1f6                                 
  01d8  8936ec44         mov word ptr [0x44ec], si                
  01dc  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  01e1  0bc0             or ax, ax                                
  01e3  7507             jne 0x1ec                                
  01e5  8936ec44         mov word ptr [0x44ec], si                
  01e9  e984fe           jmp 0x70                                 
  01ec  56               push si                                  
  01ed  9a3e00db2f       lcall 0x2fdb, 0x3e                       -> ovl25:0919
  01f2  59               pop cx                                   
  01f3  e977fe           jmp 0x6d                                 
  01f6  33c0             xor ax, ax                               
  01f8  5f               pop di                                   
  01f9  5e               pop si                                   
  01fa  c9               leave                                    
  01fb  cb               retf                                     

ovl47_01fc:  ; ENTRY
  01fc  55               push bp                                  
  01fd  8bec             mov bp, sp                               
  01ff  83ec3a           sub sp, 0x3a                             
  0202  56               push si                                  
  0203  57               push di                                  
  0204  666a00           push 0                                   
  0207  666a01           push 1                                   
  020a  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  020f  83c408           add sp, 8                                
  0212  b8042c           mov ax, 0x2c04                           
  0215  8ec0             mov es, ax                               
  0217  268b1e1001       mov bx, word ptr es:[0x110]              
  021c  6bdb14           imul bx, bx, 0x14                        
  021f  b8042c           mov ax, 0x2c04                           
  0222  8b161011         mov dx, word ptr [0x1110]                
  0226  8ec0             mov es, ax                               
  0228  2629978501       sub word ptr es:[bx + 0x185], dx         
  022d  c70610110000     mov word ptr [0x1110], 0                 
  0233  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0238  3d0100           cmp ax, 1                                
  023b  7503             jne 0x240                                
  023d  e9bd00           jmp 0x2fd                                
  0240  c746fe0100       mov word ptr [bp - 2], 1                 
  0245  90               nop                                      
  0246  0e               push cs                                  
  0247  e85118           call 0x1a9b                              
  024a  8946fc           mov word ptr [bp - 4], ax                
  024d  666a64           push 0x64                                
  0250  6a01             push 1                                   
  0252  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0257  83c406           add sp, 6                                
  025a  8bd0             mov dx, ax                               
  025c  83fa46           cmp dx, 0x46                             
  025f  7d05             jge 0x266                                
  0261  be0100           mov si, 1                                
  0264  eb0d             jmp 0x273                                
  0266  83fa5f           cmp dx, 0x5f                             
  0269  7d05             jge 0x270                                
  026b  be0200           mov si, 2                                
  026e  eb03             jmp 0x273                                
  0270  be0300           mov si, 3                                
  0273  837efe00         cmp word ptr [bp - 2], 0                 
  0277  7503             jne 0x27c                                
  0279  e98100           jmp 0x2fd                                
  027c  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  0281  0bc0             or ax, ax                                
  0283  754c             jne 0x2d1                                
  0285  83fe01           cmp si, 1                                
  0288  751c             jne 0x2a6                                
  028a  666a60           push 0x60                                
  028d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0292  83c404           add sp, 4                                
  0295  52               push dx                                  
  0296  50               push ax                                  
  0297  16               push ss                                  
  0298  8d46c6           lea ax, [bp - 0x3a]                      
  029b  50               push ax                                  
  029c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  02a1  83c408           add sp, 8                                
  02a4  eb1e             jmp 0x2c4                                
  02a6  56               push si                                  
  02a7  666860000100     push 0x10060                             
  02ad  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  02b2  83c404           add sp, 4                                
  02b5  52               push dx                                  
  02b6  50               push ax                                  
  02b7  16               push ss                                  
  02b8  8d46c6           lea ax, [bp - 0x3a]                      
  02bb  50               push ax                                  
  02bc  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  02c1  83c40a           add sp, 0xa                              
  02c4  16               push ss                                  
  02c5  8d46c6           lea ax, [bp - 0x3a]                      
  02c8  50               push ax                                  
  02c9  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  02ce  83c404           add sp, 4                                
  02d1  33ff             xor di, di                               
  02d3  eb24             jmp 0x2f9                                
  02d5  ff36e844         push word ptr [0x44e8]                   
  02d9  ff36ea44         push word ptr [0x44ea]                   
  02dd  ff76fc           push word ptr [bp - 4]                   
  02e0  9a34001430       lcall 0x3014, 0x34                       -> ovl34:12e6
  02e5  83c406           add sp, 6                                
  02e8  8956fa           mov word ptr [bp - 6], dx                
  02eb  8946f8           mov word ptr [bp - 8], ax                
  02ee  52               push dx                                  
  02ef  50               push ax                                  
  02f0  9ae202620b       lcall 0xb62, 0x2e2                       -> 0b62:02e2
  02f5  83c404           add sp, 4                                
  02f8  47               inc di                                   
  02f9  3bfe             cmp di, si                               
  02fb  7cd8             jl 0x2d5                                 
  02fd  5f               pop di                                   
  02fe  5e               pop si                                   
  02ff  c9               leave                                    
  0300  cb               retf                                     

ovl47_0301:  ; ENTRY
  0301  55               push bp                                  
  0302  8bec             mov bp, sp                               
  0304  90               nop                                      
  0305  0e               push cs                                  
  0306  e85e09           call 0xc67                               
  0309  ff36d044         push word ptr [0x44d0]                   
  030d  1e               push ds                                  
  030e  68d244           push 0x44d2                              
  0311  90               nop                                      
  0312  0e               push cs                                  
  0313  e80500           call 0x31b                               
  0316  83c406           add sp, 6                                
  0319  5d               pop bp                                   
  031a  cb               retf                                     

ovl47_031b:  ; ENTRY
  031b  55               push bp                                  
  031c  8bec             mov bp, sp                               
  031e  83ec10           sub sp, 0x10                             
  0321  a1ec44           mov ax, word ptr [0x44ec]                
  0324  8946fe           mov word ptr [bp - 2], ax                
  0327  c746fc0000       mov word ptr [bp - 4], 0                 
  032c  eb15             jmp 0x343                                
  032e  8b5efc           mov bx, word ptr [bp - 4]                
  0331  d1e3             shl bx, 1                                
  0333  b8042c           mov ax, 0x2c04                           
  0336  8ec0             mov es, ax                               
  0338  2683bf430500     cmp word ptr es:[bx + 0x543], 0          
  033e  7409             je 0x349                                 
  0340  ff46fc           inc word ptr [bp - 4]                    
  0343  837efc28         cmp word ptr [bp - 4], 0x28              
  0347  7ce5             jl 0x32e                                 
  0349  66ff7606         push dword ptr [bp + 6]                  
  034d  1e               push ds                                  
  034e  685a11           push 0x115a                              
  0351  8b46fc           mov ax, word ptr [bp - 4]                
  0354  6bc014           imul ax, ax, 0x14                        
  0357  052302           add ax, 0x223                            
  035a  68042c           push 0x2c04                              
  035d  50               push ax                                  
  035e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0363  83c40c           add sp, 0xc                              
  0366  8b5efc           mov bx, word ptr [bp - 4]                
  0369  d1e3             shl bx, 1                                
  036b  b8042c           mov ax, 0x2c04                           
  036e  8ec0             mov es, ax                               
  0370  26c78743050100   mov word ptr es:[bx + 0x543], 1          
  0377  8b5efc           mov bx, word ptr [bp - 4]                
  037a  d1e3             shl bx, 1                                
  037c  b8042c           mov ax, 0x2c04                           
  037f  8b560a           mov dx, word ptr [bp + 0xa]              
  0382  8ec0             mov es, ax                               
  0384  2689979305       mov word ptr es:[bx + 0x593], dx         
  0389  b8042c           mov ax, 0x2c04                           
  038c  8b5efc           mov bx, word ptr [bp - 4]                
  038f  8ec0             mov es, ax                               
  0391  2680a7e305fc     and byte ptr es:[bx + 0x5e3], 0xfc       
  0397  8ec0             mov es, ax                               
  0399  2680a7e30503     and byte ptr es:[bx + 0x5e3], 3          
  039f  16               push ss                                  
  03a0  8d46f8           lea ax, [bp - 8]                         
  03a3  50               push ax                                  
  03a4  16               push ss                                  
  03a5  8d46fa           lea ax, [bp - 6]                         
  03a8  50               push ax                                  
  03a9  6a01             push 1                                   
  03ab  ff76fe           push word ptr [bp - 2]                   
  03ae  9a2a005130       lcall 0x3051, 0x2a                       -> ovl43:0bff
  03b3  83c40c           add sp, 0xc                              
  03b6  9a0903620b       lcall 0xb62, 0x309                       -> 0b62:0309
  03bb  8956f2           mov word ptr [bp - 0xe], dx              
  03be  8946f0           mov word ptr [bp - 0x10], ax             
  03c1  c45ef0           les bx, ptr [bp - 0x10]                  
  03c4  8b46fa           mov ax, word ptr [bp - 6]                
  03c7  268907           mov word ptr es:[bx], ax                 
  03ca  8b46f8           mov ax, word ptr [bp - 8]                
  03cd  26894702         mov word ptr es:[bx + 2], ax             
  03d1  8b46fa           mov ax, word ptr [bp - 6]                
  03d4  a3ea44           mov word ptr [0x44ea], ax                
  03d7  8b46f8           mov ax, word ptr [bp - 8]                
  03da  a3e844           mov word ptr [0x44e8], ax                
  03dd  26c647041c       mov byte ptr es:[bx + 4], 0x1c           
  03e2  b00e             mov al, 0xe                              
  03e4  26884707         mov byte ptr es:[bx + 7], al             
  03e8  26884706         mov byte ptr es:[bx + 6], al             
  03ec  26c6470805       mov byte ptr es:[bx + 8], 5              
  03f1  8a46fe           mov al, byte ptr [bp - 2]                
  03f4  26884709         mov byte ptr es:[bx + 9], al             
  03f8  8a46fc           mov al, byte ptr [bp - 4]                
  03fb  2688470a         mov byte ptr es:[bx + 0xa], al           
  03ff  26c6470b00       mov byte ptr es:[bx + 0xb], 0            
  0404  8b5ef8           mov bx, word ptr [bp - 8]                
  0407  69dbe000         imul bx, bx, 0xe0                        
  040b  8b46fa           mov ax, word ptr [bp - 6]                
  040e  d1e0             shl ax, 1                                
  0410  03d8             add bx, ax                               
  0412  b81d1e           mov ax, 0x1e1d                           
  0415  8ec0             mov es, ax                               
  0417  268b870000       mov ax, word ptr es:[bx]                 
  041c  8946f4           mov word ptr [bp - 0xc], ax              
  041f  b8042c           mov ax, 0x2c04                           
  0422  8ec0             mov es, ax                               
  0424  26a11001         mov ax, word ptr es:[0x110]              
  0428  8946f6           mov word ptr [bp - 0xa], ax              
  042b  250f00           and ax, 0xf                              
  042e  8066f5f0         and byte ptr [bp - 0xb], 0xf0            
  0432  0846f5           or byte ptr [bp - 0xb], al               
  0435  8b5ef8           mov bx, word ptr [bp - 8]                
  0438  69dbe000         imul bx, bx, 0xe0                        
  043c  8b46fa           mov ax, word ptr [bp - 6]                
  043f  d1e0             shl ax, 1                                
  0441  03d8             add bx, ax                               
  0443  b81d1e           mov ax, 0x1e1d                           
  0446  8b56f4           mov dx, word ptr [bp - 0xc]              
  0449  8ec0             mov es, ax                               
  044b  2689970000       mov word ptr es:[bx], dx                 
  0450  668b46f0         mov eax, dword ptr [bp - 0x10]           
  0454  66a3ee44         mov dword ptr [0x44ee], eax              
  0458  66ff76f0         push dword ptr [bp - 0x10]               
  045c  9ae202620b       lcall 0xb62, 0x2e2                       -> 0b62:02e2
  0461  83c404           add sp, 4                                
  0464  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0469  3d0100           cmp ax, 1                                
  046c  7e06             jle 0x474                                
  046e  0e               push cs                                  
  046f  e88afd           call 0x1fc                               
  0472  eb5d             jmp 0x4d1                                
  0474  b8042c           mov ax, 0x2c04                           
  0477  8ec0             mov es, ax                               
  0479  268b1e1001       mov bx, word ptr es:[0x110]              
  047e  6bdb1d           imul bx, bx, 0x1d                        
  0481  b8042c           mov ax, 0x2c04                           
  0484  8ec0             mov es, ax                               
  0486  26c687ff0c03     mov byte ptr es:[bx + 0xcff], 3          
  048c  b8042c           mov ax, 0x2c04                           
  048f  8ec0             mov es, ax                               
  0491  268b0e8101       mov cx, word ptr es:[0x181]              
  0496  eb1b             jmp 0x4b3                                
  0498  8bc1             mov ax, cx                               
  049a  6bc016           imul ax, ax, 0x16                        
  049d  ba1d1e           mov dx, 0x1e1d                           
  04a0  bb0000           mov bx, 0                                
  04a3  03d8             add bx, ax                               
  04a5  81c38088         add bx, 0x8880                           
  04a9  3b56f2           cmp dx, word ptr [bp - 0xe]              
  04ac  7505             jne 0x4b3                                
  04ae  3b5ef0           cmp bx, word ptr [bp - 0x10]             
  04b1  7407             je 0x4ba                                 
  04b3  8bc1             mov ax, cx                               
  04b5  49               dec cx                                   
  04b6  0bc0             or ax, ax                                
  04b8  75de             jne 0x498                                
  04ba  b8042c           mov ax, 0x2c04                           
  04bd  8ec0             mov es, ax                               
  04bf  268b1e1001       mov bx, word ptr es:[0x110]              
  04c4  6bdb1d           imul bx, bx, 0x1d                        
  04c7  b8042c           mov ax, 0x2c04                           
  04ca  8ec0             mov es, ax                               
  04cc  26898f000d       mov word ptr es:[bx + 0xd00], cx         
  04d1  66ff7606         push dword ptr [bp + 6]                  
  04d5  6a00             push 0                                   
  04d7  ff36ec44         push word ptr [0x44ec]                   
  04db  6a00             push 0                                   
  04dd  b8042c           mov ax, 0x2c04                           
  04e0  8ec0             mov es, ax                               
  04e2  26ff361001       push word ptr es:[0x110]                 
  04e7  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  04ec  83c40c           add sp, 0xc                              
  04ef  c9               leave                                    
  04f0  cb               retf                                     

ovl47_04f1:  ; ENTRY
  04f1  55               push bp                                  
  04f2  8bec             mov bp, sp                               
  04f4  8b4e0a           mov cx, word ptr [bp + 0xa]              
  04f7  c45e06           les bx, ptr [bp + 6]                     
  04fa  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  04ff  7576             jne 0x577                                
  0501  c45e06           les bx, ptr [bp + 6]                     
  0504  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0508  98               cwde                                     
  0509  ba042c           mov dx, 0x2c04                           
  050c  8bd8             mov bx, ax                               
  050e  8ec2             mov es, dx                               
  0510  268a87e305       mov al, byte ptr es:[bx + 0x5e3]         
  0515  c1e802           shr ax, 2                                
  0518  253f00           and ax, 0x3f                             
  051b  03c1             add ax, cx                               
  051d  3d3c00           cmp ax, 0x3c                             
  0520  721a             jb 0x53c                                 
  0522  c45e06           les bx, ptr [bp + 6]                     
  0525  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0529  98               cwde                                     
  052a  8bd8             mov bx, ax                               
  052c  8ec2             mov es, dx                               
  052e  2680a7e30503     and byte ptr es:[bx + 0x5e3], 3          
  0534  26808fe305f0     or byte ptr es:[bx + 0x5e3], 0xf0        
  053a  eb3b             jmp 0x577                                
  053c  c45e06           les bx, ptr [bp + 6]                     
  053f  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0543  98               cwde                                     
  0544  ba042c           mov dx, 0x2c04                           
  0547  8bd8             mov bx, ax                               
  0549  8ec2             mov es, dx                               
  054b  268a87e305       mov al, byte ptr es:[bx + 0x5e3]         
  0550  c1e802           shr ax, 2                                
  0553  253f00           and ax, 0x3f                             
  0556  03c1             add ax, cx                               
  0558  253f00           and ax, 0x3f                             
  055b  c45e06           les bx, ptr [bp + 6]                     
  055e  50               push ax                                  
  055f  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0563  98               cwde                                     
  0564  8bd8             mov bx, ax                               
  0566  8ec2             mov es, dx                               
  0568  2680a7e30503     and byte ptr es:[bx + 0x5e3], 3          
  056e  58               pop ax                                   
  056f  c0e002           shl al, 2                                
  0572  260887e305       or byte ptr es:[bx + 0x5e3], al          
  0577  5d               pop bp                                   
  0578  cb               retf                                     

ovl47_0579:  ; ENTRY
  0579  55               push bp                                  
  057a  8bec             mov bp, sp                               
  057c  56               push si                                  
  057d  57               push di                                  
  057e  b8042c           mov ax, 0x2c04                           
  0581  8ec0             mov es, ax                               
  0583  268b3e8101       mov di, word ptr es:[0x181]              
  0588  e9d900           jmp 0x664                                
  058b  8bdf             mov bx, di                               
  058d  6bdb16           imul bx, bx, 0x16                        
  0590  b81d1e           mov ax, 0x1e1d                           
  0593  8ec0             mov es, ax                               
  0595  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  059b  7403             je 0x5a0                                 
  059d  e9c400           jmp 0x664                                
  05a0  8bdf             mov bx, di                               
  05a2  6bdb16           imul bx, bx, 0x16                        
  05a5  b81d1e           mov ax, 0x1e1d                           
  05a8  8ec0             mov es, ax                               
  05aa  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  05af  98               cwde                                     
  05b0  ba042c           mov dx, 0x2c04                           
  05b3  8ec2             mov es, dx                               
  05b5  263b061001       cmp ax, word ptr es:[0x110]              
  05ba  7403             je 0x5bf                                 
  05bc  e9a500           jmp 0x664                                
  05bf  8bdf             mov bx, di                               
  05c1  6bdb16           imul bx, bx, 0x16                        
  05c4  b81d1e           mov ax, 0x1e1d                           
  05c7  8ec0             mov es, ax                               
  05c9  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  05ce  98               cwde                                     
  05cf  8bf0             mov si, ax                               
  05d1  b8042c           mov ax, 0x2c04                           
  05d4  8ec0             mov es, ax                               
  05d6  268a84e305       mov al, byte ptr es:[si + 0x5e3]         
  05db  250300           and ax, 3                                
  05de  0bc0             or ax, ax                                
  05e0  751d             jne 0x5ff                                
  05e2  b8042c           mov ax, 0x2c04                           
  05e5  8ec0             mov es, ax                               
  05e7  268a84e305       mov al, byte ptr es:[si + 0x5e3]         
  05ec  c1e802           shr ax, 2                                
  05ef  253f00           and ax, 0x3f                             
  05f2  3d0f00           cmp ax, 0xf                              
  05f5  7208             jb 0x5ff                                 
  05f7  666865001000     push 0x100065                            
  05fd  eb5c             jmp 0x65b                                
  05ff  b8042c           mov ax, 0x2c04                           
  0602  8ec0             mov es, ax                               
  0604  268a84e305       mov al, byte ptr es:[si + 0x5e3]         
  0609  250300           and ax, 3                                
  060c  3d0100           cmp ax, 1                                
  060f  751d             jne 0x62e                                
  0611  b8042c           mov ax, 0x2c04                           
  0614  8ec0             mov es, ax                               
  0616  268a84e305       mov al, byte ptr es:[si + 0x5e3]         
  061b  c1e802           shr ax, 2                                
  061e  253f00           and ax, 0x3f                             
  0621  3d1e00           cmp ax, 0x1e                             
  0624  7208             jb 0x62e                                 
  0626  666866001100     push 0x110066                            
  062c  eb2d             jmp 0x65b                                
  062e  b8042c           mov ax, 0x2c04                           
  0631  8ec0             mov es, ax                               
  0633  268a84e305       mov al, byte ptr es:[si + 0x5e3]         
  0638  250300           and ax, 3                                
  063b  3d0200           cmp ax, 2                                
  063e  7524             jne 0x664                                
  0640  b8042c           mov ax, 0x2c04                           
  0643  8ec0             mov es, ax                               
  0645  268a84e305       mov al, byte ptr es:[si + 0x5e3]         
  064a  c1e802           shr ax, 2                                
  064d  253f00           and ax, 0x3f                             
  0650  3d3c00           cmp ax, 0x3c                             
  0653  720f             jb 0x664                                 
  0655  666867001200     push 0x120067                            
  065b  57               push di                                  
  065c  90               nop                                      
  065d  0e               push cs                                  
  065e  e81100           call 0x672                               
  0661  83c406           add sp, 6                                
  0664  8bc7             mov ax, di                               
  0666  4f               dec di                                   
  0667  0bc0             or ax, ax                                
  0669  7403             je 0x66e                                 
  066b  e91dff           jmp 0x58b                                
  066e  5f               pop di                                   
  066f  5e               pop si                                   
  0670  5d               pop bp                                   
  0671  cb               retf                                     

ovl47_0672:  ; ENTRY
  0672  55               push bp                                  
  0673  8bec             mov bp, sp                               
  0675  83ec2e           sub sp, 0x2e                             
  0678  56               push si                                  
  0679  57               push di                                  
  067a  8b7606           mov si, word ptr [bp + 6]                
  067d  8bde             mov bx, si                               
  067f  6bdb16           imul bx, bx, 0x16                        
  0682  b81d1e           mov ax, 0x1e1d                           
  0685  8ec0             mov es, ax                               
  0687  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  068c  98               cwde                                     
  068d  f7d8             neg ax                                   
  068f  8946fc           mov word ptr [bp - 4], ax                
  0692  8bde             mov bx, si                               
  0694  6bdb16           imul bx, bx, 0x16                        
  0697  b81d1e           mov ax, 0x1e1d                           
  069a  8ec0             mov es, ax                               
  069c  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  06a1  98               cwde                                     
  06a2  8bf8             mov di, ax                               
  06a4  b8042c           mov ax, 0x2c04                           
  06a7  8ec0             mov es, ax                               
  06a9  268a85e305       mov al, byte ptr es:[di + 0x5e3]         
  06ae  250300           and ax, 3                                
  06b1  40               inc ax                                   
  06b2  250300           and ax, 3                                
  06b5  ba042c           mov dx, 0x2c04                           
  06b8  8ec2             mov es, dx                               
  06ba  2680a5e305fc     and byte ptr es:[di + 0x5e3], 0xfc       
  06c0  260885e305       or byte ptr es:[di + 0x5e3], al          
  06c5  6a01             push 1                                   
  06c7  8bc6             mov ax, si                               
  06c9  6bc016           imul ax, ax, 0x16                        
  06cc  ba0000           mov dx, 0                                
  06cf  03d0             add dx, ax                               
  06d1  81c28088         add dx, 0x8880                           
  06d5  681d1e           push 0x1e1d                              
  06d8  52               push dx                                  
  06d9  9a0500620b       lcall 0xb62, 5                           -> 0b62:0005
  06de  83c406           add sp, 6                                
  06e1  8bde             mov bx, si                               
  06e3  6bdb16           imul bx, bx, 0x16                        
  06e6  b81d1e           mov ax, 0x1e1d                           
  06e9  8ec0             mov es, ax                               
  06eb  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  06f0  98               cwde                                     
  06f1  0146fc           add word ptr [bp - 4], ax                
  06f4  c746fa0200       mov word ptr [bp - 6], 2                 
  06f9  8bde             mov bx, si                               
  06fb  6bdb16           imul bx, bx, 0x16                        
  06fe  b81d1e           mov ax, 0x1e1d                           
  0701  8ec0             mov es, ax                               
  0703  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  0708  0246fa           add al, byte ptr [bp - 6]                
  070b  8bde             mov bx, si                               
  070d  6bdb16           imul bx, bx, 0x16                        
  0710  ba1d1e           mov dx, 0x1e1d                           
  0713  8ec2             mov es, dx                               
  0715  2688878688       mov byte ptr es:[bx - 0x777a], al        
  071a  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  071f  0bc0             or ax, ax                                
  0721  7403             je 0x726                                 
  0723  e99d01           jmp 0x8c3                                
  0726  6a07             push 7                                   
  0728  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  072d  59               pop cx                                   
  072e  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0733  ff760a           push word ptr [bp + 0xa]                 
  0736  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  073b  59               pop cx                                   
  073c  8bdf             mov bx, di                               
  073e  d1e3             shl bx, 1                                
  0740  b8042c           mov ax, 0x2c04                           
  0743  8ec0             mov es, ax                               
  0745  2683bf930500     cmp word ptr es:[bx + 0x593], 0          
  074b  7504             jne 0x751                                
  074d  33c0             xor ax, ax                               
  074f  eb03             jmp 0x754                                
  0751  b80600           mov ax, 6                                
  0754  8946fe           mov word ptr [bp - 2], ax                
  0757  666800000300     push 0x30000                             
  075d  666801000f00     push 0xf0001                             
  0763  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0768  83c408           add sp, 8                                
  076b  ff76fe           push word ptr [bp - 2]                   
  076e  ff7608           push word ptr [bp + 8]                   
  0771  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0776  83c404           add sp, 4                                
  0779  52               push dx                                  
  077a  50               push ax                                  
  077b  666840015d00     push 0x5d0140                            
  0781  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0786  83c408           add sp, 8                                
  0789  666800000300     push 0x30000                             
  078f  666802000f00     push 0xf0002                             
  0795  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  079a  83c408           add sp, 8                                
  079d  8bc7             mov ax, di                               
  079f  6bc014           imul ax, ax, 0x14                        
  07a2  052302           add ax, 0x223                            
  07a5  68042c           push 0x2c04                              
  07a8  50               push ax                                  
  07a9  666840018c00     push 0x8c0140                            
  07af  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  07b4  83c408           add sp, 8                                
  07b7  8b46fe           mov ax, word ptr [bp - 2]                
  07ba  40               inc ax                                   
  07bb  50               push ax                                  
  07bc  ff7608           push word ptr [bp + 8]                   
  07bf  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  07c4  83c404           add sp, 4                                
  07c7  52               push dx                                  
  07c8  50               push ax                                  
  07c9  66684001a000     push 0xa00140                            
  07cf  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  07d4  83c408           add sp, 8                                
  07d7  8b46fe           mov ax, word ptr [bp - 2]                
  07da  050200           add ax, 2                                
  07dd  50               push ax                                  
  07de  ff7608           push word ptr [bp + 8]                   
  07e1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  07e6  83c404           add sp, 4                                
  07e9  52               push dx                                  
  07ea  50               push ax                                  
  07eb  66684001b400     push 0xb40140                            
  07f1  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  07f6  83c408           add sp, 8                                
  07f9  8b46fe           mov ax, word ptr [bp - 2]                
  07fc  050300           add ax, 3                                
  07ff  50               push ax                                  
  0800  ff7608           push word ptr [bp + 8]                   
  0803  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0808  83c404           add sp, 4                                
  080b  52               push dx                                  
  080c  50               push ax                                  
  080d  66684001c800     push 0xc80140                            
  0813  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0818  83c408           add sp, 8                                
  081b  8b46fe           mov ax, word ptr [bp - 2]                
  081e  050400           add ax, 4                                
  0821  50               push ax                                  
  0822  ff7608           push word ptr [bp + 8]                   
  0825  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  082a  83c404           add sp, 4                                
  082d  52               push dx                                  
  082e  50               push ax                                  
  082f  66684001e800     push 0xe80140                            
  0835  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  083a  83c408           add sp, 8                                
  083d  ff76fa           push word ptr [bp - 6]                   
  0840  8bde             mov bx, si                               
  0842  6bdb16           imul bx, bx, 0x16                        
  0845  b81d1e           mov ax, 0x1e1d                           
  0848  8ec0             mov es, ax                               
  084a  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  084f  98               cwde                                     
  0850  50               push ax                                  
  0851  ff76fc           push word ptr [bp - 4]                   
  0854  8bde             mov bx, si                               
  0856  6bdb16           imul bx, bx, 0x16                        
  0859  b81d1e           mov ax, 0x1e1d                           
  085c  8ec0             mov es, ax                               
  085e  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  0863  98               cwde                                     
  0864  50               push ax                                  
  0865  b8042c           mov ax, 0x2c04                           
  0868  8ec0             mov es, ax                               
  086a  268a85e305       mov al, byte ptr es:[di + 0x5e3]         
  086f  250300           and ax, 3                                
  0872  40               inc ax                                   
  0873  50               push ax                                  
  0874  8b46fe           mov ax, word ptr [bp - 2]                
  0877  050500           add ax, 5                                
  087a  50               push ax                                  
  087b  ff7608           push word ptr [bp + 8]                   
  087e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0883  83c404           add sp, 4                                
  0886  52               push dx                                  
  0887  50               push ax                                  
  0888  16               push ss                                  
  0889  8d46d2           lea ax, [bp - 0x2e]                      
  088c  50               push ax                                  
  088d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0892  83c412           add sp, 0x12                             
  0895  16               push ss                                  
  0896  8d46d2           lea ax, [bp - 0x2e]                      
  0899  50               push ax                                  
  089a  66684001fc00     push 0xfc0140                            
  08a0  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  08a5  83c408           add sp, 8                                
  08a8  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  08ad  c7066a160100     mov word ptr [0x166a], 1                 
  08b3  9a2000c130       lcall 0x30c1, 0x20                       -> ovl59:0142
  08b8  c7066a160000     mov word ptr [0x166a], 0                 
  08be  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  08c3  5f               pop di                                   
  08c4  5e               pop si                                   
  08c5  c9               leave                                    
  08c6  cb               retf                                     

ovl47_08c7:  ; ENTRY
  08c7  55               push bp                                  
  08c8  8bec             mov bp, sp                               
  08ca  56               push si                                  
  08cb  8b4e0a           mov cx, word ptr [bp + 0xa]              
  08ce  0bc9             or cx, cx                                
  08d0  7c6e             jl 0x940                                 
  08d2  8bd9             mov bx, cx                               
  08d4  6bdb1d           imul bx, bx, 0x1d                        
  08d7  b8042c           mov ax, 0x2c04                           
  08da  8ec0             mov es, ax                               
  08dc  26c687ff0c03     mov byte ptr es:[bx + 0xcff], 3          
  08e2  b8042c           mov ax, 0x2c04                           
  08e5  8ec0             mov es, ax                               
  08e7  268b368101       mov si, word ptr es:[0x181]              
  08ec  eb2c             jmp 0x91a                                
  08ee  8bc6             mov ax, si                               
  08f0  6bc016           imul ax, ax, 0x16                        
  08f3  ba1d1e           mov dx, 0x1e1d                           
  08f6  bb0000           mov bx, 0                                
  08f9  03d8             add bx, ax                               
  08fb  81c38088         add bx, 0x8880                           
  08ff  3b5608           cmp dx, word ptr [bp + 8]                
  0902  7516             jne 0x91a                                
  0904  3b5e06           cmp bx, word ptr [bp + 6]                
  0907  7511             jne 0x91a                                
  0909  8bd9             mov bx, cx                               
  090b  6bdb1d           imul bx, bx, 0x1d                        
  090e  b8042c           mov ax, 0x2c04                           
  0911  8ec0             mov es, ax                               
  0913  2689b7000d       mov word ptr es:[bx + 0xd00], si         
  0918  eb07             jmp 0x921                                
  091a  8bc6             mov ax, si                               
  091c  4e               dec si                                   
  091d  0bc0             or ax, ax                                
  091f  75cd             jne 0x8ee                                
  0921  83f908           cmp cx, 8                                
  0924  7d1a             jge 0x940                                
  0926  c45e06           les bx, ptr [bp + 6]                     
  0929  268b4702         mov ax, word ptr es:[bx + 2]             
  092d  6bc070           imul ax, ax, 0x70                        
  0930  260307           add ax, word ptr es:[bx]                 
  0933  bad919           mov dx, 0x19d9                           
  0936  8bd8             mov bx, ax                               
  0938  8ec2             mov es, dx                               
  093a  2680a70000bf     and byte ptr es:[bx], 0xbf               
  0940  5e               pop si                                   
  0941  5d               pop bp                                   
  0942  cb               retf                                     

ovl47_0943:  ; ENTRY
  0943  55               push bp                                  
  0944  8bec             mov bp, sp                               
  0946  83ec02           sub sp, 2                                
  0949  56               push si                                  
  094a  8b4e0a           mov cx, word ptr [bp + 0xa]              
  094d  c45e06           les bx, ptr [bp + 6]                     
  0950  268b5f02         mov bx, word ptr es:[bx + 2]             
  0954  69dbe000         imul bx, bx, 0xe0                        
  0958  8b7606           mov si, word ptr [bp + 6]                
  095b  268b04           mov ax, word ptr es:[si]                 
  095e  d1e0             shl ax, 1                                
  0960  03d8             add bx, ax                               
  0962  b81d1e           mov ax, 0x1e1d                           
  0965  8ec0             mov es, ax                               
  0967  268a9f0000       mov bl, byte ptr es:[bx]                 
  096c  81e3ff00         and bx, 0xff                             
  0970  b8042c           mov ax, 0x2c04                           
  0973  8ec0             mov es, ax                               
  0975  268a871007       mov al, byte ptr es:[bx + 0x710]         
  097a  98               cwde                                     
  097b  8946fe           mov word ptr [bp - 2], ax                
  097e  0bc9             or cx, cx                                
  0980  7c72             jl 0x9f4                                 
  0982  837efe02         cmp word ptr [bp - 2], 2                 
  0986  7520             jne 0x9a8                                
  0988  8bd9             mov bx, cx                               
  098a  6bdb1d           imul bx, bx, 0x1d                        
  098d  b8042c           mov ax, 0x2c04                           
  0990  8ec0             mov es, ax                               
  0992  26c687ff0c00     mov byte ptr es:[bx + 0xcff], 0          
  0998  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  099d  0bc0             or ax, ax                                
  099f  7553             jne 0x9f4                                
  09a1  9a3e00ba30       lcall 0x30ba, 0x3e                       -> ovl58:023d
  09a6  eb4c             jmp 0x9f4                                
  09a8  8bd9             mov bx, cx                               
  09aa  6bdb1d           imul bx, bx, 0x1d                        
  09ad  b8042c           mov ax, 0x2c04                           
  09b0  8ec0             mov es, ax                               
  09b2  26c687ff0c01     mov byte ptr es:[bx + 0xcff], 1          
  09b8  8bd9             mov bx, cx                               
  09ba  6bdb1d           imul bx, bx, 0x1d                        
  09bd  b8042c           mov ax, 0x2c04                           
  09c0  8ec0             mov es, ax                               
  09c2  26c787000d0000   mov word ptr es:[bx + 0xd00], 0          
  09c9  8bd9             mov bx, cx                               
  09cb  6bdb1d           imul bx, bx, 0x1d                        
  09ce  b8042c           mov ax, 0x2c04                           
  09d1  c47606           les si, ptr [bp + 6]                     
  09d4  268b14           mov dx, word ptr es:[si]                 
  09d7  8ec0             mov es, ax                               
  09d9  268997020d       mov word ptr es:[bx + 0xd02], dx         
  09de  8bd9             mov bx, cx                               
  09e0  6bdb1d           imul bx, bx, 0x1d                        
  09e3  b8042c           mov ax, 0x2c04                           
  09e6  8e4608           mov es, word ptr [bp + 8]                
  09e9  268b5402         mov dx, word ptr es:[si + 2]             
  09ed  8ec0             mov es, ax                               
  09ef  268997040d       mov word ptr es:[bx + 0xd04], dx         
  09f4  5e               pop si                                   
  09f5  c9               leave                                    
  09f6  cb               retf                                     

ovl47_09f7:  ; ENTRY
  09f7  55               push bp                                  
  09f8  8bec             mov bp, sp                               
  09fa  56               push si                                  
  09fb  c41e5e5e         les bx, ptr [0x5e5e]                     
  09ff  268b5f02         mov bx, word ptr es:[bx + 2]             
  0a03  69dbe000         imul bx, bx, 0xe0                        
  0a07  8b365e5e         mov si, word ptr [0x5e5e]                
  0a0b  268b04           mov ax, word ptr es:[si]                 
  0a0e  d1e0             shl ax, 1                                
  0a10  03d8             add bx, ax                               
  0a12  b81d1e           mov ax, 0x1e1d                           
  0a15  8ec0             mov es, ax                               
  0a17  268a9f0000       mov bl, byte ptr es:[bx]                 
  0a1c  81e3ff00         and bx, 0xff                             
  0a20  b8042c           mov ax, 0x2c04                           
  0a23  8ec0             mov es, ax                               
  0a25  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0a2a  98               cwde                                     
  0a2b  8bd0             mov dx, ax                               
  0a2d  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  0a33  7503             jne 0xa38                                
  0a35  e90c01           jmp 0xb44                                
  0a38  83fa02           cmp dx, 2                                
  0a3b  7503             jne 0xa40                                
  0a3d  e90401           jmp 0xb44                                
  0a40  83fa03           cmp dx, 3                                
  0a43  7503             jne 0xa48                                
  0a45  e9fc00           jmp 0xb44                                
  0a48  83fa0a           cmp dx, 0xa                              
  0a4b  7503             jne 0xa50                                
  0a4d  e9f400           jmp 0xb44                                
  0a50  83fa0b           cmp dx, 0xb                              
  0a53  7503             jne 0xa58                                
  0a55  e9ec00           jmp 0xb44                                
  0a58  c41e5e5e         les bx, ptr [0x5e5e]                     
  0a5c  268b4702         mov ax, word ptr es:[bx + 2]             
  0a60  6bc070           imul ax, ax, 0x70                        
  0a63  260307           add ax, word ptr es:[bx]                 
  0a66  bad919           mov dx, 0x19d9                           
  0a69  8bd8             mov bx, ax                               
  0a6b  8ec2             mov es, dx                               
  0a6d  268a870000       mov al, byte ptr es:[bx]                 
  0a72  c1e806           shr ax, 6                                
  0a75  250100           and ax, 1                                
  0a78  0bc0             or ax, ax                                
  0a7a  7403             je 0xa7f                                 
  0a7c  e9c500           jmp 0xb44                                
  0a7f  66ff365e5e       push dword ptr [0x5e5e]                  
  0a84  666a00           push 0                                   
  0a87  6a02             push 2                                   
  0a89  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  0a8e  83c40a           add sp, 0xa                              
  0a91  33c9             xor cx, cx                               
  0a93  e9a000           jmp 0xb36                                
  0a96  8bd9             mov bx, cx                               
  0a98  d1e3             shl bx, 1                                
  0a9a  8b87fc4b         mov ax, word ptr [bx + 0x4bfc]           
  0a9e  ba042c           mov dx, 0x2c04                           
  0aa1  8ec2             mov es, dx                               
  0aa3  263b061001       cmp ax, word ptr es:[0x110]              
  0aa8  7403             je 0xaad                                 
  0aaa  e98800           jmp 0xb35                                
  0aad  8bd9             mov bx, cx                               
  0aaf  d1e3             shl bx, 1                                
  0ab1  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0ab5  6bdb1d           imul bx, bx, 0x1d                        
  0ab8  b8042c           mov ax, 0x2c04                           
  0abb  c4365e5e         les si, ptr [0x5e5e]                     
  0abf  268b14           mov dx, word ptr es:[si]                 
  0ac2  8ec0             mov es, ax                               
  0ac4  268997020d       mov word ptr es:[bx + 0xd02], dx         
  0ac9  8bd9             mov bx, cx                               
  0acb  d1e3             shl bx, 1                                
  0acd  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0ad1  6bdb1d           imul bx, bx, 0x1d                        
  0ad4  b8042c           mov ax, 0x2c04                           
  0ad7  8e06605e         mov es, word ptr [0x5e60]                
  0adb  268b5402         mov dx, word ptr es:[si + 2]             
  0adf  8ec0             mov es, ax                               
  0ae1  268997040d       mov word ptr es:[bx + 0xd04], dx         
  0ae6  8bd9             mov bx, cx                               
  0ae8  d1e3             shl bx, 1                                
  0aea  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0aee  6bdb1d           imul bx, bx, 0x1d                        
  0af1  b8042c           mov ax, 0x2c04                           
  0af4  8ec0             mov es, ax                               
  0af6  26c687ff0c01     mov byte ptr es:[bx + 0xcff], 1          
  0afc  8bd9             mov bx, cx                               
  0afe  d1e3             shl bx, 1                                
  0b00  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0b04  6bdb1d           imul bx, bx, 0x1d                        
  0b07  b8042c           mov ax, 0x2c04                           
  0b0a  8ec0             mov es, ax                               
  0b0c  26c787000d0000   mov word ptr es:[bx + 0xd00], 0          
  0b13  c41e5e5e         les bx, ptr [0x5e5e]                     
  0b17  268b4702         mov ax, word ptr es:[bx + 2]             
  0b1b  6bc070           imul ax, ax, 0x70                        
  0b1e  260307           add ax, word ptr es:[bx]                 
  0b21  bad919           mov dx, 0x19d9                           
  0b24  8bd8             mov bx, ax                               
  0b26  8ec2             mov es, dx                               
  0b28  26808f000040     or byte ptr es:[bx], 0x40                
  0b2e  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0b33  eb0a             jmp 0xb3f                                
  0b35  41               inc cx                                   
  0b36  3b0e2e48         cmp cx, word ptr [0x482e]                
  0b3a  7d03             jge 0xb3f                                
  0b3c  e957ff           jmp 0xa96                                
  0b3f  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  0b44  5e               pop si                                   
  0b45  5d               pop bp                                   
  0b46  cb               retf                                     

ovl47_0b47:  ; ENTRY
  0b47  55               push bp                                  
  0b48  8bec             mov bp, sp                               
  0b4a  8b4e06           mov cx, word ptr [bp + 6]                
  0b4d  c45e08           les bx, ptr [bp + 8]                     
  0b50  26c707ffff       mov word ptr es:[bx], 0xffff             
  0b55  c45e0c           les bx, ptr [bp + 0xc]                   
  0b58  26c707ffff       mov word ptr es:[bx], 0xffff             
  0b5d  8bd9             mov bx, cx                               
  0b5f  6bdb1d           imul bx, bx, 0x1d                        
  0b62  b8042c           mov ax, 0x2c04                           
  0b65  8ec0             mov es, ax                               
  0b67  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  0b6d  7404             je 0xb73                                 
  0b6f  33c0             xor ax, ax                               
  0b71  eb64             jmp 0xbd7                                
  0b73  8bd9             mov bx, cx                               
  0b75  6bdb1d           imul bx, bx, 0x1d                        
  0b78  b8042c           mov ax, 0x2c04                           
  0b7b  8ec0             mov es, ax                               
  0b7d  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  0b82  6bc070           imul ax, ax, 0x70                        
  0b85  8bd9             mov bx, cx                               
  0b87  6bdb1d           imul bx, bx, 0x1d                        
  0b8a  ba042c           mov dx, 0x2c04                           
  0b8d  8ec2             mov es, dx                               
  0b8f  260387020d       add ax, word ptr es:[bx + 0xd02]         
  0b94  bad919           mov dx, 0x19d9                           
  0b97  8bd8             mov bx, ax                               
  0b99  8ec2             mov es, dx                               
  0b9b  268a870000       mov al, byte ptr es:[bx]                 
  0ba0  c1e806           shr ax, 6                                
  0ba3  250100           and ax, 1                                
  0ba6  0bc0             or ax, ax                                
  0ba8  74c5             je 0xb6f                                 
  0baa  8bd9             mov bx, cx                               
  0bac  6bdb1d           imul bx, bx, 0x1d                        
  0baf  b8042c           mov ax, 0x2c04                           
  0bb2  8ec0             mov es, ax                               
  0bb4  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  0bb9  c45e08           les bx, ptr [bp + 8]                     
  0bbc  268907           mov word ptr es:[bx], ax                 
  0bbf  8bd9             mov bx, cx                               
  0bc1  6bdb1d           imul bx, bx, 0x1d                        
  0bc4  b8042c           mov ax, 0x2c04                           
  0bc7  8ec0             mov es, ax                               
  0bc9  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  0bce  c45e0c           les bx, ptr [bp + 0xc]                   
  0bd1  268907           mov word ptr es:[bx], ax                 
  0bd4  b80100           mov ax, 1                                
  0bd7  5d               pop bp                                   
  0bd8  cb               retf                                     

ovl47_0bd9:  ; ENTRY
  0bd9  55               push bp                                  
  0bda  8bec             mov bp, sp                               
  0bdc  83ec06           sub sp, 6                                
  0bdf  16               push ss                                  
  0be0  8d46fa           lea ax, [bp - 6]                         
  0be3  50               push ax                                  
  0be4  16               push ss                                  
  0be5  8d46fc           lea ax, [bp - 4]                         
  0be8  50               push ax                                  
  0be9  b8042c           mov ax, 0x2c04                           
  0bec  8ec0             mov es, ax                               
  0bee  26ff361001       push word ptr es:[0x110]                 
  0bf3  0e               push cs                                  
  0bf4  e850ff           call 0xb47                               
  0bf7  83c40a           add sp, 0xa                              
  0bfa  8946fe           mov word ptr [bp - 2], ax                
  0bfd  837efe00         cmp word ptr [bp - 2], 0                 
  0c01  7562             jne 0xc65                                
  0c03  33c9             xor cx, cx                               
  0c05  eb52             jmp 0xc59                                
  0c07  8bd9             mov bx, cx                               
  0c09  6bdb41           imul bx, bx, 0x41                        
  0c0c  b8042c           mov ax, 0x2c04                           
  0c0f  8ec0             mov es, ax                               
  0c11  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0c16  98               cwde                                     
  0c17  ba042c           mov dx, 0x2c04                           
  0c1a  8ec2             mov es, dx                               
  0c1c  263b061001       cmp ax, word ptr es:[0x110]              
  0c21  7535             jne 0xc58                                
  0c23  8bd9             mov bx, cx                               
  0c25  6bdb41           imul bx, bx, 0x41                        
  0c28  b8042c           mov ax, 0x2c04                           
  0c2b  8ec0             mov es, ax                               
  0c2d  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  0c33  7423             je 0xc58                                 
  0c35  8bd9             mov bx, cx                               
  0c37  6bdb41           imul bx, bx, 0x41                        
  0c3a  b8042c           mov ax, 0x2c04                           
  0c3d  8ec0             mov es, ax                               
  0c3f  2683bfb015fe     cmp word ptr es:[bx + 0x15b0], -2        
  0c45  7511             jne 0xc58                                
  0c47  8bd9             mov bx, cx                               
  0c49  6bdb41           imul bx, bx, 0x41                        
  0c4c  b8042c           mov ax, 0x2c04                           
  0c4f  8ec0             mov es, ax                               
  0c51  26c787ae150000   mov word ptr es:[bx + 0x15ae], 0         
  0c58  41               inc cx                                   
  0c59  b8042c           mov ax, 0x2c04                           
  0c5c  8ec0             mov es, ax                               
  0c5e  26390e7b15       cmp word ptr es:[0x157b], cx             
  0c63  7fa2             jg 0xc07                                 
  0c65  c9               leave                                    
  0c66  cb               retf                                     

ovl47_0c67:  ; ENTRY
  0c67  55               push bp                                  
  0c68  8bec             mov bp, sp                               
  0c6a  83ec06           sub sp, 6                                
  0c6d  56               push si                                  
  0c6e  57               push di                                  
  0c6f  b8042c           mov ax, 0x2c04                           
  0c72  8ec0             mov es, ax                               
  0c74  26ff366101       push word ptr es:[0x161]                 
  0c79  8ec0             mov es, ax                               
  0c7b  26ff361001       push word ptr es:[0x110]                 
  0c80  6a14             push 0x14                                
  0c82  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0c87  83c404           add sp, 4                                
  0c8a  52               push dx                                  
  0c8b  50               push ax                                  
  0c8c  1e               push ds                                  
  0c8d  68885c           push 0x5c88                              
  0c90  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0c95  83c40a           add sp, 0xa                              
  0c98  6a02             push 2                                   
  0c9a  1e               push ds                                  
  0c9b  68885c           push 0x5c88                              
  0c9e  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0ca3  83c406           add sp, 6                                
  0ca6  8bf8             mov di, ax                               
  0ca8  50               push ax                                  
  0ca9  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0cae  59               pop cx                                   
  0caf  8bf0             mov si, ax                               
  0cb1  50               push ax                                  
  0cb2  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0cb7  59               pop cx                                   
  0cb8  8956fc           mov word ptr [bp - 4], dx                
  0cbb  8946fa           mov word ptr [bp - 6], ax                
  0cbe  56               push si                                  
  0cbf  52               push dx                                  
  0cc0  50               push ax                                  
  0cc1  57               push di                                  
  0cc2  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0cc7  83c408           add sp, 8                                
  0cca  57               push di                                  
  0ccb  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0cd0  59               pop cx                                   
  0cd1  33ff             xor di, di                               
  0cd3  666a64           push 0x64                                
  0cd6  6a01             push 1                                   
  0cd8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0cdd  83c406           add sp, 6                                
  0ce0  8946fe           mov word ptr [bp - 2], ax                
  0ce3  33d2             xor dx, dx                               
  0ce5  eb15             jmp 0xcfc                                
  0ce7  c45efa           les bx, ptr [bp - 6]                     
  0cea  03da             add bx, dx                               
  0cec  26803f23         cmp byte ptr es:[bx], 0x23               
  0cf0  7509             jne 0xcfb                                
  0cf2  47               inc di                                   
  0cf3  3b7efe           cmp di, word ptr [bp - 2]                
  0cf6  7503             jne 0xcfb                                
  0cf8  42               inc dx                                   
  0cf9  eb05             jmp 0xd00                                
  0cfb  42               inc dx                                   
  0cfc  3bd6             cmp dx, si                               
  0cfe  7ce7             jl 0xce7                                 
  0d00  c45efa           les bx, ptr [bp - 6]                     
  0d03  03da             add bx, dx                               
  0d05  26803f30         cmp byte ptr es:[bx], 0x30               
  0d09  7504             jne 0xd0f                                
  0d0b  33c0             xor ax, ax                               
  0d0d  eb03             jmp 0xd12                                
  0d0f  b80100           mov ax, 1                                
  0d12  a3d044           mov word ptr [0x44d0], ax                
  0d15  83c202           add dx, 2                                
  0d18  8bca             mov cx, dx                               
  0d1a  eb2c             jmp 0xd48                                
  0d1c  c45efa           les bx, ptr [bp - 6]                     
  0d1f  03d9             add bx, cx                               
  0d21  26803f20         cmp byte ptr es:[bx], 0x20               
  0d25  7d20             jge 0xd47                                
  0d27  8b5efa           mov bx, word ptr [bp - 6]                
  0d2a  03d9             add bx, cx                               
  0d2c  26c60700         mov byte ptr es:[bx], 0                  
  0d30  8b46fa           mov ax, word ptr [bp - 6]                
  0d33  03c2             add ax, dx                               
  0d35  ff76fc           push word ptr [bp - 4]                   
  0d38  50               push ax                                  
  0d39  1e               push ds                                  
  0d3a  68d244           push 0x44d2                              
  0d3d  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0d42  83c408           add sp, 8                                
  0d45  eb05             jmp 0xd4c                                
  0d47  41               inc cx                                   
  0d48  3bce             cmp cx, si                               
  0d4a  7cd0             jl 0xd1c                                 
  0d4c  66ff76fa         push dword ptr [bp - 6]                  
  0d50  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0d55  83c404           add sp, 4                                
  0d58  5f               pop di                                   
  0d59  5e               pop si                                   
  0d5a  c9               leave                                    
  0d5b  cb               retf                                     

ovl47_0d5c:  ; ENTRY
  0d5c  55               push bp                                  
  0d5d  8bec             mov bp, sp                               
  0d5f  81ece800         sub sp, 0xe8                             
  0d63  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0d68  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0d6d  8946fe           mov word ptr [bp - 2], ax                
  0d70  c7066a160100     mov word ptr [0x166a], 1                 
  0d76  6a02             push 2                                   
  0d78  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0d7d  59               pop cx                                   
  0d7e  666a00           push 0                                   
  0d81  666801000100     push 0x10001                             
  0d87  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  0d8c  83c408           add sp, 8                                
  0d8f  6a01             push 1                                   
  0d91  8b1eec44         mov bx, word ptr [0x44ec]                
  0d95  6bdb41           imul bx, bx, 0x41                        
  0d98  b8042c           mov ax, 0x2c04                           
  0d9b  8ec0             mov es, ax                               
  0d9d  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0da2  8b1eec44         mov bx, word ptr [0x44ec]                
  0da6  6bdb41           imul bx, bx, 0x41                        
  0da9  b8042c           mov ax, 0x2c04                           
  0dac  8ec0             mov es, ax                               
  0dae  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0db3  9a4300f230       lcall 0x30f2, 0x43                       -> ovl63:1f5f
  0db8  83c406           add sp, 6                                
  0dbb  666a00           push 0                                   
  0dbe  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  0dc3  83c404           add sp, 4                                
  0dc6  0e               push cs                                  
  0dc7  e89dfe           call 0xc67                               
  0dca  837efe01         cmp word ptr [bp - 2], 1                 
  0dce  7403             je 0xdd3                                 
  0dd0  e91501           jmp 0xee8                                
  0dd3  833ed04400       cmp word ptr [0x44d0], 0                 
  0dd8  7403             je 0xddd                                 
  0dda  e98400           jmp 0xe61                                
  0ddd  666a61           push 0x61                                
  0de0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0de5  83c404           add sp, 4                                
  0de8  52               push dx                                  
  0de9  50               push ax                                  
  0dea  16               push ss                                  
  0deb  8d46ae           lea ax, [bp - 0x52]                      
  0dee  50               push ax                                  
  0def  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0df4  83c408           add sp, 8                                
  0df7  666861000100     push 0x10061                             
  0dfd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e02  83c404           add sp, 4                                
  0e05  52               push dx                                  
  0e06  50               push ax                                  
  0e07  16               push ss                                  
  0e08  8d867cff         lea ax, [bp - 0x84]                      
  0e0c  50               push ax                                  
  0e0d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e12  83c408           add sp, 8                                
  0e15  666861000200     push 0x20061                             
  0e1b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e20  83c404           add sp, 4                                
  0e23  52               push dx                                  
  0e24  50               push ax                                  
  0e25  16               push ss                                  
  0e26  8d864aff         lea ax, [bp - 0xb6]                      
  0e2a  50               push ax                                  
  0e2b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e30  83c408           add sp, 8                                
  0e33  a1ec44           mov ax, word ptr [0x44ec]                
  0e36  6bc041           imul ax, ax, 0x41                        
  0e39  058115           add ax, 0x1581                           
  0e3c  68042c           push 0x2c04                              
  0e3f  50               push ax                                  
  0e40  666861000300     push 0x30061                             
  0e46  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e4b  83c404           add sp, 4                                
  0e4e  52               push dx                                  
  0e4f  50               push ax                                  
  0e50  16               push ss                                  
  0e51  8d8618ff         lea ax, [bp - 0xe8]                      
  0e55  50               push ax                                  
  0e56  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e5b  83c40c           add sp, 0xc                              
  0e5e  e9b401           jmp 0x1015                               
  0e61  666861000800     push 0x80061                             
  0e67  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e6c  83c404           add sp, 4                                
  0e6f  52               push dx                                  
  0e70  50               push ax                                  
  0e71  16               push ss                                  
  0e72  8d46ae           lea ax, [bp - 0x52]                      
  0e75  50               push ax                                  
  0e76  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e7b  83c408           add sp, 8                                
  0e7e  666861000900     push 0x90061                             
  0e84  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e89  83c404           add sp, 4                                
  0e8c  52               push dx                                  
  0e8d  50               push ax                                  
  0e8e  16               push ss                                  
  0e8f  8d867cff         lea ax, [bp - 0x84]                      
  0e93  50               push ax                                  
  0e94  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e99  83c408           add sp, 8                                
  0e9c  666861000a00     push 0xa0061                             
  0ea2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0ea7  83c404           add sp, 4                                
  0eaa  52               push dx                                  
  0eab  50               push ax                                  
  0eac  16               push ss                                  
  0ead  8d864aff         lea ax, [bp - 0xb6]                      
  0eb1  50               push ax                                  
  0eb2  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0eb7  83c408           add sp, 8                                
  0eba  a1ec44           mov ax, word ptr [0x44ec]                
  0ebd  6bc041           imul ax, ax, 0x41                        
  0ec0  058115           add ax, 0x1581                           
  0ec3  68042c           push 0x2c04                              
  0ec6  50               push ax                                  
  0ec7  666861000b00     push 0xb0061                             
  0ecd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0ed2  83c404           add sp, 4                                
  0ed5  52               push dx                                  
  0ed6  50               push ax                                  
  0ed7  16               push ss                                  
  0ed8  8d8618ff         lea ax, [bp - 0xe8]                      
  0edc  50               push ax                                  
  0edd  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0ee2  83c40c           add sp, 0xc                              
  0ee5  e92d01           jmp 0x1015                               
  0ee8  833ed04400       cmp word ptr [0x44d0], 0                 
  0eed  7403             je 0xef2                                 
  0eef  e98600           jmp 0xf78                                
  0ef2  a1ec44           mov ax, word ptr [0x44ec]                
  0ef5  6bc041           imul ax, ax, 0x41                        
  0ef8  058115           add ax, 0x1581                           
  0efb  68042c           push 0x2c04                              
  0efe  50               push ax                                  
  0eff  666861000400     push 0x40061                             
  0f05  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f0a  83c404           add sp, 4                                
  0f0d  52               push dx                                  
  0f0e  50               push ax                                  
  0f0f  16               push ss                                  
  0f10  8d46ae           lea ax, [bp - 0x52]                      
  0f13  50               push ax                                  
  0f14  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0f19  83c40c           add sp, 0xc                              
  0f1c  ff361011         push word ptr [0x1110]                   
  0f20  666861000500     push 0x50061                             
  0f26  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f2b  83c404           add sp, 4                                
  0f2e  52               push dx                                  
  0f2f  50               push ax                                  
  0f30  16               push ss                                  
  0f31  8d867cff         lea ax, [bp - 0x84]                      
  0f35  50               push ax                                  
  0f36  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0f3b  83c40a           add sp, 0xa                              
  0f3e  b8042c           mov ax, 0x2c04                           
  0f41  8ec0             mov es, ax                               
  0f43  268b1e1001       mov bx, word ptr es:[0x110]              
  0f48  6bdb14           imul bx, bx, 0x14                        
  0f4b  b8042c           mov ax, 0x2c04                           
  0f4e  8ec0             mov es, ax                               
  0f50  26ffb78501       push word ptr es:[bx + 0x185]            
  0f55  666861000600     push 0x60061                             
  0f5b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f60  83c404           add sp, 4                                
  0f63  52               push dx                                  
  0f64  50               push ax                                  
  0f65  16               push ss                                  
  0f66  8d864aff         lea ax, [bp - 0xb6]                      
  0f6a  50               push ax                                  
  0f6b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0f70  83c40a           add sp, 0xa                              
  0f73  6a07             push 7                                   
  0f75  e98300           jmp 0xffb                                
  0f78  a1ec44           mov ax, word ptr [0x44ec]                
  0f7b  6bc041           imul ax, ax, 0x41                        
  0f7e  058115           add ax, 0x1581                           
  0f81  68042c           push 0x2c04                              
  0f84  50               push ax                                  
  0f85  666861000c00     push 0xc0061                             
  0f8b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f90  83c404           add sp, 4                                
  0f93  52               push dx                                  
  0f94  50               push ax                                  
  0f95  16               push ss                                  
  0f96  8d46ae           lea ax, [bp - 0x52]                      
  0f99  50               push ax                                  
  0f9a  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0f9f  83c40c           add sp, 0xc                              
  0fa2  ff361011         push word ptr [0x1110]                   
  0fa6  666861000d00     push 0xd0061                             
  0fac  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0fb1  83c404           add sp, 4                                
  0fb4  52               push dx                                  
  0fb5  50               push ax                                  
  0fb6  16               push ss                                  
  0fb7  8d867cff         lea ax, [bp - 0x84]                      
  0fbb  50               push ax                                  
  0fbc  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0fc1  83c40a           add sp, 0xa                              
  0fc4  b8042c           mov ax, 0x2c04                           
  0fc7  8ec0             mov es, ax                               
  0fc9  268b1e1001       mov bx, word ptr es:[0x110]              
  0fce  6bdb14           imul bx, bx, 0x14                        
  0fd1  b8042c           mov ax, 0x2c04                           
  0fd4  8ec0             mov es, ax                               
  0fd6  26ffb78501       push word ptr es:[bx + 0x185]            
  0fdb  666861000e00     push 0xe0061                             
  0fe1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0fe6  83c404           add sp, 4                                
  0fe9  52               push dx                                  
  0fea  50               push ax                                  
  0feb  16               push ss                                  
  0fec  8d864aff         lea ax, [bp - 0xb6]                      
  0ff0  50               push ax                                  
  0ff1  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0ff6  83c40a           add sp, 0xa                              
  0ff9  6a0f             push 0xf                                 
  0ffb  6a61             push 0x61                                
  0ffd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1002  83c404           add sp, 4                                
  1005  52               push dx                                  
  1006  50               push ax                                  
  1007  16               push ss                                  
  1008  8d8618ff         lea ax, [bp - 0xe8]                      
  100c  50               push ax                                  
  100d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1012  83c408           add sp, 8                                
  1015  666800000300     push 0x30000                             
  101b  666801000f00     push 0xf0001                             
  1021  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1026  83c408           add sp, 8                                
  1029  666a5f           push 0x5f                                
  102c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1031  83c404           add sp, 4                                
  1034  52               push dx                                  
  1035  50               push ax                                  
  1036  66ff362611       push dword ptr [0x1126]                  
  103b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1040  83c408           add sp, 8                                
  1043  833ed04400       cmp word ptr [0x44d0], 0                 
  1048  7516             jne 0x1060                               
  104a  66ff361a11       push dword ptr [0x111a]                  
  104f  b81211           mov ax, 0x1112                           
  1052  8cda             mov dx, ds                               
  1054  b90800           mov cx, 8                                
  1057  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  105c  6a21             push 0x21                                
  105e  eb14             jmp 0x1074                               
  1060  66ff361a11       push dword ptr [0x111a]                  
  1065  b81211           mov ax, 0x1112                           
  1068  8cda             mov dx, ds                               
  106a  b90800           mov cx, 8                                
  106d  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1072  6a22             push 0x22                                
  1074  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1079  83c40e           add sp, 0xe                              
  107c  6a00             push 0                                   
  107e  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1083  59               pop cx                                   
  1084  1e               push ds                                  
  1085  681e11           push 0x111e                              
  1088  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  108d  83c404           add sp, 4                                
  1090  66680e000300     push 0x3000e                             
  1096  666802000f00     push 0xf0002                             
  109c  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  10a1  83c408           add sp, 8                                
  10a4  16               push ss                                  
  10a5  8d46ae           lea ax, [bp - 0x52]                      
  10a8  50               push ax                                  
  10a9  66ff362a11       push dword ptr [0x112a]                  
  10ae  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10b3  83c408           add sp, 8                                
  10b6  16               push ss                                  
  10b7  8d867cff         lea ax, [bp - 0x84]                      
  10bb  50               push ax                                  
  10bc  66ff362e11       push dword ptr [0x112e]                  
  10c1  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10c6  83c408           add sp, 8                                
  10c9  16               push ss                                  
  10ca  8d864aff         lea ax, [bp - 0xb6]                      
  10ce  50               push ax                                  
  10cf  66ff363211       push dword ptr [0x1132]                  
  10d4  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10d9  83c408           add sp, 8                                
  10dc  16               push ss                                  
  10dd  8d8618ff         lea ax, [bp - 0xe8]                      
  10e1  50               push ax                                  
  10e2  66ff363611       push dword ptr [0x1136]                  
  10e7  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10ec  83c408           add sp, 8                                
  10ef  666800000300     push 0x30000                             
  10f5  666802000f00     push 0xf0002                             
  10fb  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1100  83c408           add sp, 8                                
  1103  1e               push ds                                  
  1104  68d244           push 0x44d2                              
  1107  66ff363e11       push dword ptr [0x113e]                  
  110c  66ff363a11       push dword ptr [0x113a]                  
  1111  9a5c00c130       lcall 0x30c1, 0x5c                       -> ovl59:0058
  1116  83c40c           add sp, 0xc                              
  1119  6a00             push 0                                   
  111b  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1120  59               pop cx                                   
  1121  1e               push ds                                  
  1122  684211           push 0x1142                              
  1125  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  112a  83c404           add sp, 4                                
  112d  66ff364a11       push dword ptr [0x114a]                  
  1132  833ed04400       cmp word ptr [0x44d0], 0                 
  1137  7504             jne 0x113d                               
  1139  33c0             xor ax, ax                               
  113b  eb03             jmp 0x1140                               
  113d  b80100           mov ax, 1                                
  1140  c1e003           shl ax, 3                                
  1143  8cda             mov dx, ds                               
  1145  05d40a           add ax, 0xad4                            
  1148  b90800           mov cx, 8                                
  114b  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1150  6a08             push 8                                   
  1152  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1157  83c40e           add sp, 0xe                              
  115a  66ff364e11       push dword ptr [0x114e]                  
  115f  833ed04400       cmp word ptr [0x44d0], 0                 
  1164  7505             jne 0x116b                               
  1166  b80100           mov ax, 1                                
  1169  eb02             jmp 0x116d                               
  116b  33c0             xor ax, ax                               
  116d  c1e003           shl ax, 3                                
  1170  8cda             mov dx, ds                               
  1172  05d40a           add ax, 0xad4                            
  1175  b90800           mov cx, 8                                
  1178  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  117d  6a08             push 8                                   
  117f  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1184  83c40e           add sp, 0xe                              
  1187  666a62           push 0x62                                
  118a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  118f  83c404           add sp, 4                                
  1192  52               push dx                                  
  1193  50               push ax                                  
  1194  66ff365211       push dword ptr [0x1152]                  
  1199  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  119e  83c408           add sp, 8                                
  11a1  666862000100     push 0x10062                             
  11a7  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  11ac  83c404           add sp, 4                                
  11af  52               push dx                                  
  11b0  50               push ax                                  
  11b1  66ff365611       push dword ptr [0x1156]                  
  11b6  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  11bb  83c408           add sp, 8                                
  11be  6a0c             push 0xc                                 
  11c0  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  11c5  59               pop cx                                   
  11c6  90               nop                                      
  11c7  0e               push cs                                  
  11c8  e84100           call 0x120c                              
  11cb  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  11d0  b8042c           mov ax, 0x2c04                           
  11d3  8ec0             mov es, ax                               
  11d5  26833e2e0100     cmp word ptr es:[0x12e], 0               
  11db  742d             je 0x120a                                
  11dd  8ec0             mov es, ax                               
  11df  26a03401         mov al, byte ptr es:[0x134]              
  11e3  250100           and ax, 1                                
  11e6  0bc0             or ax, ax                                
  11e8  7520             jne 0x120a                               
  11ea  b8042c           mov ax, 0x2c04                           
  11ed  8ec0             mov es, ax                               
  11ef  26800e340101     or byte ptr es:[0x134], 1                
  11f5  666a19           push 0x19                                
  11f8  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  11fd  83c404           add sp, 4                                
  1200  52               push dx                                  
  1201  50               push ax                                  
  1202  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  1207  83c404           add sp, 4                                
  120a  c9               leave                                    
  120b  cb               retf                                     

ovl47_120c:  ; ENTRY
  120c  55               push bp                                  
  120d  8bec             mov bp, sp                               
  120f  66681f010100     push 0x1011f                             
  1215  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  121a  83c404           add sp, 4                                
  121d  666821010100     push 0x10121                             
  1223  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1228  83c404           add sp, 4                                
  122b  833ed04400       cmp word ptr [0x44d0], 0                 
  1230  7512             jne 0x1244                               
  1232  666822010000     push 0x122                               
  1238  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  123d  83c404           add sp, 4                                
  1240  6a01             push 1                                   
  1242  eb10             jmp 0x1254                               
  1244  666822010100     push 0x10122                             
  124a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  124f  83c404           add sp, 4                                
  1252  6a00             push 0                                   
  1254  682301           push 0x123                               
  1257  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  125c  83c404           add sp, 4                                
  125f  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  1264  3d0100           cmp ax, 1                                
  1267  750f             jne 0x1278                               
  1269  6a02             push 2                                   
  126b  682001           push 0x120                               
  126e  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1273  83c404           add sp, 4                                
  1276  eb04             jmp 0x127c                               
  1278  6a01             push 1                                   
  127a  ebef             jmp 0x126b                               
  127c  5d               pop bp                                   
  127d  cb               retf                                     

ovl47_127e:  ; ENTRY
  127e  55               push bp                                  
  127f  8bec             mov bp, sp                               
  1281  ff36d044         push word ptr [0x44d0]                   
  1285  1e               push ds                                  
  1286  68d244           push 0x44d2                              
  1289  0e               push cs                                  
  128a  e88ef0           call 0x31b                               
  128d  83c406           add sp, 6                                
  1290  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  1295  666800000100     push 0x10000                             
  129b  6a01             push 1                                   
  129d  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  12a2  83c406           add sp, 6                                
  12a5  6a01             push 1                                   
  12a7  9a2a002031       lcall 0x3120, 0x2a                       -> ovl68:04bd
  12ac  59               pop cx                                   
  12ad  5d               pop bp                                   
  12ae  cb               retf                                     

ovl47_12af:  ; ENTRY
  12af  55               push bp                                  
  12b0  8bec             mov bp, sp                               
  12b2  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  12b7  666a00           push 0                                   
  12ba  6a00             push 0                                   
  12bc  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  12c1  83c406           add sp, 6                                
  12c4  6a01             push 1                                   
  12c6  9a2a002031       lcall 0x3120, 0x2a                       -> ovl68:04bd
  12cb  59               pop cx                                   
  12cc  5d               pop bp                                   
  12cd  cb               retf                                     

ovl47_12ce:  ; ENTRY
  12ce  55               push bp                                  
  12cf  8bec             mov bp, sp                               
  12d1  a13e11           mov ax, word ptr [0x113e]                
  12d4  05e0ff           add ax, 0xffe0                           
  12d7  50               push ax                                  
  12d8  6a0f             push 0xf                                 
  12da  1e               push ds                                  
  12db  68d244           push 0x44d2                              
  12de  b83a11           mov ax, 0x113a                           
  12e1  8cda             mov dx, ds                               
  12e3  b90800           mov cx, 8                                
  12e6  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  12eb  9a4800a530       lcall 0x30a5, 0x48                       -> ovl56:03a6
  12f0  83c410           add sp, 0x10                             
  12f3  0e               push cs                                  
  12f4  e815ff           call 0x120c                              
  12f7  5d               pop bp                                   
  12f8  cb               retf                                     

ovl47_12f9:  ; ENTRY
  12f9  55               push bp                                  
  12fa  8bec             mov bp, sp                               
  12fc  81ecc800         sub sp, 0xc8                              ; "Quest"
  1300  8b4606           mov ax, word ptr [bp + 6]                
  1303  a3d044           mov word ptr [0x44d0], ax                
  1306  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  130b  833ed04400       cmp word ptr [0x44d0], 0                 
  1310  7516             jne 0x1328                               
  1312  66ff361a11       push dword ptr [0x111a]                  
  1317  b81211           mov ax, 0x1112                           
  131a  8cda             mov dx, ds                               
  131c  b90800           mov cx, 8                                
  131f  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1324  6a21             push 0x21                                
  1326  eb14             jmp 0x133c                               
  1328  66ff361a11       push dword ptr [0x111a]                  
  132d  b81211           mov ax, 0x1112                           
  1330  8cda             mov dx, ds                               
  1332  b90800           mov cx, 8                                
  1335  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  133a  6a22             push 0x22                                
  133c  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1341  83c40e           add sp, 0xe                              
  1344  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  1349  3d0100           cmp ax, 1                                
  134c  7403             je 0x1351                                
  134e  e91301           jmp 0x1464                               
  1351  833ed04400       cmp word ptr [0x44d0], 0                 
  1356  7403             je 0x135b                                
  1358  e98300           jmp 0x13de                               
  135b  666a61           push 0x61                                
  135e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1363  83c404           add sp, 4                                
  1366  52               push dx                                  
  1367  50               push ax                                  
  1368  16               push ss                                  
  1369  8d46ce           lea ax, [bp - 0x32]                      
  136c  50               push ax                                  
  136d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1372  83c408           add sp, 8                                
  1375  666861000100     push 0x10061                             
  137b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1380  83c404           add sp, 4                                
  1383  52               push dx                                  
  1384  50               push ax                                  
  1385  16               push ss                                  
  1386  8d469c           lea ax, [bp - 0x64]                      
  1389  50               push ax                                  
  138a  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  138f  83c408           add sp, 8                                
  1392  666861000200     push 0x20061                             
  1398  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  139d  83c404           add sp, 4                                
  13a0  52               push dx                                  
  13a1  50               push ax                                  
  13a2  16               push ss                                  
  13a3  8d866aff         lea ax, [bp - 0x96]                      
  13a7  50               push ax                                  
  13a8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  13ad  83c408           add sp, 8                                
  13b0  a1ec44           mov ax, word ptr [0x44ec]                
  13b3  6bc041           imul ax, ax, 0x41                        
  13b6  058115           add ax, 0x1581                           
  13b9  68042c           push 0x2c04                              
  13bc  50               push ax                                  
  13bd  666861000300     push 0x30061                             
  13c3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  13c8  83c404           add sp, 4                                
  13cb  52               push dx                                  
  13cc  50               push ax                                  
  13cd  16               push ss                                  
  13ce  8d8638ff         lea ax, [bp - 0xc8]                      
  13d2  50               push ax                                  
  13d3  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  13d8  83c40c           add sp, 0xc                              
  13db  e9b101           jmp 0x158f                               
  13de  666861000800     push 0x80061                             
  13e4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  13e9  83c404           add sp, 4                                
  13ec  52               push dx                                  
  13ed  50               push ax                                  
  13ee  16               push ss                                  
  13ef  8d46ce           lea ax, [bp - 0x32]                      
  13f2  50               push ax                                  
  13f3  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  13f8  83c408           add sp, 8                                
  13fb  666861000900     push 0x90061                             
  1401  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1406  83c404           add sp, 4                                
  1409  52               push dx                                  
  140a  50               push ax                                  
  140b  16               push ss                                  
  140c  8d469c           lea ax, [bp - 0x64]                      
  140f  50               push ax                                  
  1410  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1415  83c408           add sp, 8                                
  1418  666861000a00     push 0xa0061                             
  141e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1423  83c404           add sp, 4                                
  1426  52               push dx                                  
  1427  50               push ax                                  
  1428  16               push ss                                  
  1429  8d866aff         lea ax, [bp - 0x96]                      
  142d  50               push ax                                  
  142e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1433  83c408           add sp, 8                                
  1436  a1ec44           mov ax, word ptr [0x44ec]                
  1439  6bc041           imul ax, ax, 0x41                        
  143c  058115           add ax, 0x1581                           
  143f  68042c           push 0x2c04                              
  1442  50               push ax                                  
  1443  666861000b00     push 0xb0061                             
  1449  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  144e  83c404           add sp, 4                                
  1451  52               push dx                                  
  1452  50               push ax                                  
  1453  16               push ss                                  
  1454  8d8638ff         lea ax, [bp - 0xc8]                      
  1458  50               push ax                                  
  1459  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  145e  83c40c           add sp, 0xc                              
  1461  e92b01           jmp 0x158f                               
  1464  833ed04400       cmp word ptr [0x44d0], 0                 
  1469  7403             je 0x146e                                
  146b  e98500           jmp 0x14f3                               
  146e  a1ec44           mov ax, word ptr [0x44ec]                
  1471  6bc041           imul ax, ax, 0x41                        
  1474  058115           add ax, 0x1581                           
  1477  68042c           push 0x2c04                              
  147a  50               push ax                                  
  147b  666861000400     push 0x40061                             
  1481  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1486  83c404           add sp, 4                                
  1489  52               push dx                                  
  148a  50               push ax                                  
  148b  16               push ss                                  
  148c  8d46ce           lea ax, [bp - 0x32]                      
  148f  50               push ax                                  
  1490  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1495  83c40c           add sp, 0xc                              
  1498  ff361011         push word ptr [0x1110]                   
  149c  666861000500     push 0x50061                             
  14a2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  14a7  83c404           add sp, 4                                
  14aa  52               push dx                                  
  14ab  50               push ax                                  
  14ac  16               push ss                                  
  14ad  8d469c           lea ax, [bp - 0x64]                      
  14b0  50               push ax                                  
  14b1  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  14b6  83c40a           add sp, 0xa                              
  14b9  b8042c           mov ax, 0x2c04                           
  14bc  8ec0             mov es, ax                               
  14be  268b1e1001       mov bx, word ptr es:[0x110]              
  14c3  6bdb14           imul bx, bx, 0x14                        
  14c6  b8042c           mov ax, 0x2c04                           
  14c9  8ec0             mov es, ax                               
  14cb  26ffb78501       push word ptr es:[bx + 0x185]            
  14d0  666861000600     push 0x60061                             
  14d6  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  14db  83c404           add sp, 4                                
  14de  52               push dx                                  
  14df  50               push ax                                  
  14e0  16               push ss                                  
  14e1  8d866aff         lea ax, [bp - 0x96]                      
  14e5  50               push ax                                  
  14e6  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  14eb  83c40a           add sp, 0xa                              
  14ee  6a07             push 7                                   
  14f0  e98200           jmp 0x1575                               
  14f3  a1ec44           mov ax, word ptr [0x44ec]                
  14f6  6bc041           imul ax, ax, 0x41                        
  14f9  058115           add ax, 0x1581                           
  14fc  68042c           push 0x2c04                              
  14ff  50               push ax                                  
  1500  666861000c00     push 0xc0061                             
  1506  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  150b  83c404           add sp, 4                                
  150e  52               push dx                                  
  150f  50               push ax                                  
  1510  16               push ss                                  
  1511  8d46ce           lea ax, [bp - 0x32]                      
  1514  50               push ax                                  
  1515  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  151a  83c40c           add sp, 0xc                              
  151d  ff361011         push word ptr [0x1110]                   
  1521  666861000d00     push 0xd0061                             
  1527  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  152c  83c404           add sp, 4                                
  152f  52               push dx                                  
  1530  50               push ax                                  
  1531  16               push ss                                  
  1532  8d469c           lea ax, [bp - 0x64]                      
  1535  50               push ax                                  
  1536  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  153b  83c40a           add sp, 0xa                              
  153e  b8042c           mov ax, 0x2c04                           
  1541  8ec0             mov es, ax                               
  1543  268b1e1001       mov bx, word ptr es:[0x110]              
  1548  6bdb14           imul bx, bx, 0x14                        
  154b  b8042c           mov ax, 0x2c04                           
  154e  8ec0             mov es, ax                               
  1550  26ffb78501       push word ptr es:[bx + 0x185]            
  1555  666861000e00     push 0xe0061                             
  155b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1560  83c404           add sp, 4                                
  1563  52               push dx                                  
  1564  50               push ax                                  
  1565  16               push ss                                  
  1566  8d866aff         lea ax, [bp - 0x96]                      
  156a  50               push ax                                  
  156b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1570  83c40a           add sp, 0xa                              
  1573  6a0f             push 0xf                                 
  1575  6a61             push 0x61                                
  1577  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  157c  83c404           add sp, 4                                
  157f  52               push dx                                  
  1580  50               push ax                                  
  1581  16               push ss                                  
  1582  8d8638ff         lea ax, [bp - 0xc8]                      
  1586  50               push ax                                  
  1587  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  158c  83c408           add sp, 8                                
  158f  66680e000300     push 0x3000e                             
  1595  666802000f00     push 0xf0002                             
  159b  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  15a0  83c408           add sp, 8                                
  15a3  16               push ss                                  
  15a4  8d46ce           lea ax, [bp - 0x32]                      
  15a7  50               push ax                                  
  15a8  66ff362a11       push dword ptr [0x112a]                  
  15ad  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  15b2  83c408           add sp, 8                                
  15b5  16               push ss                                  
  15b6  8d469c           lea ax, [bp - 0x64]                      
  15b9  50               push ax                                  
  15ba  66ff362e11       push dword ptr [0x112e]                  
  15bf  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  15c4  83c408           add sp, 8                                
  15c7  16               push ss                                  
  15c8  8d866aff         lea ax, [bp - 0x96]                      
  15cc  50               push ax                                  
  15cd  66ff363211       push dword ptr [0x1132]                  
  15d2  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  15d7  83c408           add sp, 8                                
  15da  16               push ss                                  
  15db  8d8638ff         lea ax, [bp - 0xc8]                      
  15df  50               push ax                                  
  15e0  66ff363611       push dword ptr [0x1136]                  
  15e5  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  15ea  83c408           add sp, 8                                
  15ed  66ff364a11       push dword ptr [0x114a]                  
  15f2  833ed04400       cmp word ptr [0x44d0], 0                 
  15f7  7504             jne 0x15fd                               
  15f9  33c0             xor ax, ax                               
  15fb  eb03             jmp 0x1600                               
  15fd  b80100           mov ax, 1                                
  1600  c1e003           shl ax, 3                                
  1603  8cda             mov dx, ds                               
  1605  05d40a           add ax, 0xad4                            
  1608  b90800           mov cx, 8                                
  160b  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1610  6a08             push 8                                   
  1612  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1617  83c40e           add sp, 0xe                              
  161a  66ff364e11       push dword ptr [0x114e]                  
  161f  833ed04400       cmp word ptr [0x44d0], 0                 
  1624  7505             jne 0x162b                               
  1626  b80100           mov ax, 1                                
  1629  eb02             jmp 0x162d                               
  162b  33c0             xor ax, ax                               
  162d  c1e003           shl ax, 3                                
  1630  8cda             mov dx, ds                               
  1632  05d40a           add ax, 0xad4                            
  1635  b90800           mov cx, 8                                
  1638  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  163d  6a08             push 8                                   
  163f  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  1644  83c40e           add sp, 0xe                              
  1647  0e               push cs                                  
  1648  e8c1fb           call 0x120c                              
  164b  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1650  c9               leave                                    
  1651  cb               retf                                     

ovl47_1652:  ; ENTRY
  1652  55               push bp                                  
  1653  8bec             mov bp, sp                               
  1655  83ec1c           sub sp, 0x1c                             
  1658  56               push si                                  
  1659  57               push di                                  
  165a  33f6             xor si, si                               
  165c  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1661  6a00             push 0                                   
  1663  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1668  59               pop cx                                   
  1669  c7066a160100     mov word ptr [0x166a], 1                 
  166f  6a1c             push 0x1c                                
  1671  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1676  59               pop cx                                   
  1677  6668d5010100     push 0x101d5                             
  167d  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1682  83c404           add sp, 4                                
  1685  666800000300     push 0x30000                             
  168b  666801000f00     push 0xf0001                             
  1691  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1696  83c408           add sp, 8                                
  1699  666a68           push 0x68                                
  169c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  16a1  83c404           add sp, 4                                
  16a4  52               push dx                                  
  16a5  50               push ax                                  
  16a6  666840013f00     push 0x3f0140                            
  16ac  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  16b1  83c408           add sp, 8                                
  16b4  6a03             push 3                                   
  16b6  b8042c           mov ax, 0x2c04                           
  16b9  8ec0             mov es, ax                               
  16bb  268b1e1001       mov bx, word ptr es:[0x110]              
  16c0  d1e3             shl bx, 1                                
  16c2  b8042c           mov ax, 0x2c04                           
  16c5  8ec0             mov es, ax                               
  16c7  26ffb7b000       push word ptr es:[bx + 0xb0]             
  16cc  b8042c           mov ax, 0x2c04                           
  16cf  8ec0             mov es, ax                               
  16d1  268b1e1001       mov bx, word ptr es:[0x110]              
  16d6  d1e3             shl bx, 1                                
  16d8  b8042c           mov ax, 0x2c04                           
  16db  8ec0             mov es, ax                               
  16dd  26ffb7a000       push word ptr es:[bx + 0xa0]             
  16e2  6a02             push 2                                   
  16e4  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  16e9  83c408           add sp, 8                                
  16ec  666868000100     push 0x10068                             
  16f2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  16f7  83c404           add sp, 4                                
  16fa  52               push dx                                  
  16fb  50               push ax                                  
  16fc  666880006900     push 0x690080                            
  1702  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1707  83c408           add sp, 8                                
  170a  666868000200     push 0x20068                             
  1710  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1715  83c404           add sp, 4                                
  1718  52               push dx                                  
  1719  50               push ax                                  
  171a  666810016900     push 0x690110                            
  1720  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1725  83c408           add sp, 8                                
  1728  666868000300     push 0x30068                             
  172e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1733  83c404           add sp, 4                                
  1736  52               push dx                                  
  1737  50               push ax                                  
  1738  666888016900     push 0x690188                            
  173e  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1743  83c408           add sp, 8                                
  1746  666868000400     push 0x40068                             
  174c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1751  83c404           add sp, 4                                
  1754  52               push dx                                  
  1755  50               push ax                                  
  1756  6668b8016900     push 0x6901b8                            
  175c  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1761  83c408           add sp, 8                                
  1764  666868000500     push 0x50068                             
  176a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  176f  83c404           add sp, 4                                
  1772  52               push dx                                  
  1773  50               push ax                                  
  1774  6668e8016900     push 0x6901e8                            
  177a  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  177f  83c408           add sp, 8                                
  1782  666868000600     push 0x60068                             
  1788  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  178d  83c404           add sp, 4                                
  1790  52               push dx                                  
  1791  50               push ax                                  
  1792  666818026900     push 0x690218                            
  1798  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  179d  83c408           add sp, 8                                
  17a0  666800000300     push 0x30000                             
  17a6  666802000f00     push 0xf0002                             
  17ac  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  17b1  83c408           add sp, 8                                
  17b4  c746fe0400       mov word ptr [bp - 2], 4                 
  17b9  e96102           jmp 0x1a1d                               
  17bc  b8042c           mov ax, 0x2c04                           
  17bf  8ec0             mov es, ax                               
  17c1  26a18101         mov ax, word ptr es:[0x181]              
  17c5  8946fc           mov word ptr [bp - 4], ax                
  17c8  e94502           jmp 0x1a10                               
  17cb  8b5efc           mov bx, word ptr [bp - 4]                
  17ce  6bdb16           imul bx, bx, 0x16                        
  17d1  b81d1e           mov ax, 0x1e1d                           
  17d4  8ec0             mov es, ax                               
  17d6  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  17dc  7403             je 0x17e1                                
  17de  e92f02           jmp 0x1a10                               
  17e1  8b5efc           mov bx, word ptr [bp - 4]                
  17e4  6bdb16           imul bx, bx, 0x16                        
  17e7  b81d1e           mov ax, 0x1e1d                           
  17ea  8ec0             mov es, ax                               
  17ec  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  17f1  98               cwde                                     
  17f2  ba042c           mov dx, 0x2c04                           
  17f5  8ec2             mov es, dx                               
  17f7  263b061001       cmp ax, word ptr es:[0x110]              
  17fc  7403             je 0x1801                                
  17fe  e90f02           jmp 0x1a10                               
  1801  8b5efc           mov bx, word ptr [bp - 4]                
  1804  6bdb16           imul bx, bx, 0x16                        
  1807  b81d1e           mov ax, 0x1e1d                           
  180a  8ec0             mov es, ax                               
  180c  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  1811  98               cwde                                     
  1812  ba042c           mov dx, 0x2c04                           
  1815  8bd8             mov bx, ax                               
  1817  8ec2             mov es, dx                               
  1819  268a87e305       mov al, byte ptr es:[bx + 0x5e3]         
  181e  250300           and ax, 3                                
  1821  3b46fe           cmp ax, word ptr [bp - 2]                
  1824  7403             je 0x1829                                
  1826  e9e701           jmp 0x1a10                               
  1829  8b5efc           mov bx, word ptr [bp - 4]                
  182c  6bdb16           imul bx, bx, 0x16                        
  182f  b81d1e           mov ax, 0x1e1d                           
  1832  8ec0             mov es, ax                               
  1834  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  1839  98               cwde                                     
  183a  8bf8             mov di, ax                               
  183c  837efe03         cmp word ptr [bp - 2], 3                 
  1840  750e             jne 0x1850                               
  1842  b8042c           mov ax, 0x2c04                           
  1845  8ec0             mov es, ax                               
  1847  26a11001         mov ax, word ptr es:[0x110]              
  184b  050200           add ax, 2                                
  184e  eb03             jmp 0x1853                               
  1850  b80100           mov ax, 1                                
  1853  8946fa           mov word ptr [bp - 6], ax                
  1856  666a00           push 0                                   
  1859  50               push ax                                  
  185a  666a00           push 0                                   
  185d  666a00           push 0                                   
  1860  8bc6             mov ax, si                               
  1862  6bc01e           imul ax, ax, 0x1e                        
  1865  058000           add ax, 0x80                             
  1868  50               push ax                                  
  1869  6a58             push 0x58                                
  186b  1e               push ds                                  
  186c  682a34           push 0x342a                              
  186f  b8042c           mov ax, 0x2c04                           
  1872  8ec0             mov es, ax                               
  1874  26ff361001       push word ptr es:[0x110]                 
  1879  6a1c             push 0x1c                                
  187b  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  1880  83c41a           add sp, 0x1a                             
  1883  8bc7             mov ax, di                               
  1885  6bc014           imul ax, ax, 0x14                        
  1888  052302           add ax, 0x223                            
  188b  68042c           push 0x2c04                              
  188e  50               push ax                                  
  188f  8bc6             mov ax, si                               
  1891  6bc01e           imul ax, ax, 0x1e                        
  1894  058600           add ax, 0x86                             
  1897  50               push ax                                  
  1898  688000           push 0x80                                
  189b  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  18a0  83c408           add sp, 8                                
  18a3  8bdf             mov bx, di                               
  18a5  d1e3             shl bx, 1                                
  18a7  b8042c           mov ax, 0x2c04                           
  18aa  8ec0             mov es, ax                               
  18ac  2683bf930500     cmp word ptr es:[bx + 0x593], 0          
  18b2  7512             jne 0x18c6                               
  18b4  b8042c           mov ax, 0x2c04                           
  18b7  8ec0             mov es, ax                               
  18b9  268a85e305       mov al, byte ptr es:[di + 0x5e3]         
  18be  250300           and ax, 3                                
  18c1  50               push ax                                  
  18c2  6a63             push 0x63                                
  18c4  eb10             jmp 0x18d6                               
  18c6  b8042c           mov ax, 0x2c04                           
  18c9  8ec0             mov es, ax                               
  18cb  268a85e305       mov al, byte ptr es:[di + 0x5e3]         
  18d0  250300           and ax, 3                                
  18d3  50               push ax                                  
  18d4  6a64             push 0x64                                
  18d6  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  18db  83c404           add sp, 4                                
  18de  52               push dx                                  
  18df  50               push ax                                  
  18e0  8bc6             mov ax, si                               
  18e2  6bc01e           imul ax, ax, 0x1e                        
  18e5  058600           add ax, 0x86                             
  18e8  50               push ax                                  
  18e9  681001           push 0x110                               
  18ec  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  18f1  83c408           add sp, 8                                
  18f4  b8042c           mov ax, 0x2c04                           
  18f7  8ec0             mov es, ax                               
  18f9  268a85e305       mov al, byte ptr es:[di + 0x5e3]         
  18fe  c1e802           shr ax, 2                                
  1901  253f00           and ax, 0x3f                             
  1904  50               push ax                                  
  1905  1e               push ds                                  
  1906  685d11           push 0x115d                              
  1909  16               push ss                                  
  190a  8d46e4           lea ax, [bp - 0x1c]                      
  190d  50               push ax                                  
  190e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1913  83c40a           add sp, 0xa                              
  1916  16               push ss                                  
  1917  8d46e4           lea ax, [bp - 0x1c]                      
  191a  50               push ax                                  
  191b  8bc6             mov ax, si                               
  191d  6bc01e           imul ax, ax, 0x1e                        
  1920  058600           add ax, 0x86                             
  1923  50               push ax                                  
  1924  688801           push 0x188                               
  1927  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  192c  83c408           add sp, 8                                
  192f  b8042c           mov ax, 0x2c04                           
  1932  8ec0             mov es, ax                               
  1934  268a9de305       mov bl, byte ptr es:[di + 0x5e3]         
  1939  83e303           and bx, 3                                
  193c  83fb03           cmp bx, 3                                
  193f  773d             ja 0x197e                                
  1941  d1e3             shl bx, 1                                
  1943  2effa7721a       jmp word ptr cs:[bx + 0x1a72]            
ovl47_1948:  ; case
  1948  6a0f             push 0xf                                 
  194a  1e               push ds                                  
  194b  686011           push 0x1160                              
  194e  16               push ss                                  
  194f  8d46e4           lea ax, [bp - 0x1c]                      
  1952  50               push ax                                  
  1953  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1958  83c40a           add sp, 0xa                              
  195b  eb21             jmp 0x197e                               
ovl47_195d:  ; case
  195d  6a1e             push 0x1e                                
  195f  1e               push ds                                  
  1960  686311           push 0x1163                              
  1963  ebe9             jmp 0x194e                               
ovl47_1965:  ; case
  1965  6a3c             push 0x3c                                
  1967  1e               push ds                                  
  1968  686611           push 0x1166                              
  196b  ebe1             jmp 0x194e                               
ovl47_196d:  ; case
  196d  1e               push ds                                  
  196e  686911           push 0x1169                              
  1971  16               push ss                                  
  1972  8d46e4           lea ax, [bp - 0x1c]                      
  1975  50               push ax                                  
  1976  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  197b  83c408           add sp, 8                                
  197e  16               push ss                                  
  197f  8d46e4           lea ax, [bp - 0x1c]                      
  1982  50               push ax                                  
  1983  8bc6             mov ax, si                               
  1985  6bc01e           imul ax, ax, 0x1e                        
  1988  058600           add ax, 0x86                             
  198b  50               push ax                                  
  198c  68b801           push 0x1b8                               
  198f  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1994  83c408           add sp, 8                                
  1997  8b5efc           mov bx, word ptr [bp - 4]                
  199a  6bdb16           imul bx, bx, 0x16                        
  199d  b81d1e           mov ax, 0x1e1d                           
  19a0  8ec0             mov es, ax                               
  19a2  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  19a7  98               cwde                                     
  19a8  50               push ax                                  
  19a9  1e               push ds                                  
  19aa  686b11           push 0x116b                              
  19ad  16               push ss                                  
  19ae  8d46e4           lea ax, [bp - 0x1c]                      
  19b1  50               push ax                                  
  19b2  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  19b7  83c40a           add sp, 0xa                              
  19ba  16               push ss                                  
  19bb  8d46e4           lea ax, [bp - 0x1c]                      
  19be  50               push ax                                  
  19bf  8bc6             mov ax, si                               
  19c1  6bc01e           imul ax, ax, 0x1e                        
  19c4  058600           add ax, 0x86                             
  19c7  50               push ax                                  
  19c8  68e801           push 0x1e8                               
  19cb  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  19d0  83c408           add sp, 8                                
  19d3  8b5efc           mov bx, word ptr [bp - 4]                
  19d6  6bdb16           imul bx, bx, 0x16                        
  19d9  b81d1e           mov ax, 0x1e1d                           
  19dc  8ec0             mov es, ax                               
  19de  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  19e3  98               cwde                                     
  19e4  50               push ax                                  
  19e5  1e               push ds                                  
  19e6  686e11           push 0x116e                              
  19e9  16               push ss                                  
  19ea  8d46e4           lea ax, [bp - 0x1c]                      
  19ed  50               push ax                                  
  19ee  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  19f3  83c40a           add sp, 0xa                              
  19f6  16               push ss                                  
  19f7  8d46e4           lea ax, [bp - 0x1c]                      
  19fa  50               push ax                                  
  19fb  8bc6             mov ax, si                               
  19fd  6bc01e           imul ax, ax, 0x1e                        
  1a00  058600           add ax, 0x86                             
  1a03  50               push ax                                  
  1a04  681802           push 0x218                               
  1a07  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1a0c  83c408           add sp, 8                                
  1a0f  46               inc si                                   
  1a10  8b46fc           mov ax, word ptr [bp - 4]                
  1a13  ff4efc           dec word ptr [bp - 4]                    
  1a16  0bc0             or ax, ax                                
  1a18  7403             je 0x1a1d                                
  1a1a  e9aefd           jmp 0x17cb                               
  1a1d  8b46fe           mov ax, word ptr [bp - 2]                
  1a20  ff4efe           dec word ptr [bp - 2]                    
  1a23  0bc0             or ax, ax                                
  1a25  7403             je 0x1a2a                                
  1a27  e992fd           jmp 0x17bc                               
  1a2a  8976f8           mov word ptr [bp - 8], si                
  1a2d  8b76f8           mov si, word ptr [bp - 8]                
  1a30  eb32             jmp 0x1a64                               
  1a32  666a00           push 0                                   
  1a35  666800000100     push 0x10000                             
  1a3b  666a00           push 0                                   
  1a3e  6a00             push 0                                   
  1a40  8bc6             mov ax, si                               
  1a42  6bc01e           imul ax, ax, 0x1e                        
  1a45  058000           add ax, 0x80                             
  1a48  50               push ax                                  
  1a49  6a58             push 0x58                                
  1a4b  1e               push ds                                  
  1a4c  682a34           push 0x342a                              
  1a4f  b8042c           mov ax, 0x2c04                           
  1a52  8ec0             mov es, ax                               
  1a54  26ff361001       push word ptr es:[0x110]                 
  1a59  6aff             push -1                                  
  1a5b  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  1a60  83c41a           add sp, 0x1a                             
  1a63  46               inc si                                   
  1a64  83fe06           cmp si, 6                                
  1a67  7cc9             jl 0x1a32                                
  1a69  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1a6e  5f               pop di                                   
  1a6f  5e               pop si                                   
  1a70  c9               leave                                    
  1a71  cb               retf                                     
  1a72  48195d1965196d19 dw 1948,195d,1965,196d                   jump table

ovl47_1a7a:  ; ENTRY
  1a7a  55               push bp                                  
  1a7b  8bec             mov bp, sp                               
  1a7d  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1a82  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  1a87  666a00           push 0                                   
  1a8a  6a00             push 0                                   
  1a8c  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  1a91  83c406           add sp, 6                                
  1a94  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1a99  5d               pop bp                                   
  1a9a  cb               retf                                     

ovl47_1a9b:  ; ENTRY
  1a9b  55               push bp                                  
  1a9c  8bec             mov bp, sp                               
  1a9e  83ec02           sub sp, 2                                
  1aa1  33c0             xor ax, ax                               
  1aa3  33d2             xor dx, dx                               
  1aa5  eb0e             jmp 0x1ab5                               
  1aa7  8bda             mov bx, dx                               
  1aa9  6bdb06           imul bx, bx, 6                           
  1aac  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  1ab1  7401             je 0x1ab4                                
  1ab3  40               inc ax                                   
  1ab4  42               inc dx                                   
  1ab5  83fa1c           cmp dx, 0x1c                             
  1ab8  7ced             jl 0x1aa7                                
  1aba  6aff             push -1                                  
  1abc  50               push ax                                  
  1abd  6a01             push 1                                   
  1abf  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1ac4  83c406           add sp, 6                                
  1ac7  8946fe           mov word ptr [bp - 2], ax                
  1aca  33c9             xor cx, cx                               
  1acc  33d2             xor dx, dx                               
  1ace  eb13             jmp 0x1ae3                               
  1ad0  8bda             mov bx, dx                               
  1ad2  6bdb06           imul bx, bx, 6                           
  1ad5  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  1ada  7406             je 0x1ae2                                
  1adc  3b4efe           cmp cx, word ptr [bp - 2]                
  1adf  7407             je 0x1ae8                                
  1ae1  41               inc cx                                   
  1ae2  42               inc dx                                   
  1ae3  83fa1c           cmp dx, 0x1c                             
  1ae6  7ce8             jl 0x1ad0                                
  1ae8  83fa1c           cmp dx, 0x1c                             
  1aeb  7d12             jge 0x1aff                               
  1aed  0bd2             or dx, dx                                
  1aef  7c0e             jl 0x1aff                                
  1af1  8bda             mov bx, dx                               
  1af3  6bdb06           imul bx, bx, 6                           
  1af6  8a87c845         mov al, byte ptr [bx + 0x45c8]           
  1afa  98               cwde                                     
  1afb  0bc0             or ax, ax                                
  1afd  7503             jne 0x1b02                               
  1aff  ba1900           mov dx, 0x19                             
  1b02  8bc2             mov ax, dx                               
  1b04  c9               leave                                    
  1b05  cb               retf                                     
