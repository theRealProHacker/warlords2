; res_0997 file_off 0xb970
  000e  55               push bp                                  
  000f  8bec             mov bp, sp                               
  0011  56               push si                                  
  0012  33f6             xor si, si                               
  0014  eb1b             jmp 0x31                                 
  0016  8bde             mov bx, si                               
  0018  6bdb0c           imul bx, bx, 0xc                         
  001b  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  001f  c1e803           shr ax, 3                                
  0022  250100           and ax, 1                                
  0025  0bc0             or ax, ax                                
  0027  7407             je 0x30                                  
  0029  56               push si                                  
  002a  90               nop                                      
  002b  0e               push cs                                  
  002c  e87a03           call 0x3a9                               
  002f  59               pop cx                                   
  0030  46               inc si                                   
  0031  3b360a23         cmp si, word ptr [0x230a]                
  0035  7cdf             jl 0x16                                  
  0037  5e               pop si                                   
  0038  5d               pop bp                                   
  0039  cb               retf                                     
  003a  55               push bp                                  
  003b  8bec             mov bp, sp                               
  003d  56               push si                                  
  003e  33f6             xor si, si                               
  0040  eb1b             jmp 0x5d                                 
  0042  8bde             mov bx, si                               
  0044  6bdb0c           imul bx, bx, 0xc                         
  0047  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  004b  c1e802           shr ax, 2                                
  004e  250100           and ax, 1                                
  0051  0bc0             or ax, ax                                
  0053  7407             je 0x5c                                  
  0055  56               push si                                  
  0056  90               nop                                      
  0057  0e               push cs                                  
  0058  e84105           call 0x59c                               
  005b  59               pop cx                                   
  005c  46               inc si                                   
  005d  3b360a23         cmp si, word ptr [0x230a]                
  0061  7cdf             jl 0x42                                  
  0063  5e               pop si                                   
  0064  5d               pop bp                                   
  0065  cb               retf                                     

res_0997_0066:  ; ENTRY
  0066  55               push bp                                  
  0067  8bec             mov bp, sp                               
  0069  56               push si                                  
  006a  33f6             xor si, si                               
  006c  eb2b             jmp 0x99                                 
  006e  8bde             mov bx, si                               
  0070  6bdb0c           imul bx, bx, 0xc                         
  0073  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0077  c1e802           shr ax, 2                                
  007a  250100           and ax, 1                                
  007d  0bc0             or ax, ax                                
  007f  7417             je 0x98                                  
  0081  8bde             mov bx, si                               
  0083  6bdb0c           imul bx, bx, 0xc                         
  0086  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  008a  250300           and ax, 3                                
  008d  0bc0             or ax, ax                                
  008f  7407             je 0x98                                  
  0091  56               push si                                  
  0092  90               nop                                      
  0093  0e               push cs                                  
  0094  e80505           call 0x59c                               
  0097  59               pop cx                                   
  0098  46               inc si                                   
  0099  3b360a23         cmp si, word ptr [0x230a]                
  009d  7ccf             jl 0x6e                                  
  009f  5e               pop si                                   
  00a0  5d               pop bp                                   
  00a1  cb               retf                                     

