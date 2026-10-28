; res_0d28 file_off 0xf280

res_0d28_000e:  ; ENTRY
  000e  55               push bp                                  
  000f  8bec             mov bp, sp                               
  0011  06               push es                                  
  0012  56               push si                                  
  0013  57               push di                                  
  0014  be8a32           mov si, 0x328a                           
  0017  c70688329232     mov word ptr [0x3288], 0x3292            
  001d  bf0a00           mov di, 0xa                              
  0020  8b1b             mov bx, word ptr [bp + di]               
  0022  83fbff           cmp bx, -1                               
  0025  7438             je 0x5f                                  
  0027  837e0800         cmp word ptr [bp + 8], 0                 
  002b  7432             je 0x5f                                  
  002d  d1e3             shl bx, 1                                
  002f  8b18             mov bx, word ptr [bx + si]               
  0031  ff5708           call word ptr [bx + 8]                   
  0034  7224             jb 0x5a                                  
  0036  b80100           mov ax, 1                                
  0039  8b5608           mov dx, word ptr [bp + 8]                
  003c  ff5704           call word ptr [bx + 4]                   
  003f  7219             jb 0x5a                                  
  0041  8b470c           mov ax, word ptr [bx + 0xc]              
  0044  b105             mov cl, 5                                
  0046  d3e8             shr ax, cl                               
  0048  294608           sub word ptr [bp + 8], ax                
  004b  8bc3             mov ax, bx                               
  004d  8b1e8832         mov bx, word ptr [0x3288]                
  0051  8907             mov word ptr [bx], ax                    
  0053  83c302           add bx, 2                                
  0056  891e8832         mov word ptr [0x3288], bx                
  005a  83c702           add di, 2                                
  005d  ebc1             jmp 0x20                                 
  005f  bbffff           mov bx, 0xffff                           
  0062  b448             mov ah, 0x48                             
  0064  cd21             int 0x21                                 
  0066  2b1e8232         sub bx, word ptr [0x3282]                
  006a  8bd3             mov dx, bx                               
  006c  b448             mov ah, 0x48                             
  006e  cd21             int 0x21                                 
  0070  a37432           mov word ptr [0x3274], ax                
  0073  03c2             add ax, dx                               
  0075  a37e32           mov word ptr [0x327e], ax                
  0078  52               push dx                                  
  0079  8b4606           mov ax, word ptr [bp + 6]                
  007c  bb0500           mov bx, 5                                
  007f  f7e3             mul bx                                   
  0081  5a               pop dx                                   
  0082  0d0f00           or ax, 0xf                               
  0085  40               inc ax                                   
  0086  8bd8             mov bx, ax                               
  0088  b104             mov cl, 4                                
  008a  d3e8             shr ax, cl                               
  008c  50               push ax                                  
  008d  03067432         add ax, word ptr [0x3274]                
  0091  bb9232           mov bx, 0x3292                           
  0094  8b37             mov si, word ptr [bx]                    
  0096  83fe00           cmp si, 0                                
  0099  7408             je 0xa3                                  
  009b  e8eb0a           call 0xb89                               
  009e  83c302           add bx, 2                                
  00a1  ebf1             jmp 0x94                                 
  00a3  40               inc ax                                   
  00a4  a37a32           mov word ptr [0x327a], ax                
  00a7  a37c32           mov word ptr [0x327c], ax                
  00aa  8ec0             mov es, ax                               
  00ac  e8dd05           call 0x68c                               
  00af  8b167e32         mov dx, word ptr [0x327e]                
  00b3  2bd0             sub dx, ax                               
  00b5  2689160200       mov word ptr es:[2], dx                  
  00ba  59               pop cx                                   
  00bb  d1e1             shl cx, 1                                
  00bd  d1e1             shl cx, 1                                
  00bf  d1e1             shl cx, 1                                
  00c1  a17432           mov ax, word ptr [0x3274]                
  00c4  8ec0             mov es, ax                               
  00c6  33ff             xor di, di                               
  00c8  33c0             xor ax, ax                               
  00ca  f3ab             rep stosw word ptr es:[di], ax           
  00cc  52               push dx                                  
  00cd  33d2             xor dx, dx                               
  00cf  8bc7             mov ax, di                               
  00d1  b90500           mov cx, 5                                
  00d4  f7f1             div cx                                   
  00d6  2bfa             sub di, dx                               
  00d8  893e7832         mov word ptr [0x3278], di                
  00dc  33ff             xor di, di                               
  00de  5a               pop dx                                   
  00df  26c64504a0       mov byte ptr es:[di + 4], 0xa0           
  00e4  8bc2             mov ax, dx                               
  00e6  48               dec ax                                   
  00e7  bb1000           mov bx, 0x10                             
  00ea  f7e3             mul bx                                   
  00ec  5f               pop di                                   
  00ed  5e               pop si                                   
  00ee  07               pop es                                   
  00ef  8be5             mov sp, bp                               
  00f1  5d               pop bp                                   
  00f2  cb               retf                                     

res_0d28_00f3:  ; ENTRY
  00f3  55               push bp                                  
  00f4  8bec             mov bp, sp                               
  00f6  06               push es                                  
  00f7  a17432           mov ax, word ptr [0x3274]                
  00fa  8ec0             mov es, ax                               
  00fc  b449             mov ah, 0x49                             
  00fe  cd21             int 0x21                                 
  0100  bb9232           mov bx, 0x3292                           
  0103  8b37             mov si, word ptr [bx]                    
  0105  83fe00           cmp si, 0                                
  0108  740a             je 0x114                                 
  010a  53               push bx                                  
  010b  ff5406           call word ptr [si + 6]                   
  010e  5b               pop bx                                   
  010f  83c302           add bx, 2                                
  0112  ebef             jmp 0x103                                
  0114  c70674320000     mov word ptr [0x3274], 0                 
  011a  07               pop es                                   
  011b  8be5             mov sp, bp                               
  011d  5d               pop bp                                   
  011e  cb               retf                                     

res_0d28_011f:  ; ENTRY
  011f  55               push bp                                  
  0120  8bec             mov bp, sp                               
  0122  06               push es                                  
  0123  56               push si                                  
  0124  57               push di                                  
  0125  a17432           mov ax, word ptr [0x3274]                
  0128  8ec0             mov es, ax                               
  012a  8b3e7632         mov di, word ptr [0x3276]                
  012e  8bcf             mov cx, di                               
  0130  26f6450480       test byte ptr es:[di + 4], 0x80          
  0135  7433             je 0x16a                                 
  0137  83c705           add di, 5                                
  013a  3b3e7832         cmp di, word ptr [0x3278]                
  013e  7202             jb 0x142                                 
  0140  33ff             xor di, di                               
  0142  3bf9             cmp di, cx                               
  0144  75ea             jne 0x130                                
  0146  33c0             xor ax, ax                               
  0148  c70680320100     mov word ptr [0x3280], 1                 
  014e  a18432           mov ax, word ptr [0x3284]                
  0151  0b068632         or ax, word ptr [0x3286]                 
  0155  740c             je 0x163                                 
  0157  c4560c           les dx, ptr [bp + 0xc]                   
  015a  06               push es                                  
  015b  52               push dx                                  
  015c  ff1e8432         lcall [0x3284]                           
  0160  83c404           add sp, 4                                
  0163  33c0             xor ax, ax                               
  0165  33d2             xor dx, dx                               
  0167  eb65             jmp 0x1ce                                
  0169  90               nop                                      
  016a  893e7632         mov word ptr [0x3276], di                
  016e  57               push di                                  
  016f  c44606           les ax, ptr [bp + 6]                     
  0172  8cc2             mov dx, es                               
  0174  8bd8             mov bx, ax                               
  0176  d1ea             shr dx, 1                                
  0178  d1d8             rcr ax, 1                                
  017a  d1ea             shr dx, 1                                
  017c  d1d8             rcr ax, 1                                
  017e  d1ea             shr dx, 1                                
  0180  d1d8             rcr ax, 1                                
  0182  d1ea             shr dx, 1                                
  0184  d1d8             rcr ax, 1                                
  0186  83fa00           cmp dx, 0                                
  0189  75c3             jne 0x14e                                
  018b  83e30f           and bx, 0xf                              
  018e  7403             je 0x193                                 
  0190  40               inc ax                                   
  0191  72bb             jb 0x14e                                 
  0193  40               inc ax                                   
  0194  72b8             jb 0x14e                                 
  0196  e8ab00           call 0x244                               
  0199  7503             jne 0x19e                                
  019b  5f               pop di                                   
  019c  ebb0             jmp 0x14e                                
  019e  5f               pop di                                   
  019f  26893e0400       mov word ptr es:[4], di                  
  01a4  8cc2             mov dx, es                               
  01a6  8b0e7432         mov cx, word ptr [0x3274]                
  01aa  8a460a           mov al, byte ptr [bp + 0xa]              
  01ad  2608060800       or byte ptr es:[8], al                   
  01b2  8ec1             mov es, cx                               
  01b4  26c7050000       mov word ptr es:[di], 0                  
  01b9  42               inc dx                                   
  01ba  26895502         mov word ptr es:[di + 2], dx             
  01be  8a460a           mov al, byte ptr [bp + 0xa]              
  01c1  26884504         mov byte ptr es:[di + 4], al             
  01c5  26804d0480       or byte ptr es:[di + 4], 0x80            
  01ca  8cc2             mov dx, es                               
  01cc  8bc7             mov ax, di                               
  01ce  5f               pop di                                   
  01cf  5e               pop si                                   
  01d0  07               pop es                                   
  01d1  8be5             mov sp, bp                               
  01d3  5d               pop bp                                   
  01d4  cb               retf                                     

res_0d28_01d5:  ; ENTRY
  01d5  55               push bp                                  
  01d6  8bec             mov bp, sp                               
  01d8  06               push es                                  
  01d9  56               push si                                  
  01da  57               push di                                  
  01db  8b4606           mov ax, word ptr [bp + 6]                
  01de  3d0000           cmp ax, 0                                
  01e1  7505             jne 0x1e8                                
  01e3  8bd0             mov dx, ax                               
  01e5  eb38             jmp 0x21f                                
  01e7  90               nop                                      
  01e8  8bd8             mov bx, ax                               
  01ea  b104             mov cl, 4                                
  01ec  d3e8             shr ax, cl                               
  01ee  83e30f           and bx, 0xf                              
  01f1  7401             je 0x1f4                                 
  01f3  40               inc ax                                   
  01f4  40               inc ax                                   
  01f5  833e743200       cmp word ptr [0x3274], 0                 
  01fa  742a             je 0x226                                 
  01fc  e84500           call 0x244                               
  01ff  750d             jne 0x20e                                
  0201  c70680320200     mov word ptr [0x3280], 2                 
  0207  33c0             xor ax, ax                               
  0209  33d2             xor dx, dx                               
  020b  eb12             jmp 0x21f                                
  020d  90               nop                                      
  020e  33c0             xor ax, ax                               
  0210  26a30400         mov word ptr es:[4], ax                  
  0214  26800e080020     or byte ptr es:[8], 0x20                 
  021a  8cc2             mov dx, es                               
  021c  42               inc dx                                   
  021d  33c0             xor ax, ax                               
  021f  5f               pop di                                   
  0220  5e               pop si                                   
  0221  07               pop es                                   
  0222  8be5             mov sp, bp                               
  0224  5d               pop bp                                   
  0225  cb               retf                                     
  0226  48               dec ax                                   
  0227  8bd8             mov bx, ax                               
  0229  b448             mov ah, 0x48                             
  022b  cd21             int 0x21                                 
  022d  72d2             jb 0x201                                 
  022f  8bd0             mov dx, ax                               
  0231  33c0             xor ax, ax                               
  0233  ebea             jmp 0x21f                                
  0235  33c0             xor ax, ax                               
  0237  50               push ax                                  
  0238  ff7606           push word ptr [bp + 6]                   
  023b  9aea330000       lcall 0, 0x33ea                          -> 0000:33ea
  0240  59               pop cx                                   
  0241  59               pop cx                                   
  0242  ebdb             jmp 0x21f                                

res_0d28_0244:  ; ENTRY
  0244  e8f502           call 0x53c                               
  0247  7532             jne 0x27b                                
  0249  50               push ax                                  
  024a  e88200           call 0x2cf                               
  024d  58               pop ax                                   
  024e  e8eb02           call 0x53c                               
  0251  7528             jne 0x27b                                
  0253  50               push ax                                  
  0254  e87103           call 0x5c8                               
  0257  58               pop ax                                   
  0258  740f             je 0x269                                 
  025a  e8df02           call 0x53c                               
  025d  751c             jne 0x27b                                
  025f  50               push ax                                  
  0260  e86c00           call 0x2cf                               
  0263  58               pop ax                                   
  0264  e8d502           call 0x53c                               
  0267  7512             jne 0x27b                                
  0269  50               push ax                                  
  026a  e81708           call 0xa84                               
  026d  7203             jb 0x272                                 
  026f  58               pop ax                                   
  0270  ebd2             jmp 0x244                                
  0272  5f               pop di                                   
  0273  c70680320200     mov word ptr [0x3280], 2                 
  0279  3ac0             cmp al, al                               
  027b  c3               ret                                      
  027c  55               push bp                                  
  027d  8bec             mov bp, sp                               
  027f  56               push si                                  
  0280  57               push di                                  
  0281  1e               push ds                                  
  0282  06               push es                                  
  0283  8b4e06           mov cx, word ptr [bp + 6]                
  0286  8b4608           mov ax, word ptr [bp + 8]                
  0289  f7e1             mul cx                                   
  028b  50               push ax                                  
  028c  52               push dx                                  
  028d  c44e0c           les cx, ptr [bp + 0xc]                   
  0290  06               push es                                  
  0291  51               push cx                                  
  0292  ff760a           push word ptr [bp + 0xa]                 
  0295  52               push dx                                  
  0296  50               push ax                                  
  0297  0e               push cs                                  
  0298  e884fe           call 0x11f                               
  029b  83c40a           add sp, 0xa                              
  029e  8bf0             mov si, ax                               
  02a0  0bf2             or si, dx                                
  02a2  7416             je 0x2ba                                 
  02a4  5b               pop bx                                   
  02a5  59               pop cx                                   
  02a6  8eda             mov ds, dx                               
  02a8  8bf0             mov si, ax                               
  02aa  c43c             les di, ptr [si]                         
  02ac  50               push ax                                  
  02ad  32c0             xor al, al                               
  02af  f3aa             rep stosb byte ptr es:[di], al           
  02b1  58               pop ax                                   
  02b2  83fb00           cmp bx, 0                                
  02b5  7406             je 0x2bd                                 
  02b7  4b               dec bx                                   
  02b8  ebf2             jmp 0x2ac                                
  02ba  83c404           add sp, 4                                
  02bd  07               pop es                                   
  02be  1f               pop ds                                   
  02bf  5f               pop di                                   
  02c0  5e               pop si                                   
  02c1  8be5             mov sp, bp                               
  02c3  5d               pop bp                                   
  02c4  cb               retf                                     

