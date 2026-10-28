; ovl59 stub 30c1 file_off 0x74b90 size 0xaaa

ovl59_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec08           sub sp, 8                                
  0006  90               nop                                      
  0007  0e               push cs                                  
  0008  e8710a           call 0xa7c                               
  000b  0bc0             or ax, ax                                
  000d  7547             jne 0x56                                 
  000f  16               push ss                                  
  0010  8d46fc           lea ax, [bp - 4]                         
  0013  50               push ax                                  
  0014  6a00             push 0                                   
  0016  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  001b  83c406           add sp, 6                                
  001e  668b46fc         mov eax, dword ptr [bp - 4]              
  0022  668946f8         mov dword ptr [bp - 8], eax              
  0026  eb1c             jmp 0x44                                 
  0028  90               nop                                      
  0029  0e               push cs                                  
  002a  e84f0a           call 0xa7c                               
  002d  0bc0             or ax, ax                                
  002f  7525             jne 0x56                                 
  0031  16               push ss                                  
  0032  8d46f8           lea ax, [bp - 8]                         
  0035  50               push ax                                  
  0036  6a00             push 0                                   
  0038  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  003d  83c406           add sp, 6                                
  0040  0bc0             or ax, ax                                
  0042  7512             jne 0x56                                 
  0044  660fbf4606       movsx eax, word ptr [bp + 6]             
  0049  668b56fc         mov edx, dword ptr [bp - 4]              
  004d  6603d0           add edx, eax                             
  0050  663b56f8         cmp edx, dword ptr [bp - 8]              
  0054  7fd2             jg 0x28                                  
  0056  c9               leave                                    
  0057  cb               retf                                     

ovl59_0058:  ; ENTRY
  0058  55               push bp                                  
  0059  8bec             mov bp, sp                               
  005b  83ec08           sub sp, 8                                
  005e  56               push si                                  
  005f  57               push di                                  
  0060  8b7606           mov si, word ptr [bp + 6]                
  0063  8b7e08           mov di, word ptr [bp + 8]                
  0066  ff760c           push word ptr [bp + 0xc]                 
  0069  ff760a           push word ptr [bp + 0xa]                 
  006c  57               push di                                  
  006d  56               push si                                  
  006e  16               push ss                                  
  006f  8d46f8           lea ax, [bp - 8]                         
  0072  50               push ax                                  
  0073  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0078  83c40c           add sp, 0xc                              
  007b  6a03             push 3                                   
  007d  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0082  59               pop cx                                   
  0083  16               push ss                                  
  0084  8d46f8           lea ax, [bp - 8]                         
  0087  50               push ax                                  
  0088  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  008d  83c404           add sp, 4                                
  0090  666804000200     push 0x20004                             
  0096  16               push ss                                  
  0097  8d46f8           lea ax, [bp - 8]                         
  009a  50               push ax                                  
  009b  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  00a0  83c408           add sp, 8                                
  00a3  66ff760e         push dword ptr [bp + 0xe]                
  00a7  8bc7             mov ax, di                               
  00a9  050200           add ax, 2                                
  00ac  50               push ax                                  
  00ad  8bc6             mov ax, si                               
  00af  050300           add ax, 3                                
  00b2  50               push ax                                  
  00b3  9a0104e211       lcall 0x11e2, 0x401                      -> 11e2:0401
  00b8  83c408           add sp, 8                                
  00bb  5f               pop di                                   
  00bc  5e               pop si                                   
  00bd  c9               leave                                    
  00be  cb               retf                                     

ovl59_00bf:  ; ENTRY
  00bf  55               push bp                                  
  00c0  8bec             mov bp, sp                               
  00c2  66ff760a         push dword ptr [bp + 0xa]                
  00c6  ff7608           push word ptr [bp + 8]                   
  00c9  ff7606           push word ptr [bp + 6]                   
  00cc  9aaa04e211       lcall 0x11e2, 0x4aa                      -> 11e2:04aa
  00d1  83c408           add sp, 8                                
  00d4  5d               pop bp                                   
  00d5  cb               retf                                     

ovl59_00d6:  ; ENTRY
  00d6  55               push bp                                  
  00d7  8bec             mov bp, sp                               
  00d9  56               push si                                  
  00da  8b7606           mov si, word ptr [bp + 6]                
  00dd  66ff760a         push dword ptr [bp + 0xa]                
  00e1  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  00e6  83c404           add sp, 4                                
  00e9  99               cdq                                      
  00ea  2bc2             sub ax, dx                               
  00ec  d1f8             sar ax, 1                                
  00ee  2bf0             sub si, ax                               
  00f0  66ff760a         push dword ptr [bp + 0xa]                
  00f4  ff7608           push word ptr [bp + 8]                   
  00f7  56               push si                                  
  00f8  9aaa04e211       lcall 0x11e2, 0x4aa                      -> 11e2:04aa
  00fd  83c408           add sp, 8                                
  0100  5e               pop si                                   
  0101  5d               pop bp                                   
  0102  cb               retf                                     

ovl59_0103:  ; ENTRY
  0103  55               push bp                                  
  0104  8bec             mov bp, sp                               
  0106  56               push si                                  
  0107  8b7606           mov si, word ptr [bp + 6]                
  010a  66ff760a         push dword ptr [bp + 0xa]                
  010e  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  0113  83c404           add sp, 4                                
  0116  2bf0             sub si, ax                               
  0118  66ff760a         push dword ptr [bp + 0xa]                
  011c  ff7608           push word ptr [bp + 8]                   
  011f  56               push si                                  
  0120  9aaa04e211       lcall 0x11e2, 0x4aa                      -> 11e2:04aa
  0125  83c408           add sp, 8                                
  0128  5e               pop si                                   
  0129  5d               pop bp                                   
  012a  cb               retf                                     

ovl59_012b:  ; ENTRY
  012b  55               push bp                                  
  012c  8bec             mov bp, sp                               
  012e  83ec02           sub sp, 2                                
  0131  6a00             push 0                                   
  0133  90               nop                                      
  0134  0e               push cs                                  
  0135  e8d500           call 0x20d                               
  0138  59               pop cx                                   
  0139  8946fe           mov word ptr [bp - 2], ax                
  013c  0bc0             or ax, ax                                
  013e  74f1             je 0x131                                 
  0140  c9               leave                                    
  0141  cb               retf                                     

ovl59_0142:  ; ENTRY
  0142  55               push bp                                  
  0143  8bec             mov bp, sp                               
  0145  1e               push ds                                  
  0146  688859           push 0x5988                              
  0149  6668d4000000     push 0xd4                                
  014f  9a3900b511       lcall 0x11b5, 0x39                       -> 11b5:0039
  0154  83c408           add sp, 8                                
  0157  8cda             mov dx, ds                               
  0159  b88859           mov ax, 0x5988                           
  015c  5d               pop bp                                   
  015d  cb               retf                                     

