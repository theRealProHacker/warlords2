; ovl18 stub 2fb1 file_off 0x48610 size 0xafe

ovl18_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec38           sub sp, 0x38                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  b8042c           mov ax, 0x2c04                           
  000b  8ec0             mov es, ax                               
  000d  268b1e1001       mov bx, word ptr es:[0x110]              
  0012  d1e3             shl bx, 1                                
  0014  b8042c           mov ax, 0x2c04                           
  0017  8ec0             mov es, ax                               
  0019  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  001f  7505             jne 0x26                                 
  0021  b80100           mov ax, 1                                
  0024  eb02             jmp 0x28                                 
  0026  33c0             xor ax, ax                               
  0028  8946fc           mov word ptr [bp - 4], ax                
  002b  90               nop                                      
  002c  0e               push cs                                  
  002d  e8e708           call 0x917                               
  0030  b8042c           mov ax, 0x2c04                           
  0033  8ec0             mov es, ax                               
  0035  26833e1c0100     cmp word ptr es:[0x11c], 0               
  003b  7503             jne 0x40                                 
  003d  e90d08           jmp 0x84d                                
  0040  6a00             push 0                                   
  0042  9a3900e82f       lcall 0x2fe8, 0x39                       -> ovl27:0e04
  0047  59               pop cx                                   
  0048  a38e40           mov word ptr [0x408e], ax                
  004b  be0800           mov si, 8                                
  004e  e9b000           jmp 0x101                                
  0051  b8042c           mov ax, 0x2c04                           
  0054  8ec0             mov es, ax                               
  0056  268b1e1001       mov bx, word ptr es:[0x110]              
  005b  c1e303           shl bx, 3                                
  005e  03de             add bx, si                               
  0060  b8042c           mov ax, 0x2c04                           
  0063  8ec0             mov es, ax                               
  0065  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  006b  8bde             mov bx, si                               
  006d  d1e3             shl bx, 1                                
  006f  33c0             xor ax, ax                               
  0071  89879040         mov word ptr [bx + 0x4090], ax           
  0075  8bde             mov bx, si                               
  0077  d1e3             shl bx, 1                                
  0079  8987a040         mov word ptr [bx + 0x40a0], ax           
  007d  8bde             mov bx, si                               
  007f  d1e3             shl bx, 1                                
  0081  8987b040         mov word ptr [bx + 0x40b0], ax           
  0085  8bde             mov bx, si                               
  0087  d1e3             shl bx, 1                                
  0089  8d46d8           lea ax, [bp - 0x28]                      
  008c  03d8             add bx, ax                               
  008e  33c0             xor ax, ax                               
  0090  368907           mov word ptr ss:[bx], ax                 
  0093  8bde             mov bx, si                               
  0095  d1e3             shl bx, 1                                
  0097  8d56e8           lea dx, [bp - 0x18]                      
  009a  03da             add bx, dx                               
  009c  368907           mov word ptr ss:[bx], ax                 
  009f  8bc6             mov ax, si                               
  00a1  c1e003           shl ax, 3                                
  00a4  ba042c           mov dx, 0x2c04                           
  00a7  8ec2             mov es, dx                               
  00a9  2603061001       add ax, word ptr es:[0x110]              
  00ae  ba042c           mov dx, 0x2c04                           
  00b1  8bd8             mov bx, ax                               
  00b3  8ec2             mov es, dx                               
  00b5  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  00ba  c1e802           shr ax, 2                                
  00bd  250300           and ax, 3                                
  00c0  0bc0             or ax, ax                                
  00c2  7509             jne 0xcd                                 
  00c4  8bde             mov bx, si                               
  00c6  d1e3             shl bx, 1                                
  00c8  8d46e8           lea ax, [bp - 0x18]                      
  00cb  eb2d             jmp 0xfa                                 
  00cd  8bc6             mov ax, si                               
  00cf  c1e003           shl ax, 3                                
  00d2  ba042c           mov dx, 0x2c04                           
  00d5  8ec2             mov es, dx                               
  00d7  2603061001       add ax, word ptr es:[0x110]              
  00dc  ba042c           mov dx, 0x2c04                           
  00df  8bd8             mov bx, ax                               
  00e1  8ec2             mov es, dx                               
  00e3  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  00e8  c1e802           shr ax, 2                                
  00eb  250300           and ax, 3                                
  00ee  3d0200           cmp ax, 2                                
  00f1  750e             jne 0x101                                
  00f3  8bde             mov bx, si                               
  00f5  d1e3             shl bx, 1                                
  00f7  8d46d8           lea ax, [bp - 0x28]                      
  00fa  03d8             add bx, ax                               
  00fc  36c7070100       mov word ptr ss:[bx], 1                  
  0101  8bc6             mov ax, si                               
  0103  4e               dec si                                   
  0104  0bc0             or ax, ax                                
  0106  7403             je 0x10b                                 
  0108  e946ff           jmp 0x51                                 
  010b  33ff             xor di, di                               
  010d  b8042c           mov ax, 0x2c04                           
  0110  8ec0             mov es, ax                               
  0112  268b0e7b15       mov cx, word ptr es:[0x157b]             
  0117  e90c01           jmp 0x226                                
  011a  8bd9             mov bx, cx                               
  011c  6bdb41           imul bx, bx, 0x41                        
  011f  b8042c           mov ax, 0x2c04                           
  0122  8ec0             mov es, ax                               
  0124  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0129  69dbe000         imul bx, bx, 0xe0                        
  012d  8bf1             mov si, cx                               
  012f  6bf641           imul si, si, 0x41                        
  0132  b8042c           mov ax, 0x2c04                           
  0135  8ec0             mov es, ax                               
  0137  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  013c  d1e0             shl ax, 1                                
  013e  03d8             add bx, ax                               
  0140  b81d1e           mov ax, 0x1e1d                           
  0143  8ec0             mov es, ax                               
  0145  268a9f0000       mov bl, byte ptr es:[bx]                 
  014a  81e3ff00         and bx, 0xff                             
  014e  b8042c           mov ax, 0x2c04                           
  0151  8ec0             mov es, ax                               
  0153  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0159  7501             jne 0x15c                                
  015b  47               inc di                                   
  015c  8bd9             mov bx, cx                               
  015e  6bdb41           imul bx, bx, 0x41                        
  0161  b8042c           mov ax, 0x2c04                           
  0164  8ec0             mov es, ax                               
  0166  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  016c  7503             jne 0x171                                
  016e  e9b500           jmp 0x226                                
  0171  8bd9             mov bx, cx                               
  0173  6bdb41           imul bx, bx, 0x41                        
  0176  b8042c           mov ax, 0x2c04                           
  0179  8ec0             mov es, ax                               
  017b  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0180  98               cwde                                     
  0181  d1e0             shl ax, 1                                
  0183  8bd8             mov bx, ax                               
  0185  ff87a040         inc word ptr [bx + 0x40a0]               
  0189  c41eee40         les bx, ptr [0x40ee]                     
  018d  03d9             add bx, cx                               
  018f  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  0194  b400             mov ah, 0                                
  0196  a90100           test ax, 1                               
  0199  7518             jne 0x1b3                                
  019b  8bd9             mov bx, cx                               
  019d  6bdb41           imul bx, bx, 0x41                        
  01a0  b8042c           mov ax, 0x2c04                           
  01a3  8ec0             mov es, ax                               
  01a5  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  01aa  98               cwde                                     
  01ab  d1e0             shl ax, 1                                
  01ad  8bd8             mov bx, ax                               
  01af  ff87b040         inc word ptr [bx + 0x40b0]               
  01b3  8bd9             mov bx, cx                               
  01b5  6bdb41           imul bx, bx, 0x41                        
  01b8  b8042c           mov ax, 0x2c04                           
  01bb  8ec0             mov es, ax                               
  01bd  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  01c2  98               cwde                                     
  01c3  ba042c           mov dx, 0x2c04                           
  01c6  8ec2             mov es, dx                               
  01c8  263b061001       cmp ax, word ptr es:[0x110]              
  01cd  7522             jne 0x1f1                                
  01cf  8bd9             mov bx, cx                               
  01d1  6bdb41           imul bx, bx, 0x41                        
  01d4  b8042c           mov ax, 0x2c04                           
  01d7  8ec0             mov es, ax                               
  01d9  2680bfac150f     cmp byte ptr es:[bx + 0x15ac], 0xf       
  01df  7445             je 0x226                                 
  01e1  8bd9             mov bx, cx                               
  01e3  6bdb41           imul bx, bx, 0x41                        
  01e6  8ec0             mov es, ax                               
  01e8  268a87ac15       mov al, byte ptr es:[bx + 0x15ac]        
  01ed  b400             mov ah, 0                                
  01ef  eb2d             jmp 0x21e                                
  01f1  8bd9             mov bx, cx                               
  01f3  6bdb41           imul bx, bx, 0x41                        
  01f6  b8042c           mov ax, 0x2c04                           
  01f9  8ec0             mov es, ax                               
  01fb  268a87ac15       mov al, byte ptr es:[bx + 0x15ac]        
  0200  b400             mov ah, 0                                
  0202  ba042c           mov dx, 0x2c04                           
  0205  8ec2             mov es, dx                               
  0207  263b061001       cmp ax, word ptr es:[0x110]              
  020c  7518             jne 0x226                                
  020e  8bd9             mov bx, cx                               
  0210  6bdb41           imul bx, bx, 0x41                        
  0213  b8042c           mov ax, 0x2c04                           
  0216  8ec0             mov es, ax                               
  0218  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  021d  98               cwde                                     
  021e  d1e0             shl ax, 1                                
  0220  8bd8             mov bx, ax                               
  0222  ff879040         inc word ptr [bx + 0x4090]               
  0226  8bc1             mov ax, cx                               
  0228  49               dec cx                                   
  0229  0bc0             or ax, ax                                
  022b  7403             je 0x230                                 
  022d  e9eafe           jmp 0x11a                                
  0230  be0800           mov si, 8                                
  0233  e99a00           jmp 0x2d0                                
  0236  b8042c           mov ax, 0x2c04                           
  0239  8ec0             mov es, ax                               
  023b  2639361001       cmp word ptr es:[0x110], si              
  0240  7503             jne 0x245                                
  0242  e98b00           jmp 0x2d0                                
  0245  8bde             mov bx, si                               
  0247  d1e3             shl bx, 1                                
  0249  b8042c           mov ax, 0x2c04                           
  024c  8ec0             mov es, ax                               
  024e  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0254  747a             je 0x2d0                                 
  0256  8bde             mov bx, si                               
  0258  d1e3             shl bx, 1                                
  025a  8d46e8           lea ax, [bp - 0x18]                      
  025d  03d8             add bx, ax                               
  025f  368b17           mov dx, word ptr ss:[bx]                 
  0262  8bde             mov bx, si                               
  0264  d1e3             shl bx, 1                                
  0266  8d46d8           lea ax, [bp - 0x28]                      
  0269  03d8             add bx, ax                               
  026b  362b17           sub dx, word ptr ss:[bx]                 
  026e  d1e2             shl dx, 1                                
  0270  8bde             mov bx, si                               
  0272  d1e3             shl bx, 1                                
  0274  8bc2             mov ax, dx                               
  0276  050400           add ax, 4                                
  0279  39879040         cmp word ptr [bx + 0x4090], ax           
  027d  7c22             jl 0x2a1                                 
  027f  b8042c           mov ax, 0x2c04                           
  0282  8ec0             mov es, ax                               
  0284  268b1e1001       mov bx, word ptr es:[0x110]              
  0289  c1e303           shl bx, 3                                
  028c  03de             add bx, si                               
  028e  b8042c           mov ax, 0x2c04                           
  0291  8ec0             mov es, ax                               
  0293  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  0299  26808f3b1504     or byte ptr es:[bx + 0x153b], 4          
  029f  eb2f             jmp 0x2d0                                
  02a1  8bde             mov bx, si                               
  02a3  d1e3             shl bx, 1                                
  02a5  8bc2             mov ax, dx                               
  02a7  050800           add ax, 8                                
  02aa  39879040         cmp word ptr [bx + 0x4090], ax           
  02ae  7c20             jl 0x2d0                                 
  02b0  b8042c           mov ax, 0x2c04                           
  02b3  8ec0             mov es, ax                               
  02b5  268b1e1001       mov bx, word ptr es:[0x110]              
  02ba  c1e303           shl bx, 3                                
  02bd  03de             add bx, si                               
  02bf  b8042c           mov ax, 0x2c04                           
  02c2  8ec0             mov es, ax                               
  02c4  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  02ca  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  02d0  8bc6             mov ax, si                               
  02d2  4e               dec si                                   
  02d3  0bc0             or ax, ax                                
  02d5  7403             je 0x2da                                 
  02d7  e95cff           jmp 0x236                                
  02da  be0800           mov si, 8                                
  02dd  e90001           jmp 0x3e0                                
  02e0  b8042c           mov ax, 0x2c04                           
  02e3  8ec0             mov es, ax                               
  02e5  2639361001       cmp word ptr es:[0x110], si              
  02ea  7503             jne 0x2ef                                
  02ec  e9f100           jmp 0x3e0                                
  02ef  8bde             mov bx, si                               
  02f1  d1e3             shl bx, 1                                
  02f3  b8042c           mov ax, 0x2c04                           
  02f6  8ec0             mov es, ax                               
  02f8  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  02fe  7503             jne 0x303                                
  0300  e9dd00           jmp 0x3e0                                
  0303  8bc6             mov ax, si                               
  0305  d1e0             shl ax, 1                                
  0307  c41eee40         les bx, ptr [0x40ee]                     
  030b  03d8             add bx, ax                               
  030d  268b8fec03       mov cx, word ptr es:[bx + 0x3ec]         
  0312  268b870c04       mov ax, word ptr es:[bx + 0x40c]         
  0317  c1e002           shl ax, 2                                
  031a  03c8             add cx, ax                               
  031c  268b87bc03       mov ax, word ptr es:[bx + 0x3bc]         
  0321  d1e0             shl ax, 1                                
  0323  03c8             add cx, ax                               
  0325  8bde             mov bx, si                               
  0327  d1e3             shl bx, 1                                
  0329  8d46e8           lea ax, [bp - 0x18]                      
  032c  03d8             add bx, ax                               
  032e  368b17           mov dx, word ptr ss:[bx]                 
  0331  8bde             mov bx, si                               
  0333  d1e3             shl bx, 1                                
  0335  8d46d8           lea ax, [bp - 0x28]                      
  0338  03d8             add bx, ax                               
  033a  362b17           sub dx, word ptr ss:[bx]                 
  033d  d1e2             shl dx, 1                                
  033f  8bc2             mov ax, dx                               
  0341  050500           add ax, 5                                
  0344  3bc1             cmp ax, cx                               
  0346  7f6f             jg 0x3b7                                 
  0348  b8042c           mov ax, 0x2c04                           
  034b  8ec0             mov es, ax                               
  034d  268b1e1001       mov bx, word ptr es:[0x110]              
  0352  c1e303           shl bx, 3                                
  0355  03de             add bx, si                               
  0357  b8042c           mov ax, 0x2c04                           
  035a  8ec0             mov es, ax                               
  035c  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0361  c1e802           shr ax, 2                                
  0364  250300           and ax, 3                                
  0367  3d0100           cmp ax, 1                                
  036a  7621             jbe 0x38d                                
  036c  b8042c           mov ax, 0x2c04                           
  036f  8ec0             mov es, ax                               
  0371  268b1e1001       mov bx, word ptr es:[0x110]              
  0376  c1e303           shl bx, 3                                
  0379  03de             add bx, si                               
  037b  b8042c           mov ax, 0x2c04                           
  037e  8ec0             mov es, ax                               
  0380  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0385  c1e802           shr ax, 2                                
  0388  250300           and ax, 3                                
  038b  eb03             jmp 0x390                                
  038d  b80100           mov ax, 1                                
  0390  250300           and ax, 3                                
  0393  ba042c           mov dx, 0x2c04                           
  0396  8ec2             mov es, dx                               
  0398  268b1e1001       mov bx, word ptr es:[0x110]              
  039d  c1e303           shl bx, 3                                
  03a0  03de             add bx, si                               
  03a2  ba042c           mov dx, 0x2c04                           
  03a5  8ec2             mov es, dx                               
  03a7  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  03ad  c0e002           shl al, 2                                
  03b0  2608873b15       or byte ptr es:[bx + 0x153b], al         
  03b5  eb29             jmp 0x3e0                                
  03b7  8bc2             mov ax, dx                               
  03b9  050a00           add ax, 0xa                              
  03bc  3bc1             cmp ax, cx                               
  03be  7f20             jg 0x3e0                                 
  03c0  b8042c           mov ax, 0x2c04                           
  03c3  8ec0             mov es, ax                               
  03c5  268b1e1001       mov bx, word ptr es:[0x110]              
  03ca  c1e303           shl bx, 3                                
  03cd  03de             add bx, si                               
  03cf  b8042c           mov ax, 0x2c04                           
  03d2  8ec0             mov es, ax                               
  03d4  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  03da  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  03e0  8bc6             mov ax, si                               
  03e2  4e               dec si                                   
  03e3  0bc0             or ax, ax                                
  03e5  7403             je 0x3ea                                 
  03e7  e9f6fe           jmp 0x2e0                                
  03ea  833e8e40ff       cmp word ptr [0x408e], -1                
  03ef  7422             je 0x413                                 
  03f1  b8042c           mov ax, 0x2c04                           
  03f4  8ec0             mov es, ax                               
  03f6  268b1e1001       mov bx, word ptr es:[0x110]              
  03fb  c1e303           shl bx, 3                                
  03fe  031e8e40         add bx, word ptr [0x408e]                
  0402  b8042c           mov ax, 0x2c04                           
  0405  8ec0             mov es, ax                               
  0407  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  040d  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  0413  be0400           mov si, 4                                
  0416  eb42             jmp 0x45a                                
  0418  8bc6             mov ax, si                               
  041a  6bc05c           imul ax, ax, 0x5c                        
  041d  c41eee40         les bx, ptr [0x40ee]                     
  0421  03d8             add bx, ax                               
  0423  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0429  742f             je 0x45a                                 
  042b  b8042c           mov ax, 0x2c04                           
  042e  8ec0             mov es, ax                               
  0430  26a11001         mov ax, word ptr es:[0x110]              
  0434  c1e003           shl ax, 3                                
  0437  8bd6             mov dx, si                               
  0439  6bd25c           imul dx, dx, 0x5c                        
  043c  c41eee40         les bx, ptr [0x40ee]                     
  0440  03da             add bx, dx                               
  0442  2603874e02       add ax, word ptr es:[bx + 0x24e]         
  0447  ba042c           mov dx, 0x2c04                           
  044a  8bd8             mov bx, ax                               
  044c  8ec2             mov es, dx                               
  044e  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  0454  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  045a  8bc6             mov ax, si                               
  045c  4e               dec si                                   
  045d  0bc0             or ax, ax                                
  045f  75b7             jne 0x418                                
  0461  c746fe0000       mov word ptr [bp - 2], 0                 
  0466  b9ffff           mov cx, 0xffff                           
  0469  be0800           mov si, 8                                
  046c  eb75             jmp 0x4e3                                
  046e  8bde             mov bx, si                               
  0470  d1e3             shl bx, 1                                
  0472  b8042c           mov ax, 0x2c04                           
  0475  8ec0             mov es, ax                               
  0477  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  047d  7464             je 0x4e3                                 
  047f  8bde             mov bx, si                               
  0481  d1e3             shl bx, 1                                
  0483  8b87a040         mov ax, word ptr [bx + 0x40a0]           
  0487  6bc064           imul ax, ax, 0x64                        
  048a  50               push ax                                  
  048b  83ff01           cmp di, 1                                
  048e  7d05             jge 0x495                                
  0490  b80100           mov ax, 1                                
  0493  eb02             jmp 0x497                                
  0495  8bc7             mov ax, di                               
  0497  8bd8             mov bx, ax                               
  0499  58               pop ax                                   
  049a  99               cdq                                      
  049b  f7fb             idiv bx                                  
  049d  8946fa           mov word ptr [bp - 6], ax                
  04a0  8bde             mov bx, si                               
  04a2  d1e3             shl bx, 1                                
  04a4  b8042c           mov ax, 0x2c04                           
  04a7  8ec0             mov es, ax                               
  04a9  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  04af  750a             jne 0x4bb                                
  04b1  c41eee40         les bx, ptr [0x40ee]                     
  04b5  268b4744         mov ax, word ptr es:[bx + 0x44]          
  04b9  eb03             jmp 0x4be                                
  04bb  b83200           mov ax, 0x32                             
  04be  8946f8           mov word ptr [bp - 8], ax                
  04c1  8bde             mov bx, si                               
  04c3  d1e3             shl bx, 1                                
  04c5  8b87a040         mov ax, word ptr [bx + 0x40a0]           
  04c9  3b46fe           cmp ax, word ptr [bp - 2]                
  04cc  7e15             jle 0x4e3                                
  04ce  8b46fa           mov ax, word ptr [bp - 6]                
  04d1  3b46f8           cmp ax, word ptr [bp - 8]                
  04d4  7e0d             jle 0x4e3                                
  04d6  8bde             mov bx, si                               
  04d8  d1e3             shl bx, 1                                
  04da  8b87a040         mov ax, word ptr [bx + 0x40a0]           
  04de  8946fe           mov word ptr [bp - 2], ax                
  04e1  8bce             mov cx, si                               
  04e3  8bc6             mov ax, si                               
  04e5  4e               dec si                                   
  04e6  0bc0             or ax, ax                                
  04e8  7584             jne 0x46e                                
  04ea  83f9ff           cmp cx, -1                               
  04ed  746f             je 0x55e                                 
  04ef  b8042c           mov ax, 0x2c04                           
  04f2  8ec0             mov es, ax                               
  04f4  26390e1001       cmp word ptr es:[0x110], cx              
  04f9  7463             je 0x55e                                 
  04fb  be0800           mov si, 8                                
  04fe  eb57             jmp 0x557                                
  0500  8bde             mov bx, si                               
  0502  d1e3             shl bx, 1                                
  0504  b8042c           mov ax, 0x2c04                           
  0507  8ec0             mov es, ax                               
  0509  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  050f  7446             je 0x557                                 
  0511  3bf1             cmp si, cx                               
  0513  7406             je 0x51b                                 
  0515  3b368e40         cmp si, word ptr [0x408e]                
  0519  7522             jne 0x53d                                
  051b  b8042c           mov ax, 0x2c04                           
  051e  8ec0             mov es, ax                               
  0520  268b1e1001       mov bx, word ptr es:[0x110]              
  0525  c1e303           shl bx, 3                                
  0528  03de             add bx, si                               
  052a  b8042c           mov ax, 0x2c04                           
  052d  8ec0             mov es, ax                               
  052f  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  0535  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  053b  eb1a             jmp 0x557                                
  053d  b8042c           mov ax, 0x2c04                           
  0540  8ec0             mov es, ax                               
  0542  268b1e1001       mov bx, word ptr es:[0x110]              
  0547  c1e303           shl bx, 3                                
  054a  03de             add bx, si                               
  054c  b8042c           mov ax, 0x2c04                           
  054f  8ec0             mov es, ax                               
  0551  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  0557  8bc6             mov ax, si                               
  0559  4e               dec si                                   
  055a  0bc0             or ax, ax                                
  055c  75a2             jne 0x500                                
  055e  837efc00         cmp word ptr [bp - 4], 0                 
  0562  7403             je 0x567                                 
  0564  e93801           jmp 0x69f                                
  0567  c41eee40         les bx, ptr [0x40ee]                     
  056b  26837f3800       cmp word ptr es:[bx + 0x38], 0           
  0570  7503             jne 0x575                                
  0572  e92a01           jmp 0x69f                                
  0575  33ff             xor di, di                               
  0577  be0800           mov si, 8                                
  057a  eb73             jmp 0x5ef                                
  057c  8bde             mov bx, si                               
  057e  d1e3             shl bx, 1                                
  0580  b8042c           mov ax, 0x2c04                           
  0583  8ec0             mov es, ax                               
  0585  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  058b  7462             je 0x5ef                                 
  058d  8bde             mov bx, si                               
  058f  d1e3             shl bx, 1                                
  0591  b8042c           mov ax, 0x2c04                           
  0594  8ec0             mov es, ax                               
  0596  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  059c  7451             je 0x5ef                                 
  059e  b8042c           mov ax, 0x2c04                           
  05a1  8ec0             mov es, ax                               
  05a3  2639361001       cmp word ptr es:[0x110], si              
  05a8  7445             je 0x5ef                                 
  05aa  8ec0             mov es, ax                               
  05ac  268b1e1001       mov bx, word ptr es:[0x110]              
  05b1  c1e303           shl bx, 3                                
  05b4  03de             add bx, si                               
  05b6  b8042c           mov ax, 0x2c04                           
  05b9  8ec0             mov es, ax                               
  05bb  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  05c0  c1e802           shr ax, 2                                
  05c3  250300           and ax, 3                                
  05c6  0bc0             or ax, ax                                
  05c8  7425             je 0x5ef                                 
  05ca  56               push si                                  
  05cb  90               nop                                      
  05cc  0e               push cs                                  
  05cd  e89e04           call 0xa6e                               
  05d0  59               pop cx                                   
  05d1  0bc0             or ax, ax                                
  05d3  741a             je 0x5ef                                 
  05d5  b8042c           mov ax, 0x2c04                           
  05d8  8ec0             mov es, ax                               
  05da  268b1e1001       mov bx, word ptr es:[0x110]              
  05df  c1e303           shl bx, 3                                
  05e2  03de             add bx, si                               
  05e4  b8042c           mov ax, 0x2c04                           
  05e7  8ec0             mov es, ax                               
  05e9  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  05ef  8bc6             mov ax, si                               
  05f1  4e               dec si                                   
  05f2  0bc0             or ax, ax                                
  05f4  7586             jne 0x57c                                
  05f6  be0800           mov si, 8                                
  05f9  eb46             jmp 0x641                                
  05fb  8bde             mov bx, si                               
  05fd  d1e3             shl bx, 1                                
  05ff  b8042c           mov ax, 0x2c04                           
  0602  8ec0             mov es, ax                               
  0604  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  060a  7435             je 0x641                                 
  060c  8bde             mov bx, si                               
  060e  d1e3             shl bx, 1                                
  0610  b8042c           mov ax, 0x2c04                           
  0613  8ec0             mov es, ax                               
  0615  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  061b  7424             je 0x641                                 
  061d  b8042c           mov ax, 0x2c04                           
  0620  8ec0             mov es, ax                               
  0622  268b1e1001       mov bx, word ptr es:[0x110]              
  0627  c1e303           shl bx, 3                                
  062a  03de             add bx, si                               
  062c  b8042c           mov ax, 0x2c04                           
  062f  8ec0             mov es, ax                               
  0631  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0636  250300           and ax, 3                                
  0639  3d0200           cmp ax, 2                                
  063c  7503             jne 0x641                                
  063e  bf0100           mov di, 1                                
  0641  8bc6             mov ax, si                               
  0643  4e               dec si                                   
  0644  0bc0             or ax, ax                                
  0646  75b3             jne 0x5fb                                
  0648  0bff             or di, di                                
  064a  7453             je 0x69f                                 
  064c  be0800           mov si, 8                                
  064f  eb47             jmp 0x698                                
  0651  8bde             mov bx, si                               
  0653  d1e3             shl bx, 1                                
  0655  b8042c           mov ax, 0x2c04                           
  0658  8ec0             mov es, ax                               
  065a  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0660  7436             je 0x698                                 
  0662  8bde             mov bx, si                               
  0664  d1e3             shl bx, 1                                
  0666  b8042c           mov ax, 0x2c04                           
  0669  8ec0             mov es, ax                               
  066b  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  0671  7525             jne 0x698                                
  0673  8bde             mov bx, si                               
  0675  d1e3             shl bx, 1                                
  0677  83bff24000       cmp word ptr [bx + 0x40f2], 0            
  067c  741a             je 0x698                                 
  067e  b8042c           mov ax, 0x2c04                           
  0681  8ec0             mov es, ax                               
  0683  268b1e1001       mov bx, word ptr es:[0x110]              
  0688  c1e303           shl bx, 3                                
  068b  03de             add bx, si                               
  068d  b8042c           mov ax, 0x2c04                           
  0690  8ec0             mov es, ax                               
  0692  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  0698  8bc6             mov ax, si                               
  069a  4e               dec si                                   
  069b  0bc0             or ax, ax                                
  069d  75b2             jne 0x651                                
  069f  837efc00         cmp word ptr [bp - 4], 0                 
  06a3  7403             je 0x6a8                                 
  06a5  e91801           jmp 0x7c0                                
  06a8  b8042c           mov ax, 0x2c04                           
  06ab  8ec0             mov es, ax                               
  06ad  26833e160100     cmp word ptr es:[0x116], 0               
  06b3  7503             jne 0x6b8                                
  06b5  e90801           jmp 0x7c0                                
  06b8  ba0800           mov dx, 8                                
  06bb  eb0e             jmp 0x6cb                                
  06bd  8bda             mov bx, dx                               
  06bf  d1e3             shl bx, 1                                
  06c1  8d46c8           lea ax, [bp - 0x38]                      
  06c4  03d8             add bx, ax                               
  06c6  36c7070000       mov word ptr ss:[bx], 0                  
  06cb  8bc2             mov ax, dx                               
  06cd  4a               dec dx                                   
  06ce  0bc0             or ax, ax                                
  06d0  75eb             jne 0x6bd                                
  06d2  be0800           mov si, 8                                
  06d5  eb77             jmp 0x74e                                
  06d7  8bde             mov bx, si                               
  06d9  d1e3             shl bx, 1                                
  06db  b8042c           mov ax, 0x2c04                           
  06de  8ec0             mov es, ax                               
  06e0  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  06e6  7466             je 0x74e                                 
  06e8  8bde             mov bx, si                               
  06ea  d1e3             shl bx, 1                                
  06ec  b8042c           mov ax, 0x2c04                           
  06ef  8ec0             mov es, ax                               
  06f1  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  06f7  7455             je 0x74e                                 
  06f9  ba0800           mov dx, 8                                
  06fc  eb49             jmp 0x747                                
  06fe  8bda             mov bx, dx                               
  0700  d1e3             shl bx, 1                                
  0702  b8042c           mov ax, 0x2c04                           
  0705  8ec0             mov es, ax                               
  0707  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  070d  7438             je 0x747                                 
  070f  8bda             mov bx, dx                               
  0711  d1e3             shl bx, 1                                
  0713  b8042c           mov ax, 0x2c04                           
  0716  8ec0             mov es, ax                               
  0718  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  071e  7427             je 0x747                                 
  0720  8bde             mov bx, si                               
  0722  c1e303           shl bx, 3                                
  0725  03da             add bx, dx                               
  0727  b8042c           mov ax, 0x2c04                           
  072a  8ec0             mov es, ax                               
  072c  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0731  250300           and ax, 3                                
  0734  3d0200           cmp ax, 2                                
  0737  750e             jne 0x747                                
  0739  8bde             mov bx, si                               
  073b  d1e3             shl bx, 1                                
  073d  8d46c8           lea ax, [bp - 0x38]                      
  0740  03d8             add bx, ax                               
  0742  36c7070100       mov word ptr ss:[bx], 1                  
  0747  8bc2             mov ax, dx                               
  0749  4a               dec dx                                   
  074a  0bc0             or ax, ax                                
  074c  75b0             jne 0x6fe                                
  074e  8bc6             mov ax, si                               
  0750  4e               dec si                                   
  0751  0bc0             or ax, ax                                
  0753  7582             jne 0x6d7                                
  0755  be0800           mov si, 8                                
  0758  eb5f             jmp 0x7b9                                
  075a  8bde             mov bx, si                               
  075c  d1e3             shl bx, 1                                
  075e  b8042c           mov ax, 0x2c04                           
  0761  8ec0             mov es, ax                               
  0763  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0769  744e             je 0x7b9                                 
  076b  8bde             mov bx, si                               
  076d  d1e3             shl bx, 1                                
  076f  b8042c           mov ax, 0x2c04                           
  0772  8ec0             mov es, ax                               
  0774  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  077a  743d             je 0x7b9                                 
  077c  b8042c           mov ax, 0x2c04                           
  077f  8ec0             mov es, ax                               
  0781  268b1e1001       mov bx, word ptr es:[0x110]              
  0786  d1e3             shl bx, 1                                
  0788  8d46c8           lea ax, [bp - 0x38]                      
  078b  03d8             add bx, ax                               
  078d  36833f00         cmp word ptr ss:[bx], 0                  
  0791  750c             jne 0x79f                                
  0793  8bde             mov bx, si                               
  0795  d1e3             shl bx, 1                                
  0797  03d8             add bx, ax                               
  0799  36833f00         cmp word ptr ss:[bx], 0                  
  079d  741a             je 0x7b9                                 
  079f  b8042c           mov ax, 0x2c04                           
  07a2  8ec0             mov es, ax                               
  07a4  268b1e1001       mov bx, word ptr es:[0x110]              
  07a9  c1e303           shl bx, 3                                
  07ac  03de             add bx, si                               
  07ae  b8042c           mov ax, 0x2c04                           
  07b1  8ec0             mov es, ax                               
  07b3  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  07b9  8bc6             mov ax, si                               
  07bb  4e               dec si                                   
  07bc  0bc0             or ax, ax                                
  07be  759a             jne 0x75a                                
  07c0  be0800           mov si, 8                                
  07c3  eb25             jmp 0x7ea                                
  07c5  8bde             mov bx, si                               
  07c7  d1e3             shl bx, 1                                
  07c9  83bfb04000       cmp word ptr [bx + 0x40b0], 0            
  07ce  751a             jne 0x7ea                                
  07d0  b8042c           mov ax, 0x2c04                           
  07d3  8ec0             mov es, ax                               
  07d5  268b1e1001       mov bx, word ptr es:[0x110]              
  07da  c1e303           shl bx, 3                                
  07dd  03de             add bx, si                               
  07df  b8042c           mov ax, 0x2c04                           
  07e2  8ec0             mov es, ax                               
  07e4  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  07ea  8bc6             mov ax, si                               
  07ec  4e               dec si                                   
  07ed  0bc0             or ax, ax                                
  07ef  75d4             jne 0x7c5                                
  07f1  be0400           mov si, 4                                
  07f4  eb50             jmp 0x846                                
  07f6  8bc6             mov ax, si                               
  07f8  6bc05c           imul ax, ax, 0x5c                        
  07fb  c41eee40         les bx, ptr [0x40ee]                     
  07ff  03d8             add bx, ax                               
  0801  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0807  743d             je 0x846                                 
  0809  b8042c           mov ax, 0x2c04                           
  080c  8ec0             mov es, ax                               
  080e  26a11001         mov ax, word ptr es:[0x110]              
  0812  c1e003           shl ax, 3                                
  0815  8bd6             mov dx, si                               
  0817  6bd25c           imul dx, dx, 0x5c                        
  081a  c41eee40         les bx, ptr [0x40ee]                     
  081e  03da             add bx, dx                               
  0820  2603874e02       add ax, word ptr es:[bx + 0x24e]         
  0825  ba042c           mov dx, 0x2c04                           
  0828  8bd8             mov bx, ax                               
  082a  8ec2             mov es, dx                               
  082c  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0831  c1e802           shr ax, 2                                
  0834  250300           and ax, 3                                
  0837  0bc0             or ax, ax                                
  0839  750b             jne 0x846                                
  083b  6a14             push 0x14                                
  083d  56               push si                                  
  083e  9a2500b52f       lcall 0x2fb5, 0x25                       -> ovl19:066d
  0843  83c404           add sp, 4                                
  0846  8bc6             mov ax, si                               
  0848  4e               dec si                                   
  0849  0bc0             or ax, ax                                
  084b  75a9             jne 0x7f6                                
  084d  5f               pop di                                   
  084e  5e               pop si                                   
  084f  c9               leave                                    
  0850  cb               retf                                     