res_0d28_02c5:  ; ENTRY
  02c5  06               push es                                  
  02c6  56               push si                                  
  02c7  57               push di                                  
  02c8  e80400           call 0x2cf                               
  02cb  5f               pop di                                   
  02cc  5e               pop si                                   
  02cd  07               pop es                                   
  02ce  cb               retf                                     

res_0d28_02cf:  ; ENTRY
  02cf  a17a32           mov ax, word ptr [0x327a]                
  02d2  8ec0             mov es, ax                               
  02d4  3b067e32         cmp ax, word ptr [0x327e]                
  02d8  7503             jne 0x2dd                                
  02da  e9aa01           jmp 0x487                                
  02dd  26f606080080     test byte ptr es:[8], 0x80               
  02e3  7407             je 0x2ec                                 
  02e5  2603060200       add ax, word ptr es:[2]                  
  02ea  ebe6             jmp 0x2d2                                
  02ec  3b067e32         cmp ax, word ptr [0x327e]                
  02f0  7503             jne 0x2f5                                
  02f2  e99201           jmp 0x487                                
  02f5  8bd8             mov bx, ax                               
  02f7  26031e0200       add bx, word ptr es:[2]                  
  02fc  3b1e7e32         cmp bx, word ptr [0x327e]                
  0300  7503             jne 0x305                                
  0302  e98201           jmp 0x487                                
  0305  1e               push ds                                  
  0306  8edb             mov ds, bx                               
  0308  f606080020       test byte ptr [8], 0x20                  
  030d  1f               pop ds                                   
  030e  7403             je 0x313                                 
  0310  e9a000           jmp 0x3b3                                
  0313  1e               push ds                                  
  0314  268b160200       mov dx, word ptr es:[2]                  
  0319  bf0200           mov di, 2                                
  031c  be0200           mov si, 2                                
  031f  8edb             mov ds, bx                               
  0321  8b0e0200         mov cx, word ptr [2]                     
  0325  52               push dx                                  
  0326  33d2             xor dx, dx                               
  0328  d1e1             shl cx, 1                                
  032a  d1d2             rcl dx, 1                                
  032c  d1e1             shl cx, 1                                
  032e  d1d2             rcl dx, 1                                
  0330  d1e1             shl cx, 1                                
  0332  d1d2             rcl dx, 1                                
  0334  83e901           sub cx, 1                                
  0337  83da00           sbb dx, 0                                
  033a  e8aa08           call 0xbe7                               
  033d  5a               pop dx                                   
  033e  1f               pop ds                                   
  033f  8cc6             mov si, es                               
  0341  46               inc si                                   
  0342  268b3e0400       mov di, word ptr es:[4]                  
  0347  a17432           mov ax, word ptr [0x3274]                
  034a  8ec0             mov es, ax                               
  034c  26897502         mov word ptr es:[di + 2], si             
  0350  4e               dec si                                   
  0351  8bc6             mov ax, si                               
  0353  8ec0             mov es, ax                               
  0355  2603060200       add ax, word ptr es:[2]                  
  035a  8ec0             mov es, ax                               
  035c  2689360000       mov word ptr es:[0], si                  
  0361  2689160200       mov word ptr es:[2], dx                  
  0366  26c606080000     mov byte ptr es:[8], 0                   
  036c  8bd0             mov dx, ax                               
  036e  2603060200       add ax, word ptr es:[2]                  
  0373  3b067e32         cmp ax, word ptr [0x327e]                
  0377  7433             je 0x3ac                                 
  0379  8ec0             mov es, ax                               
  037b  26f606080080     test byte ptr es:[8], 0x80               
  0381  7408             je 0x38b                                 
  0383  2689160000       mov word ptr es:[0], dx                  
  0388  eb22             jmp 0x3ac                                
  038a  90               nop                                      
  038b  26a10200         mov ax, word ptr es:[2]                  
  038f  8ec2             mov es, dx                               
  0391  2601060200       add word ptr es:[2], ax                  
  0396  8cc0             mov ax, es                               
  0398  8bc8             mov cx, ax                               
  039a  2603060200       add ax, word ptr es:[2]                  
  039f  3b067e32         cmp ax, word ptr [0x327e]                
  03a3  7407             je 0x3ac                                 
  03a5  8ec0             mov es, ax                               
  03a7  26890e0000       mov word ptr es:[0], cx                  
  03ac  8ec2             mov es, dx                               
  03ae  8cc0             mov ax, es                               
  03b0  e939ff           jmp 0x2ec                                
  03b3  06               push es                                  
  03b4  268b0e0200       mov cx, word ptr es:[2]                  
  03b9  33d2             xor dx, dx                               
  03bb  8cc0             mov ax, es                               
  03bd  2603060200       add ax, word ptr es:[2]                  
  03c2  3b067e32         cmp ax, word ptr [0x327e]                
  03c6  741e             je 0x3e6                                 
  03c8  8ec0             mov es, ax                               
  03ca  26a00800         mov al, byte ptr es:[8]                  
  03ce  24a0             and al, 0xa0                             
  03d0  3c80             cmp al, 0x80                             
  03d2  75e7             jne 0x3bb                                
  03d4  26a10200         mov ax, word ptr es:[2]                  
  03d8  3bc1             cmp ax, cx                               
  03da  77df             ja 0x3bb                                 
  03dc  3bc2             cmp ax, dx                               
  03de  72db             jb 0x3bb                                 
  03e0  8bd0             mov dx, ax                               
  03e2  8cc6             mov si, es                               
  03e4  ebd5             jmp 0x3bb                                
  03e6  83fa00           cmp dx, 0                                
  03e9  750d             jne 0x3f8                                
  03eb  07               pop es                                   
  03ec  8cc0             mov ax, es                               
  03ee  2603060200       add ax, word ptr es:[2]                  
  03f3  8ec0             mov es, ax                               
  03f5  e9dafe           jmp 0x2d2                                
  03f8  8ec6             mov es, si                               
  03fa  268b0e0200       mov cx, word ptr es:[2]                  
  03ff  07               pop es                                   
  0400  06               push es                                  
  0401  51               push cx                                  
  0402  26ff360200       push word ptr es:[2]                     
  0407  56               push si                                  
  0408  1e               push ds                                  
  0409  268b160200       mov dx, word ptr es:[2]                  
  040e  8ede             mov ds, si                               
  0410  bf0200           mov di, 2                                
  0413  be0200           mov si, 2                                
  0416  52               push dx                                  
  0417  33d2             xor dx, dx                               
  0419  d1e1             shl cx, 1                                
  041b  d1d2             rcl dx, 1                                
  041d  d1e1             shl cx, 1                                
  041f  d1d2             rcl dx, 1                                
  0421  d1e1             shl cx, 1                                
  0423  d1d2             rcl dx, 1                                
  0425  83e901           sub cx, 1                                
  0428  83da00           sbb dx, 0                                
  042b  e8b907           call 0xbe7                               
  042e  5a               pop dx                                   
  042f  1f               pop ds                                   
  0430  8cc6             mov si, es                               
  0432  46               inc si                                   
  0433  268b3e0400       mov di, word ptr es:[4]                  
  0438  a17432           mov ax, word ptr [0x3274]                
  043b  8ec0             mov es, ax                               
  043d  26897502         mov word ptr es:[di + 2], si             
  0441  58               pop ax                                   
  0442  8ec0             mov es, ax                               
  0444  e8c601           call 0x60d                               
  0447  5b               pop bx                                   
  0448  59               pop cx                                   
  0449  58               pop ax                                   
  044a  8ec0             mov es, ax                               
  044c  3bcb             cmp cx, bx                               
  044e  740a             je 0x45a                                 
  0450  41               inc cx                                   
  0451  3bcb             cmp cx, bx                               
  0453  750a             jne 0x45f                                
  0455  26ff060200       inc word ptr es:[2]                      
  045a  8ec0             mov es, ax                               
  045c  e973fe           jmp 0x2d2                                
  045f  49               dec cx                                   
  0460  8bd0             mov dx, ax                               
  0462  03c1             add ax, cx                               
  0464  8ec0             mov es, ax                               
  0466  2689160000       mov word ptr es:[0], dx                  
  046b  2bd9             sub bx, cx                               
  046d  26891e0200       mov word ptr es:[2], bx                  
  0472  26c606080000     mov byte ptr es:[8], 0                   
  0478  8bd0             mov dx, ax                               
  047a  03d3             add dx, bx                               
  047c  8ec2             mov es, dx                               
  047e  26a30000         mov word ptr es:[0], ax                  
  0482  8ec0             mov es, ax                               
  0484  e92cff           jmp 0x3b3                                
  0487  a17a32           mov ax, word ptr [0x327a]                
  048a  a37c32           mov word ptr [0x327c], ax                
  048d  c3               ret                                      

res_0d28_048e:  ; ENTRY
  048e  55               push bp                                  
  048f  8bec             mov bp, sp                               
  0491  06               push es                                  
  0492  56               push si                                  
  0493  57               push di                                  
  0494  c47e06           les di, ptr [bp + 6]                     
  0497  8cc0             mov ax, es                               
  0499  3b067432         cmp ax, word ptr [0x3274]                
  049d  7409             je 0x4a8                                 
  049f  c70680320400     mov word ptr [0x3280], 4                 
  04a5  eb5f             jmp 0x506                                
  04a7  90               nop                                      
  04a8  26f6450480       test byte ptr es:[di + 4], 0x80          
  04ad  7509             jne 0x4b8                                
  04af  c70680320500     mov word ptr [0x3280], 5                 
  04b5  eb4f             jmp 0x506                                
  04b7  90               nop                                      
  04b8  3b3e7832         cmp di, word ptr [0x3278]                
  04bc  73f1             jae 0x4af                                
  04be  26f6450408       test byte ptr es:[di + 4], 8             
  04c3  7422             je 0x4e7                                 
  04c5  268a4504         mov al, byte ptr es:[di + 4]             
  04c9  268b5502         mov dx, word ptr es:[di + 2]             
  04cd  268b1d           mov bx, word ptr es:[di]                 
  04d0  26c6450400       mov byte ptr es:[di + 4], 0              
  04d5  32e4             xor ah, ah                               
  04d7  2407             and al, 7                                
  04d9  d1e0             shl ax, 1                                
  04db  8bf0             mov si, ax                               
  04dd  8bb49232         mov si, word ptr [si + 0x3292]           
  04e1  e8c706           call 0xbab                               
  04e4  eb20             jmp 0x506                                
  04e6  90               nop                                      
  04e7  268b4502         mov ax, word ptr es:[di + 2]             
  04eb  48               dec ax                                   
  04ec  26c6450400       mov byte ptr es:[di + 4], 0              
  04f1  8ec0             mov es, ax                               
  04f3  26393e0400       cmp word ptr es:[4], di                  
  04f8  7409             je 0x503                                 
  04fa  c70680320600     mov word ptr [0x3280], 6                 
  0500  eb04             jmp 0x506                                
  0502  90               nop                                      
  0503  e80701           call 0x60d                               
  0506  5f               pop di                                   
  0507  5e               pop si                                   
  0508  07               pop es                                   
  0509  8be5             mov sp, bp                               
  050b  5d               pop bp                                   
  050c  cb               retf                                     

res_0d28_050d:  ; ENTRY
  050d  55               push bp                                  
  050e  8bec             mov bp, sp                               
  0510  06               push es                                  
  0511  56               push si                                  
  0512  57               push di                                  
  0513  c47e06           les di, ptr [bp + 6]                     
  0516  8cc0             mov ax, es                               
  0518  8b1e7432         mov bx, word ptr [0x3274]                
  051c  83fb00           cmp bx, 0                                
  051f  7414             je 0x535                                 
  0521  3bc3             cmp ax, bx                               
  0523  7210             jb 0x535                                 
  0525  3d0000           cmp ax, 0                                
  0528  7505             jne 0x52f                                
  052a  83ff00           cmp di, 0                                
  052d  7406             je 0x535                                 
  052f  48               dec ax                                   
  0530  8ec0             mov es, ax                               
  0532  e8d800           call 0x60d                               
  0535  5f               pop di                                   
  0536  5e               pop si                                   
  0537  07               pop es                                   
  0538  8be5             mov sp, bp                               
  053a  5d               pop bp                                   
  053b  cb               retf                                     