ovl59_015e:  ; ENTRY
  015e  55               push bp                                  
  015f  8bec             mov bp, sp                               
  0161  83ec08           sub sp, 8                                
  0164  90               nop                                      
  0165  0e               push cs                                  
  0166  e81309           call 0xa7c                               
  0169  0bc0             or ax, ax                                
  016b  7406             je 0x173                                 
  016d  33d2             xor dx, dx                               
  016f  33c0             xor ax, ax                               
  0171  eb67             jmp 0x1da                                
  0173  16               push ss                                  
  0174  8d46fc           lea ax, [bp - 4]                         
  0177  50               push ax                                  
  0178  6a00             push 0                                   
  017a  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  017f  83c406           add sp, 6                                
  0182  668b46fc         mov eax, dword ptr [bp - 4]              
  0186  668946f8         mov dword ptr [bp - 8], eax              
  018a  eb33             jmp 0x1bf                                
  018c  9a8a001d15       lcall 0x151d, 0x8a                       -> 151d:008a
  0191  90               nop                                      
  0192  0e               push cs                                  
  0193  e8e608           call 0xa7c                               
  0196  0bc0             or ax, ax                                
  0198  75d3             jne 0x16d                                
  019a  16               push ss                                  
  019b  8d46f8           lea ax, [bp - 8]                         
  019e  50               push ax                                  
  019f  6a00             push 0                                   
  01a1  9acf1b0000       lcall 0, 0x1bcf                          -> 0000:1bcf
  01a6  83c406           add sp, 6                                
  01a9  0bc0             or ax, ax                                
  01ab  75c0             jne 0x16d                                
  01ad  660fbf4606       movsx eax, word ptr [bp + 6]             
  01b2  668b56fc         mov edx, dword ptr [bp - 4]              
  01b6  6603d0           add edx, eax                             
  01b9  663b56f8         cmp edx, dword ptr [bp - 8]              
  01bd  7eae             jle 0x16d                                
  01bf  1e               push ds                                  
  01c0  689859           push 0x5998                              
  01c3  6668d4000000     push 0xd4                                
  01c9  9a0300b511       lcall 0x11b5, 3                          -> 11b5:0003
  01ce  83c408           add sp, 8                                
  01d1  0bc0             or ax, ax                                
  01d3  74b7             je 0x18c                                 
  01d5  8cda             mov dx, ds                               
  01d7  b89859           mov ax, 0x5998                           
  01da  c9               leave                                    
  01db  cb               retf                                     

ovl59_01dc:  ; ENTRY
  01dc  55               push bp                                  
  01dd  8bec             mov bp, sp                               
  01df  eb05             jmp 0x1e6                                
  01e1  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  01e6  9adc380000       lcall 0, 0x38dc                          -> 0000:38dc
  01eb  0bc0             or ax, ax                                
  01ed  75f2             jne 0x1e1                                
  01ef  5d               pop bp                                   
  01f0  cb               retf                                     

ovl59_01f1:  ; ENTRY
  01f1  55               push bp                                  
  01f2  8bec             mov bp, sp                               
  01f4  83ec10           sub sp, 0x10                             
  01f7  16               push ss                                  
  01f8  8d46f0           lea ax, [bp - 0x10]                      
  01fb  50               push ax                                  
  01fc  666aff           push -1                                  
  01ff  9a0300b511       lcall 0x11b5, 3                          -> 11b5:0003
  0204  83c408           add sp, 8                                
  0207  0bc0             or ax, ax                                
  0209  75ec             jne 0x1f7                                
  020b  c9               leave                                    
  020c  cb               retf                                     

ovl59_020d:  ; ENTRY
  020d  55               push bp                                  
  020e  8bec             mov bp, sp                               
  0210  83ec0a           sub sp, 0xa                              
  0213  56               push si                                  
  0214  57               push di                                  
  0215  b000             mov al, 0                                
  0217  8846fb           mov byte ptr [bp - 5], al                
  021a  b400             mov ah, 0                                
  021c  8bf8             mov di, ax                               
  021e  33f6             xor si, si                               
  0220  9af01b0000       lcall 0, 0x1bf0                          -> 0000:1bf0
  0225  8946fe           mov word ptr [bp - 2], ax                
  0228  eb7d             jmp 0x2a7                                
  022a  9adc380000       lcall 0, 0x38dc                          -> 0000:38dc
  022f  0bc0             or ax, ax                                
  0231  7423             je 0x256                                 
  0233  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  0238  8bf0             mov si, ax                               
  023a  0bf6             or si, si                                
  023c  fe46fb           inc byte ptr [bp - 5]                    
  023f  0bf6             or si, si                                
  0241  7513             jne 0x256                                
  0243  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  0248  0d0001           or ax, 0x100                             
  024b  8bf0             mov si, ax                               
  024d  81fe5301         cmp si, 0x153                            
  0251  7503             jne 0x256                                
  0253  be1b00           mov si, 0x1b                             
  0256  47               inc di                                   
  0257  9af01b0000       lcall 0, 0x1bf0                          -> 0000:1bf0
  025c  8946fc           mov word ptr [bp - 4], ax                
  025f  3dffff           cmp ax, 0xffff                           
  0262  743d             je 0x2a1                                 
  0264  2b46fe           sub ax, word ptr [bp - 2]                
  0267  6bc00a           imul ax, ax, 0xa                         
  026a  8946f6           mov word ptr [bp - 0xa], ax              
  026d  c746f80000       mov word ptr [bp - 8], 0                 
  0272  cd37             int 0x37                                 
  0274  46               inc si                                   
  0275  f6cd38           test ch, 0x38                            
  0278  368826a174       mov byte ptr ss:[0x74a1], ah             
  027d  268946f6         mov word ptr es:[bp - 0xa], ax           
  0281  c746f80000       mov word ptr [bp - 8], 0                 
  0286  cd37             int 0x37                                 
  0288  46               inc si                                   
  0289  f6cd3a           test ch, 0x3a                            
  028c  d9cd             fxch st(5)                               
  028e  397ef6           cmp word ptr [bp - 0xa], di              
  0291  cd3d             int 0x3d                                 
  0293  8b46f6           mov ax, word ptr [bp - 0xa]              
  0296  9e               sahf                                     
  0297  721a             jb 0x2b3                                 
  0299  81ff204e         cmp di, 0x4e20                           
  029d  7508             jne 0x2a7                                
  029f  eb12             jmp 0x2b3                                
  02a1  81ffe803         cmp di, 0x3e8                            
  02a5  740c             je 0x2b3                                 
  02a7  8a46fb           mov al, byte ptr [bp - 5]                
  02aa  b400             mov ah, 0                                
  02ac  0bc0             or ax, ax                                
  02ae  7503             jne 0x2b3                                
  02b0  e977ff           jmp 0x22a                                
  02b3  a17626           mov ax, word ptr [0x2676]                
  02b6  a37426           mov word ptr [0x2674], ax                
  02b9  8bc6             mov ax, si                               
  02bb  5f               pop di                                   
  02bc  5e               pop si                                   
  02bd  c9               leave                                    
  02be  cb               retf                                     