ovl18_0851:  ; ENTRY
  0851  55               push bp                                  
  0852  8bec             mov bp, sp                               
  0854  83ec02           sub sp, 2                                
  0857  56               push si                                  
  0858  33c9             xor cx, cx                               
  085a  8b5e06           mov bx, word ptr [bp + 6]                
  085d  6bdb41           imul bx, bx, 0x41                        
  0860  b8042c           mov ax, 0x2c04                           
  0863  8ec0             mov es, ax                               
  0865  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  086a  98               cwde                                     
  086b  8bf0             mov si, ax                               
  086d  83fe0f           cmp si, 0xf                              
  0870  7506             jne 0x878                                
  0872  b80100           mov ax, 1                                
  0875  e99c00           jmp 0x914                                
  0878  ba0800           mov dx, 8                                
  087b  eb36             jmp 0x8b3                                
  087d  8bda             mov bx, dx                               
  087f  d1e3             shl bx, 1                                
  0881  b8042c           mov ax, 0x2c04                           
  0884  8ec0             mov es, ax                               
  0886  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  088c  7425             je 0x8b3                                 
  088e  b8042c           mov ax, 0x2c04                           
  0891  8ec0             mov es, ax                               
  0893  268b1e1001       mov bx, word ptr es:[0x110]              
  0898  c1e303           shl bx, 3                                
  089b  03da             add bx, dx                               
  089d  b8042c           mov ax, 0x2c04                           
  08a0  8ec0             mov es, ax                               
  08a2  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  08a7  250300           and ax, 3                                
  08aa  3d0200           cmp ax, 2                                
  08ad  7504             jne 0x8b3                                
  08af  8956fe           mov word ptr [bp - 2], dx                
  08b2  41               inc cx                                   
  08b3  8bc2             mov ax, dx                               
  08b5  4a               dec dx                                   
  08b6  0bc0             or ax, ax                                
  08b8  75c3             jne 0x87d                                
  08ba  b8042c           mov ax, 0x2c04                           
  08bd  8ec0             mov es, ax                               
  08bf  268b1e1001       mov bx, word ptr es:[0x110]              
  08c4  c1e303           shl bx, 3                                
  08c7  03de             add bx, si                               
  08c9  b8042c           mov ax, 0x2c04                           
  08cc  8ec0             mov es, ax                               
  08ce  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  08d3  250300           and ax, 3                                
  08d6  0bc0             or ax, ax                                
  08d8  741b             je 0x8f5                                 
  08da  3d0100           cmp ax, 1                                
  08dd  7407             je 0x8e6                                 
  08df  3d0200           cmp ax, 2                                
  08e2  752e             jne 0x912                                
  08e4  eb8c             jmp 0x872                                
  08e6  c41eee40         les bx, ptr [0x40ee]                     
  08ea  26f7470c0100     test word ptr es:[bx + 0xc], 1           
  08f0  7420             je 0x912                                 
  08f2  e97dff           jmp 0x872                                
  08f5  0bc9             or cx, cx                                
  08f7  740a             je 0x903                                 
  08f9  83f901           cmp cx, 1                                
  08fc  7514             jne 0x912                                
  08fe  3976fe           cmp word ptr [bp - 2], si                
  0901  750f             jne 0x912                                
  0903  c41eee40         les bx, ptr [0x40ee]                     
  0907  26f7470c0100     test word ptr es:[bx + 0xc], 1           
  090d  7403             je 0x912                                 
  090f  e960ff           jmp 0x872                                
  0912  33c0             xor ax, ax                               
  0914  5e               pop si                                   
  0915  c9               leave                                    
  0916  cb               retf                                     