res_0997_00a2:  ; ENTRY
  00a2  55               push bp                                  
  00a3  8bec             mov bp, sp                               
  00a5  56               push si                                  
  00a6  8b7606           mov si, word ptr [bp + 6]                
  00a9  8bde             mov bx, si                               
  00ab  6bdb0c           imul bx, bx, 0xc                         
  00ae  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  00b2  c1e802           shr ax, 2                                
  00b5  250100           and ax, 1                                
  00b8  0bc0             or ax, ax                                
  00ba  7542             jne 0xfe                                 
  00bc  33d2             xor dx, dx                               
  00be  eb31             jmp 0xf1                                 
  00c0  8bda             mov bx, dx                               
  00c2  6bdb0c           imul bx, bx, 0xc                         
  00c5  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  00c9  c1e802           shr ax, 2                                
  00cc  250100           and ax, 1                                
  00cf  0bc0             or ax, ax                                
  00d1  741d             je 0xf0                                  
  00d3  8bda             mov bx, dx                               
  00d5  6bdb0c           imul bx, bx, 0xc                         
  00d8  8a875b1f         mov al, byte ptr [bx + 0x1f5b]           
  00dc  8bde             mov bx, si                               
  00de  6bdb0c           imul bx, bx, 0xc                         
  00e1  3a875b1f         cmp al, byte ptr [bx + 0x1f5b]           
  00e5  7509             jne 0xf0                                 
  00e7  52               push dx                                  
  00e8  90               nop                                      
  00e9  0e               push cs                                  
  00ea  e8af04           call 0x59c                               
  00ed  59               pop cx                                   
  00ee  eb07             jmp 0xf7                                 
  00f0  42               inc dx                                   
  00f1  3b160a23         cmp dx, word ptr [0x230a]                
  00f5  7cc9             jl 0xc0                                  
  00f7  56               push si                                  
  00f8  90               nop                                      
  00f9  0e               push cs                                  
  00fa  e8ac02           call 0x3a9                               
  00fd  59               pop cx                                   
  00fe  66ff7612         push dword ptr [bp + 0x12]               
  0102  8b5e10           mov bx, word ptr [bp + 0x10]             
  0105  6bdb0c           imul bx, bx, 0xc                         
  0108  66ffb7571f       push dword ptr [bx + 0x1f57]             
  010d  66ff760c         push dword ptr [bp + 0xc]                
  0111  66ff7608         push dword ptr [bp + 8]                  
  0115  8bde             mov bx, si                               
  0117  6bdb0c           imul bx, bx, 0xc                         
  011a  66ffb7571f       push dword ptr [bx + 0x1f57]             
  011f  ff1ed469         lcall [0x69d4]                           
  0123  83c414           add sp, 0x14                             
  0126  5e               pop si                                   
  0127  5d               pop bp                                   
  0128  cb               retf                                     