ovl59_02bf:  ; ENTRY
  02bf  55               push bp                                  
  02c0  8bec             mov bp, sp                               
  02c2  83ec06           sub sp, 6                                
  02c5  56               push si                                  
  02c6  57               push di                                  
  02c7  8b7e06           mov di, word ptr [bp + 6]                
  02ca  8b760a           mov si, word ptr [bp + 0xa]              
  02cd  c746fc0000       mov word ptr [bp - 4], 0                 
  02d2  833e782600       cmp word ptr [0x2678], 0                 
  02d7  750b             jne 0x2e4                                
  02d9  c70678260100     mov word ptr [0x2678], 1                 
  02df  90               nop                                      
  02e0  0e               push cs                                  
  02e1  e87200           call 0x356                               
  02e4  837e0800         cmp word ptr [bp + 8], 0                 
  02e8  7504             jne 0x2ee                                
  02ea  8bc6             mov ax, si                               
  02ec  eb64             jmp 0x352                                
  02ee  c746fe0000       mov word ptr [bp - 2], 0                 
  02f3  eb2f             jmp 0x324                                
  02f5  9a0a200000       lcall 0, 0x200a                          -> 0000:200a
  02fa  8946fa           mov word ptr [bp - 6], ax                
  02fd  cd3b             int 0x3b                                 
  02ff  46               inc si                                   
  0300  fa               cli                                      
  0301  cd34             int 0x34                                 
  0303  3690             nop                                      
  0305  268b4608         mov ax, word ptr es:[bp + 8]             
  0309  8946fa           mov word ptr [bp - 6], ax                
  030c  cd3b             int 0x3b                                 
  030e  46               inc si                                   
  030f  fa               cli                                      
  0310  cd3a             int 0x3a                                 
  0312  c9               leave                                    
  0313  cd35             int 0x35                                 
  0315  e8cd3a           call 0x3de5                              
  0318  c19a571b00       rcr word ptr [bp + si + 0x1b57], 0       
  031d  0001             add byte ptr [bx + di], al               
  031f  46               inc si                                   
  0320  fc               cld                                      
  0321  ff46fe           inc word ptr [bp - 2]                    
  0324  397efe           cmp word ptr [bp - 2], di                
  0327  7ccc             jl 0x2f5                                 
  0329  8b5efc           mov bx, word ptr [bp - 4]                
  032c  03de             add bx, si                               
  032e  8bc7             mov ax, di                               
  0330  03c6             add ax, si                               
  0332  3bc3             cmp ax, bx                               
  0334  7e06             jle 0x33c                                
  0336  8bdf             mov bx, di                               
  0338  03de             add bx, si                               
  033a  eb14             jmp 0x350                                
  033c  8bc7             mov ax, di                               
  033e  f76e08           imul word ptr [bp + 8]                   
  0341  03c6             add ax, si                               
  0343  3bc3             cmp ax, bx                               
  0345  7d09             jge 0x350                                
  0347  8bc7             mov ax, di                               
  0349  f76e08           imul word ptr [bp + 8]                   
  034c  03c6             add ax, si                               
  034e  8bd8             mov bx, ax                               
  0350  8bc3             mov ax, bx                               
  0352  5f               pop di                                   
  0353  5e               pop si                                   
  0354  c9               leave                                    
  0355  cb               retf                                     

ovl59_0356:  ; ENTRY
  0356  55               push bp                                  
  0357  8bec             mov bp, sp                               
  0359  83ec06           sub sp, 6                                
  035c  16               push ss                                  
  035d  8d46fc           lea ax, [bp - 4]                         
  0360  50               push ax                                  
  0361  9a35280000       lcall 0, 0x2835                          -> 0000:2835
  0366  83c404           add sp, 4                                
  0369  8946fa           mov word ptr [bp - 6], ax                
  036c  50               push ax                                  
  036d  9af91f0000       lcall 0, 0x1ff9                          -> 0000:1ff9
  0372  59               pop cx                                   
  0373  c9               leave                                    
  0374  cb               retf                                     

ovl59_0375:  ; ENTRY
  0375  55               push bp                                  
  0376  8bec             mov bp, sp                               
  0378  56               push si                                  
  0379  be0100           mov si, 1                                
  037c  6a02             push 2                                   
  037e  66ff7606         push dword ptr [bp + 6]                  
  0382  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0387  83c406           add sp, 6                                
  038a  8bd0             mov dx, ax                               
  038c  0bd2             or dx, dx                                
  038e  7d04             jge 0x394                                
  0390  33f6             xor si, si                               
  0392  eb07             jmp 0x39b                                
  0394  52               push dx                                  
  0395  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  039a  59               pop cx                                   
  039b  8bc6             mov ax, si                               
  039d  5e               pop si                                   
  039e  5d               pop bp                                   
  039f  cb               retf                                     