ovl18_0917:  ; ENTRY
  0917  55               push bp                                  
  0918  8bec             mov bp, sp                               
  091a  83ec06           sub sp, 6                                
  091d  56               push si                                  
  091e  57               push di                                  
  091f  c746feffff       mov word ptr [bp - 2], 0xffff            
  0924  c746fc1027       mov word ptr [bp - 4], 0x2710            
  0929  b8042c           mov ax, 0x2c04                           
  092c  8ec0             mov es, ax                               
  092e  268b1e1001       mov bx, word ptr es:[0x110]              
  0933  6bdb14           imul bx, bx, 0x14                        
  0936  b8042c           mov ax, 0x2c04                           
  0939  8ec0             mov es, ax                               
  093b  26ffb79501       push word ptr es:[bx + 0x195]            
  0940  b8042c           mov ax, 0x2c04                           
  0943  8ec0             mov es, ax                               
  0945  268b1e1001       mov bx, word ptr es:[0x110]              
  094a  6bdb14           imul bx, bx, 0x14                        
  094d  b8042c           mov ax, 0x2c04                           
  0950  8ec0             mov es, ax                               
  0952  26ffb79301       push word ptr es:[bx + 0x193]            
  0957  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  095c  83c404           add sp, 4                                
  095f  8946fa           mov word ptr [bp - 6], ax                
  0962  b8042c           mov ax, 0x2c04                           
  0965  8ec0             mov es, ax                               
  0967  268b3e7b15       mov di, word ptr es:[0x157b]             
  096c  e9d100           jmp 0xa40                                
  096f  8bdf             mov bx, di                               
  0971  6bdb41           imul bx, bx, 0x41                        
  0974  b8042c           mov ax, 0x2c04                           
  0977  8ec0             mov es, ax                               
  0979  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  097e  69dbe000         imul bx, bx, 0xe0                        
  0982  8bf7             mov si, di                               
  0984  6bf641           imul si, si, 0x41                        
  0987  b8042c           mov ax, 0x2c04                           
  098a  8ec0             mov es, ax                               
  098c  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0991  d1e0             shl ax, 1                                
  0993  03d8             add bx, ax                               
  0995  b81d1e           mov ax, 0x1e1d                           
  0998  8ec0             mov es, ax                               
  099a  268a9f0000       mov bl, byte ptr es:[bx]                 
  099f  81e3ff00         and bx, 0xff                             
  09a3  b8042c           mov ax, 0x2c04                           
  09a6  8ec0             mov es, ax                               
  09a8  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  09ae  7403             je 0x9b3                                 
  09b0  e98d00           jmp 0xa40                                
  09b3  8bdf             mov bx, di                               
  09b5  6bdb41           imul bx, bx, 0x41                        
  09b8  b8042c           mov ax, 0x2c04                           
  09bb  8ec0             mov es, ax                               
  09bd  268a87ac15       mov al, byte ptr es:[bx + 0x15ac]        
  09c2  b400             mov ah, 0                                
  09c4  8bc8             mov cx, ax                               
  09c6  ba042c           mov dx, 0x2c04                           
  09c9  8ec2             mov es, dx                               
  09cb  263b061001       cmp ax, word ptr es:[0x110]              
  09d0  746e             je 0xa40                                 
  09d2  83f90f           cmp cx, 0xf                              
  09d5  7411             je 0x9e8                                 
  09d7  8bd9             mov bx, cx                               
  09d9  d1e3             shl bx, 1                                
  09db  b8042c           mov ax, 0x2c04                           
  09de  8ec0             mov es, ax                               
  09e0  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  09e6  7558             jne 0xa40                                
  09e8  8b5efa           mov bx, word ptr [bp - 6]                
  09eb  6bdb41           imul bx, bx, 0x41                        
  09ee  b8042c           mov ax, 0x2c04                           
  09f1  8ec0             mov es, ax                               
  09f3  26ffb77f15       push word ptr es:[bx + 0x157f]           
  09f8  8b5efa           mov bx, word ptr [bp - 6]                
  09fb  6bdb41           imul bx, bx, 0x41                        
  09fe  b8042c           mov ax, 0x2c04                           
  0a01  8ec0             mov es, ax                               
  0a03  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0a08  8bdf             mov bx, di                               
  0a0a  6bdb41           imul bx, bx, 0x41                        
  0a0d  b8042c           mov ax, 0x2c04                           
  0a10  8ec0             mov es, ax                               
  0a12  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0a17  8bdf             mov bx, di                               
  0a19  6bdb41           imul bx, bx, 0x41                        
  0a1c  b8042c           mov ax, 0x2c04                           
  0a1f  8ec0             mov es, ax                               
  0a21  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0a26  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0a2b  83c408           add sp, 8                                
  0a2e  8bd0             mov dx, ax                               
  0a30  83fa28           cmp dx, 0x28                             
  0a33  7d0b             jge 0xa40                                
  0a35  3b56fc           cmp dx, word ptr [bp - 4]                
  0a38  7d06             jge 0xa40                                
  0a3a  8956fc           mov word ptr [bp - 4], dx                
  0a3d  897efe           mov word ptr [bp - 2], di                
  0a40  8bc7             mov ax, di                               
  0a42  4f               dec di                                   
  0a43  0bc0             or ax, ax                                
  0a45  7403             je 0xa4a                                 
  0a47  e925ff           jmp 0x96f                                
  0a4a  837efeff         cmp word ptr [bp - 2], -1                
  0a4e  741a             je 0xa6a                                 
  0a50  8b5efe           mov bx, word ptr [bp - 2]                
  0a53  6bdb41           imul bx, bx, 0x41                        
  0a56  b8042c           mov ax, 0x2c04                           
  0a59  ba042c           mov dx, 0x2c04                           
  0a5c  8ec2             mov es, dx                               
  0a5e  268a161001       mov dl, byte ptr es:[0x110]              
  0a63  8ec0             mov es, ax                               
  0a65  268897ac15       mov byte ptr es:[bx + 0x15ac], dl        
  0a6a  5f               pop di                                   
  0a6b  5e               pop si                                   
  0a6c  c9               leave                                    
  0a6d  cb               retf                                     