res_0997_0129:  ; ENTRY
  0129  55               push bp                                  
  012a  8bec             mov bp, sp                               
  012c  56               push si                                  
  012d  8b7606           mov si, word ptr [bp + 6]                
  0130  8bde             mov bx, si                               
  0132  6bdb0c           imul bx, bx, 0xc                         
  0135  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0139  c1e802           shr ax, 2                                
  013c  250100           and ax, 1                                
  013f  0bc0             or ax, ax                                
  0141  7542             jne 0x185                                
  0143  33d2             xor dx, dx                               
  0145  eb31             jmp 0x178                                
  0147  8bda             mov bx, dx                               
  0149  6bdb0c           imul bx, bx, 0xc                         
  014c  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0150  c1e802           shr ax, 2                                
  0153  250100           and ax, 1                                
  0156  0bc0             or ax, ax                                
  0158  741d             je 0x177                                 
  015a  8bda             mov bx, dx                               
  015c  6bdb0c           imul bx, bx, 0xc                         
  015f  8a875b1f         mov al, byte ptr [bx + 0x1f5b]           
  0163  8bde             mov bx, si                               
  0165  6bdb0c           imul bx, bx, 0xc                         
  0168  3a875b1f         cmp al, byte ptr [bx + 0x1f5b]           
  016c  7509             jne 0x177                                
  016e  52               push dx                                  
  016f  90               nop                                      
  0170  0e               push cs                                  
  0171  e82804           call 0x59c                               
  0174  59               pop cx                                   
  0175  eb07             jmp 0x17e                                
  0177  42               inc dx                                   
  0178  3b160a23         cmp dx, word ptr [0x230a]                
  017c  7cc9             jl 0x147                                 
  017e  56               push si                                  
  017f  90               nop                                      
  0180  0e               push cs                                  
  0181  e82502           call 0x3a9                               
  0184  59               pop cx                                   
  0185  66ff7610         push dword ptr [bp + 0x10]               
  0189  1e               push ds                                  
  018a  682a34           push 0x342a                              
  018d  66ff760c         push dword ptr [bp + 0xc]                
  0191  66ff7608         push dword ptr [bp + 8]                  
  0195  8bde             mov bx, si                               
  0197  6bdb0c           imul bx, bx, 0xc                         
  019a  66ffb7571f       push dword ptr [bx + 0x1f57]             
  019f  ff1ed469         lcall [0x69d4]                           
  01a3  83c414           add sp, 0x14                             
  01a6  5e               pop si                                   
  01a7  5d               pop bp                                   
  01a8  cb               retf                                     
  01a9  55               push bp                                  
  01aa  8bec             mov bp, sp                               
  01ac  56               push si                                  
  01ad  57               push di                                  
  01ae  8b7606           mov si, word ptr [bp + 6]                
  01b1  8b7e10           mov di, word ptr [bp + 0x10]             
  01b4  8bde             mov bx, si                               
  01b6  6bdb0c           imul bx, bx, 0xc                         
  01b9  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  01bd  c1e802           shr ax, 2                                
  01c0  250100           and ax, 1                                
  01c3  0bc0             or ax, ax                                
  01c5  7542             jne 0x209                                
  01c7  33d2             xor dx, dx                               
  01c9  eb31             jmp 0x1fc                                
  01cb  8bda             mov bx, dx                               
  01cd  6bdb0c           imul bx, bx, 0xc                         
  01d0  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  01d4  c1e802           shr ax, 2                                
  01d7  250100           and ax, 1                                
  01da  0bc0             or ax, ax                                
  01dc  741d             je 0x1fb                                 
  01de  8bda             mov bx, dx                               
  01e0  6bdb0c           imul bx, bx, 0xc                         
  01e3  8a875b1f         mov al, byte ptr [bx + 0x1f5b]           
  01e7  8bde             mov bx, si                               
  01e9  6bdb0c           imul bx, bx, 0xc                         
  01ec  3a875b1f         cmp al, byte ptr [bx + 0x1f5b]           
  01f0  7509             jne 0x1fb                                
  01f2  52               push dx                                  
  01f3  90               nop                                      
  01f4  0e               push cs                                  
  01f5  e8a403           call 0x59c                               
  01f8  59               pop cx                                   
  01f9  eb07             jmp 0x202                                
  01fb  42               inc dx                                   
  01fc  3b160a23         cmp dx, word ptr [0x230a]                
  0200  7cc9             jl 0x1cb                                 
  0202  56               push si                                  
  0203  90               nop                                      
  0204  0e               push cs                                  
  0205  e8a101           call 0x3a9                               
  0208  59               pop cx                                   
  0209  8bde             mov bx, si                               
  020b  6bdb0c           imul bx, bx, 0xc                         
  020e  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0212  c1e805           shr ax, 5                                
  0215  250100           and ax, 1                                
  0218  0bc0             or ax, ax                                
  021a  7529             jne 0x245                                
  021c  66ff7612         push dword ptr [bp + 0x12]               
  0220  8bdf             mov bx, di                               
  0222  6bdb0c           imul bx, bx, 0xc                         
  0225  66ffb7571f       push dword ptr [bx + 0x1f57]             
  022a  66ff760c         push dword ptr [bp + 0xc]                
  022e  66ff7608         push dword ptr [bp + 8]                  
  0232  8bde             mov bx, si                               
  0234  6bdb0c           imul bx, bx, 0xc                         
  0237  66ffb7571f       push dword ptr [bx + 0x1f57]             
  023c  ff1ed469         lcall [0x69d4]                           
  0240  83c414           add sp, 0x14                             
  0243  eb35             jmp 0x27a                                
  0245  66ff7608         push dword ptr [bp + 8]                  
  0249  8bde             mov bx, si                               
  024b  6bdb0c           imul bx, bx, 0xc                         
  024e  66ffb75c1f       push dword ptr [bx + 0x1f5c]             
  0253  66ff7612         push dword ptr [bp + 0x12]               
  0257  8bdf             mov bx, di                               
  0259  6bdb0c           imul bx, bx, 0xc                         
  025c  66ffb7571f       push dword ptr [bx + 0x1f57]             
  0261  66ff760c         push dword ptr [bp + 0xc]                
  0265  66ff7608         push dword ptr [bp + 8]                  
  0269  8bde             mov bx, si                               
  026b  6bdb0c           imul bx, bx, 0xc                         
  026e  66ffb7571f       push dword ptr [bx + 0x1f57]             
  0273  ff1ec869         lcall [0x69c8]                           
  0277  83c41c           add sp, 0x1c                             
  027a  5f               pop di                                   
  027b  5e               pop si                                   
  027c  5d               pop bp                                   
  027d  cb               retf                                     