ovl59_03a0:  ; ENTRY
  03a0  55               push bp                                  
  03a1  8bec             mov bp, sp                               
  03a3  83ec04           sub sp, 4                                
  03a6  56               push si                                  
  03a7  57               push di                                  
  03a8  6a02             push 2                                   
  03aa  1e               push ds                                  
  03ab  689426           push 0x2694                              
  03ae  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  03b3  83c406           add sp, 6                                
  03b6  8bf0             mov si, ax                               
  03b8  0bf6             or si, si                                
  03ba  7d03             jge 0x3bf                                
  03bc  e92d01           jmp 0x4ec                                
  03bf  56               push si                                  
  03c0  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  03c5  59               pop cx                                   
  03c6  8bf8             mov di, ax                               
  03c8  6668a6000000     push 0xa6                                
  03ce  6a00             push 0                                   
  03d0  660fbfc7         movsx eax, di                            
  03d4  6650             push eax                                 
  03d6  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  03db  83c40a           add sp, 0xa                              
  03de  8916365c         mov word ptr [0x5c36], dx                
  03e2  a3345c           mov word ptr [0x5c34], ax                
  03e5  52               push dx                                  
  03e6  50               push ax                                  
  03e7  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  03ec  83c404           add sp, 4                                
  03ef  8956fe           mov word ptr [bp - 2], dx                
  03f2  8946fc           mov word ptr [bp - 4], ax                
  03f5  57               push di                                  
  03f6  52               push dx                                  
  03f7  50               push ax                                  
  03f8  56               push si                                  
  03f9  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  03fe  83c408           add sp, 8                                
  0401  66ff36345c       push dword ptr [0x5c34]                  
  0406  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  040b  83c404           add sp, 4                                
  040e  56               push si                                  
  040f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0414  59               pop cx                                   
  0415  6a02             push 2                                   
  0417  1e               push ds                                  
  0418  68a426           push 0x26a4                               ; "DATA\ERROR.DAT"
  041b  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0420  83c406           add sp, 6                                
  0423  8bf0             mov si, ax                               
  0425  0bf6             or si, si                                
  0427  7d03             jge 0x42c                                
  0429  e9c000           jmp 0x4ec                                
  042c  56               push si                                  
  042d  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0432  59               pop cx                                   
  0433  8bf8             mov di, ax                               
  0435  6668a7000000     push 0xa7                                
  043b  6a00             push 0                                   
  043d  660fbfc7         movsx eax, di                            
  0441  6650             push eax                                 
  0443  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0448  83c40a           add sp, 0xa                              
  044b  89162e5c         mov word ptr [0x5c2e], dx                
  044f  a32c5c           mov word ptr [0x5c2c], ax                
  0452  52               push dx                                  
  0453  50               push ax                                  
  0454  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0459  83c404           add sp, 4                                
  045c  8956fe           mov word ptr [bp - 2], dx                
  045f  8946fc           mov word ptr [bp - 4], ax                
  0462  57               push di                                  
  0463  52               push dx                                  
  0464  50               push ax                                  
  0465  56               push si                                  
  0466  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  046b  83c408           add sp, 8                                
  046e  66ff362c5c       push dword ptr [0x5c2c]                  
  0473  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0478  83c404           add sp, 4                                
  047b  56               push si                                  
  047c  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0481  59               pop cx                                   
  0482  6a02             push 2                                   
  0484  1e               push ds                                  
  0485  68b326           push 0x26b3                               ; "DATA\FILE.DAT"
  0488  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  048d  83c406           add sp, 6                                
  0490  8bf0             mov si, ax                               
  0492  0bf6             or si, si                                
  0494  7c56             jl 0x4ec                                 
  0496  56               push si                                  
  0497  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  049c  59               pop cx                                   
  049d  8bf8             mov di, ax                               
  049f  6668a8000000     push 0xa8                                
  04a5  6a00             push 0                                   
  04a7  660fbfc7         movsx eax, di                            
  04ab  6650             push eax                                 
  04ad  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  04b2  83c40a           add sp, 0xa                              
  04b5  8916325c         mov word ptr [0x5c32], dx                
  04b9  a3305c           mov word ptr [0x5c30], ax                
  04bc  52               push dx                                  
  04bd  50               push ax                                  
  04be  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  04c3  83c404           add sp, 4                                
  04c6  8956fe           mov word ptr [bp - 2], dx                
  04c9  8946fc           mov word ptr [bp - 4], ax                
  04cc  57               push di                                  
  04cd  52               push dx                                  
  04ce  50               push ax                                  
  04cf  56               push si                                  
  04d0  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  04d5  83c408           add sp, 8                                
  04d8  66ff36305c       push dword ptr [0x5c30]                  
  04dd  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  04e2  83c404           add sp, 4                                
  04e5  56               push si                                  
  04e6  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  04eb  59               pop cx                                   
  04ec  5f               pop di                                   
  04ed  5e               pop si                                   
  04ee  c9               leave                                    
  04ef  cb               retf                                     

ovl59_04f0:  ; ENTRY
  04f0  55               push bp                                  
  04f1  8bec             mov bp, sp                               
  04f3  ff7608           push word ptr [bp + 8]                   
  04f6  ff7606           push word ptr [bp + 6]                   
  04f9  6a00             push 0                                   
  04fb  90               nop                                      
  04fc  0e               push cs                                  
  04fd  e82f00           call 0x52f                               
  0500  83c406           add sp, 6                                
  0503  5d               pop bp                                   
  0504  cb               retf                                     

ovl59_0505:  ; ENTRY
  0505  55               push bp                                  
  0506  8bec             mov bp, sp                               
  0508  ff7608           push word ptr [bp + 8]                   
  050b  ff7606           push word ptr [bp + 6]                   
  050e  6a01             push 1                                   
  0510  90               nop                                      
  0511  0e               push cs                                  
  0512  e81a00           call 0x52f                               
  0515  83c406           add sp, 6                                
  0518  5d               pop bp                                   
  0519  cb               retf                                     

ovl59_051a:  ; ENTRY
  051a  55               push bp                                  
  051b  8bec             mov bp, sp                               
  051d  ff7608           push word ptr [bp + 8]                   
  0520  ff7606           push word ptr [bp + 6]                   
  0523  6a02             push 2                                   
  0525  90               nop                                      
  0526  0e               push cs                                  
  0527  e80500           call 0x52f                               
  052a  83c406           add sp, 6                                
  052d  5d               pop bp                                   
  052e  cb               retf                                     