res_0d28_053c:  ; ENTRY
  053c  8b167c32         mov dx, word ptr [0x327c]                
  0540  8bca             mov cx, dx                               
  0542  8ec2             mov es, dx                               
  0544  26f606080080     test byte ptr es:[8], 0x80               
  054a  7507             jne 0x553                                
  054c  263b060200       cmp ax, word ptr es:[2]                  
  0551  7617             jbe 0x56a                                
  0553  2603160200       add dx, word ptr es:[2]                  
  0558  3b167e32         cmp dx, word ptr [0x327e]                
  055c  7504             jne 0x562                                
  055e  8b167a32         mov dx, word ptr [0x327a]                
  0562  3bd1             cmp dx, cx                               
  0564  7461             je 0x5c7                                 
  0566  8ec2             mov es, dx                               
  0568  ebda             jmp 0x544                                
  056a  263b060200       cmp ax, word ptr es:[2]                  
  056f  7442             je 0x5b3                                 
  0571  40               inc ax                                   
  0572  263b060200       cmp ax, word ptr es:[2]                  
  0577  743a             je 0x5b3                                 
  0579  48               dec ax                                   
  057a  06               push es                                  
  057b  8bc8             mov cx, ax                               
  057d  268b1e0200       mov bx, word ptr es:[2]                  
  0582  2bd8             sub bx, ax                               
  0584  8cc0             mov ax, es                               
  0586  03c1             add ax, cx                               
  0588  8ec0             mov es, ax                               
  058a  e8ff00           call 0x68c                               
  058d  26891e0200       mov word ptr es:[2], bx                  
  0592  8bc3             mov ax, bx                               
  0594  5b               pop bx                                   
  0595  26891e0000       mov word ptr es:[0], bx                  
  059a  8cc2             mov dx, es                               
  059c  03c2             add ax, dx                               
  059e  3b067e32         cmp ax, word ptr [0x327e]                
  05a2  7408             je 0x5ac                                 
  05a4  06               push es                                  
  05a5  8ec0             mov es, ax                               
  05a7  58               pop ax                                   
  05a8  26a30000         mov word ptr es:[0], ax                  
  05ac  8ec3             mov es, bx                               
  05ae  26890e0200       mov word ptr es:[2], cx                  
  05b3  26c70604000000   mov word ptr es:[4], 0                   
  05ba  26c606080080     mov byte ptr es:[8], 0x80                
  05c0  8cc0             mov ax, es                               
  05c2  a37c32           mov word ptr [0x327c], ax                
  05c5  23c0             and ax, ax                               
  05c7  c3               ret                                      

res_0d28_05c8:  ; ENTRY
  05c8  33f6             xor si, si                               
  05ca  a17a32           mov ax, word ptr [0x327a]                
  05cd  a37c32           mov word ptr [0x327c], ax                
  05d0  8ec0             mov es, ax                               
  05d2  26f606080040     test byte ptr es:[8], 0x40               
  05d8  7424             je 0x5fe                                 
  05da  26f606080020     test byte ptr es:[8], 0x20               
  05e0  751c             jne 0x5fe                                
  05e2  be0100           mov si, 1                                
  05e5  06               push es                                  
  05e6  268b3e0400       mov di, word ptr es:[4]                  
  05eb  8b167432         mov dx, word ptr [0x3274]                
  05ef  8ec2             mov es, dx                               
  05f1  26804d0410       or byte ptr es:[di + 4], 0x10            
  05f6  07               pop es                                   
  05f7  50               push ax                                  
  05f8  e81200           call 0x60d                               
  05fb  58               pop ax                                   
  05fc  ebd2             jmp 0x5d0                                
  05fe  2603060200       add ax, word ptr es:[2]                  
  0603  3b067e32         cmp ax, word ptr [0x327e]                
  0607  75c7             jne 0x5d0                                
  0609  83fe00           cmp si, 0                                
  060c  c3               ret                                      

res_0d28_060d:  ; ENTRY
  060d  26c606080000     mov byte ptr es:[8], 0                   
  0613  8cc0             mov ax, es                               
  0615  a37c32           mov word ptr [0x327c], ax                
  0618  8cc3             mov bx, es                               
  061a  8cc2             mov dx, es                               
  061c  2603160200       add dx, word ptr es:[2]                  
  0621  3b167e32         cmp dx, word ptr [0x327e]                
  0625  7429             je 0x650                                 
  0627  8ec2             mov es, dx                               
  0629  26f606080080     test byte ptr es:[8], 0x80               
  062f  751f             jne 0x650                                
  0631  26a10200         mov ax, word ptr es:[2]                  
  0635  8ec3             mov es, bx                               
  0637  2601060200       add word ptr es:[2], ax                  
  063c  8bc3             mov ax, bx                               
  063e  2603060200       add ax, word ptr es:[2]                  
  0643  3b067e32         cmp ax, word ptr [0x327e]                
  0647  7407             je 0x650                                 
  0649  8ec0             mov es, ax                               
  064b  26891e0000       mov word ptr es:[0], bx                  
  0650  8ec3             mov es, bx                               
  0652  3b1e7a32         cmp bx, word ptr [0x327a]                
  0656  7433             je 0x68b                                 
  0658  268b160000       mov dx, word ptr es:[0]                  
  065d  26a10200         mov ax, word ptr es:[2]                  
  0661  8cc1             mov cx, es                               
  0663  03c8             add cx, ax                               
  0665  8ec2             mov es, dx                               
  0667  26f606080080     test byte ptr es:[8], 0x80               
  066d  751c             jne 0x68b                                
  066f  50               push ax                                  
  0670  8cc0             mov ax, es                               
  0672  a37c32           mov word ptr [0x327c], ax                
  0675  58               pop ax                                   
  0676  2601060200       add word ptr es:[2], ax                  
  067b  3b0e7e32         cmp cx, word ptr [0x327e]                
  067f  740a             je 0x68b                                 
  0681  8cc0             mov ax, es                               
  0683  8ec1             mov es, cx                               
  0685  26a30000         mov word ptr es:[0], ax                  
  0689  8ec0             mov es, ax                               
  068b  c3               ret                                      

res_0d28_068c:  ; ENTRY
  068c  50               push ax                                  
  068d  51               push cx                                  
  068e  33ff             xor di, di                               
  0690  33c0             xor ax, ax                               
  0692  b90800           mov cx, 8                                
  0695  f3ab             rep stosw word ptr es:[di], ax           
  0697  59               pop cx                                   
  0698  58               pop ax                                   
  0699  c3               ret                                      

res_0d28_069a:  ; ENTRY
  069a  55               push bp                                  
  069b  8bec             mov bp, sp                               
  069d  56               push si                                  
  069e  57               push di                                  
  069f  06               push es                                  
  06a0  c47e06           les di, ptr [bp + 6]                     
  06a3  26f6450408       test byte ptr es:[di + 4], 8             
  06a8  7464             je 0x70e                                 
  06aa  26ff7504         push word ptr es:[di + 4]                
  06ae  26ff35           push word ptr es:[di]                    
  06b1  268b4502         mov ax, word ptr es:[di + 2]             
  06b5  50               push ax                                  
  06b6  e88bfb           call 0x244                               
  06b9  7525             jne 0x6e0                                
  06bb  c70680320300     mov word ptr [0x3280], 3                 
  06c1  a18432           mov ax, word ptr [0x3284]                
  06c4  0b068632         or ax, word ptr [0x3286]                 
  06c8  740c             je 0x6d6                                 
  06ca  c45608           les dx, ptr [bp + 8]                     
  06cd  06               push es                                  
  06ce  52               push dx                                  
  06cf  ff1e8432         lcall [0x3284]                           
  06d3  83c404           add sp, 4                                
  06d6  58               pop ax                                   
  06d7  58               pop ax                                   
  06d8  58               pop ax                                   
  06d9  33c0             xor ax, ax                               
  06db  33d2             xor dx, dx                               
  06dd  eb77             jmp 0x756                                
  06df  90               nop                                      
  06e0  5a               pop dx                                   
  06e1  5b               pop bx                                   
  06e2  58               pop ax                                   
  06e3  32e4             xor ah, ah                               
  06e5  2407             and al, 7                                
  06e7  d1e0             shl ax, 1                                
  06e9  8bf0             mov si, ax                               
  06eb  8bb49232         mov si, word ptr [si + 0x3292]           
  06ef  ff14             call word ptr [si]                       
  06f1  8cc2             mov dx, es                               
  06f3  c47e06           les di, ptr [bp + 6]                     
  06f6  26895502         mov word ptr es:[di + 2], dx             
  06fa  26c7050000       mov word ptr es:[di], 0                  
  06ff  26806504f7       and byte ptr es:[di + 4], 0xf7           
  0704  06               push es                                  
  0705  4a               dec dx                                   
  0706  8ec2             mov es, dx                               
  0708  26893e0400       mov word ptr es:[4], di                  
  070d  07               pop es                                   
  070e  a17432           mov ax, word ptr [0x3274]                
  0711  8cc3             mov bx, es                               
  0713  3bc3             cmp ax, bx                               
  0715  7402             je 0x719                                 
  0717  7507             jne 0x720                                
  0719  a17832           mov ax, word ptr [0x3278]                
  071c  3bf8             cmp di, ax                               
  071e  7221             jb 0x741                                 
  0720  c70680320400     mov word ptr [0x3280], 4                 
  0726  a18432           mov ax, word ptr [0x3284]                
  0729  0b068632         or ax, word ptr [0x3286]                 
  072d  740b             je 0x73a                                 
  072f  33c0             xor ax, ax                               
  0731  50               push ax                                  
  0732  50               push ax                                  
  0733  ff1e8432         lcall [0x3284]                           
  0737  83c404           add sp, 4                                
  073a  33c0             xor ax, ax                               
  073c  8bd0             mov dx, ax                               
  073e  eb16             jmp 0x756                                
  0740  90               nop                                      
  0741  26804d0420       or byte ptr es:[di + 4], 0x20            
  0746  268b5502         mov dx, word ptr es:[di + 2]             
  074a  4a               dec dx                                   
  074b  8ec2             mov es, dx                               
  074d  42               inc dx                                   
  074e  26800e080020     or byte ptr es:[8], 0x20                 
  0754  33c0             xor ax, ax                               
  0756  07               pop es                                   
  0757  5f               pop di                                   
  0758  5e               pop si                                   
  0759  8be5             mov sp, bp                               
  075b  5d               pop bp                                   
  075c  cb               retf                                     

res_0d28_075d:  ; ENTRY
  075d  55               push bp                                  
  075e  8bec             mov bp, sp                               
  0760  56               push si                                  
  0761  57               push di                                  
  0762  06               push es                                  
  0763  c47e06           les di, ptr [bp + 6]                     
  0766  33c0             xor ax, ax                               
  0768  33d2             xor dx, dx                               
  076a  26f6450418       test byte ptr es:[di + 4], 0x18          
  076f  749d             je 0x70e                                 
  0771  07               pop es                                   
  0772  5f               pop di                                   
  0773  5e               pop si                                   
  0774  8be5             mov sp, bp                               
  0776  5d               pop bp                                   
  0777  cb               retf                                     
  0778  55               push bp                                  
  0779  8bec             mov bp, sp                               
  077b  06               push es                                  
  077c  56               push si                                  
  077d  57               push di                                  
  077e  8cc1             mov cx, es                               
  0780  c47e06           les di, ptr [bp + 6]                     
  0783  26f6450408       test byte ptr es:[di + 4], 8             
  0788  7407             je 0x791                                 
  078a  33c0             xor ax, ax                               
  078c  8bd0             mov dx, ax                               
  078e  eb12             jmp 0x7a2                                
  0790  90               nop                                      
  0791  268b4502         mov ax, word ptr es:[di + 2]             
  0795  48               dec ax                                   
  0796  8ec0             mov es, ax                               
  0798  26a10200         mov ax, word ptr es:[2]                  
  079c  48               dec ax                                   
  079d  bb1000           mov bx, 0x10                             
  07a0  f7e3             mul bx                                   
  07a2  5f               pop di                                   
  07a3  5e               pop si                                   
  07a4  07               pop es                                   
  07a5  8be5             mov sp, bp                               
  07a7  5d               pop bp                                   
  07a8  cb               retf                                     

res_0d28_07a9:  ; ENTRY
  07a9  55               push bp                                  
  07aa  8bec             mov bp, sp                               
  07ac  56               push si                                  
  07ad  57               push di                                  
  07ae  8cc1             mov cx, es                               
  07b0  c47e06           les di, ptr [bp + 6]                     
  07b3  a17432           mov ax, word ptr [0x3274]                
  07b6  8cc3             mov bx, es                               
  07b8  3bc3             cmp ax, bx                               
  07ba  7402             je 0x7be                                 
  07bc  7507             jne 0x7c5                                
  07be  a17832           mov ax, word ptr [0x3278]                
  07c1  3bf8             cmp di, ax                               
  07c3  721d             jb 0x7e2                                 
  07c5  c70680320400     mov word ptr [0x3280], 4                 
  07cb  a18432           mov ax, word ptr [0x3284]                
  07ce  0b068632         or ax, word ptr [0x3286]                 
  07d2  740b             je 0x7df                                 
  07d4  33c0             xor ax, ax                               
  07d6  50               push ax                                  
  07d7  50               push ax                                  
  07d8  ff1e8432         lcall [0x3284]                           
  07dc  83c404           add sp, 4                                
  07df  eb1c             jmp 0x7fd                                
  07e1  90               nop                                      
  07e2  26f6450408       test byte ptr es:[di + 4], 8             
  07e7  7514             jne 0x7fd                                
  07e9  06               push es                                  
  07ea  268b5502         mov dx, word ptr es:[di + 2]             
  07ee  4a               dec dx                                   
  07ef  8ec2             mov es, dx                               
  07f1  2680260800df     and byte ptr es:[8], 0xdf                
  07f7  07               pop es                                   
  07f8  26806504df       and byte ptr es:[di + 4], 0xdf           
  07fd  8ec1             mov es, cx                               
  07ff  5f               pop di                                   
  0800  5e               pop si                                   
  0801  8be5             mov sp, bp                               
  0803  5d               pop bp                                   
  0804  cb               retf                                     