res_0997_027e:  ; ENTRY
  027e  55               push bp                                  
  027f  8bec             mov bp, sp                               
  0281  56               push si                                  
  0282  8b7606           mov si, word ptr [bp + 6]                
  0285  8bde             mov bx, si                               
  0287  6bdb0c           imul bx, bx, 0xc                         
  028a  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  028e  c1e802           shr ax, 2                                
  0291  250100           and ax, 1                                
  0294  0bc0             or ax, ax                                
  0296  7542             jne 0x2da                                
  0298  33d2             xor dx, dx                               
  029a  eb31             jmp 0x2cd                                
  029c  8bda             mov bx, dx                               
  029e  6bdb0c           imul bx, bx, 0xc                         
  02a1  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  02a5  c1e802           shr ax, 2                                
  02a8  250100           and ax, 1                                
  02ab  0bc0             or ax, ax                                
  02ad  741d             je 0x2cc                                 
  02af  8bda             mov bx, dx                               
  02b1  6bdb0c           imul bx, bx, 0xc                         
  02b4  8a875b1f         mov al, byte ptr [bx + 0x1f5b]           
  02b8  8bde             mov bx, si                               
  02ba  6bdb0c           imul bx, bx, 0xc                         
  02bd  3a875b1f         cmp al, byte ptr [bx + 0x1f5b]           
  02c1  7509             jne 0x2cc                                
  02c3  52               push dx                                  
  02c4  90               nop                                      
  02c5  0e               push cs                                  
  02c6  e8d302           call 0x59c                               
  02c9  59               pop cx                                   
  02ca  eb07             jmp 0x2d3                                
  02cc  42               inc dx                                   
  02cd  3b160a23         cmp dx, word ptr [0x230a]                
  02d1  7cc9             jl 0x29c                                 
  02d3  56               push si                                  
  02d4  90               nop                                      
  02d5  0e               push cs                                  
  02d6  e8d000           call 0x3a9                               
  02d9  59               pop cx                                   
  02da  8bde             mov bx, si                               
  02dc  6bdb0c           imul bx, bx, 0xc                         
  02df  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  02e3  c1e805           shr ax, 5                                
  02e6  250100           and ax, 1                                
  02e9  0bc0             or ax, ax                                
  02eb  751d             jne 0x30a                                
  02ed  66ff7610         push dword ptr [bp + 0x10]               
  02f1  16               push ss                                  
  02f2  8d4608           lea ax, [bp + 8]                         
  02f5  50               push ax                                  
  02f6  8bde             mov bx, si                               
  02f8  6bdb0c           imul bx, bx, 0xc                         
  02fb  66ffb7571f       push dword ptr [bx + 0x1f57]             
  0300  9a9d00d014       lcall 0x14d0, 0x9d                       -> 14d0:009d
  0305  83c40c           add sp, 0xc                              
  0308  eb2f             jmp 0x339                                
  030a  66ff7608         push dword ptr [bp + 8]                  
  030e  8bde             mov bx, si                               
  0310  6bdb0c           imul bx, bx, 0xc                         
  0313  66ffb75c1f       push dword ptr [bx + 0x1f5c]             
  0318  66ff7610         push dword ptr [bp + 0x10]               
  031c  1e               push ds                                  
  031d  682a34           push 0x342a                              
  0320  66ff760c         push dword ptr [bp + 0xc]                
  0324  66ff7608         push dword ptr [bp + 8]                  
  0328  8bde             mov bx, si                               
  032a  6bdb0c           imul bx, bx, 0xc                         
  032d  66ffb7571f       push dword ptr [bx + 0x1f57]             
  0332  ff1ec869         lcall [0x69c8]                           
  0336  83c41c           add sp, 0x1c                             
  0339  5e               pop si                                   
  033a  5d               pop bp                                   
  033b  cb               retf                                     
  033c  55               push bp                                  
  033d  8bec             mov bp, sp                               
  033f  ff7606           push word ptr [bp + 6]                   
  0342  90               nop                                      
  0343  0e               push cs                                  
  0344  e85502           call 0x59c                               
  0347  59               pop cx                                   
  0348  5d               pop bp                                   
  0349  cb               retf                                     