ovl59_052f:  ; ENTRY
  052f  55               push bp                                  
  0530  8bec             mov bp, sp                               
  0532  83ec14           sub sp, 0x14                             
  0535  56               push si                                  
  0536  57               push di                                  
  0537  8b760a           mov si, word ptr [bp + 0xa]              
  053a  8b1e7a26         mov bx, word ptr [0x267a]                
  053e  6bdb50           imul bx, bx, 0x50                        
  0541  c687a85900       mov byte ptr [bx + 0x59a8], 0            
  0546  8b5e06           mov bx, word ptr [bp + 6]                
  0549  c1e302           shl bx, 2                                
  054c  c49f7c26         les bx, ptr [bx + 0x267c]                
  0550  6626ff37         push dword ptr es:[bx]                   
  0554  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0559  83c404           add sp, 4                                
  055c  8956f6           mov word ptr [bp - 0xa], dx              
  055f  8946f4           mov word ptr [bp - 0xc], ax              
  0562  8b4608           mov ax, word ptr [bp + 8]                
  0565  d1e0             shl ax, 1                                
  0567  d1e0             shl ax, 1                                
  0569  8b5ef4           mov bx, word ptr [bp - 0xc]              
  056c  03d8             add bx, ax                               
  056e  8956f2           mov word ptr [bp - 0xe], dx              
  0571  895ef0           mov word ptr [bp - 0x10], bx             
  0574  8e46f2           mov es, word ptr [bp - 0xe]              
  0577  268b07           mov ax, word ptr es:[bx]                 
  057a  8946fe           mov word ptr [bp - 2], ax                
  057d  8346f002         add word ptr [bp - 0x10], 2              
  0581  c45ef0           les bx, ptr [bp - 0x10]                  
  0584  268b3f           mov di, word ptr es:[bx]                 
  0587  8346f002         add word ptr [bp - 0x10], 2              
  058b  0bf6             or si, si                                
  058d  7d0e             jge 0x59d                                
  058f  6aff             push -1                                  
  0591  57               push di                                  
  0592  6a01             push 1                                   
  0594  0e               push cs                                  
  0595  e827fd           call 0x2bf                               
  0598  83c406           add sp, 6                                
  059b  eb02             jmp 0x59f                                
  059d  8bc6             mov ax, si                               
  059f  8bf0             mov si, ax                               
  05a1  8bc7             mov ax, di                               
  05a3  48               dec ax                                   
  05a4  3bc6             cmp ax, si                               
  05a6  7d03             jge 0x5ab                                
  05a8  8bf7             mov si, di                               
  05aa  4e               dec si                                   
  05ab  8bc6             mov ax, si                               
  05ad  d1e0             shl ax, 1                                
  05af  8b56f6           mov dx, word ptr [bp - 0xa]              
  05b2  8b5ef4           mov bx, word ptr [bp - 0xc]              
  05b5  035efe           add bx, word ptr [bp - 2]                
  05b8  03d8             add bx, ax                               
  05ba  8956f2           mov word ptr [bp - 0xe], dx              
  05bd  895ef0           mov word ptr [bp - 0x10], bx             
  05c0  8e46f2           mov es, word ptr [bp - 0xe]              
  05c3  268b07           mov ax, word ptr es:[bx]                 
  05c6  8946fc           mov word ptr [bp - 4], ax                
  05c9  8b46f6           mov ax, word ptr [bp - 0xa]              
  05cc  8b56f4           mov dx, word ptr [bp - 0xc]              
  05cf  0356fc           add dx, word ptr [bp - 4]                
  05d2  8946ee           mov word ptr [bp - 0x12], ax             
  05d5  8956ec           mov word ptr [bp - 0x14], dx             
  05d8  50               push ax                                  
  05d9  52               push dx                                  
  05da  a17a26           mov ax, word ptr [0x267a]                
  05dd  6bc050           imul ax, ax, 0x50                        
  05e0  05a859           add ax, 0x59a8                           
  05e3  1e               push ds                                  
  05e4  50               push ax                                  
  05e5  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  05ea  83c408           add sp, 8                                
  05ed  8b5e06           mov bx, word ptr [bp + 6]                
  05f0  c1e302           shl bx, 2                                
  05f3  c49f7c26         les bx, ptr [bx + 0x267c]                
  05f7  6626ff37         push dword ptr es:[bx]                   
  05fb  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0600  83c404           add sp, 4                                
  0603  a17a26           mov ax, word ptr [0x267a]                
  0606  6bc050           imul ax, ax, 0x50                        
  0609  05a859           add ax, 0x59a8                           
  060c  8c5efa           mov word ptr [bp - 6], ds                
  060f  8946f8           mov word ptr [bp - 8], ax                
  0612  a17a26           mov ax, word ptr [0x267a]                
  0615  40               inc ax                                   
  0616  bb0800           mov bx, 8                                
  0619  99               cdq                                      
  061a  f7fb             idiv bx                                  
  061c  89167a26         mov word ptr [0x267a], dx                
  0620  8b56fa           mov dx, word ptr [bp - 6]                
  0623  8b46f8           mov ax, word ptr [bp - 8]                
  0626  5f               pop di                                   
  0627  5e               pop si                                   
  0628  c9               leave                                    
  0629  cb               retf                                     

ovl59_062a:  ; ENTRY
  062a  55               push bp                                  
  062b  8bec             mov bp, sp                               
  062d  83ec0e           sub sp, 0xe                              
  0630  56               push si                                  
  0631  57               push di                                  
  0632  33ff             xor di, di                               
  0634  c746f20000       mov word ptr [bp - 0xe], 0               
  0639  6a02             push 2                                   
  063b  66ff7606         push dword ptr [bp + 6]                  
  063f  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0644  83c406           add sp, 6                                
  0647  8bf0             mov si, ax                               
  0649  0bf6             or si, si                                
  064b  7d05             jge 0x652                                
  064d  33c0             xor ax, ax                               
  064f  e98800           jmp 0x6da                                
  0652  56               push si                                  
  0653  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0658  59               pop cx                                   
  0659  8946fe           mov word ptr [bp - 2], ax                
  065c  50               push ax                                  
  065d  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0662  59               pop cx                                   
  0663  8956fc           mov word ptr [bp - 4], dx                
  0666  8946fa           mov word ptr [bp - 6], ax                
  0669  668b46fa         mov eax, dword ptr [bp - 6]              
  066d  668946f6         mov dword ptr [bp - 0xa], eax            
  0671  ff76fe           push word ptr [bp - 2]                   
  0674  52               push dx                                  
  0675  ff76fa           push word ptr [bp - 6]                   
  0678  56               push si                                  
  0679  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  067e  83c408           add sp, 8                                
  0681  eb3d             jmp 0x6c0                                
  0683  ff46f6           inc word ptr [bp - 0xa]                  
  0686  c45ef6           les bx, ptr [bp - 0xa]                   
  0689  26803f23         cmp byte ptr es:[bx], 0x23               
  068d  75f4             jne 0x683                                
  068f  ff46f6           inc word ptr [bp - 0xa]                  
  0692  c45ef6           les bx, ptr [bp - 0xa]                   
  0695  268a07           mov al, byte ptr es:[bx]                 
  0698  8846f5           mov byte ptr [bp - 0xb], al              
  069b  ff46f6           inc word ptr [bp - 0xa]                  
  069e  98               cwde                                     
  069f  3d4400           cmp ax, 0x44                             
  06a2  7407             je 0x6ab                                 
  06a4  3d4500           cmp ax, 0x45                             
  06a7  7414             je 0x6bd                                 
  06a9  eb15             jmp 0x6c0                                
  06ab  16               push ss                                  
  06ac  8d46f2           lea ax, [bp - 0xe]                       
  06af  50               push ax                                  
  06b0  16               push ss                                  
  06b1  8d46f6           lea ax, [bp - 0xa]                       
  06b4  50               push ax                                  
  06b5  90               nop                                      
  06b6  0e               push cs                                  
  06b7  e82f02           call 0x8e9                               
  06ba  83c408           add sp, 8                                
  06bd  bf0100           mov di, 1                                
  06c0  0bff             or di, di                                
  06c2  74c2             je 0x686                                 
  06c4  66ff76fa         push dword ptr [bp - 6]                  
  06c8  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  06cd  83c404           add sp, 4                                
  06d0  56               push si                                  
  06d1  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  06d6  59               pop cx                                   
  06d7  8b46f2           mov ax, word ptr [bp - 0xe]              
  06da  5f               pop di                                   
  06db  5e               pop si                                   
  06dc  c9               leave                                    
  06dd  cb               retf                                     