res_0d28_0805:  ; ENTRY
  0805  55               push bp                                  
  0806  8bec             mov bp, sp                               
  0808  06               push es                                  
  0809  56               push si                                  
  080a  57               push di                                  
  080b  33d2             xor dx, dx                               
  080d  33c9             xor cx, cx                               
  080f  33f6             xor si, si                               
  0811  8b1e7a32         mov bx, word ptr [0x327a]                
  0815  8ec3             mov es, bx                               
  0817  26a10200         mov ax, word ptr es:[2]                  
  081b  48               dec ax                                   
  081c  26f606080080     test byte ptr es:[8], 0x80               
  0822  750b             jne 0x82f                                
  0824  03c8             add cx, ax                               
  0826  3bd0             cmp dx, ax                               
  0828  770f             ja 0x839                                 
  082a  8bd0             mov dx, ax                               
  082c  eb0b             jmp 0x839                                
  082e  90               nop                                      
  082f  26f606080020     test byte ptr es:[8], 0x20               
  0835  7402             je 0x839                                 
  0837  03f0             add si, ax                               
  0839  03d8             add bx, ax                               
  083b  43               inc bx                                   
  083c  3b1e7e32         cmp bx, word ptr [0x327e]                
  0840  75d3             jne 0x815                                
  0842  8bc1             mov ax, cx                               
  0844  33db             xor bx, bx                               
  0846  d1e0             shl ax, 1                                
  0848  d1d3             rcl bx, 1                                
  084a  d1e0             shl ax, 1                                
  084c  d1d3             rcl bx, 1                                
  084e  d1e0             shl ax, 1                                
  0850  d1d3             rcl bx, 1                                
  0852  d1e0             shl ax, 1                                
  0854  d1d3             rcl bx, 1                                
  0856  c47e06           les di, ptr [bp + 6]                     
  0859  268905           mov word ptr es:[di], ax                 
  085c  26895d02         mov word ptr es:[di + 2], bx             
  0860  8bc2             mov ax, dx                               
  0862  33db             xor bx, bx                               
  0864  d1e0             shl ax, 1                                
  0866  d1d3             rcl bx, 1                                
  0868  d1e0             shl ax, 1                                
  086a  d1d3             rcl bx, 1                                
  086c  d1e0             shl ax, 1                                
  086e  d1d3             rcl bx, 1                                
  0870  d1e0             shl ax, 1                                
  0872  d1d3             rcl bx, 1                                
  0874  c47e0a           les di, ptr [bp + 0xa]                   
  0877  268905           mov word ptr es:[di], ax                 
  087a  26895d02         mov word ptr es:[di + 2], bx             
  087e  8bc6             mov ax, si                               
  0880  33db             xor bx, bx                               
  0882  d1e0             shl ax, 1                                
  0884  d1d3             rcl bx, 1                                
  0886  d1e0             shl ax, 1                                
  0888  d1d3             rcl bx, 1                                
  088a  d1e0             shl ax, 1                                
  088c  d1d3             rcl bx, 1                                
  088e  d1e0             shl ax, 1                                
  0890  d1d3             rcl bx, 1                                
  0892  c47e0e           les di, ptr [bp + 0xe]                   
  0895  268905           mov word ptr es:[di], ax                 
  0898  26895d02         mov word ptr es:[di + 2], bx             
  089c  5f               pop di                                   
  089d  5e               pop si                                   
  089e  07               pop es                                   
  089f  8be5             mov sp, bp                               
  08a1  5d               pop bp                                   
  08a2  cb               retf                                     

res_0d28_08a3:  ; ENTRY
  08a3  55               push bp                                  
  08a4  8bec             mov bp, sp                               
  08a6  06               push es                                  
  08a7  56               push si                                  
  08a8  57               push di                                  
  08a9  c47e06           les di, ptr [bp + 6]                     
  08ac  06               push es                                  
  08ad  57               push di                                  
  08ae  0e               push cs                                  
  08af  e8e8fd           call 0x69a                               
  08b2  83c404           add sp, 4                                
  08b5  c47e06           les di, ptr [bp + 6]                     
  08b8  06               push es                                  
  08b9  c4460a           les ax, ptr [bp + 0xa]                   
  08bc  8cc2             mov dx, es                               
  08be  07               pop es                                   
  08bf  8bc8             mov cx, ax                               
  08c1  0bca             or cx, dx                                
  08c3  7503             jne 0x8c8                                
  08c5  e96101           jmp 0xa29                                
  08c8  8cc3             mov bx, es                               
  08ca  8bc8             mov cx, ax                               
  08cc  d1ea             shr dx, 1                                
  08ce  d1d8             rcr ax, 1                                
  08d0  d1ea             shr dx, 1                                
  08d2  d1d8             rcr ax, 1                                
  08d4  d1ea             shr dx, 1                                
  08d6  d1d8             rcr ax, 1                                
  08d8  d1ea             shr dx, 1                                
  08da  d1d8             rcr ax, 1                                
  08dc  83fa00           cmp dx, 0                                
  08df  750b             jne 0x8ec                                
  08e1  83e10f           and cx, 0xf                              
  08e4  7403             je 0x8e9                                 
  08e6  40               inc ax                                   
  08e7  7203             jb 0x8ec                                 
  08e9  40               inc ax                                   
  08ea  7303             jae 0x8ef                                
  08ec  e93a01           jmp 0xa29                                
  08ef  8bd0             mov dx, ax                               
  08f1  268b4502         mov ax, word ptr es:[di + 2]             
  08f5  48               dec ax                                   
  08f6  8ec0             mov es, ax                               
  08f8  26a10200         mov ax, word ptr es:[2]                  
  08fc  3bc2             cmp ax, dx                               
  08fe  7208             jb 0x908                                 
  0900  7403             je 0x905                                 
  0902  e9c200           jmp 0x9c7                                
  0905  e92601           jmp 0xa2e                                
  0908  8cc3             mov bx, es                               
  090a  268b0e0200       mov cx, word ptr es:[2]                  
  090f  8cc0             mov ax, es                               
  0911  03c1             add ax, cx                               
  0913  3b067e32         cmp ax, word ptr [0x327e]                
  0917  7460             je 0x979                                 
  0919  8ec0             mov es, ax                               
  091b  26f606080080     test byte ptr es:[8], 0x80               
  0921  7556             jne 0x979                                
  0923  26a10200         mov ax, word ptr es:[2]                  
  0927  03c1             add ax, cx                               
  0929  3bc2             cmp ax, dx                               
  092b  724c             jb 0x979                                 
  092d  770f             ja 0x93e                                 
  092f  26a10200         mov ax, word ptr es:[2]                  
  0933  03c1             add ax, cx                               
  0935  8ec3             mov es, bx                               
  0937  26a30200         mov word ptr es:[2], ax                  
  093b  eb23             jmp 0x960                                
  093d  90               nop                                      
  093e  2bc2             sub ax, dx                               
  0940  3d0100           cmp ax, 1                                
  0943  74ea             je 0x92f                                 
  0945  891e7c32         mov word ptr [0x327c], bx                
  0949  8ec3             mov es, bx                               
  094b  2689160200       mov word ptr es:[2], dx                  
  0950  03d3             add dx, bx                               
  0952  8ec2             mov es, dx                               
  0954  e835fd           call 0x68c                               
  0957  26891e0000       mov word ptr es:[0], bx                  
  095c  26a30200         mov word ptr es:[2], ax                  
  0960  8cc0             mov ax, es                               
  0962  8bd0             mov dx, ax                               
  0964  2603060200       add ax, word ptr es:[2]                  
  0969  3b067e32         cmp ax, word ptr [0x327e]                
  096d  7407             je 0x976                                 
  096f  8ec0             mov es, ax                               
  0971  2689160000       mov word ptr es:[0], dx                  
  0976  e9b500           jmp 0xa2e                                
  0979  53               push bx                                  
  097a  8bc2             mov ax, dx                               
  097c  e8bdfb           call 0x53c                               
  097f  7504             jne 0x985                                
  0981  5b               pop bx                                   
  0982  e9a400           jmp 0xa29                                
  0985  8cc0             mov ax, es                               
  0987  a37c32           mov word ptr [0x327c], ax                
  098a  58               pop ax                                   
  098b  1e               push ds                                  
  098c  8ed8             mov ds, ax                               
  098e  8b0e0200         mov cx, word ptr [2]                     
  0992  52               push dx                                  
  0993  33d2             xor dx, dx                               
  0995  d1e1             shl cx, 1                                
  0997  d1d2             rcl dx, 1                                
  0999  d1e1             shl cx, 1                                
  099b  d1d2             rcl dx, 1                                
  099d  d1e1             shl cx, 1                                
  099f  d1d2             rcl dx, 1                                
  09a1  83c106           add cx, 6                                
  09a4  83d200           adc dx, 0                                
  09a7  be0400           mov si, 4                                
  09aa  8bfe             mov di, si                               
  09ac  e83802           call 0xbe7                               
  09af  5a               pop dx                                   
  09b0  8cc0             mov ax, es                               
  09b2  8cdb             mov bx, ds                               
  09b4  8ec3             mov es, bx                               
  09b6  1f               pop ds                                   
  09b7  50               push ax                                  
  09b8  e852fc           call 0x60d                               
  09bb  58               pop ax                                   
  09bc  c47e06           les di, ptr [bp + 6]                     
  09bf  40               inc ax                                   
  09c0  26894502         mov word ptr es:[di + 2], ax             
  09c4  eb68             jmp 0xa2e                                
  09c6  90               nop                                      
  09c7  2bc2             sub ax, dx                               
  09c9  3d0100           cmp ax, 1                                
  09cc  7460             je 0xa2e                                 
  09ce  8bd0             mov dx, ax                               
  09d0  8cc3             mov bx, es                               
  09d2  891e7c32         mov word ptr [0x327c], bx                
  09d6  268b0e0200       mov cx, word ptr es:[2]                  
  09db  8cc0             mov ax, es                               
  09dd  03c1             add ax, cx                               
  09df  2bca             sub cx, dx                               
  09e1  26890e0200       mov word ptr es:[2], cx                  
  09e6  8ec0             mov es, ax                               
  09e8  3b067e32         cmp ax, word ptr [0x327e]                
  09ec  7408             je 0x9f6                                 
  09ee  26f606080080     test byte ptr es:[8], 0x80               
  09f4  742c             je 0xa22                                 
  09f6  8bc3             mov ax, bx                               
  09f8  03c1             add ax, cx                               
  09fa  8ec0             mov es, ax                               
  09fc  e88dfc           call 0x68c                               
  09ff  26891e0000       mov word ptr es:[0], bx                  
  0a04  2689160200       mov word ptr es:[2], dx                  
  0a09  8cc0             mov ax, es                               
  0a0b  8bd0             mov dx, ax                               
  0a0d  2603060200       add ax, word ptr es:[2]                  
  0a12  3b067e32         cmp ax, word ptr [0x327e]                
  0a16  7407             je 0xa1f                                 
  0a18  8ec0             mov es, ax                               
  0a1a  2689160000       mov word ptr es:[0], dx                  
  0a1f  eb0d             jmp 0xa2e                                
  0a21  90               nop                                      
  0a22  2603160200       add dx, word ptr es:[2]                  
  0a27  ebcd             jmp 0x9f6                                
  0a29  33c0             xor ax, ax                               
  0a2b  eb04             jmp 0xa31                                
  0a2d  90               nop                                      
  0a2e  b8ffff           mov ax, 0xffff                           
  0a31  5f               pop di                                   
  0a32  5e               pop si                                   
  0a33  07               pop es                                   
  0a34  8be5             mov sp, bp                               
  0a36  5d               pop bp                                   
  0a37  cb               retf                                     
  0a38  55               push bp                                  
  0a39  8bec             mov bp, sp                               
  0a3b  06               push es                                  
  0a3c  57               push di                                  
  0a3d  a17432           mov ax, word ptr [0x3274]                
  0a40  c47e06           les di, ptr [bp + 6]                     
  0a43  8cc2             mov dx, es                               
  0a45  0bd7             or dx, di                                
  0a47  742f             je 0xa78                                 
  0a49  8cc2             mov dx, es                               
  0a4b  8ec0             mov es, ax                               
  0a4d  26893e0000       mov word ptr es:[0], di                  
  0a52  2689160200       mov word ptr es:[2], dx                  
  0a57  33c0             xor ax, ax                               
  0a59  50               push ax                                  
  0a5a  ff760a           push word ptr [bp + 0xa]                 
  0a5d  06               push es                                  
  0a5e  50               push ax                                  
  0a5f  0e               push cs                                  
  0a60  e840fe           call 0x8a3                               
  0a63  83c408           add sp, 8                                
  0a66  a17432           mov ax, word ptr [0x3274]                
  0a69  26a10000         mov ax, word ptr es:[0]                  
  0a6d  268b160200       mov dx, word ptr es:[2]                  
  0a72  5f               pop di                                   
  0a73  07               pop es                                   
  0a74  8be5             mov sp, bp                               
  0a76  5d               pop bp                                   
  0a77  cb               retf                                     
  0a78  ff760a           push word ptr [bp + 0xa]                 
  0a7b  0e               push cs                                  
  0a7c  e856f7           call 0x1d5                               
  0a7f  83c402           add sp, 2                                
  0a82  ebee             jmp 0xa72                                