res_0997_034a:  ; ENTRY
  034a  55               push bp                                  
  034b  8bec             mov bp, sp                               
  034d  56               push si                                  
  034e  8b7606           mov si, word ptr [bp + 6]                
  0351  8bde             mov bx, si                               
  0353  6bdb0c           imul bx, bx, 0xc                         
  0356  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  035a  c1e802           shr ax, 2                                
  035d  250100           and ax, 1                                
  0360  0bc0             or ax, ax                                
  0362  7542             jne 0x3a6                                
  0364  33d2             xor dx, dx                               
  0366  eb31             jmp 0x399                                
  0368  8bda             mov bx, dx                               
  036a  6bdb0c           imul bx, bx, 0xc                         
  036d  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0371  c1e802           shr ax, 2                                
  0374  250100           and ax, 1                                
  0377  0bc0             or ax, ax                                
  0379  741d             je 0x398                                 
  037b  8bda             mov bx, dx                               
  037d  6bdb0c           imul bx, bx, 0xc                         
  0380  8a875b1f         mov al, byte ptr [bx + 0x1f5b]           
  0384  8bde             mov bx, si                               
  0386  6bdb0c           imul bx, bx, 0xc                         
  0389  3a875b1f         cmp al, byte ptr [bx + 0x1f5b]           
  038d  7509             jne 0x398                                
  038f  52               push dx                                  
  0390  90               nop                                      
  0391  0e               push cs                                  
  0392  e80702           call 0x59c                               
  0395  59               pop cx                                   
  0396  eb07             jmp 0x39f                                
  0398  42               inc dx                                   
  0399  3b160a23         cmp dx, word ptr [0x230a]                
  039d  7cc9             jl 0x368                                 
  039f  56               push si                                  
  03a0  90               nop                                      
  03a1  0e               push cs                                  
  03a2  e80400           call 0x3a9                               
  03a5  59               pop cx                                   
  03a6  5e               pop si                                   
  03a7  5d               pop bp                                   
  03a8  cb               retf                                     