ovl59_06de:  ; ENTRY
  06de  55               push bp                                  
  06df  8bec             mov bp, sp                               
  06e1  83ec6c           sub sp, 0x6c                             
  06e4  56               push si                                  
  06e5  57               push di                                  
  06e6  33ff             xor di, di                               
  06e8  8b460a           mov ax, word ptr [bp + 0xa]              
  06eb  a32a5c           mov word ptr [0x5c2a], ax                
  06ee  8b460c           mov ax, word ptr [bp + 0xc]              
  06f1  a3285c           mov word ptr [0x5c28], ax                
  06f4  6a02             push 2                                   
  06f6  66ff7606         push dword ptr [bp + 6]                  
  06fa  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  06ff  83c406           add sp, 6                                
  0702  8bf0             mov si, ax                               
  0704  0bf6             or si, si                                
  0706  7d03             jge 0x70b                                
  0708  e9b601           jmp 0x8c1                                
  070b  56               push si                                  
  070c  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0711  59               pop cx                                   
  0712  8946fe           mov word ptr [bp - 2], ax                
  0715  50               push ax                                  
  0716  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  071b  59               pop cx                                   
  071c  8956fc           mov word ptr [bp - 4], dx                
  071f  8946fa           mov word ptr [bp - 6], ax                
  0722  668b46fa         mov eax, dword ptr [bp - 6]              
  0726  668946f6         mov dword ptr [bp - 0xa], eax            
  072a  ff76fe           push word ptr [bp - 2]                   
  072d  52               push dx                                  
  072e  ff76fa           push word ptr [bp - 6]                   
  0731  56               push si                                  
  0732  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0737  83c408           add sp, 8                                
  073a  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  073f  e96001           jmp 0x8a2                                
  0742  ff46f6           inc word ptr [bp - 0xa]                  
  0745  c45ef6           les bx, ptr [bp - 0xa]                   
  0748  26803f23         cmp byte ptr es:[bx], 0x23               
  074c  75f4             jne 0x742                                
  074e  ff46f6           inc word ptr [bp - 0xa]                  
  0751  c45ef6           les bx, ptr [bp - 0xa]                   
  0754  268a07           mov al, byte ptr es:[bx]                 
  0757  8846e9           mov byte ptr [bp - 0x17], al             
  075a  ff46f6           inc word ptr [bp - 0xa]                  
  075d  98               cwde                                     
  075e  2d4300           sub ax, 0x43                             
  0761  8bd8             mov bx, ax                               
  0763  83fb11           cmp bx, 0x11                             
  0766  7603             jbe 0x76b                                
  0768  e93701           jmp 0x8a2                                
  076b  d1e3             shl bx, 1                                
  076d  2effa7c508       jmp word ptr cs:[bx + 0x8c5]             
ovl59_0772:  ; case
  0772  16               push ss                                  
  0773  8d46e4           lea ax, [bp - 0x1c]                      
  0776  50               push ax                                  
  0777  16               push ss                                  
  0778  8d46f6           lea ax, [bp - 0xa]                       
  077b  50               push ax                                  
  077c  90               nop                                      
  077d  0e               push cs                                  
  077e  e86801           call 0x8e9                               
  0781  83c408           add sp, 8                                
  0784  666800000300     push 0x30000                             
  078a  ff76e4           push word ptr [bp - 0x1c]                
  078d  6a02             push 2                                   
  078f  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0794  e9af00           jmp 0x846                                
ovl59_0797:  ; case
  0797  666800000300     push 0x30000                             
  079d  666801000f00     push 0xf0001                             
  07a3  ebea             jmp 0x78f                                
ovl59_07a5:  ; case
  07a5  666800000300     push 0x30000                             
  07ab  6a0f             push 0xf                                 
  07ad  ebde             jmp 0x78d                                
ovl59_07af:  ; case
  07af  16               push ss                                  
  07b0  8d46ea           lea ax, [bp - 0x16]                      
  07b3  50               push ax                                  
  07b4  16               push ss                                  
  07b5  8d46f6           lea ax, [bp - 0xa]                       
  07b8  50               push ax                                  
  07b9  90               nop                                      
  07ba  0e               push cs                                  
  07bb  e8d701           call 0x995                               
  07be  83c408           add sp, 8                                
  07c1  16               push ss                                  
  07c2  8d4694           lea ax, [bp - 0x6c]                      
  07c5  50               push ax                                  
  07c6  16               push ss                                  
  07c7  8d46f6           lea ax, [bp - 0xa]                       
  07ca  50               push ax                                  
  07cb  90               nop                                      
  07cc  0e               push cs                                  
  07cd  e81002           call 0x9e0                               
  07d0  83c408           add sp, 8                                
  07d3  16               push ss                                  
  07d4  8d4694           lea ax, [bp - 0x6c]                      
  07d7  50               push ax                                  
  07d8  66ff76ea         push dword ptr [bp - 0x16]               
  07dc  0e               push cs                                  
  07dd  e8f6f8           call 0xd6                                
  07e0  eb64             jmp 0x846                                
ovl59_07e2:  ; case
  07e2  16               push ss                                  
  07e3  8d46ea           lea ax, [bp - 0x16]                      
  07e6  50               push ax                                  
  07e7  16               push ss                                  
  07e8  8d46f6           lea ax, [bp - 0xa]                       
  07eb  50               push ax                                  
  07ec  90               nop                                      
  07ed  0e               push cs                                  
  07ee  e8a401           call 0x995                               
  07f1  83c408           add sp, 8                                
  07f4  16               push ss                                  
  07f5  8d4694           lea ax, [bp - 0x6c]                      
  07f8  50               push ax                                  
  07f9  16               push ss                                  
  07fa  8d46f6           lea ax, [bp - 0xa]                       
  07fd  50               push ax                                  
  07fe  90               nop                                      
  07ff  0e               push cs                                  
  0800  e8dd01           call 0x9e0                               
  0803  83c408           add sp, 8                                
  0806  16               push ss                                  
  0807  8d4694           lea ax, [bp - 0x6c]                      
  080a  50               push ax                                  
  080b  66ff76ea         push dword ptr [bp - 0x16]               
  080f  0e               push cs                                  
  0810  e8acf8           call 0xbf                                
  0813  eb31             jmp 0x846                                