res_0d28_0a84:  ; ENTRY
  0a84  833e923200       cmp word ptr [0x3292], 0                 
  0a89  7502             jne 0xa8d                                
  0a8b  f9               stc                                      
  0a8c  c3               ret                                      
  0a8d  55               push bp                                  
  0a8e  50               push ax                                  
  0a8f  8b167c32         mov dx, word ptr [0x327c]                
  0a93  8bca             mov cx, dx                               
  0a95  8ec2             mov es, dx                               
  0a97  33f6             xor si, si                               
  0a99  33ff             xor di, di                               
  0a9b  26f606080080     test byte ptr es:[8], 0x80               
  0aa1  744d             je 0xaf0                                 
  0aa3  26f606080020     test byte ptr es:[8], 0x20               
  0aa9  7545             jne 0xaf0                                
  0aab  06               push es                                  
  0aac  268b1e0200       mov bx, word ptr es:[2]                  
  0ab1  8cc2             mov dx, es                               
  0ab3  03d3             add dx, bx                               
  0ab5  3b167e32         cmp dx, word ptr [0x327e]                
  0ab9  740f             je 0xaca                                 
  0abb  8ec2             mov es, dx                               
  0abd  26f606080080     test byte ptr es:[8], 0x80               
  0ac3  7505             jne 0xaca                                
  0ac5  26031e0200       add bx, word ptr es:[2]                  
  0aca  07               pop es                                   
  0acb  06               push es                                  
  0acc  268b160000       mov dx, word ptr es:[0]                  
  0ad1  83fa00           cmp dx, 0                                
  0ad4  740d             je 0xae3                                 
  0ad6  26f606080080     test byte ptr es:[8], 0x80               
  0adc  7505             jne 0xae3                                
  0ade  26031e0200       add bx, word ptr es:[2]                  
  0ae3  07               pop es                                   
  0ae4  3bc3             cmp ax, bx                               
  0ae6  7633             jbe 0xb1b                                
  0ae8  3bde             cmp bx, si                               
  0aea  7604             jbe 0xaf0                                
  0aec  8bf3             mov si, bx                               
  0aee  8cc7             mov di, es                               
  0af0  8cc2             mov dx, es                               
  0af2  2603160200       add dx, word ptr es:[2]                  
  0af7  3b167e32         cmp dx, word ptr [0x327e]                
  0afb  7504             jne 0xb01                                
  0afd  8b167a32         mov dx, word ptr [0x327a]                
  0b01  3bd1             cmp dx, cx                               
  0b03  7404             je 0xb09                                 
  0b05  8ec2             mov es, dx                               
  0b07  eb92             jmp 0xa9b                                
  0b09  83fe00           cmp si, 0                                
  0b0c  7504             jne 0xb12                                
  0b0e  58               pop ax                                   
  0b0f  5d               pop bp                                   
  0b10  f9               stc                                      
  0b11  c3               ret                                      
  0b12  58               pop ax                                   
  0b13  2bc6             sub ax, si                               
  0b15  50               push ax                                  
  0b16  8ec7             mov es, di                               
  0b18  eb04             jmp 0xb1e                                
  0b1a  90               nop                                      
  0b1b  be0000           mov si, 0                                
  0b1e  56               push si                                  
  0b1f  26a10200         mov ax, word ptr es:[2]                  
  0b23  50               push ax                                  
  0b24  b105             mov cl, 5                                
  0b26  d3f8             sar ax, cl                               
  0b28  59               pop cx                                   
  0b29  80e11f           and cl, 0x1f                             
  0b2c  7401             je 0xb2f                                 
  0b2e  40               inc ax                                   
  0b2f  bb9232           mov bx, 0x3292                           
  0b32  b200             mov dl, 0                                
  0b34  8b37             mov si, word ptr [bx]                    
  0b36  83fe00           cmp si, 0                                
  0b39  7446             je 0xb81                                 
  0b3b  39440c           cmp word ptr [si + 0xc], ax              
  0b3e  7d07             jge 0xb47                                
  0b40  83c302           add bx, 2                                
  0b43  fec2             inc dl                                   
  0b45  ebed             jmp 0xb34                                
  0b47  06               push es                                  
  0b48  52               push dx                                  
  0b49  ff5402           call word ptr [si + 2]                   
  0b4c  5a               pop dx                                   
  0b4d  07               pop es                                   
  0b4e  06               push es                                  
  0b4f  268b0e0200       mov cx, word ptr es:[2]                  
  0b54  268b3e0400       mov di, word ptr es:[4]                  
  0b59  a17432           mov ax, word ptr [0x3274]                
  0b5c  8ec0             mov es, ax                               
  0b5e  26804d0408       or byte ptr es:[di + 4], 8               
  0b63  26806504f8       and byte ptr es:[di + 4], 0xf8           
  0b68  26085504         or byte ptr es:[di + 4], dl              
  0b6c  26892d           mov word ptr es:[di], bp                 
  0b6f  26894d02         mov word ptr es:[di + 2], cx             
  0b73  07               pop es                                   
  0b74  e896fa           call 0x60d                               
  0b77  5e               pop si                                   
  0b78  58               pop ax                                   
  0b79  83fe00           cmp si, 0                                
  0b7c  7408             je 0xb86                                 
  0b7e  e90dff           jmp 0xa8e                                
  0b81  5e               pop si                                   
  0b82  58               pop ax                                   
  0b83  5d               pop bp                                   
  0b84  f9               stc                                      
  0b85  c3               ret                                      
  0b86  5d               pop bp                                   
  0b87  f8               clc                                      
  0b88  c3               ret                                      

res_0d28_0b89:  ; ENTRY
  0b89  53               push bx                                  
  0b8a  89440e           mov word ptr [si + 0xe], ax              
  0b8d  8b5c0a           mov bx, word ptr [si + 0xa]              
  0b90  b104             mov cl, 4                                
  0b92  d3eb             shr bx, cl                               
  0b94  03d8             add bx, ax                               
  0b96  53               push bx                                  
  0b97  8b440e           mov ax, word ptr [si + 0xe]              
  0b9a  8ec0             mov es, ax                               
  0b9c  8b4c0a           mov cx, word ptr [si + 0xa]              
  0b9f  d1e9             shr cx, 1                                
  0ba1  b8ffff           mov ax, 0xffff                           
  0ba4  33ff             xor di, di                               
  0ba6  f3ab             rep stosw word ptr es:[di], ax           
  0ba8  58               pop ax                                   
  0ba9  5b               pop bx                                   
  0baa  c3               ret                                      

res_0d28_0bab:  ; ENTRY
  0bab  8b440e           mov ax, word ptr [si + 0xe]              
  0bae  8ec0             mov es, ax                               
  0bb0  268b07           mov ax, word ptr es:[bx]                 
  0bb3  26c707ffff       mov word ptr es:[bx], 0xffff             
  0bb8  ff440c           inc word ptr [si + 0xc]                  
  0bbb  3dfeff           cmp ax, 0xfffe                           
  0bbe  7404             je 0xbc4                                 
  0bc0  8bd8             mov bx, ax                               
  0bc2  ebec             jmp 0xbb0                                
  0bc4  c3               ret                                      

res_0d28_0bc5:  ; ENTRY
  0bc5  06               push es                                  
  0bc6  56               push si                                  
  0bc7  8b470e           mov ax, word ptr [bx + 0xe]              
  0bca  8ec0             mov es, ax                               
  0bcc  33f6             xor si, si                               
  0bce  b9ffff           mov cx, 0xffff                           
  0bd1  8b570a           mov dx, word ptr [bx + 0xa]              
  0bd4  26390c           cmp word ptr es:[si], cx                 
  0bd7  7406             je 0xbdf                                 
  0bd9  46               inc si                                   
  0bda  46               inc si                                   
  0bdb  3bd6             cmp dx, si                               
  0bdd  75f5             jne 0xbd4                                
  0bdf  8bd6             mov dx, si                               
  0be1  ff4f0c           dec word ptr [bx + 0xc]                  
  0be4  5e               pop si                                   
  0be5  07               pop es                                   
  0be6  c3               ret                                      

res_0d28_0be7:  ; ENTRY
  0be7  06               push es                                  
  0be8  1e               push ds                                  
  0be9  53               push bx                                  
  0bea  8bd9             mov bx, cx                               
  0bec  83fa00           cmp dx, 0                                
  0bef  751d             jne 0xc0e                                
  0bf1  81fbf87f         cmp bx, 0x7ff8                           
  0bf5  7717             ja 0xc0e                                 
  0bf7  8bcb             mov cx, bx                               
  0bf9  f6c101           test cl, 1                               
  0bfc  7407             je 0xc05                                 
  0bfe  90               nop                                      
  0bff  90               nop                                      
  0c00  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0c02  eb06             jmp 0xc0a                                
  0c04  90               nop                                      
  0c05  d1c9             ror cx, 1                                
  0c07  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0c0a  5b               pop bx                                   
  0c0b  1f               pop ds                                   
  0c0c  07               pop es                                   
  0c0d  c3               ret                                      
  0c0e  56               push si                                  
  0c0f  57               push di                                  
  0c10  b9f87f           mov cx, 0x7ff8                           
  0c13  d1c9             ror cx, 1                                
  0c15  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0c18  8cd8             mov ax, ds                               
  0c1a  05ff0f           add ax, 0xfff                            
  0c1d  8ed8             mov ds, ax                               
  0c1f  8cc0             mov ax, es                               
  0c21  05ff0f           add ax, 0xfff                            
  0c24  8ec0             mov es, ax                               
  0c26  81ebf87f         sub bx, 0x7ff8                           
  0c2a  83da00           sbb dx, 0                                
  0c2d  5f               pop di                                   
  0c2e  5e               pop si                                   
  0c2f  ebbb             jmp 0xbec                                
  0c31  005657           add byte ptr [bp + 0x57], dl             
  0c34  8bf3             mov si, bx                               
  0c36  8bf8             mov di, ax                               
  0c38  8bca             mov cx, dx                               
  0c3a  b442             mov ah, 0x42                             
  0c3c  cd67             int 0x67                                 
  0c3e  3bdf             cmp bx, di                               
  0c40  7c22             jl 0xc64                                 
  0c42  8bc1             mov ax, cx                               
  0c44  3bc3             cmp ax, bx                               
  0c46  7202             jb 0xc4a                                 
  0c48  8bc3             mov ax, bx                               
  0c4a  8bd8             mov bx, ax                               
  0c4c  b105             mov cl, 5                                
  0c4e  d3e0             shl ax, cl                               
  0c50  89440c           mov word ptr [si + 0xc], ax              
  0c53  d1e0             shl ax, 1                                
  0c55  89440a           mov word ptr [si + 0xa], ax              
  0c58  b443             mov ah, 0x43                             
  0c5a  cd67             int 0x67                                 
  0c5c  8916b732         mov word ptr [0x32b7], dx                
  0c60  f8               clc                                      
  0c61  eb02             jmp 0xc65                                
  0c63  90               nop                                      
  0c64  f9               stc                                      
  0c65  8bde             mov bx, si                               
  0c67  5f               pop di                                   
  0c68  5e               pop si                                   
  0c69  c3               ret                                      
  0c6a  8b16b732         mov dx, word ptr [0x32b7]                
  0c6e  b445             mov ah, 0x45                             
  0c70  cd67             int 0x67                                 
  0c72  c3               ret                                      
  0c73  268b160200       mov dx, word ptr es:[2]                  
  0c78  4a               dec dx                                   
  0c79  8916bb32         mov word ptr [0x32bb], dx                
  0c7d  8bde             mov bx, si                               
  0c7f  8cc0             mov ax, es                               
  0c81  40               inc ax                                   
  0c82  8ec0             mov es, ax                               
  0c84  bfffff           mov di, 0xffff                           
  0c87  e83bff           call 0xbc5                               
  0c8a  83ffff           cmp di, -1                               
  0c8d  740d             je 0xc9c                                 
  0c8f  06               push es                                  
  0c90  8b470e           mov ax, word ptr [bx + 0xe]              
  0c93  8ec0             mov es, ax                               
  0c95  268915           mov word ptr es:[di], dx                 
  0c98  07               pop es                                   
  0c99  eb03             jmp 0xc9e                                
  0c9b  90               nop                                      
  0c9c  8bea             mov bp, dx                               
  0c9e  b92000           mov cx, 0x20                             
  0ca1  3b0ebb32         cmp cx, word ptr [0x32bb]                
  0ca5  7204             jb 0xcab                                 
  0ca7  8b0ebb32         mov cx, word ptr [0x32bb]                
  0cab  33f6             xor si, si                               
  0cad  1e               push ds                                  
  0cae  06               push es                                  
  0caf  e87e00           call 0xd30                               
  0cb2  1f               pop ds                                   
  0cb3  51               push cx                                  
  0cb4  d1e1             shl cx, 1                                
  0cb6  d1e1             shl cx, 1                                
  0cb8  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0cbb  59               pop cx                                   
  0cbc  1e               push ds                                  
  0cbd  58               pop ax                                   
  0cbe  03c1             add ax, cx                               
  0cc0  8ec0             mov es, ax                               
  0cc2  1f               pop ds                                   
  0cc3  290ebb32         sub word ptr [0x32bb], cx                
  0cc7  8bfa             mov di, dx                               
  0cc9  06               push es                                  
  0cca  8b470e           mov ax, word ptr [bx + 0xe]              
  0ccd  8ec0             mov es, ax                               
  0ccf  26c705feff       mov word ptr es:[di], 0xfffe             
  0cd4  07               pop es                                   
  0cd5  75b0             jne 0xc87                                
  0cd7  c3               ret                                      
  0cd8  4a               dec dx                                   
  0cd9  8916bb32         mov word ptr [0x32bb], dx                
  0cdd  8bd3             mov dx, bx                               
  0cdf  8bde             mov bx, si                               
  0ce1  8cc0             mov ax, es                               
  0ce3  40               inc ax                                   
  0ce4  8ec0             mov es, ax                               
  0ce6  06               push es                                  
  0ce7  b92000           mov cx, 0x20                             
  0cea  3b0ebb32         cmp cx, word ptr [0x32bb]                
  0cee  7204             jb 0xcf4                                 
  0cf0  8b0ebb32         mov cx, word ptr [0x32bb]                
  0cf4  06               push es                                  
  0cf5  1e               push ds                                  
  0cf6  06               push es                                  
  0cf7  e83600           call 0xd30                               
  0cfa  8cc0             mov ax, es                               
  0cfc  8ed8             mov ds, ax                               
  0cfe  8bf7             mov si, di                               
  0d00  07               pop es                                   
  0d01  51               push cx                                  
  0d02  d1e1             shl cx, 1                                
  0d04  d1e1             shl cx, 1                                
  0d06  33ff             xor di, di                               
  0d08  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0d0b  59               pop cx                                   
  0d0c  1f               pop ds                                   
  0d0d  58               pop ax                                   
  0d0e  03c1             add ax, cx                               
  0d10  50               push ax                                  
  0d11  290ebb32         sub word ptr [0x32bb], cx                
  0d15  9c               pushf                                    
  0d16  8b470e           mov ax, word ptr [bx + 0xe]              
  0d19  8ec0             mov es, ax                               
  0d1b  8bf2             mov si, dx                               
  0d1d  268b0c           mov cx, word ptr es:[si]                 
  0d20  26c704ffff       mov word ptr es:[si], 0xffff             
  0d25  ff470c           inc word ptr [bx + 0xc]                  
  0d28  8bd1             mov dx, cx                               
  0d2a  9d               popf                                     
  0d2b  07               pop es                                   
  0d2c  75b9             jne 0xce7                                
  0d2e  07               pop es                                   
  0d2f  c3               ret                                      