res_0997_03a9:  ; ENTRY
  03a9  55               push bp                                  
  03aa  8bec             mov bp, sp                               
  03ac  81eca600         sub sp, 0xa6                             
  03b0  56               push si                                  
  03b1  8b7606           mov si, word ptr [bp + 6]                
  03b4  1e               push ds                                  
  03b5  680c23           push 0x230c                              
  03b8  16               push ss                                  
  03b9  8d4696           lea ax, [bp - 0x6a]                      
  03bc  50               push ax                                  
  03bd  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  03c2  83c408           add sp, 8                                
  03c5  8bde             mov bx, si                               
  03c7  6bdb0c           imul bx, bx, 0xc                         
  03ca  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  03ce  250300           and ax, 3                                
  03d1  3d0100           cmp ax, 1                                
  03d4  7517             jne 0x3ed                                
  03d6  1e               push ds                                  
  03d7  68a85d           push 0x5da8                              
  03da  1e               push ds                                  
  03db  680d23           push 0x230d                               ; "%s\pics\"
  03de  16               push ss                                  
  03df  8d4696           lea ax, [bp - 0x6a]                      
  03e2  50               push ax                                  
  03e3  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03e8  83c40c           add sp, 0xc                              
  03eb  eb3f             jmp 0x42c                                
  03ed  8bde             mov bx, si                               
  03ef  6bdb0c           imul bx, bx, 0xc                         
  03f2  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  03f6  250300           and ax, 3                                
  03f9  3d0200           cmp ax, 2                                
  03fc  751d             jne 0x41b                                
  03fe  b8042c           mov ax, 0x2c04                           
  0401  8ec0             mov es, ax                               
  0403  26ff366101       push word ptr es:[0x161]                 
  0408  1e               push ds                                  
  0409  681623           push 0x2316                               ; "terrain%d\"
  040c  16               push ss                                  
  040d  8d4696           lea ax, [bp - 0x6a]                      
  0410  50               push ax                                  
  0411  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0416  83c40a           add sp, 0xa                              
  0419  eb11             jmp 0x42c                                
  041b  1e               push ds                                  
  041c  682123           push 0x2321                               ; "pics\"
  041f  16               push ss                                  
  0420  8d4696           lea ax, [bp - 0x6a]                      
  0423  50               push ax                                  
  0424  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0429  83c408           add sp, 8                                
  042c  8bde             mov bx, si                               
  042e  6bdb0c           imul bx, bx, 0xc                         
  0431  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0435  c1e804           shr ax, 4                                
  0438  250100           and ax, 1                                
  043b  0bc0             or ax, ax                                
  043d  7415             je 0x454                                 
  043f  c6468e00         mov byte ptr [bp - 0x72], 0              
  0443  c7468f0000       mov word ptr [bp - 0x71], 0              
  0448  8d865aff         lea ax, [bp - 0xa6]                      
  044c  8c56fe           mov word ptr [bp - 2], ss                
  044f  8946fc           mov word ptr [bp - 4], ax                
  0452  eb13             jmp 0x467                                
  0454  8bde             mov bx, si                               
  0456  6bdb0c           imul bx, bx, 0xc                         
  0459  8b87591f         mov ax, word ptr [bx + 0x1f59]           
  045d  8b97571f         mov dx, word ptr [bx + 0x1f57]           
  0461  8946fe           mov word ptr [bp - 2], ax                
  0464  8956fc           mov word ptr [bp - 4], dx                
  0467  56               push si                                  
  0468  6a03             push 3                                   
  046a  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  046f  83c404           add sp, 4                                
  0472  52               push dx                                  
  0473  50               push ax                                  
  0474  16               push ss                                  
  0475  8d4696           lea ax, [bp - 0x6a]                      
  0478  50               push ax                                  
  0479  66ff76fc         push dword ptr [bp - 4]                  
  047d  9a05007b09       lcall 0x97b, 5                           -> 097b:0005
  0482  83c40c           add sp, 0xc                              
  0485  0bc0             or ax, ax                                
  0487  7534             jne 0x4bd                                
  0489  56               push si                                  
  048a  6a03             push 3                                   
  048c  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0491  83c404           add sp, 4                                
  0494  52               push dx                                  
  0495  50               push ax                                  
  0496  666a01           push 1                                   
  0499  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  049e  83c404           add sp, 4                                
  04a1  52               push dx                                  
  04a2  50               push ax                                  
  04a3  16               push ss                                  
  04a4  8d46c8           lea ax, [bp - 0x38]                      
  04a7  50               push ax                                  
  04a8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  04ad  83c40c           add sp, 0xc                              
  04b0  16               push ss                                  
  04b1  8d46c8           lea ax, [bp - 0x38]                      
  04b4  50               push ax                                  
  04b5  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  04ba  83c404           add sp, 4                                
  04bd  8bde             mov bx, si                               
  04bf  6bdb0c           imul bx, bx, 0xc                         
  04c2  808f561f04       or byte ptr [bx + 0x1f56], 4             
  04c7  8bde             mov bx, si                               
  04c9  6bdb0c           imul bx, bx, 0xc                         
  04cc  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  04d0  c1e805           shr ax, 5                                
  04d3  250100           and ax, 1                                
  04d6  0bc0             or ax, ax                                
  04d8  7453             je 0x52d                                 
  04da  8bde             mov bx, si                               
  04dc  6bdb0c           imul bx, bx, 0xc                         
  04df  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  04e3  c1e806           shr ax, 6                                
  04e6  250100           and ax, 1                                
  04e9  8946fa           mov word ptr [bp - 6], ax                
  04ec  8bde             mov bx, si                               
  04ee  6bdb0c           imul bx, bx, 0xc                         
  04f1  ffb7601f         push word ptr [bx + 0x1f60]              
  04f5  8bde             mov bx, si                               
  04f7  6bdb0c           imul bx, bx, 0xc                         
  04fa  66ffb75c1f       push dword ptr [bx + 0x1f5c]             
  04ff  8bde             mov bx, si                               
  0501  6bdb0c           imul bx, bx, 0xc                         
  0504  66ffb7571f       push dword ptr [bx + 0x1f57]             
  0509  16               push ss                                  
  050a  8d46fa           lea ax, [bp - 6]                         
  050d  50               push ax                                  
  050e  9acf001d15       lcall 0x151d, 0xcf                       -> 151d:00cf
  0513  83c40e           add sp, 0xe                              
  0516  8b46fa           mov ax, word ptr [bp - 6]                
  0519  250100           and ax, 1                                
  051c  8bde             mov bx, si                               
  051e  6bdb0c           imul bx, bx, 0xc                         
  0521  80a7561fbf       and byte ptr [bx + 0x1f56], 0xbf         
  0526  c0e006           shl al, 6                                
  0529  0887561f         or byte ptr [bx + 0x1f56], al            
  052d  8bde             mov bx, si                               
  052f  6bdb0c           imul bx, bx, 0xc                         
  0532  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0536  c1e804           shr ax, 4                                
  0539  250100           and ax, 1                                
  053c  0bc0             or ax, ax                                
  053e  7459             je 0x599                                 
  0540  8bde             mov bx, si                               
  0542  6bdb0c           imul bx, bx, 0xc                         
  0545  66ffb7571f       push dword ptr [bx + 0x1f57]             
  054a  9acf091210       lcall 0x1012, 0x9cf                      -> 1012:09cf
  054f  83c404           add sp, 4                                
  0552  66ffb65eff       push dword ptr [bp - 0xa2]               
  0557  8bde             mov bx, si                               
  0559  6bdb0c           imul bx, bx, 0xc                         
  055c  66ffb7571f       push dword ptr [bx + 0x1f57]             
  0561  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0566  83c408           add sp, 8                                
  0569  666a00           push 0                                   
  056c  8bde             mov bx, si                               
  056e  6bdb0c           imul bx, bx, 0xc                         
  0571  66ffb7571f       push dword ptr [bx + 0x1f57]             
  0576  66ffb65eff       push dword ptr [bp - 0xa2]               
  057b  666a00           push 0                                   
  057e  16               push ss                                  
  057f  8d865aff         lea ax, [bp - 0xa6]                      
  0583  50               push ax                                  
  0584  ff1ed469         lcall [0x69d4]                           
  0588  83c414           add sp, 0x14                             
  058b  16               push ss                                  
  058c  8d865aff         lea ax, [bp - 0xa6]                      
  0590  50               push ax                                  
  0591  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0596  83c404           add sp, 4                                
  0599  5e               pop si                                   
  059a  c9               leave                                    
  059b  cb               retf                                     