ovl18_0a6e:  ; ENTRY
  0a6e  55               push bp                                  
  0a6f  8bec             mov bp, sp                               
  0a71  33c9             xor cx, cx                               
  0a73  b8042c           mov ax, 0x2c04                           
  0a76  8ec0             mov es, ax                               
  0a78  26833e1c0100     cmp word ptr es:[0x11c], 0               
  0a7e  747a             je 0xafa                                 
  0a80  c41eee40         les bx, ptr [0x40ee]                     
  0a84  26837f3800       cmp word ptr es:[bx + 0x38], 0           
  0a89  746f             je 0xafa                                 
  0a8b  b8042c           mov ax, 0x2c04                           
  0a8e  8ec0             mov es, ax                               
  0a90  268b1e1001       mov bx, word ptr es:[0x110]              
  0a95  d1e3             shl bx, 1                                
  0a97  b8042c           mov ax, 0x2c04                           
  0a9a  8ec0             mov es, ax                               
  0a9c  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0aa2  7456             je 0xafa                                 
  0aa4  ba0800           mov dx, 8                                
  0aa7  eb4a             jmp 0xaf3                                
  0aa9  8bda             mov bx, dx                               
  0aab  d1e3             shl bx, 1                                
  0aad  b8042c           mov ax, 0x2c04                           
  0ab0  8ec0             mov es, ax                               
  0ab2  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0ab8  7439             je 0xaf3                                 
  0aba  8bda             mov bx, dx                               
  0abc  d1e3             shl bx, 1                                
  0abe  b8042c           mov ax, 0x2c04                           
  0ac1  8ec0             mov es, ax                               
  0ac3  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0ac9  7528             jne 0xaf3                                
  0acb  8b5e06           mov bx, word ptr [bp + 6]                
  0ace  c1e303           shl bx, 3                                
  0ad1  03da             add bx, dx                               
  0ad3  b8042c           mov ax, 0x2c04                           
  0ad6  8ec0             mov es, ax                               
  0ad8  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0add  250300           and ax, 3                                
  0ae0  3d0200           cmp ax, 2                                
  0ae3  750e             jne 0xaf3                                
  0ae5  8bda             mov bx, dx                               
  0ae7  d1e3             shl bx, 1                                
  0ae9  83bff24000       cmp word ptr [bx + 0x40f2], 0            
  0aee  7403             je 0xaf3                                 
  0af0  b90100           mov cx, 1                                
  0af3  8bc2             mov ax, dx                               
  0af5  4a               dec dx                                   
  0af6  0bc0             or ax, ax                                
  0af8  75af             jne 0xaa9                                
  0afa  8bc1             mov ax, cx                               
  0afc  5d               pop bp                                   
  0afd  cb               retf                                     