res_0d28_0d30:  ; ENTRY
  0d30  52               push dx                                  
  0d31  51               push cx                                  
  0d32  53               push bx                                  
  0d33  52               push dx                                  
  0d34  8bda             mov bx, dx                               
  0d36  8b16b732         mov dx, word ptr [0x32b7]                
  0d3a  b80044           mov ax, 0x4400                           
  0d3d  b106             mov cl, 6                                
  0d3f  d3eb             shr bx, cl                               
  0d41  cd67             int 0x67                                 
  0d43  a1b932           mov ax, word ptr [0x32b9]                
  0d46  8ec0             mov es, ax                               
  0d48  5f               pop di                                   
  0d49  83e73f           and di, 0x3f                             
  0d4c  b108             mov cl, 8                                
  0d4e  d3e7             shl di, cl                               
  0d50  5b               pop bx                                   
  0d51  59               pop cx                                   
  0d52  5a               pop dx                                   
  0d53  c3               ret                                      
  0d54  53               push bx                                  
  0d55  baac32           mov dx, 0x32ac                            ; "EMMXXXX0"
  0d58  b8003d           mov ax, 0x3d00                           
  0d5b  cd21             int 0x21                                 
  0d5d  7234             jb 0xd93                                 
  0d5f  8bd8             mov bx, ax                               
  0d61  b80044           mov ax, 0x4400                           
  0d64  cd21             int 0x21                                 
  0d66  7227             jb 0xd8f                                 
  0d68  81e28000         and dx, 0x80                             
  0d6c  7421             je 0xd8f                                 
  0d6e  b80744           mov ax, 0x4407                           
  0d71  cd21             int 0x21                                 
  0d73  721a             jb 0xd8f                                 
  0d75  0ac0             or al, al                                
  0d77  7416             je 0xd8f                                 
  0d79  b43e             mov ah, 0x3e                             
  0d7b  cd21             int 0x21                                 
  0d7d  7210             jb 0xd8f                                 
  0d7f  b441             mov ah, 0x41                             
  0d81  cd67             int 0x67                                 
  0d83  80fc00           cmp ah, 0                                
  0d86  750b             jne 0xd93                                
  0d88  891eb932         mov word ptr [0x32b9], bx                
  0d8c  f8               clc                                      
  0d8d  5b               pop bx                                   
  0d8e  c3               ret                                      
  0d8f  b43e             mov ah, 0x3e                             
  0d91  cd21             int 0x21                                 
  0d93  f9               stc                                      
  0d94  5b               pop bx                                   
  0d95  c3               ret                                      
  0d96  8bc2             mov ax, dx                               
  0d98  b105             mov cl, 5                                
  0d9a  d3e0             shl ax, cl                               
  0d9c  89470c           mov word ptr [bx + 0xc], ax              
  0d9f  d1e0             shl ax, 1                                
  0da1  89470a           mov word ptr [bx + 0xa], ax              
  0da4  f8               clc                                      
  0da5  c3               ret                                      
  0da6  53               push bx                                  
  0da7  8b1ed232         mov bx, word ptr [0x32d2]                
  0dab  b43e             mov ah, 0x3e                             
  0dad  cd21             int 0x21                                 
  0daf  5b               pop bx                                   
  0db0  c3               ret                                      
  0db1  268b160200       mov dx, word ptr es:[2]                  
  0db6  4a               dec dx                                   
  0db7  8916d432         mov word ptr [0x32d4], dx                
  0dbb  8bde             mov bx, si                               
  0dbd  8cc0             mov ax, es                               
  0dbf  40               inc ax                                   
  0dc0  8ec0             mov es, ax                               
  0dc2  bfffff           mov di, 0xffff                           
  0dc5  e8fdfd           call 0xbc5                               
  0dc8  83ffff           cmp di, -1                               
  0dcb  740d             je 0xdda                                 
  0dcd  06               push es                                  
  0dce  8b470e           mov ax, word ptr [bx + 0xe]              
  0dd1  8ec0             mov es, ax                               
  0dd3  268915           mov word ptr es:[di], dx                 
  0dd6  07               pop es                                   
  0dd7  eb03             jmp 0xddc                                
  0dd9  90               nop                                      
  0dda  8bea             mov bp, dx                               
  0ddc  b92000           mov cx, 0x20                             
  0ddf  3b0ed432         cmp cx, word ptr [0x32d4]                
  0de3  7204             jb 0xde9                                 
  0de5  8b0ed432         mov cx, word ptr [0x32d4]                
  0de9  51               push cx                                  
  0dea  d1e1             shl cx, 1                                
  0dec  d1e1             shl cx, 1                                
  0dee  d1e1             shl cx, 1                                
  0df0  d1e1             shl cx, 1                                
  0df2  53               push bx                                  
  0df3  51               push cx                                  
  0df4  52               push dx                                  
  0df5  e88a00           call 0xe82                               
  0df8  1e               push ds                                  
  0df9  8cc0             mov ax, es                               
  0dfb  8ed8             mov ds, ax                               
  0dfd  33d2             xor dx, dx                               
  0dff  b440             mov ah, 0x40                             
  0e01  cd21             int 0x21                                 
  0e03  1f               pop ds                                   
  0e04  5a               pop dx                                   
  0e05  59               pop cx                                   
  0e06  5b               pop bx                                   
  0e07  59               pop cx                                   
  0e08  8cc0             mov ax, es                               
  0e0a  03c1             add ax, cx                               
  0e0c  8ec0             mov es, ax                               
  0e0e  290ed432         sub word ptr [0x32d4], cx                
  0e12  8bfa             mov di, dx                               
  0e14  06               push es                                  
  0e15  8b470e           mov ax, word ptr [bx + 0xe]              
  0e18  8ec0             mov es, ax                               
  0e1a  26c705feff       mov word ptr es:[di], 0xfffe             
  0e1f  07               pop es                                   
  0e20  75a3             jne 0xdc5                                
  0e22  c3               ret                                      
  0e23  4a               dec dx                                   
  0e24  8916d432         mov word ptr [0x32d4], dx                
  0e28  53               push bx                                  
  0e29  56               push si                                  
  0e2a  5b               pop bx                                   
  0e2b  5e               pop si                                   
  0e2c  8cc0             mov ax, es                               
  0e2e  40               inc ax                                   
  0e2f  8ec0             mov es, ax                               
  0e31  06               push es                                  
  0e32  b92000           mov cx, 0x20                             
  0e35  3b0ed432         cmp cx, word ptr [0x32d4]                
  0e39  7204             jb 0xe3f                                 
  0e3b  8b0ed432         mov cx, word ptr [0x32d4]                
  0e3f  51               push cx                                  
  0e40  d1e1             shl cx, 1                                
  0e42  d1e1             shl cx, 1                                
  0e44  d1e1             shl cx, 1                                
  0e46  d1e1             shl cx, 1                                
  0e48  53               push bx                                  
  0e49  51               push cx                                  
  0e4a  8bd6             mov dx, si                               
  0e4c  e83300           call 0xe82                               
  0e4f  1e               push ds                                  
  0e50  8cc0             mov ax, es                               
  0e52  8ed8             mov ds, ax                               
  0e54  33d2             xor dx, dx                               
  0e56  b43f             mov ah, 0x3f                             
  0e58  cd21             int 0x21                                 
  0e5a  1f               pop ds                                   
  0e5b  59               pop cx                                   
  0e5c  5b               pop bx                                   
  0e5d  59               pop cx                                   
  0e5e  8cc0             mov ax, es                               
  0e60  03c1             add ax, cx                               
  0e62  8ec0             mov es, ax                               
  0e64  290ed432         sub word ptr [0x32d4], cx                
  0e68  9c               pushf                                    
  0e69  06               push es                                  
  0e6a  8b470e           mov ax, word ptr [bx + 0xe]              
  0e6d  8ec0             mov es, ax                               
  0e6f  268b04           mov ax, word ptr es:[si]                 
  0e72  26c704ffff       mov word ptr es:[si], 0xffff             
  0e77  ff470c           inc word ptr [bx + 0xc]                  
  0e7a  8bf0             mov si, ax                               
  0e7c  07               pop es                                   
  0e7d  9d               popf                                     
  0e7e  75b2             jne 0xe32                                
  0e80  07               pop es                                   
  0e81  c3               ret                                      