res_0997_059c:  ; ENTRY
  059c  55               push bp                                  
  059d  8bec             mov bp, sp                               
  059f  56               push si                                  
  05a0  8b7606           mov si, word ptr [bp + 6]                
  05a3  8bde             mov bx, si                               
  05a5  6bdb0c           imul bx, bx, 0xc                         
  05a8  80a7561ffb       and byte ptr [bx + 0x1f56], 0xfb         
  05ad  8bde             mov bx, si                               
  05af  6bdb0c           imul bx, bx, 0xc                         
  05b2  80a7561fbf       and byte ptr [bx + 0x1f56], 0xbf         
  05b7  8bde             mov bx, si                               
  05b9  6bdb0c           imul bx, bx, 0xc                         
  05bc  66ffb7571f       push dword ptr [bx + 0x1f57]             
  05c1  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  05c6  83c404           add sp, 4                                
  05c9  8bde             mov bx, si                               
  05cb  6bdb0c           imul bx, bx, 0xc                         
  05ce  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  05d2  c1e805           shr ax, 5                                
  05d5  250100           and ax, 1                                
  05d8  0bc0             or ax, ax                                
  05da  7412             je 0x5ee                                 
  05dc  8bde             mov bx, si                               
  05de  6bdb0c           imul bx, bx, 0xc                         
  05e1  66ffb75c1f       push dword ptr [bx + 0x1f5c]             
  05e6  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  05eb  83c404           add sp, 4                                
  05ee  5e               pop si                                   
  05ef  5d               pop bp                                   
  05f0  cb               retf                                     
  05f1  55               push bp                                  
  05f2  8bec             mov bp, sp                               
  05f4  8b5e06           mov bx, word ptr [bp + 6]                
  05f7  6bdb0c           imul bx, bx, 0xc                         
  05fa  8b460a           mov ax, word ptr [bp + 0xa]              
  05fd  8b5608           mov dx, word ptr [bp + 8]                
  0600  8987591f         mov word ptr [bx + 0x1f59], ax           
  0604  8997571f         mov word ptr [bx + 0x1f57], dx           
  0608  5d               pop bp                                   
  0609  cb               retf                                     