ovl59_0815:  ; case
  0815  16               push ss                                  
  0816  8d46ea           lea ax, [bp - 0x16]                      
  0819  50               push ax                                  
  081a  16               push ss                                  
  081b  8d46f6           lea ax, [bp - 0xa]                       
  081e  50               push ax                                  
  081f  90               nop                                      
  0820  0e               push cs                                  
  0821  e87101           call 0x995                               
  0824  83c408           add sp, 8                                
  0827  16               push ss                                  
  0828  8d4694           lea ax, [bp - 0x6c]                      
  082b  50               push ax                                  
  082c  16               push ss                                  
  082d  8d46f6           lea ax, [bp - 0xa]                       
  0830  50               push ax                                  
  0831  90               nop                                      
  0832  0e               push cs                                  
  0833  e8aa01           call 0x9e0                               
  0836  83c408           add sp, 8                                
  0839  16               push ss                                  
  083a  8d4694           lea ax, [bp - 0x6c]                      
  083d  50               push ax                                  
  083e  66ff76ea         push dword ptr [bp - 0x16]               
  0842  0e               push cs                                  
  0843  e8bdf8           call 0x103                               
  0846  83c408           add sp, 8                                
  0849  eb57             jmp 0x8a2                                
ovl59_084b:  ; case
  084b  16               push ss                                  
  084c  8d46ee           lea ax, [bp - 0x12]                      
  084f  50               push ax                                  
  0850  16               push ss                                  
  0851  8d46f6           lea ax, [bp - 0xa]                       
  0854  50               push ax                                  
  0855  90               nop                                      
  0856  0e               push cs                                  
  0857  e8ca00           call 0x924                               
  085a  83c408           add sp, 8                                
  085d  16               push ss                                  
  085e  8d46e6           lea ax, [bp - 0x1a]                      
  0861  50               push ax                                  
  0862  16               push ss                                  
  0863  8d46f6           lea ax, [bp - 0xa]                       
  0866  50               push ax                                  
  0867  90               nop                                      
  0868  0e               push cs                                  
  0869  e87d00           call 0x8e9                               
  086c  83c408           add sp, 8                                
  086f  16               push ss                                  
  0870  8d46ea           lea ax, [bp - 0x16]                      
  0873  50               push ax                                  
  0874  16               push ss                                  
  0875  8d46f6           lea ax, [bp - 0xa]                       
  0878  50               push ax                                  
  0879  90               nop                                      
  087a  0e               push cs                                  
  087b  e81701           call 0x995                               
  087e  83c408           add sp, 8                                
  0881  66ff76ea         push dword ptr [bp - 0x16]               
  0885  8d46ee           lea ax, [bp - 0x12]                      
  0888  8cd2             mov dx, ss                               
  088a  b90800           mov cx, 8                                
  088d  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0892  ff76e6           push word ptr [bp - 0x1a]                
  0895  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  089a  83c40e           add sp, 0xe                              
  089d  eb03             jmp 0x8a2                                
ovl59_089f:  ; case
  089f  bf0100           mov di, 1                                
ovl59_08a2:  ; case
  08a2  0bff             or di, di                                
  08a4  7503             jne 0x8a9                                
  08a6  e99cfe           jmp 0x745                                
  08a9  66ff76fa         push dword ptr [bp - 6]                  
  08ad  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  08b2  83c404           add sp, 4                                
  08b5  56               push si                                  
  08b6  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  08bb  59               pop cx                                   
  08bc  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  08c1  5f               pop di                                   
  08c2  5e               pop si                                   
  08c3  c9               leave                                    
  08c4  cb               retf                                     
  08c5  af07a2089f087207 dw 07af,08a2,089f,0772,084b,0797,08a2,08a2,08a2,07e2,08a2,08a2,08a2,08a2,08a2,0815,08a2,07a5 jump table

ovl59_08e9:  ; ENTRY
  08e9  55               push bp                                  
  08ea  8bec             mov bp, sp                               
  08ec  c45e06           les bx, ptr [bp + 6]                     
  08ef  26c41f           les bx, ptr es:[bx]                      
  08f2  268a07           mov al, byte ptr es:[bx]                 
  08f5  98               cwde                                     
  08f6  05d0ff           add ax, 0xffd0                           
  08f9  6bc064           imul ax, ax, 0x64                        
  08fc  50               push ax                                  
  08fd  268a4701         mov al, byte ptr es:[bx + 1]             
  0901  98               cwde                                     
  0902  05d0ff           add ax, 0xffd0                           
  0905  6bc00a           imul ax, ax, 0xa                         
  0908  5a               pop dx                                   
  0909  03d0             add dx, ax                               
  090b  268a4702         mov al, byte ptr es:[bx + 2]             
  090f  98               cwde                                     
  0910  03d0             add dx, ax                               
  0912  83c2d0           add dx, -0x30                            
  0915  c45e0a           les bx, ptr [bp + 0xa]                   
  0918  268917           mov word ptr es:[bx], dx                 
  091b  c45e06           les bx, ptr [bp + 6]                     
  091e  26830703         add word ptr es:[bx], 3                  
  0922  5d               pop bp                                   
  0923  cb               retf                                     

ovl59_0924:  ; ENTRY
  0924  55               push bp                                  
  0925  8bec             mov bp, sp                               
  0927  c45e06           les bx, ptr [bp + 6]                     
  092a  26ff07           inc word ptr es:[bx]                     
  092d  66ff760a         push dword ptr [bp + 0xa]                
  0931  ff7608           push word ptr [bp + 8]                   
  0934  53               push bx                                  
  0935  0e               push cs                                  
  0936  e8b0ff           call 0x8e9                               
  0939  83c408           add sp, 8                                
  093c  c45e06           les bx, ptr [bp + 6]                     
  093f  26ff07           inc word ptr es:[bx]                     
  0942  8b460a           mov ax, word ptr [bp + 0xa]              
  0945  050200           add ax, 2                                
  0948  ff760c           push word ptr [bp + 0xc]                 
  094b  50               push ax                                  
  094c  ff7608           push word ptr [bp + 8]                   
  094f  53               push bx                                  
  0950  0e               push cs                                  
  0951  e895ff           call 0x8e9                               
  0954  83c408           add sp, 8                                
  0957  c45e06           les bx, ptr [bp + 6]                     
  095a  26ff07           inc word ptr es:[bx]                     
  095d  8b460a           mov ax, word ptr [bp + 0xa]              
  0960  050400           add ax, 4                                
  0963  ff760c           push word ptr [bp + 0xc]                 
  0966  50               push ax                                  
  0967  ff7608           push word ptr [bp + 8]                   
  096a  53               push bx                                  
  096b  0e               push cs                                  
  096c  e87aff           call 0x8e9                               
  096f  83c408           add sp, 8                                
  0972  c45e06           les bx, ptr [bp + 6]                     
  0975  26ff07           inc word ptr es:[bx]                     
  0978  8b460a           mov ax, word ptr [bp + 0xa]              
  097b  050600           add ax, 6                                
  097e  ff760c           push word ptr [bp + 0xc]                 
  0981  50               push ax                                  
  0982  ff7608           push word ptr [bp + 8]                   
  0985  53               push bx                                  
  0986  0e               push cs                                  
  0987  e85fff           call 0x8e9                               
  098a  83c408           add sp, 8                                
  098d  c45e06           les bx, ptr [bp + 6]                     
  0990  26ff07           inc word ptr es:[bx]                     
  0993  5d               pop bp                                   
  0994  cb               retf                                     