res_0d28_0e82:  ; ENTRY
  0e82  51               push cx                                  
  0e83  52               push dx                                  
  0e84  33c9             xor cx, cx                               
  0e86  d1e2             shl dx, 1                                
  0e88  d1d1             rcl cx, 1                                
  0e8a  d1e2             shl dx, 1                                
  0e8c  d1d1             rcl cx, 1                                
  0e8e  d1e2             shl dx, 1                                
  0e90  d1d1             rcl cx, 1                                
  0e92  d1e2             shl dx, 1                                
  0e94  d1d1             rcl cx, 1                                
  0e96  d1e2             shl dx, 1                                
  0e98  d1d1             rcl cx, 1                                
  0e9a  d1e2             shl dx, 1                                
  0e9c  d1d1             rcl cx, 1                                
  0e9e  d1e2             shl dx, 1                                
  0ea0  d1d1             rcl cx, 1                                
  0ea2  d1e2             shl dx, 1                                
  0ea4  d1d1             rcl cx, 1                                
  0ea6  8b1ed232         mov bx, word ptr [0x32d2]                
  0eaa  b80042           mov ax, 0x4200                           
  0ead  cd21             int 0x21                                 
  0eaf  5a               pop dx                                   
  0eb0  59               pop cx                                   
  0eb1  c3               ret                                      
  0eb2  1e               push ds                                  
  0eb3  c516ce32         lds dx, ptr [0x32ce]                     
  0eb7  b8023d           mov ax, 0x3d02                           
  0eba  cd21             int 0x21                                 
  0ebc  1f               pop ds                                   
  0ebd  a3d232           mov word ptr [0x32d2], ax                
  0ec0  c3               ret                                      
  0ec1  005657           add byte ptr [bp + 0x57], dl             
  0ec4  8bf3             mov si, bx                               
  0ec6  8bf8             mov di, ax                               
  0ec8  52               push dx                                  
  0ec9  b408             mov ah, 8                                
  0ecb  53               push bx                                  
  0ecc  ff1eec32         lcall [0x32ec]                           
  0ed0  5b               pop bx                                   
  0ed1  5a               pop dx                                   
  0ed2  b104             mov cl, 4                                
  0ed4  d3f8             sar ax, cl                               
  0ed6  3bc7             cmp ax, di                               
  0ed8  722f             jb 0xf09                                 
  0eda  3bc2             cmp ax, dx                               
  0edc  7202             jb 0xee0                                 
  0ede  8bc2             mov ax, dx                               
  0ee0  8bd8             mov bx, ax                               
  0ee2  b105             mov cl, 5                                
  0ee4  d3e0             shl ax, cl                               
  0ee6  89440c           mov word ptr [si + 0xc], ax              
  0ee9  d1e0             shl ax, 1                                
  0eeb  89440a           mov word ptr [si + 0xa], ax              
  0eee  d1f8             sar ax, 1                                
  0ef0  d1f8             sar ax, 1                                
  0ef2  8bd0             mov dx, ax                               
  0ef4  b409             mov ah, 9                                
  0ef6  53               push bx                                  
  0ef7  ff1eec32         lcall [0x32ec]                           
  0efb  5b               pop bx                                   
  0efc  3d0000           cmp ax, 0                                
  0eff  7408             je 0xf09                                 
  0f01  8916e832         mov word ptr [0x32e8], dx                
  0f05  f8               clc                                      
  0f06  eb02             jmp 0xf0a                                
  0f08  90               nop                                      
  0f09  f9               stc                                      
  0f0a  8bde             mov bx, si                               
  0f0c  5f               pop di                                   
  0f0d  5e               pop si                                   
  0f0e  c3               ret                                      
  0f0f  8b16e832         mov dx, word ptr [0x32e8]                
  0f13  b40a             mov ah, 0xa                              
  0f15  ff1eec32         lcall [0x32ec]                           
  0f19  c3               ret                                      
  0f1a  c706f2320000     mov word ptr [0x32f2], 0                 
  0f20  c706f4320000     mov word ptr [0x32f4], 0                 
  0f26  a1e832           mov ax, word ptr [0x32e8]                
  0f29  a3fa32           mov word ptr [0x32fa], ax                
  0f2c  268b160200       mov dx, word ptr es:[2]                  
  0f31  4a               dec dx                                   
  0f32  89160033         mov word ptr [0x3300], dx                
  0f36  8bde             mov bx, si                               
  0f38  8cc0             mov ax, es                               
  0f3a  40               inc ax                                   
  0f3b  a3f832           mov word ptr [0x32f8], ax                
  0f3e  c706f6320000     mov word ptr [0x32f6], 0                 
  0f44  bfffff           mov di, 0xffff                           
  0f47  e87bfc           call 0xbc5                               
  0f4a  83ffff           cmp di, -1                               
  0f4d  740b             je 0xf5a                                 
  0f4f  8b470e           mov ax, word ptr [bx + 0xe]              
  0f52  8ec0             mov es, ax                               
  0f54  268915           mov word ptr es:[di], dx                 
  0f57  eb03             jmp 0xf5c                                
  0f59  90               nop                                      
  0f5a  8bea             mov bp, dx                               
  0f5c  52               push dx                                  
  0f5d  33c9             xor cx, cx                               
  0f5f  d1e2             shl dx, 1                                
  0f61  d1d1             rcl cx, 1                                
  0f63  d1e2             shl dx, 1                                
  0f65  d1d1             rcl cx, 1                                
  0f67  d1e2             shl dx, 1                                
  0f69  d1d1             rcl cx, 1                                
  0f6b  d1e2             shl dx, 1                                
  0f6d  d1d1             rcl cx, 1                                
  0f6f  d1e2             shl dx, 1                                
  0f71  d1d1             rcl cx, 1                                
  0f73  d1e2             shl dx, 1                                
  0f75  d1d1             rcl cx, 1                                
  0f77  d1e2             shl dx, 1                                
  0f79  d1d1             rcl cx, 1                                
  0f7b  d1e2             shl dx, 1                                
  0f7d  d1d1             rcl cx, 1                                
  0f7f  8916fc32         mov word ptr [0x32fc], dx                
  0f83  890efe32         mov word ptr [0x32fe], cx                
  0f87  b92000           mov cx, 0x20                             
  0f8a  3b0e0033         cmp cx, word ptr [0x3300]                
  0f8e  7204             jb 0xf94                                 
  0f90  8b0e0033         mov cx, word ptr [0x3300]                
  0f94  51               push cx                                  
  0f95  d1e1             shl cx, 1                                
  0f97  d1e1             shl cx, 1                                
  0f99  d1e1             shl cx, 1                                
  0f9b  d1e1             shl cx, 1                                
  0f9d  890ef032         mov word ptr [0x32f0], cx                
  0fa1  b40b             mov ah, 0xb                              
  0fa3  bef032           mov si, 0x32f0                           
  0fa6  53               push bx                                  
  0fa7  ff1eec32         lcall [0x32ec]                           
  0fab  5b               pop bx                                   
  0fac  59               pop cx                                   
  0fad  5a               pop dx                                   
  0fae  010ef832         add word ptr [0x32f8], cx                
  0fb2  290e0033         sub word ptr [0x3300], cx                
  0fb6  8bfa             mov di, dx                               
  0fb8  8b470e           mov ax, word ptr [bx + 0xe]              
  0fbb  8ec0             mov es, ax                               
  0fbd  26c705feff       mov word ptr es:[di], 0xfffe             
  0fc2  7583             jne 0xf47                                
  0fc4  c3               ret                                      
  0fc5  c706f2320000     mov word ptr [0x32f2], 0                 
  0fcb  c706fa320000     mov word ptr [0x32fa], 0                 
  0fd1  a1e832           mov ax, word ptr [0x32e8]                
  0fd4  a3f432           mov word ptr [0x32f4], ax                
  0fd7  4a               dec dx                                   
  0fd8  89160033         mov word ptr [0x3300], dx                
  0fdc  8bd3             mov dx, bx                               
  0fde  8bde             mov bx, si                               
  0fe0  8cc0             mov ax, es                               
  0fe2  40               inc ax                                   
  0fe3  50               push ax                                  
  0fe4  a3fe32           mov word ptr [0x32fe], ax                
  0fe7  c706fc320000     mov word ptr [0x32fc], 0                 
  0fed  52               push dx                                  
  0fee  33c9             xor cx, cx                               
  0ff0  d1e2             shl dx, 1                                
  0ff2  d1d1             rcl cx, 1                                
  0ff4  d1e2             shl dx, 1                                
  0ff6  d1d1             rcl cx, 1                                
  0ff8  d1e2             shl dx, 1                                
  0ffa  d1d1             rcl cx, 1                                
  0ffc  d1e2             shl dx, 1                                
  0ffe  d1d1             rcl cx, 1                                
  1000  d1e2             shl dx, 1                                
  1002  d1d1             rcl cx, 1                                
  1004  d1e2             shl dx, 1                                
  1006  d1d1             rcl cx, 1                                
  1008  d1e2             shl dx, 1                                
  100a  d1d1             rcl cx, 1                                
  100c  d1e2             shl dx, 1                                
  100e  d1d1             rcl cx, 1                                
  1010  8916f632         mov word ptr [0x32f6], dx                
  1014  890ef832         mov word ptr [0x32f8], cx                
  1018  b92000           mov cx, 0x20                             
  101b  3b0e0033         cmp cx, word ptr [0x3300]                
  101f  7204             jb 0x1025                                
  1021  8b0e0033         mov cx, word ptr [0x3300]                
  1025  51               push cx                                  
  1026  d1e1             shl cx, 1                                
  1028  d1e1             shl cx, 1                                
  102a  d1e1             shl cx, 1                                
  102c  d1e1             shl cx, 1                                
  102e  890ef032         mov word ptr [0x32f0], cx                
  1032  b40b             mov ah, 0xb                              
  1034  bef032           mov si, 0x32f0                           
  1037  53               push bx                                  
  1038  ff1eec32         lcall [0x32ec]                           
  103c  5b               pop bx                                   
  103d  59               pop cx                                   
  103e  5a               pop dx                                   
  103f  010efe32         add word ptr [0x32fe], cx                
  1043  290e0033         sub word ptr [0x3300], cx                
  1047  9c               pushf                                    
  1048  8b470e           mov ax, word ptr [bx + 0xe]              
  104b  8ec0             mov es, ax                               
  104d  8bfa             mov di, dx                               
  104f  268b0d           mov cx, word ptr es:[di]                 
  1052  26c705ffff       mov word ptr es:[di], 0xffff             
  1057  ff470c           inc word ptr [bx + 0xc]                  
  105a  8bd1             mov dx, cx                               
  105c  9d               popf                                     
  105d  758e             jne 0xfed                                
  105f  07               pop es                                   
  1060  c3               ret                                      
  1061  b80043           mov ax, 0x4300                           
  1064  cd2f             int 0x2f                                 
  1066  3c80             cmp al, 0x80                             
  1068  7513             jne 0x107d                               
  106a  53               push bx                                  
  106b  06               push es                                  
  106c  b81043           mov ax, 0x4310                           
  106f  cd2f             int 0x2f                                 
  1071  891eec32         mov word ptr [0x32ec], bx                
  1075  8c06ee32         mov word ptr [0x32ee], es                
  1079  07               pop es                                   
  107a  5b               pop bx                                   
  107b  f8               clc                                      
  107c  c3               ret                                      
  107d  f9               stc                                      
  107e  c3               ret                                      
  107f  005657           add byte ptr [bp + 0x57], dl             
  1082  8bf3             mov si, bx                               
  1084  8bf8             mov di, ax                               
  1086  b488             mov ah, 0x88                             
  1088  cd15             int 0x15                                 
  108a  833e323300       cmp word ptr [0x3332], 0                 
  108f  7407             je 0x1098                                
  1091  050004           add ax, 0x400                            
  1094  2b063033         sub ax, word ptr [0x3330]                
  1098  b104             mov cl, 4                                
  109a  d3f8             sar ax, cl                               
  109c  3bc7             cmp ax, di                               
  109e  7303             jae 0x10a3                               
  10a0  e9ba00           jmp 0x115d                               
  10a3  3bc2             cmp ax, dx                               
  10a5  7202             jb 0x10a9                                
  10a7  8bc2             mov ax, dx                               
  10a9  8bd8             mov bx, ax                               
  10ab  b105             mov cl, 5                                
  10ad  d3e0             shl ax, cl                               
  10af  89440c           mov word ptr [si + 0xc], ax              
  10b2  d1e0             shl ax, 1                                
  10b4  89440a           mov word ptr [si + 0xa], ax              
  10b7  d1f8             sar ax, 1                                
  10b9  d1f8             sar ax, 1                                
  10bb  a33433           mov word ptr [0x3334], ax                
  10be  833e323300       cmp word ptr [0x3332], 0                 
  10c3  7464             je 0x1129                                
  10c5  8b0e3033         mov cx, word ptr [0x3330]                
  10c9  890e6633         mov word ptr [0x3366], cx                
  10cd  01063033         add word ptr [0x3330], ax                
  10d1  b94000           mov cx, 0x40                             
  10d4  f7e1             mul cx                                   
  10d6  8b0e3233         mov cx, word ptr [0x3332]                
  10da  8ec1             mov es, cx                               
  10dc  bf2c00           mov di, 0x2c                             
  10df  260105           add word ptr es:[di], ax                 
  10e2  26105502         adc byte ptr es:[di + 2], dl             
  10e6  56               push si                                  
  10e7  b92000           mov cx, 0x20                             
  10ea  be3633           mov si, 0x3336                           
  10ed  894c10           mov word ptr [si + 0x10], cx             
  10f0  894c18           mov word ptr [si + 0x18], cx             
  10f3  c7441a0000       mov word ptr [si + 0x1a], 0              
  10f8  c6441c10         mov byte ptr [si + 0x1c], 0x10           
  10fc  33db             xor bx, bx                               
  10fe  8cd8             mov ax, ds                               
  1100  d1e0             shl ax, 1                                
  1102  d1d3             rcl bx, 1                                
  1104  d1e0             shl ax, 1                                
  1106  d1d3             rcl bx, 1                                
  1108  d1e0             shl ax, 1                                
  110a  d1d3             rcl bx, 1                                
  110c  d1e0             shl ax, 1                                
  110e  d1d3             rcl bx, 1                                
  1110  885c14           mov byte ptr [si + 0x14], bl             
  1113  051233           add ax, 0x3312                           
  1116  894412           mov word ptr [si + 0x12], ax             
  1119  b91000           mov cx, 0x10                             
  111c  8cd8             mov ax, ds                               
  111e  8ec0             mov es, ax                               
  1120  b487             mov ah, 0x87                             
  1122  cd15             int 0x15                                 
  1124  5e               pop si                                   
  1125  f8               clc                                      
  1126  eb36             jmp 0x115e                               
  1128  90               nop                                      
  1129  8bd0             mov dx, ax                               
  112b  b488             mov ah, 0x88                             
  112d  cd15             int 0x15                                 
  112f  2bc2             sub ax, dx                               
  1131  2ea37511         mov word ptr cs:[0x1175], ax             
  1135  050004           add ax, 0x400                            
  1138  a36633           mov word ptr [0x3366], ax                
  113b  b81535           mov ax, 0x3515                           
  113e  cd21             int 0x21                                 
  1140  2e891e7711       mov word ptr cs:[0x1177], bx             
  1145  8cc0             mov ax, es                               
  1147  2ea37911         mov word ptr cs:[0x1179], ax             
  114b  ba7b11           mov dx, 0x117b                           
  114e  1e               push ds                                  
  114f  8cc8             mov ax, cs                               
  1151  8ed8             mov ds, ax                               
  1153  b81525           mov ax, 0x2515                           
  1156  cd21             int 0x21                                 
  1158  1f               pop ds                                   
  1159  f8               clc                                      
  115a  eb02             jmp 0x115e                               
  115c  90               nop                                      
  115d  f9               stc                                      
  115e  9c               pushf                                    
  115f  a16633           mov ax, word ptr [0x3366]                
  1162  b90004           mov cx, 0x400                            
  1165  f7e9             imul cx                                  
  1167  88266633         mov byte ptr [0x3366], ah                
  116b  88166733         mov byte ptr [0x3367], dl                
  116f  9d               popf                                     
  1170  8bde             mov bx, si                               
  1172  5f               pop di                                   
  1173  5e               pop si                                   
  1174  c3               ret                                      
  1175  0000             add byte ptr [bx + si], al               
  1177  0000             add byte ptr [bx + si], al               
  1179  0000             add byte ptr [bx + si], al               
  117b  9c               pushf                                    
  117c  80fc88           cmp ah, 0x88                             
  117f  7406             je 0x1187                                
  1181  9d               popf                                     
  1182  2eff2e7711       ljmp cs:[0x1177]                         
  1187  2ea17511         mov ax, word ptr cs:[0x1175]             
  118b  cf               iret                                     
  118c  53               push bx                                  
  118d  a13433           mov ax, word ptr [0x3334]                
  1190  833e323300       cmp word ptr [0x3332], 0                 
  1195  7458             je 0x11ef                                
  1197  29063033         sub word ptr [0x3330], ax                
  119b  b94000           mov cx, 0x40                             
  119e  f7e1             mul cx                                   
  11a0  8b0e3233         mov cx, word ptr [0x3332]                
  11a4  8ec1             mov es, cx                               
  11a6  bf2c00           mov di, 0x2c                             
  11a9  262905           sub word ptr es:[di], ax                 
  11ac  26185502         sbb byte ptr es:[di + 2], dl             
  11b0  b92000           mov cx, 0x20                             
  11b3  be3633           mov si, 0x3336                           
  11b6  894c10           mov word ptr [si + 0x10], cx             
  11b9  894c18           mov word ptr [si + 0x18], cx             
  11bc  c7441a0000       mov word ptr [si + 0x1a], 0              
  11c1  c6441c10         mov byte ptr [si + 0x1c], 0x10           
  11c5  33db             xor bx, bx                               
  11c7  8cd8             mov ax, ds                               
  11c9  d1e0             shl ax, 1                                
  11cb  d1d3             rcl bx, 1                                
  11cd  d1e0             shl ax, 1                                
  11cf  d1d3             rcl bx, 1                                
  11d1  d1e0             shl ax, 1                                
  11d3  d1d3             rcl bx, 1                                
  11d5  d1e0             shl ax, 1                                
  11d7  d1d3             rcl bx, 1                                
  11d9  885c14           mov byte ptr [si + 0x14], bl             
  11dc  051233           add ax, 0x3312                           
  11df  894412           mov word ptr [si + 0x12], ax             
  11e2  b91000           mov cx, 0x10                             
  11e5  8cd8             mov ax, ds                               
  11e7  8ec0             mov es, ax                               
  11e9  b487             mov ah, 0x87                             
  11eb  cd15             int 0x15                                 
  11ed  5b               pop bx                                   
  11ee  c3               ret                                      
  11ef  1e               push ds                                  
  11f0  2ec5167711       lds dx, ptr cs:[0x1177]                  
  11f5  b81525           mov ax, 0x2515                           
  11f8  cd21             int 0x21                                 
  11fa  1f               pop ds                                   
  11fb  5b               pop bx                                   
  11fc  c3               ret                                      
  11fd  268b160200       mov dx, word ptr es:[2]                  
  1202  4a               dec dx                                   
  1203  89166d33         mov word ptr [0x336d], dx                
  1207  8bde             mov bx, si                               
  1209  8cc0             mov ax, es                               
  120b  40               inc ax                                   
  120c  33c9             xor cx, cx                               
  120e  d1e0             shl ax, 1                                
  1210  d1d1             rcl cx, 1                                
  1212  d1e0             shl ax, 1                                
  1214  d1d1             rcl cx, 1                                
  1216  d1e0             shl ax, 1                                
  1218  d1d1             rcl cx, 1                                
  121a  d1e0             shl ax, 1                                
  121c  d1d1             rcl cx, 1                                
  121e  a34833           mov word ptr [0x3348], ax                
  1221  880e4a33         mov byte ptr [0x334a], cl                
  1225  bfffff           mov di, 0xffff                           
  1228  e89af9           call 0xbc5                               
  122b  83ffff           cmp di, -1                               
  122e  740b             je 0x123b                                
  1230  8b470e           mov ax, word ptr [bx + 0xe]              
  1233  8ec0             mov es, ax                               
  1235  268915           mov word ptr es:[di], dx                 
  1238  eb03             jmp 0x123d                               
  123a  90               nop                                      
  123b  8bea             mov bp, dx                               
  123d  52               push dx                                  
  123e  be5033           mov si, 0x3350                           
  1241  e8d000           call 0x1314                              
  1244  b92000           mov cx, 0x20                             
  1247  3b0e6d33         cmp cx, word ptr [0x336d]                
  124b  7204             jb 0x1251                                
  124d  8b0e6d33         mov cx, word ptr [0x336d]                
  1251  51               push cx                                  
  1252  d1e1             shl cx, 1                                
  1254  d1e1             shl cx, 1                                
  1256  d1e1             shl cx, 1                                
  1258  d1e1             shl cx, 1                                
  125a  890e4633         mov word ptr [0x3346], cx                
  125e  890e4e33         mov word ptr [0x334e], cx                
  1262  51               push cx                                  
  1263  d1e9             shr cx, 1                                
  1265  be3633           mov si, 0x3336                           
  1268  8cd8             mov ax, ds                               
  126a  8ec0             mov es, ax                               
  126c  b487             mov ah, 0x87                             
  126e  cd15             int 0x15                                 
  1270  59               pop cx                                   
  1271  010e4833         add word ptr [0x3348], cx                
  1275  80164a3300       adc byte ptr [0x334a], 0                 
  127a  59               pop cx                                   
  127b  5a               pop dx                                   
  127c  290e6d33         sub word ptr [0x336d], cx                
  1280  8bfa             mov di, dx                               
  1282  8b470e           mov ax, word ptr [bx + 0xe]              
  1285  8ec0             mov es, ax                               
  1287  26c705feff       mov word ptr es:[di], 0xfffe             
  128c  759a             jne 0x1228                               
  128e  c3               ret                                      
  128f  4a               dec dx                                   
  1290  89166d33         mov word ptr [0x336d], dx                
  1294  8bd3             mov dx, bx                               
  1296  8bde             mov bx, si                               
  1298  8cc0             mov ax, es                               
  129a  40               inc ax                                   
  129b  50               push ax                                  
  129c  33c9             xor cx, cx                               
  129e  d1e0             shl ax, 1                                
  12a0  d1d1             rcl cx, 1                                
  12a2  d1e0             shl ax, 1                                
  12a4  d1d1             rcl cx, 1                                
  12a6  d1e0             shl ax, 1                                
  12a8  d1d1             rcl cx, 1                                
  12aa  d1e0             shl ax, 1                                
  12ac  d1d1             rcl cx, 1                                
  12ae  a35033           mov word ptr [0x3350], ax                
  12b1  880e5233         mov byte ptr [0x3352], cl                
  12b5  52               push dx                                  
  12b6  be4833           mov si, 0x3348                           
  12b9  e85800           call 0x1314                              
  12bc  b92000           mov cx, 0x20                             
  12bf  3b0e6d33         cmp cx, word ptr [0x336d]                
  12c3  7204             jb 0x12c9                                
  12c5  8b0e6d33         mov cx, word ptr [0x336d]                
  12c9  51               push cx                                  
  12ca  d1e1             shl cx, 1                                
  12cc  d1e1             shl cx, 1                                
  12ce  d1e1             shl cx, 1                                
  12d0  d1e1             shl cx, 1                                
  12d2  890e4633         mov word ptr [0x3346], cx                
  12d6  890e4e33         mov word ptr [0x334e], cx                
  12da  51               push cx                                  
  12db  d1e9             shr cx, 1                                
  12dd  be3633           mov si, 0x3336                           
  12e0  8cd8             mov ax, ds                               
  12e2  8ec0             mov es, ax                               
  12e4  b487             mov ah, 0x87                             
  12e6  cd15             int 0x15                                 
  12e8  59               pop cx                                   
  12e9  010e5033         add word ptr [0x3350], cx                
  12ed  8016523300       adc byte ptr [0x3352], 0                 
  12f2  59               pop cx                                   
  12f3  5a               pop dx                                   
  12f4  290e6d33         sub word ptr [0x336d], cx                
  12f8  9c               pushf                                    
  12f9  8b470e           mov ax, word ptr [bx + 0xe]              
  12fc  8ec0             mov es, ax                               
  12fe  57               push di                                  
  12ff  8bfa             mov di, dx                               
  1301  268b0d           mov cx, word ptr es:[di]                 
  1304  26c705ffff       mov word ptr es:[di], 0xffff             
  1309  ff470c           inc word ptr [bx + 0xc]                  
  130c  8bd1             mov dx, cx                               
  130e  5f               pop di                                   
  130f  9d               popf                                     
  1310  75a3             jne 0x12b5                               
  1312  07               pop es                                   
  1313  c3               ret                                      