res_0997_060a:  ; ENTRY
  060a  55               push bp                                  
  060b  8bec             mov bp, sp                               
  060d  83ec02           sub sp, 2                                
  0610  56               push si                                  
  0611  57               push di                                  
  0612  8b7e06           mov di, word ptr [bp + 6]                
  0615  8bdf             mov bx, di                               
  0617  6bdb0c           imul bx, bx, 0xc                         
  061a  c49f571f         les bx, ptr [bx + 0x1f57]                
  061e  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0623  8bdf             mov bx, di                               
  0625  6bdb0c           imul bx, bx, 0xc                         
  0628  8b9f571f         mov bx, word ptr [bx + 0x1f57]           
  062c  66263b471e       cmp eax, dword ptr es:[bx + 0x1e]        
  0631  7503             jne 0x636                                
  0633  e98100           jmp 0x6b7                                
  0636  c746fe0000       mov word ptr [bp - 2], 0                 
  063b  eb3a             jmp 0x677                                
  063d  8bdf             mov bx, di                               
  063f  6bdb0c           imul bx, bx, 0xc                         
  0642  c49f571f         les bx, ptr [bx + 0x1f57]                
  0646  8b46fe           mov ax, word ptr [bp - 2]                
  0649  c1e002           shl ax, 2                                
  064c  03d8             add bx, ax                               
  064e  6626ff770a       push dword ptr es:[bx + 0xa]             
  0653  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0658  83c404           add sp, 4                                
  065b  8bdf             mov bx, di                               
  065d  6bdb0c           imul bx, bx, 0xc                         
  0660  c49f571f         les bx, ptr [bx + 0x1f57]                
  0664  8b76fe           mov si, word ptr [bp - 2]                
  0667  c1e602           shl si, 2                                
  066a  03de             add bx, si                               
  066c  2689571c         mov word ptr es:[bx + 0x1c], dx          
  0670  2689471a         mov word ptr es:[bx + 0x1a], ax          
  0674  ff46fe           inc word ptr [bp - 2]                    
  0677  837efe04         cmp word ptr [bp - 2], 4                 
  067b  7cc0             jl 0x63d                                 
  067d  8bdf             mov bx, di                               
  067f  6bdb0c           imul bx, bx, 0xc                         
  0682  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0686  c1e805           shr ax, 5                                
  0689  250100           and ax, 1                                
  068c  0bc0             or ax, ax                                
  068e  7427             je 0x6b7                                 
  0690  8bdf             mov bx, di                               
  0692  6bdb0c           imul bx, bx, 0xc                         
  0695  c49f5c1f         les bx, ptr [bx + 0x1f5c]                
  0699  6626ff770a       push dword ptr es:[bx + 0xa]             
  069e  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  06a3  83c404           add sp, 4                                
  06a6  8bdf             mov bx, di                               
  06a8  6bdb0c           imul bx, bx, 0xc                         
  06ab  c49f5c1f         les bx, ptr [bx + 0x1f5c]                
  06af  2689571c         mov word ptr es:[bx + 0x1c], dx          
  06b3  2689471a         mov word ptr es:[bx + 0x1a], ax          
  06b7  5f               pop di                                   
  06b8  5e               pop si                                   
  06b9  c9               leave                                    
  06ba  cb               retf                                     

res_0997_06bb:  ; ENTRY
  06bb  55               push bp                                  
  06bc  8bec             mov bp, sp                               
  06be  56               push si                                  
  06bf  57               push di                                  
  06c0  8b7606           mov si, word ptr [bp + 6]                
  06c3  8bde             mov bx, si                               
  06c5  6bdb0c           imul bx, bx, 0xc                         
  06c8  c49f571f         les bx, ptr [bx + 0x1f57]                
  06cc  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  06d1  8bde             mov bx, si                               
  06d3  6bdb0c           imul bx, bx, 0xc                         
  06d6  8b9f571f         mov bx, word ptr [bx + 0x1f57]           
  06da  66263b471e       cmp eax, dword ptr es:[bx + 0x1e]        
  06df  7450             je 0x731                                 
  06e1  33ff             xor di, di                               
  06e3  eb1e             jmp 0x703                                
  06e5  8bde             mov bx, si                               
  06e7  6bdb0c           imul bx, bx, 0xc                         
  06ea  c49f571f         les bx, ptr [bx + 0x1f57]                
  06ee  8bc7             mov ax, di                               
  06f0  c1e002           shl ax, 2                                
  06f3  03d8             add bx, ax                               
  06f5  6626ff770a       push dword ptr es:[bx + 0xa]             
  06fa  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  06ff  83c404           add sp, 4                                
  0702  47               inc di                                   
  0703  83ff04           cmp di, 4                                
  0706  7cdd             jl 0x6e5                                 
  0708  8bde             mov bx, si                               
  070a  6bdb0c           imul bx, bx, 0xc                         
  070d  8a87561f         mov al, byte ptr [bx + 0x1f56]           
  0711  c1e805           shr ax, 5                                
  0714  250100           and ax, 1                                
  0717  0bc0             or ax, ax                                
  0719  7416             je 0x731                                 
  071b  8bde             mov bx, si                               
  071d  6bdb0c           imul bx, bx, 0xc                         
  0720  c49f5c1f         les bx, ptr [bx + 0x1f5c]                
  0724  6626ff770a       push dword ptr es:[bx + 0xa]             
  0729  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  072e  83c404           add sp, 4                                
  0731  5f               pop di                                   
  0732  5e               pop si                                   
  0733  5d               pop bp                                   
  0734  cb               retf                                     
  0735  55               push bp                                  