ovl59_0995:  ; ENTRY
  0995  55               push bp                                  
  0996  8bec             mov bp, sp                               
  0998  c45e06           les bx, ptr [bp + 6]                     
  099b  26ff07           inc word ptr es:[bx]                     
  099e  66ff760a         push dword ptr [bp + 0xa]                
  09a2  ff7608           push word ptr [bp + 8]                   
  09a5  53               push bx                                  
  09a6  0e               push cs                                  
  09a7  e83fff           call 0x8e9                               
  09aa  83c408           add sp, 8                                
  09ad  c45e06           les bx, ptr [bp + 6]                     
  09b0  26ff07           inc word ptr es:[bx]                     
  09b3  8b460a           mov ax, word ptr [bp + 0xa]              
  09b6  050200           add ax, 2                                
  09b9  ff760c           push word ptr [bp + 0xc]                 
  09bc  50               push ax                                  
  09bd  ff7608           push word ptr [bp + 8]                   
  09c0  53               push bx                                  
  09c1  0e               push cs                                  
  09c2  e824ff           call 0x8e9                               
  09c5  83c408           add sp, 8                                
  09c8  c45e06           les bx, ptr [bp + 6]                     
  09cb  26ff07           inc word ptr es:[bx]                     
  09ce  c45e0a           les bx, ptr [bp + 0xa]                   
  09d1  a12a5c           mov ax, word ptr [0x5c2a]                
  09d4  260107           add word ptr es:[bx], ax                 
  09d7  a1285c           mov ax, word ptr [0x5c28]                
  09da  26014702         add word ptr es:[bx + 2], ax             
  09de  5d               pop bp                                   
  09df  cb               retf                                     

ovl59_09e0:  ; ENTRY
  09e0  55               push bp                                  
  09e1  8bec             mov bp, sp                               
  09e3  33d2             xor dx, dx                               
  09e5  eb12             jmp 0x9f9                                
  09e7  c45e06           les bx, ptr [bp + 6]                     
  09ea  26c41f           les bx, ptr es:[bx]                      
  09ed  268a07           mov al, byte ptr es:[bx]                 
  09f0  c45e0a           les bx, ptr [bp + 0xa]                   
  09f3  03da             add bx, dx                               
  09f5  268807           mov byte ptr es:[bx], al                 
  09f8  42               inc dx                                   
  09f9  c45e06           les bx, ptr [bp + 6]                     
  09fc  26ff07           inc word ptr es:[bx]                     
  09ff  c45e06           les bx, ptr [bp + 6]                     
  0a02  26c41f           les bx, ptr es:[bx]                      
  0a05  26803f7c         cmp byte ptr es:[bx], 0x7c               
  0a09  75dc             jne 0x9e7                                
  0a0b  c45e0a           les bx, ptr [bp + 0xa]                   
  0a0e  03da             add bx, dx                               
  0a10  26c60700         mov byte ptr es:[bx], 0                  
  0a14  5d               pop bp                                   
  0a15  cb               retf                                     

ovl59_0a16:  ; ENTRY
  0a16  55               push bp                                  
  0a17  8bec             mov bp, sp                               
  0a19  5d               pop bp                                   
  0a1a  cb               retf                                     

ovl59_0a1b:  ; ENTRY
  0a1b  55               push bp                                  
  0a1c  8bec             mov bp, sp                               
  0a1e  83ec08           sub sp, 8                                
  0a21  c7068632c130     mov word ptr [0x3286], 0x30c1            
  0a27  c7068432a700     mov word ptr [0x3284], 0xa7              
  0a2d  666a01           push 1                                   
  0a30  6a00             push 0                                   
  0a32  6668f0490200     push 0x249f0                             
  0a38  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0a3d  83c40a           add sp, 0xa                              
  0a40  8956fe           mov word ptr [bp - 2], dx                
  0a43  8946fc           mov word ptr [bp - 4], ax                
  0a46  66837efc00       cmp dword ptr [bp - 4], 0                
  0a4b  7421             je 0xa6e                                 
  0a4d  52               push dx                                  
  0a4e  50               push ax                                  
  0a4f  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0a54  83c404           add sp, 4                                
  0a57  8956fa           mov word ptr [bp - 6], dx                
  0a5a  8946f8           mov word ptr [bp - 8], ax                
  0a5d  66837ef800       cmp dword ptr [bp - 8], 0                
  0a62  66ff76fc         push dword ptr [bp - 4]                  
  0a66  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  0a6b  83c404           add sp, 4                                
  0a6e  c70686324c0a     mov word ptr [0x3286], 0xa4c             
  0a74  c70684328803     mov word ptr [0x3284], 0x388             
  0a7a  c9               leave                                    
  0a7b  cb               retf                                     

ovl59_0a7c:  ; ENTRY
  0a7c  55               push bp                                  
  0a7d  8bec             mov bp, sp                               
  0a7f  83ec04           sub sp, 4                                
  0a82  16               push ss                                  
  0a83  8d46fc           lea ax, [bp - 4]                         
  0a86  50               push ax                                  
  0a87  9a541c0000       lcall 0, 0x1c54                          -> 0000:1c54
  0a8c  83c404           add sp, 4                                
  0a8f  807efc17         cmp byte ptr [bp - 4], 0x17              
  0a93  7511             jne 0xaa6                                
  0a95  807efd3b         cmp byte ptr [bp - 3], 0x3b              
  0a99  750b             jne 0xaa6                                
  0a9b  807efe3a         cmp byte ptr [bp - 2], 0x3a              
  0a9f  7605             jbe 0xaa6                                
  0aa1  b80100           mov ax, 1                                
  0aa4  eb02             jmp 0xaa8                                
  0aa6  33c0             xor ax, ax                               
  0aa8  c9               leave                                    
  0aa9  cb               retf                                     