res_0d28_1314:  ; ENTRY
  1314  8bc2             mov ax, dx                               
  1316  33c9             xor cx, cx                               
  1318  d1e0             shl ax, 1                                
  131a  d1d1             rcl cx, 1                                
  131c  d1e0             shl ax, 1                                
  131e  d1d1             rcl cx, 1                                
  1320  d1e0             shl ax, 1                                
  1322  d1d1             rcl cx, 1                                
  1324  d1e0             shl ax, 1                                
  1326  d1d1             rcl cx, 1                                
  1328  d1e0             shl ax, 1                                
  132a  d1d1             rcl cx, 1                                
  132c  d1e0             shl ax, 1                                
  132e  d1d1             rcl cx, 1                                
  1330  d1e0             shl ax, 1                                
  1332  d1d1             rcl cx, 1                                
  1334  d1e0             shl ax, 1                                
  1336  d1d1             rcl cx, 1                                
  1338  02266633         add ah, byte ptr [0x3366]                
  133c  120e6733         adc cl, byte ptr [0x3367]                
  1340  8904             mov word ptr [si], ax                    
  1342  884c02           mov byte ptr [si + 2], cl                
  1345  c3               ret                                      
  1346  56               push si                                  
  1347  57               push di                                  
  1348  53               push bx                                  
  1349  b488             mov ah, 0x88                             
  134b  cd15             int 0x15                                 
  134d  80fc88           cmp ah, 0x88                             
  1350  7405             je 0x1357                                
  1352  3d0000           cmp ax, 0                                
  1355  7503             jne 0x135a                               
  1357  e9aa00           jmp 0x1404                               
  135a  b81935           mov ax, 0x3519                           
  135d  cd21             int 0x21                                 
  135f  8cc0             mov ax, es                               
  1361  a33233           mov word ptr [0x3332], ax                
  1364  bf1200           mov di, 0x12                             
  1367  be6833           mov si, 0x3368                            ; "VDISK"
  136a  b90500           mov cx, 5                                
  136d  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  136f  7409             je 0x137a                                
  1371  c70632330000     mov word ptr [0x3332], 0                 
  1377  e98500           jmp 0x13ff                               
  137a  b92000           mov cx, 0x20                             
  137d  be3633           mov si, 0x3336                           
  1380  894c10           mov word ptr [si + 0x10], cx             
  1383  894c18           mov word ptr [si + 0x18], cx             
  1386  c744120000       mov word ptr [si + 0x12], 0              
  138b  c6441410         mov byte ptr [si + 0x14], 0x10           
  138f  33db             xor bx, bx                               
  1391  8cd8             mov ax, ds                               
  1393  d1e0             shl ax, 1                                
  1395  d1d3             rcl bx, 1                                
  1397  d1e0             shl ax, 1                                
  1399  d1d3             rcl bx, 1                                
  139b  d1e0             shl ax, 1                                
  139d  d1d3             rcl bx, 1                                
  139f  d1e0             shl ax, 1                                
  13a1  d1d3             rcl bx, 1                                
  13a3  885c1c           mov byte ptr [si + 0x1c], bl             
  13a6  051233           add ax, 0x3312                           
  13a9  89441a           mov word ptr [si + 0x1a], ax             
  13ac  b91000           mov cx, 0x10                             
  13af  8cd8             mov ax, ds                               
  13b1  8ec0             mov es, ax                               
  13b3  b487             mov ah, 0x87                             
  13b5  cd15             int 0x15                                 
  13b7  724b             jb 0x1404                                
  13b9  bf1533           mov di, 0x3315                           
  13bc  be6833           mov si, 0x3368                            ; "VDISK"
  13bf  b90500           mov cx, 5                                
  13c2  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  13c4  753e             jne 0x1404                               
  13c6  a13033           mov ax, word ptr [0x3330]                
  13c9  b90004           mov cx, 0x400                            
  13cc  f7e1             mul cx                                   
  13ce  8b0e3233         mov cx, word ptr [0x3332]                
  13d2  8ec1             mov es, cx                               
  13d4  bf2c00           mov di, 0x2c                             
  13d7  263a5502         cmp dl, byte ptr es:[di + 2]             
  13db  7505             jne 0x13e2                               
  13dd  263b05           cmp ax, word ptr es:[di]                 
  13e0  741d             je 0x13ff                                
  13e2  7c0a             jl 0x13ee                                
  13e4  26885502         mov byte ptr es:[di + 2], dl             
  13e8  268905           mov word ptr es:[di], ax                 
  13eb  eb12             jmp 0x13ff                               
  13ed  90               nop                                      
  13ee  32f6             xor dh, dh                               
  13f0  268a5502         mov dl, byte ptr es:[di + 2]             
  13f4  268b05           mov ax, word ptr es:[di]                 
  13f7  b94000           mov cx, 0x40                             
  13fa  f7f1             div cx                                   
  13fc  a33033           mov word ptr [0x3330], ax                
  13ff  5b               pop bx                                   
  1400  5f               pop di                                   
  1401  5e               pop si                                   
  1402  f8               clc                                      
  1403  c3               ret                                      
  1404  5b               pop bx                                   
  1405  5f               pop di                                   
  1406  5e               pop si                                   
  1407  f9               stc                                      
  1408  c3               ret                                      
  1409  00               db 00                                    
