; seg 0c87  img 0xc870..0xdc80  file off 0xd470
  0c87:0000  05870c           add ax, 0xc87                             [reloc]
  0c87:0003  83c404           add sp, 4                                
  0c87:0006  c9               leave                                    
  0c87:0007  cb               retf                                     

proc_0c87_0008:
  0c87:0008  55               push bp                                  
  0c87:0009  8bec             mov bp, sp                               
  0c87:000b  06               push es                                  
  0c87:000c  56               push si                                  
  0c87:000d  57               push di                                  
  0c87:000e  beac0b           mov si, 0xbac                            
  0c87:0011  c706aa0bb40b     mov word ptr [0xbaa], 0xbb4              
  0c87:0017  bf0a00           mov di, 0xa                              
  0c87:001a  8b1b             mov bx, word ptr [bp + di]               
  0c87:001c  83fbff           cmp bx, -1                               
  0c87:001f  7438             je 0x59                                  
  0c87:0021  837e0800         cmp word ptr [bp + 8], 0                 
  0c87:0025  7432             je 0x59                                  
  0c87:0027  d1e3             shl bx, 1                                
  0c87:0029  8b18             mov bx, word ptr [bx + si]               
  0c87:002b  ff5708           call word ptr [bx + 8]                   
  0c87:002e  7224             jb 0x54                                  
  0c87:0030  b80100           mov ax, 1                                
  0c87:0033  8b5608           mov dx, word ptr [bp + 8]                
  0c87:0036  ff5704           call word ptr [bx + 4]                   
  0c87:0039  7219             jb 0x54                                  
  0c87:003b  8b470c           mov ax, word ptr [bx + 0xc]              
  0c87:003e  b105             mov cl, 5                                
  0c87:0040  d3e8             shr ax, cl                               
  0c87:0042  294608           sub word ptr [bp + 8], ax                
  0c87:0045  8bc3             mov ax, bx                               
  0c87:0047  8b1eaa0b         mov bx, word ptr [0xbaa]                 
  0c87:004b  8907             mov word ptr [bx], ax                    
  0c87:004d  83c302           add bx, 2                                
  0c87:0050  891eaa0b         mov word ptr [0xbaa], bx                 
  0c87:0054  83c702           add di, 2                                
  0c87:0057  ebc1             jmp 0x1a                                 
  0c87:0059  bbffff           mov bx, 0xffff                           
  0c87:005c  b448             mov ah, 0x48                             
  0c87:005e  cd21             int 0x21                                 
  0c87:0060  2b1ea40b         sub bx, word ptr [0xba4]                 
  0c87:0064  8bd3             mov dx, bx                               
  0c87:0066  b448             mov ah, 0x48                             
  0c87:0068  cd21             int 0x21                                 
  0c87:006a  a3960b           mov word ptr [0xb96], ax                 
  0c87:006d  03c2             add ax, dx                               
  0c87:006f  a3a00b           mov word ptr [0xba0], ax                 
  0c87:0072  52               push dx                                  
  0c87:0073  8b4606           mov ax, word ptr [bp + 6]                
  0c87:0076  bb0500           mov bx, 5                                
  0c87:0079  f7e3             mul bx                                   
  0c87:007b  5a               pop dx                                   
  0c87:007c  0d0f00           or ax, 0xf                               
  0c87:007f  40               inc ax                                   
  0c87:0080  8bd8             mov bx, ax                               
  0c87:0082  b104             mov cl, 4                                
  0c87:0084  d3e8             shr ax, cl                               
  0c87:0086  50               push ax                                  
  0c87:0087  0306960b         add ax, word ptr [0xb96]                 
  0c87:008b  bbb40b           mov bx, 0xbb4                            
  0c87:008e  8b37             mov si, word ptr [bx]                    
  0c87:0090  83fe00           cmp si, 0                                
  0c87:0093  7408             je 0x9d                                  
  0c87:0095  e8eb0a           call 0xb83                               -> 0c87:0b83
  0c87:0098  83c302           add bx, 2                                
  0c87:009b  ebf1             jmp 0x8e                                 
  0c87:009d  40               inc ax                                   
  0c87:009e  a39c0b           mov word ptr [0xb9c], ax                 
  0c87:00a1  a39e0b           mov word ptr [0xb9e], ax                 
  0c87:00a4  8ec0             mov es, ax                               
  0c87:00a6  e8dd05           call 0x686                               -> 0c87:0686
  0c87:00a9  8b16a00b         mov dx, word ptr [0xba0]                 
  0c87:00ad  2bd0             sub dx, ax                               
  0c87:00af  2689160200       mov word ptr es:[2], dx                  
  0c87:00b4  59               pop cx                                   
  0c87:00b5  d1e1             shl cx, 1                                
  0c87:00b7  d1e1             shl cx, 1                                
  0c87:00b9  d1e1             shl cx, 1                                
  0c87:00bb  a1960b           mov ax, word ptr [0xb96]                 
  0c87:00be  8ec0             mov es, ax                               
  0c87:00c0  33ff             xor di, di                               
  0c87:00c2  33c0             xor ax, ax                               
  0c87:00c4  f3ab             rep stosw word ptr es:[di], ax           
  0c87:00c6  52               push dx                                  
  0c87:00c7  33d2             xor dx, dx                               
  0c87:00c9  8bc7             mov ax, di                               
  0c87:00cb  b90500           mov cx, 5                                
  0c87:00ce  f7f1             div cx                                   
  0c87:00d0  2bfa             sub di, dx                               
  0c87:00d2  893e9a0b         mov word ptr [0xb9a], di                 
  0c87:00d6  33ff             xor di, di                               
  0c87:00d8  5a               pop dx                                   
  0c87:00d9  26c64504a0       mov byte ptr es:[di + 4], 0xa0           
  0c87:00de  8bc2             mov ax, dx                               
  0c87:00e0  48               dec ax                                   
  0c87:00e1  bb1000           mov bx, 0x10                             
  0c87:00e4  f7e3             mul bx                                   
  0c87:00e6  5f               pop di                                   
  0c87:00e7  5e               pop si                                   
  0c87:00e8  07               pop es                                   
  0c87:00e9  8be5             mov sp, bp                               
  0c87:00eb  5d               pop bp                                   
  0c87:00ec  cb               retf                                     

proc_0c87_00ed:
  0c87:00ed  55               push bp                                  
  0c87:00ee  8bec             mov bp, sp                               
  0c87:00f0  06               push es                                  
  0c87:00f1  a1960b           mov ax, word ptr [0xb96]                 
  0c87:00f4  8ec0             mov es, ax                               
  0c87:00f6  b449             mov ah, 0x49                             
  0c87:00f8  cd21             int 0x21                                 
  0c87:00fa  bbb40b           mov bx, 0xbb4                            
  0c87:00fd  8b37             mov si, word ptr [bx]                    
  0c87:00ff  83fe00           cmp si, 0                                
  0c87:0102  740a             je 0x10e                                 
  0c87:0104  53               push bx                                  
  0c87:0105  ff5406           call word ptr [si + 6]                   
  0c87:0108  5b               pop bx                                   
  0c87:0109  83c302           add bx, 2                                
  0c87:010c  ebef             jmp 0xfd                                 
  0c87:010e  c706960b0000     mov word ptr [0xb96], 0                  
  0c87:0114  07               pop es                                   
  0c87:0115  8be5             mov sp, bp                               
  0c87:0117  5d               pop bp                                   
  0c87:0118  cb               retf                                     

proc_0c87_0119:
  0c87:0119  55               push bp                                  
  0c87:011a  8bec             mov bp, sp                               
  0c87:011c  06               push es                                  
  0c87:011d  56               push si                                  
  0c87:011e  57               push di                                  
  0c87:011f  a1960b           mov ax, word ptr [0xb96]                 
  0c87:0122  8ec0             mov es, ax                               
  0c87:0124  8b3e980b         mov di, word ptr [0xb98]                 
  0c87:0128  8bcf             mov cx, di                               
  0c87:012a  26f6450480       test byte ptr es:[di + 4], 0x80          
  0c87:012f  7433             je 0x164                                 
  0c87:0131  83c705           add di, 5                                
  0c87:0134  3b3e9a0b         cmp di, word ptr [0xb9a]                 
  0c87:0138  7202             jb 0x13c                                 
  0c87:013a  33ff             xor di, di                               
  0c87:013c  3bf9             cmp di, cx                               
  0c87:013e  75ea             jne 0x12a                                
  0c87:0140  33c0             xor ax, ax                               
  0c87:0142  c706a20b0100     mov word ptr [0xba2], 1                  
  0c87:0148  a1a60b           mov ax, word ptr [0xba6]                 
  0c87:014b  0b06a80b         or ax, word ptr [0xba8]                  
  0c87:014f  740c             je 0x15d                                 
  0c87:0151  c4560c           les dx, ptr [bp + 0xc]                   
  0c87:0154  06               push es                                  
  0c87:0155  52               push dx                                  
  0c87:0156  ff1ea60b         lcall [0xba6]                            
  0c87:015a  83c404           add sp, 4                                
  0c87:015d  33c0             xor ax, ax                               
  0c87:015f  33d2             xor dx, dx                               
  0c87:0161  eb65             jmp 0x1c8                                
  0c87:0163  90               nop                                      
  0c87:0164  893e980b         mov word ptr [0xb98], di                 
  0c87:0168  57               push di                                  
  0c87:0169  c44606           les ax, ptr [bp + 6]                     
  0c87:016c  8cc2             mov dx, es                               
  0c87:016e  8bd8             mov bx, ax                               
  0c87:0170  d1ea             shr dx, 1                                
  0c87:0172  d1d8             rcr ax, 1                                
  0c87:0174  d1ea             shr dx, 1                                
  0c87:0176  d1d8             rcr ax, 1                                
  0c87:0178  d1ea             shr dx, 1                                
  0c87:017a  d1d8             rcr ax, 1                                
  0c87:017c  d1ea             shr dx, 1                                
  0c87:017e  d1d8             rcr ax, 1                                
  0c87:0180  83fa00           cmp dx, 0                                
  0c87:0183  75c3             jne 0x148                                
  0c87:0185  83e30f           and bx, 0xf                              
  0c87:0188  7403             je 0x18d                                 
  0c87:018a  40               inc ax                                   
  0c87:018b  72bb             jb 0x148                                 
  0c87:018d  40               inc ax                                   
  0c87:018e  72b8             jb 0x148                                 
  0c87:0190  e8ab00           call 0x23e                               -> 0c87:023e
  0c87:0193  7503             jne 0x198                                
  0c87:0195  5f               pop di                                   
  0c87:0196  ebb0             jmp 0x148                                
  0c87:0198  5f               pop di                                   
  0c87:0199  26893e0400       mov word ptr es:[4], di                  
  0c87:019e  8cc2             mov dx, es                               
  0c87:01a0  8b0e960b         mov cx, word ptr [0xb96]                 
  0c87:01a4  8a460a           mov al, byte ptr [bp + 0xa]              
  0c87:01a7  2608060800       or byte ptr es:[8], al                   
  0c87:01ac  8ec1             mov es, cx                               
  0c87:01ae  26c7050000       mov word ptr es:[di], 0                  
  0c87:01b3  42               inc dx                                   
  0c87:01b4  26895502         mov word ptr es:[di + 2], dx             
  0c87:01b8  8a460a           mov al, byte ptr [bp + 0xa]              
  0c87:01bb  26884504         mov byte ptr es:[di + 4], al             
  0c87:01bf  26804d0480       or byte ptr es:[di + 4], 0x80            
  0c87:01c4  8cc2             mov dx, es                               
  0c87:01c6  8bc7             mov ax, di                               
  0c87:01c8  5f               pop di                                   
  0c87:01c9  5e               pop si                                   
  0c87:01ca  07               pop es                                   
  0c87:01cb  8be5             mov sp, bp                               
  0c87:01cd  5d               pop bp                                   
  0c87:01ce  cb               retf                                     

proc_0c87_01cf:
  0c87:01cf  55               push bp                                  
  0c87:01d0  8bec             mov bp, sp                               
  0c87:01d2  06               push es                                  
  0c87:01d3  56               push si                                  
  0c87:01d4  57               push di                                  
  0c87:01d5  8b4606           mov ax, word ptr [bp + 6]                
  0c87:01d8  3d0000           cmp ax, 0                                
  0c87:01db  7505             jne 0x1e2                                
  0c87:01dd  8bd0             mov dx, ax                               
  0c87:01df  eb38             jmp 0x219                                
  0c87:01e1  90               nop                                      
  0c87:01e2  8bd8             mov bx, ax                               
  0c87:01e4  b104             mov cl, 4                                
  0c87:01e6  d3e8             shr ax, cl                               
  0c87:01e8  83e30f           and bx, 0xf                              
  0c87:01eb  7401             je 0x1ee                                 
  0c87:01ed  40               inc ax                                   
  0c87:01ee  40               inc ax                                   
  0c87:01ef  833e960b00       cmp word ptr [0xb96], 0                  
  0c87:01f4  742a             je 0x220                                 
  0c87:01f6  e84500           call 0x23e                               -> 0c87:023e
  0c87:01f9  750d             jne 0x208                                
  0c87:01fb  c706a20b0200     mov word ptr [0xba2], 2                  
  0c87:0201  33c0             xor ax, ax                               
  0c87:0203  33d2             xor dx, dx                               
  0c87:0205  eb12             jmp 0x219                                
  0c87:0207  90               nop                                      
  0c87:0208  33c0             xor ax, ax                               
  0c87:020a  26a30400         mov word ptr es:[4], ax                  
  0c87:020e  26800e080020     or byte ptr es:[8], 0x20                 
  0c87:0214  8cc2             mov dx, es                               
  0c87:0216  42               inc dx                                   
  0c87:0217  33c0             xor ax, ax                               
  0c87:0219  5f               pop di                                   
  0c87:021a  5e               pop si                                   
  0c87:021b  07               pop es                                   
  0c87:021c  8be5             mov sp, bp                               
  0c87:021e  5d               pop bp                                   
  0c87:021f  cb               retf                                     
  0c87:0220  48               dec ax                                   
  0c87:0221  8bd8             mov bx, ax                               
  0c87:0223  b448             mov ah, 0x48                             
  0c87:0225  cd21             int 0x21                                 
  0c87:0227  72d2             jb 0x1fb                                 
  0c87:0229  8bd0             mov dx, ax                               
  0c87:022b  33c0             xor ax, ax                               
  0c87:022d  ebea             jmp 0x219                                
  0c87:022f  33c0             xor ax, ax                               
  0c87:0231  50               push ax                                  
  0c87:0232  ff7606           push word ptr [bp + 6]                   
  0c87:0235  9ad7310000       lcall 0, 0x31d7                          -> 0000:31d7 [reloc]
  0c87:023a  59               pop cx                                   
  0c87:023b  59               pop cx                                   
  0c87:023c  ebdb             jmp 0x219                                
  0c87:023e  e8f502           call 0x536                               -> 0c87:0536
  0c87:0241  7532             jne 0x275                                
  0c87:0243  50               push ax                                  
  0c87:0244  e88200           call 0x2c9                               -> 0c87:02c9
  0c87:0247  58               pop ax                                   
  0c87:0248  e8eb02           call 0x536                               -> 0c87:0536
  0c87:024b  7528             jne 0x275                                
  0c87:024d  50               push ax                                  
  0c87:024e  e87103           call 0x5c2                               -> 0c87:05c2
  0c87:0251  58               pop ax                                   
  0c87:0252  740f             je 0x263                                 
  0c87:0254  e8df02           call 0x536                               -> 0c87:0536
  0c87:0257  751c             jne 0x275                                
  0c87:0259  50               push ax                                  
  0c87:025a  e86c00           call 0x2c9                               -> 0c87:02c9
  0c87:025d  58               pop ax                                   
  0c87:025e  e8d502           call 0x536                               -> 0c87:0536
  0c87:0261  7512             jne 0x275                                
  0c87:0263  50               push ax                                  
  0c87:0264  e81708           call 0xa7e                               -> 0c87:0a7e
  0c87:0267  7203             jb 0x26c                                 
  0c87:0269  58               pop ax                                   
  0c87:026a  ebd2             jmp 0x23e                                
  0c87:026c  5f               pop di                                   
  0c87:026d  c706a20b0200     mov word ptr [0xba2], 2                  
  0c87:0273  3ac0             cmp al, al                               
  0c87:0275  c3               ret                                      

proc_0c87_0276:
  0c87:0276  55               push bp                                  
  0c87:0277  8bec             mov bp, sp                               
  0c87:0279  56               push si                                  
  0c87:027a  57               push di                                  
  0c87:027b  1e               push ds                                  
  0c87:027c  06               push es                                  
  0c87:027d  8b4e06           mov cx, word ptr [bp + 6]                
  0c87:0280  8b4608           mov ax, word ptr [bp + 8]                
  0c87:0283  f7e1             mul cx                                   
  0c87:0285  50               push ax                                  
  0c87:0286  52               push dx                                  
  0c87:0287  c44e0c           les cx, ptr [bp + 0xc]                   
  0c87:028a  06               push es                                  
  0c87:028b  51               push cx                                  
  0c87:028c  ff760a           push word ptr [bp + 0xa]                 
  0c87:028f  52               push dx                                  
  0c87:0290  50               push ax                                  
  0c87:0291  0e               push cs                                  
  0c87:0292  e884fe           call 0x119                               -> 0c87:0119
  0c87:0295  83c40a           add sp, 0xa                              
  0c87:0298  8bf0             mov si, ax                               
  0c87:029a  0bf2             or si, dx                                
  0c87:029c  7416             je 0x2b4                                 
  0c87:029e  5b               pop bx                                   
  0c87:029f  59               pop cx                                   
  0c87:02a0  8eda             mov ds, dx                               
  0c87:02a2  8bf0             mov si, ax                               
  0c87:02a4  c43c             les di, ptr [si]                         
  0c87:02a6  50               push ax                                  
  0c87:02a7  32c0             xor al, al                               
  0c87:02a9  f3aa             rep stosb byte ptr es:[di], al           
  0c87:02ab  58               pop ax                                   
  0c87:02ac  83fb00           cmp bx, 0                                
  0c87:02af  7406             je 0x2b7                                 
  0c87:02b1  4b               dec bx                                   
  0c87:02b2  ebf2             jmp 0x2a6                                
  0c87:02b4  83c404           add sp, 4                                
  0c87:02b7  07               pop es                                   
  0c87:02b8  1f               pop ds                                   
  0c87:02b9  5f               pop di                                   
  0c87:02ba  5e               pop si                                   
  0c87:02bb  8be5             mov sp, bp                               
  0c87:02bd  5d               pop bp                                   
  0c87:02be  cb               retf                                     
  0c87:02bf  06               push es                                  
  0c87:02c0  56               push si                                  
  0c87:02c1  57               push di                                  
  0c87:02c2  e80400           call 0x2c9                               -> 0c87:02c9
  0c87:02c5  5f               pop di                                   
  0c87:02c6  5e               pop si                                   
  0c87:02c7  07               pop es                                   
  0c87:02c8  cb               retf                                     
  0c87:02c9  a19c0b           mov ax, word ptr [0xb9c]                 
  0c87:02cc  8ec0             mov es, ax                               
  0c87:02ce  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:02d2  7503             jne 0x2d7                                
  0c87:02d4  e9aa01           jmp 0x481                                
  0c87:02d7  26f606080080     test byte ptr es:[8], 0x80               
  0c87:02dd  7407             je 0x2e6                                 
  0c87:02df  2603060200       add ax, word ptr es:[2]                  
  0c87:02e4  ebe6             jmp 0x2cc                                
  0c87:02e6  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:02ea  7503             jne 0x2ef                                
  0c87:02ec  e99201           jmp 0x481                                
  0c87:02ef  8bd8             mov bx, ax                               
  0c87:02f1  26031e0200       add bx, word ptr es:[2]                  
  0c87:02f6  3b1ea00b         cmp bx, word ptr [0xba0]                 
  0c87:02fa  7503             jne 0x2ff                                
  0c87:02fc  e98201           jmp 0x481                                
  0c87:02ff  1e               push ds                                  
  0c87:0300  8edb             mov ds, bx                               
  0c87:0302  f606080020       test byte ptr [8], 0x20                  
  0c87:0307  1f               pop ds                                   
  0c87:0308  7403             je 0x30d                                 
  0c87:030a  e9a000           jmp 0x3ad                                
  0c87:030d  1e               push ds                                  
  0c87:030e  268b160200       mov dx, word ptr es:[2]                  
  0c87:0313  bf0200           mov di, 2                                
  0c87:0316  be0200           mov si, 2                                
  0c87:0319  8edb             mov ds, bx                               
  0c87:031b  8b0e0200         mov cx, word ptr [2]                     
  0c87:031f  52               push dx                                  
  0c87:0320  33d2             xor dx, dx                               
  0c87:0322  d1e1             shl cx, 1                                
  0c87:0324  d1d2             rcl dx, 1                                
  0c87:0326  d1e1             shl cx, 1                                
  0c87:0328  d1d2             rcl dx, 1                                
  0c87:032a  d1e1             shl cx, 1                                
  0c87:032c  d1d2             rcl dx, 1                                
  0c87:032e  83e901           sub cx, 1                                
  0c87:0331  83da00           sbb dx, 0                                
  0c87:0334  e8aa08           call 0xbe1                               -> 0c87:0be1
  0c87:0337  5a               pop dx                                   
  0c87:0338  1f               pop ds                                   
  0c87:0339  8cc6             mov si, es                               
  0c87:033b  46               inc si                                   
  0c87:033c  268b3e0400       mov di, word ptr es:[4]                  
  0c87:0341  a1960b           mov ax, word ptr [0xb96]                 
  0c87:0344  8ec0             mov es, ax                               
  0c87:0346  26897502         mov word ptr es:[di + 2], si             
  0c87:034a  4e               dec si                                   
  0c87:034b  8bc6             mov ax, si                               
  0c87:034d  8ec0             mov es, ax                               
  0c87:034f  2603060200       add ax, word ptr es:[2]                  
  0c87:0354  8ec0             mov es, ax                               
  0c87:0356  2689360000       mov word ptr es:[0], si                  
  0c87:035b  2689160200       mov word ptr es:[2], dx                  
  0c87:0360  26c606080000     mov byte ptr es:[8], 0                   
  0c87:0366  8bd0             mov dx, ax                               
  0c87:0368  2603060200       add ax, word ptr es:[2]                  
  0c87:036d  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:0371  7433             je 0x3a6                                 
  0c87:0373  8ec0             mov es, ax                               
  0c87:0375  26f606080080     test byte ptr es:[8], 0x80               
  0c87:037b  7408             je 0x385                                 
  0c87:037d  2689160000       mov word ptr es:[0], dx                  
  0c87:0382  eb22             jmp 0x3a6                                
  0c87:0384  90               nop                                      
  0c87:0385  26a10200         mov ax, word ptr es:[2]                  
  0c87:0389  8ec2             mov es, dx                               
  0c87:038b  2601060200       add word ptr es:[2], ax                  
  0c87:0390  8cc0             mov ax, es                               
  0c87:0392  8bc8             mov cx, ax                               
  0c87:0394  2603060200       add ax, word ptr es:[2]                  
  0c87:0399  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:039d  7407             je 0x3a6                                 
  0c87:039f  8ec0             mov es, ax                               
  0c87:03a1  26890e0000       mov word ptr es:[0], cx                  
  0c87:03a6  8ec2             mov es, dx                               
  0c87:03a8  8cc0             mov ax, es                               
  0c87:03aa  e939ff           jmp 0x2e6                                
  0c87:03ad  06               push es                                  
  0c87:03ae  268b0e0200       mov cx, word ptr es:[2]                  
  0c87:03b3  33d2             xor dx, dx                               
  0c87:03b5  8cc0             mov ax, es                               
  0c87:03b7  2603060200       add ax, word ptr es:[2]                  
  0c87:03bc  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:03c0  741e             je 0x3e0                                 
  0c87:03c2  8ec0             mov es, ax                               
  0c87:03c4  26a00800         mov al, byte ptr es:[8]                  
  0c87:03c8  24a0             and al, 0xa0                             
  0c87:03ca  3c80             cmp al, 0x80                             
  0c87:03cc  75e7             jne 0x3b5                                
  0c87:03ce  26a10200         mov ax, word ptr es:[2]                  
  0c87:03d2  3bc1             cmp ax, cx                               
  0c87:03d4  77df             ja 0x3b5                                 
  0c87:03d6  3bc2             cmp ax, dx                               
  0c87:03d8  72db             jb 0x3b5                                 
  0c87:03da  8bd0             mov dx, ax                               
  0c87:03dc  8cc6             mov si, es                               
  0c87:03de  ebd5             jmp 0x3b5                                
  0c87:03e0  83fa00           cmp dx, 0                                
  0c87:03e3  750d             jne 0x3f2                                
  0c87:03e5  07               pop es                                   
  0c87:03e6  8cc0             mov ax, es                               
  0c87:03e8  2603060200       add ax, word ptr es:[2]                  
  0c87:03ed  8ec0             mov es, ax                               
  0c87:03ef  e9dafe           jmp 0x2cc                                
  0c87:03f2  8ec6             mov es, si                               
  0c87:03f4  268b0e0200       mov cx, word ptr es:[2]                  
  0c87:03f9  07               pop es                                   
  0c87:03fa  06               push es                                  
  0c87:03fb  51               push cx                                  
  0c87:03fc  26ff360200       push word ptr es:[2]                     
  0c87:0401  56               push si                                  
  0c87:0402  1e               push ds                                  
  0c87:0403  268b160200       mov dx, word ptr es:[2]                  
  0c87:0408  8ede             mov ds, si                               
  0c87:040a  bf0200           mov di, 2                                
  0c87:040d  be0200           mov si, 2                                
  0c87:0410  52               push dx                                  
  0c87:0411  33d2             xor dx, dx                               
  0c87:0413  d1e1             shl cx, 1                                
  0c87:0415  d1d2             rcl dx, 1                                
  0c87:0417  d1e1             shl cx, 1                                
  0c87:0419  d1d2             rcl dx, 1                                
  0c87:041b  d1e1             shl cx, 1                                
  0c87:041d  d1d2             rcl dx, 1                                
  0c87:041f  83e901           sub cx, 1                                
  0c87:0422  83da00           sbb dx, 0                                
  0c87:0425  e8b907           call 0xbe1                               -> 0c87:0be1
  0c87:0428  5a               pop dx                                   
  0c87:0429  1f               pop ds                                   
  0c87:042a  8cc6             mov si, es                               
  0c87:042c  46               inc si                                   
  0c87:042d  268b3e0400       mov di, word ptr es:[4]                  
  0c87:0432  a1960b           mov ax, word ptr [0xb96]                 
  0c87:0435  8ec0             mov es, ax                               
  0c87:0437  26897502         mov word ptr es:[di + 2], si             
  0c87:043b  58               pop ax                                   
  0c87:043c  8ec0             mov es, ax                               
  0c87:043e  e8c601           call 0x607                               -> 0c87:0607
  0c87:0441  5b               pop bx                                   
  0c87:0442  59               pop cx                                   
  0c87:0443  58               pop ax                                   
  0c87:0444  8ec0             mov es, ax                               
  0c87:0446  3bcb             cmp cx, bx                               
  0c87:0448  740a             je 0x454                                 
  0c87:044a  41               inc cx                                   
  0c87:044b  3bcb             cmp cx, bx                               
  0c87:044d  750a             jne 0x459                                
  0c87:044f  26ff060200       inc word ptr es:[2]                      
  0c87:0454  8ec0             mov es, ax                               
  0c87:0456  e973fe           jmp 0x2cc                                
  0c87:0459  49               dec cx                                   
  0c87:045a  8bd0             mov dx, ax                               
  0c87:045c  03c1             add ax, cx                               
  0c87:045e  8ec0             mov es, ax                               
  0c87:0460  2689160000       mov word ptr es:[0], dx                  
  0c87:0465  2bd9             sub bx, cx                               
  0c87:0467  26891e0200       mov word ptr es:[2], bx                  
  0c87:046c  26c606080000     mov byte ptr es:[8], 0                   
  0c87:0472  8bd0             mov dx, ax                               
  0c87:0474  03d3             add dx, bx                               
  0c87:0476  8ec2             mov es, dx                               
  0c87:0478  26a30000         mov word ptr es:[0], ax                  
  0c87:047c  8ec0             mov es, ax                               
  0c87:047e  e92cff           jmp 0x3ad                                
  0c87:0481  a19c0b           mov ax, word ptr [0xb9c]                 
  0c87:0484  a39e0b           mov word ptr [0xb9e], ax                 
  0c87:0487  c3               ret                                      

proc_0c87_0488:
  0c87:0488  55               push bp                                  
  0c87:0489  8bec             mov bp, sp                               
  0c87:048b  06               push es                                  
  0c87:048c  56               push si                                  
  0c87:048d  57               push di                                  
  0c87:048e  c47e06           les di, ptr [bp + 6]                     
  0c87:0491  8cc0             mov ax, es                               
  0c87:0493  3b06960b         cmp ax, word ptr [0xb96]                 
  0c87:0497  7409             je 0x4a2                                 
  0c87:0499  c706a20b0400     mov word ptr [0xba2], 4                  
  0c87:049f  eb5f             jmp 0x500                                
  0c87:04a1  90               nop                                      
  0c87:04a2  26f6450480       test byte ptr es:[di + 4], 0x80          
  0c87:04a7  7509             jne 0x4b2                                
  0c87:04a9  c706a20b0500     mov word ptr [0xba2], 5                  
  0c87:04af  eb4f             jmp 0x500                                
  0c87:04b1  90               nop                                      
  0c87:04b2  3b3e9a0b         cmp di, word ptr [0xb9a]                 
  0c87:04b6  73f1             jae 0x4a9                                
  0c87:04b8  26f6450408       test byte ptr es:[di + 4], 8             
  0c87:04bd  7422             je 0x4e1                                 
  0c87:04bf  268a4504         mov al, byte ptr es:[di + 4]             
  0c87:04c3  268b5502         mov dx, word ptr es:[di + 2]             
  0c87:04c7  268b1d           mov bx, word ptr es:[di]                 
  0c87:04ca  26c6450400       mov byte ptr es:[di + 4], 0              
  0c87:04cf  32e4             xor ah, ah                               
  0c87:04d1  2407             and al, 7                                
  0c87:04d3  d1e0             shl ax, 1                                
  0c87:04d5  8bf0             mov si, ax                               
  0c87:04d7  8bb4b40b         mov si, word ptr [si + 0xbb4]            
  0c87:04db  e8c706           call 0xba5                               -> 0c87:0ba5
  0c87:04de  eb20             jmp 0x500                                
  0c87:04e0  90               nop                                      
  0c87:04e1  268b4502         mov ax, word ptr es:[di + 2]             
  0c87:04e5  48               dec ax                                   
  0c87:04e6  26c6450400       mov byte ptr es:[di + 4], 0              
  0c87:04eb  8ec0             mov es, ax                               
  0c87:04ed  26393e0400       cmp word ptr es:[4], di                  
  0c87:04f2  7409             je 0x4fd                                 
  0c87:04f4  c706a20b0600     mov word ptr [0xba2], 6                  
  0c87:04fa  eb04             jmp 0x500                                
  0c87:04fc  90               nop                                      
  0c87:04fd  e80701           call 0x607                               -> 0c87:0607
  0c87:0500  5f               pop di                                   
  0c87:0501  5e               pop si                                   
  0c87:0502  07               pop es                                   
  0c87:0503  8be5             mov sp, bp                               
  0c87:0505  5d               pop bp                                   
  0c87:0506  cb               retf                                     

proc_0c87_0507:
  0c87:0507  55               push bp                                  
  0c87:0508  8bec             mov bp, sp                               
  0c87:050a  06               push es                                  
  0c87:050b  56               push si                                  
  0c87:050c  57               push di                                  
  0c87:050d  c47e06           les di, ptr [bp + 6]                     
  0c87:0510  8cc0             mov ax, es                               
  0c87:0512  8b1e960b         mov bx, word ptr [0xb96]                 
  0c87:0516  83fb00           cmp bx, 0                                
  0c87:0519  7414             je 0x52f                                 
  0c87:051b  3bc3             cmp ax, bx                               
  0c87:051d  7210             jb 0x52f                                 
  0c87:051f  3d0000           cmp ax, 0                                
  0c87:0522  7505             jne 0x529                                
  0c87:0524  83ff00           cmp di, 0                                
  0c87:0527  7406             je 0x52f                                 
  0c87:0529  48               dec ax                                   
  0c87:052a  8ec0             mov es, ax                               
  0c87:052c  e8d800           call 0x607                               -> 0c87:0607
  0c87:052f  5f               pop di                                   
  0c87:0530  5e               pop si                                   
  0c87:0531  07               pop es                                   
  0c87:0532  8be5             mov sp, bp                               
  0c87:0534  5d               pop bp                                   
  0c87:0535  cb               retf                                     
  0c87:0536  8b169e0b         mov dx, word ptr [0xb9e]                 
  0c87:053a  8bca             mov cx, dx                               
  0c87:053c  8ec2             mov es, dx                               
  0c87:053e  26f606080080     test byte ptr es:[8], 0x80               
  0c87:0544  7507             jne 0x54d                                
  0c87:0546  263b060200       cmp ax, word ptr es:[2]                  
  0c87:054b  7617             jbe 0x564                                
  0c87:054d  2603160200       add dx, word ptr es:[2]                  
  0c87:0552  3b16a00b         cmp dx, word ptr [0xba0]                 
  0c87:0556  7504             jne 0x55c                                
  0c87:0558  8b169c0b         mov dx, word ptr [0xb9c]                 
  0c87:055c  3bd1             cmp dx, cx                               
  0c87:055e  7461             je 0x5c1                                 
  0c87:0560  8ec2             mov es, dx                               
  0c87:0562  ebda             jmp 0x53e                                
  0c87:0564  263b060200       cmp ax, word ptr es:[2]                  
  0c87:0569  7442             je 0x5ad                                 
  0c87:056b  40               inc ax                                   
  0c87:056c  263b060200       cmp ax, word ptr es:[2]                  
  0c87:0571  743a             je 0x5ad                                 
  0c87:0573  48               dec ax                                   
  0c87:0574  06               push es                                  
  0c87:0575  8bc8             mov cx, ax                               
  0c87:0577  268b1e0200       mov bx, word ptr es:[2]                  
  0c87:057c  2bd8             sub bx, ax                               
  0c87:057e  8cc0             mov ax, es                               
  0c87:0580  03c1             add ax, cx                               
  0c87:0582  8ec0             mov es, ax                               
  0c87:0584  e8ff00           call 0x686                               -> 0c87:0686
  0c87:0587  26891e0200       mov word ptr es:[2], bx                  
  0c87:058c  8bc3             mov ax, bx                               
  0c87:058e  5b               pop bx                                   
  0c87:058f  26891e0000       mov word ptr es:[0], bx                  
  0c87:0594  8cc2             mov dx, es                               
  0c87:0596  03c2             add ax, dx                               
  0c87:0598  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:059c  7408             je 0x5a6                                 
  0c87:059e  06               push es                                  
  0c87:059f  8ec0             mov es, ax                               
  0c87:05a1  58               pop ax                                   
  0c87:05a2  26a30000         mov word ptr es:[0], ax                  
  0c87:05a6  8ec3             mov es, bx                               
  0c87:05a8  26890e0200       mov word ptr es:[2], cx                  
  0c87:05ad  26c70604000000   mov word ptr es:[4], 0                   
  0c87:05b4  26c606080080     mov byte ptr es:[8], 0x80                
  0c87:05ba  8cc0             mov ax, es                               
  0c87:05bc  a39e0b           mov word ptr [0xb9e], ax                 
  0c87:05bf  23c0             and ax, ax                               
  0c87:05c1  c3               ret                                      
  0c87:05c2  33f6             xor si, si                               
  0c87:05c4  a19c0b           mov ax, word ptr [0xb9c]                 
  0c87:05c7  a39e0b           mov word ptr [0xb9e], ax                 
  0c87:05ca  8ec0             mov es, ax                               
  0c87:05cc  26f606080040     test byte ptr es:[8], 0x40               
  0c87:05d2  7424             je 0x5f8                                 
  0c87:05d4  26f606080020     test byte ptr es:[8], 0x20               
  0c87:05da  751c             jne 0x5f8                                
  0c87:05dc  be0100           mov si, 1                                
  0c87:05df  06               push es                                  
  0c87:05e0  268b3e0400       mov di, word ptr es:[4]                  
  0c87:05e5  8b16960b         mov dx, word ptr [0xb96]                 
  0c87:05e9  8ec2             mov es, dx                               
  0c87:05eb  26804d0410       or byte ptr es:[di + 4], 0x10            
  0c87:05f0  07               pop es                                   
  0c87:05f1  50               push ax                                  
  0c87:05f2  e81200           call 0x607                               -> 0c87:0607
  0c87:05f5  58               pop ax                                   
  0c87:05f6  ebd2             jmp 0x5ca                                
  0c87:05f8  2603060200       add ax, word ptr es:[2]                  
  0c87:05fd  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:0601  75c7             jne 0x5ca                                
  0c87:0603  83fe00           cmp si, 0                                
  0c87:0606  c3               ret                                      
  0c87:0607  26c606080000     mov byte ptr es:[8], 0                   
  0c87:060d  8cc0             mov ax, es                               
  0c87:060f  a39e0b           mov word ptr [0xb9e], ax                 
  0c87:0612  8cc3             mov bx, es                               
  0c87:0614  8cc2             mov dx, es                               
  0c87:0616  2603160200       add dx, word ptr es:[2]                  
  0c87:061b  3b16a00b         cmp dx, word ptr [0xba0]                 
  0c87:061f  7429             je 0x64a                                 
  0c87:0621  8ec2             mov es, dx                               
  0c87:0623  26f606080080     test byte ptr es:[8], 0x80               
  0c87:0629  751f             jne 0x64a                                
  0c87:062b  26a10200         mov ax, word ptr es:[2]                  
  0c87:062f  8ec3             mov es, bx                               
  0c87:0631  2601060200       add word ptr es:[2], ax                  
  0c87:0636  8bc3             mov ax, bx                               
  0c87:0638  2603060200       add ax, word ptr es:[2]                  
  0c87:063d  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:0641  7407             je 0x64a                                 
  0c87:0643  8ec0             mov es, ax                               
  0c87:0645  26891e0000       mov word ptr es:[0], bx                  
  0c87:064a  8ec3             mov es, bx                               
  0c87:064c  3b1e9c0b         cmp bx, word ptr [0xb9c]                 
  0c87:0650  7433             je 0x685                                 
  0c87:0652  268b160000       mov dx, word ptr es:[0]                  
  0c87:0657  26a10200         mov ax, word ptr es:[2]                  
  0c87:065b  8cc1             mov cx, es                               
  0c87:065d  03c8             add cx, ax                               
  0c87:065f  8ec2             mov es, dx                               
  0c87:0661  26f606080080     test byte ptr es:[8], 0x80               
  0c87:0667  751c             jne 0x685                                
  0c87:0669  50               push ax                                  
  0c87:066a  8cc0             mov ax, es                               
  0c87:066c  a39e0b           mov word ptr [0xb9e], ax                 
  0c87:066f  58               pop ax                                   
  0c87:0670  2601060200       add word ptr es:[2], ax                  
  0c87:0675  3b0ea00b         cmp cx, word ptr [0xba0]                 
  0c87:0679  740a             je 0x685                                 
  0c87:067b  8cc0             mov ax, es                               
  0c87:067d  8ec1             mov es, cx                               
  0c87:067f  26a30000         mov word ptr es:[0], ax                  
  0c87:0683  8ec0             mov es, ax                               
  0c87:0685  c3               ret                                      
  0c87:0686  50               push ax                                  
  0c87:0687  51               push cx                                  
  0c87:0688  33ff             xor di, di                               
  0c87:068a  33c0             xor ax, ax                               
  0c87:068c  b90800           mov cx, 8                                
  0c87:068f  f3ab             rep stosw word ptr es:[di], ax           
  0c87:0691  59               pop cx                                   
  0c87:0692  58               pop ax                                   
  0c87:0693  c3               ret                                      

proc_0c87_0694:
  0c87:0694  55               push bp                                  
  0c87:0695  8bec             mov bp, sp                               
  0c87:0697  56               push si                                  
  0c87:0698  57               push di                                  
  0c87:0699  06               push es                                  
  0c87:069a  c47e06           les di, ptr [bp + 6]                     
  0c87:069d  26f6450408       test byte ptr es:[di + 4], 8             
  0c87:06a2  7464             je 0x708                                 
  0c87:06a4  26ff7504         push word ptr es:[di + 4]                
  0c87:06a8  26ff35           push word ptr es:[di]                    
  0c87:06ab  268b4502         mov ax, word ptr es:[di + 2]             
  0c87:06af  50               push ax                                  
  0c87:06b0  e88bfb           call 0x23e                               -> 0c87:023e
  0c87:06b3  7525             jne 0x6da                                
  0c87:06b5  c706a20b0300     mov word ptr [0xba2], 3                  
  0c87:06bb  a1a60b           mov ax, word ptr [0xba6]                 
  0c87:06be  0b06a80b         or ax, word ptr [0xba8]                  
  0c87:06c2  740c             je 0x6d0                                 
  0c87:06c4  c45608           les dx, ptr [bp + 8]                     
  0c87:06c7  06               push es                                  
  0c87:06c8  52               push dx                                  
  0c87:06c9  ff1ea60b         lcall [0xba6]                            
  0c87:06cd  83c404           add sp, 4                                
  0c87:06d0  58               pop ax                                   
  0c87:06d1  58               pop ax                                   
  0c87:06d2  58               pop ax                                   
  0c87:06d3  33c0             xor ax, ax                               
  0c87:06d5  33d2             xor dx, dx                               
  0c87:06d7  eb77             jmp 0x750                                
  0c87:06d9  90               nop                                      
  0c87:06da  5a               pop dx                                   
  0c87:06db  5b               pop bx                                   
  0c87:06dc  58               pop ax                                   
  0c87:06dd  32e4             xor ah, ah                               
  0c87:06df  2407             and al, 7                                
  0c87:06e1  d1e0             shl ax, 1                                
  0c87:06e3  8bf0             mov si, ax                               
  0c87:06e5  8bb4b40b         mov si, word ptr [si + 0xbb4]            
  0c87:06e9  ff14             call word ptr [si]                       
  0c87:06eb  8cc2             mov dx, es                               
  0c87:06ed  c47e06           les di, ptr [bp + 6]                     
  0c87:06f0  26895502         mov word ptr es:[di + 2], dx             
  0c87:06f4  26c7050000       mov word ptr es:[di], 0                  
  0c87:06f9  26806504f7       and byte ptr es:[di + 4], 0xf7           
  0c87:06fe  06               push es                                  
  0c87:06ff  4a               dec dx                                   
  0c87:0700  8ec2             mov es, dx                               
  0c87:0702  26893e0400       mov word ptr es:[4], di                  
  0c87:0707  07               pop es                                   
  0c87:0708  a1960b           mov ax, word ptr [0xb96]                 
  0c87:070b  8cc3             mov bx, es                               
  0c87:070d  3bc3             cmp ax, bx                               
  0c87:070f  7402             je 0x713                                 
  0c87:0711  7507             jne 0x71a                                
  0c87:0713  a19a0b           mov ax, word ptr [0xb9a]                 
  0c87:0716  3bf8             cmp di, ax                               
  0c87:0718  7221             jb 0x73b                                 
  0c87:071a  c706a20b0400     mov word ptr [0xba2], 4                  
  0c87:0720  a1a60b           mov ax, word ptr [0xba6]                 
  0c87:0723  0b06a80b         or ax, word ptr [0xba8]                  
  0c87:0727  740b             je 0x734                                 
  0c87:0729  33c0             xor ax, ax                               
  0c87:072b  50               push ax                                  
  0c87:072c  50               push ax                                  
  0c87:072d  ff1ea60b         lcall [0xba6]                            
  0c87:0731  83c404           add sp, 4                                
  0c87:0734  33c0             xor ax, ax                               
  0c87:0736  8bd0             mov dx, ax                               
  0c87:0738  eb16             jmp 0x750                                
  0c87:073a  90               nop                                      
  0c87:073b  26804d0420       or byte ptr es:[di + 4], 0x20            
  0c87:0740  268b5502         mov dx, word ptr es:[di + 2]             
  0c87:0744  4a               dec dx                                   
  0c87:0745  8ec2             mov es, dx                               
  0c87:0747  42               inc dx                                   
  0c87:0748  26800e080020     or byte ptr es:[8], 0x20                 
  0c87:074e  33c0             xor ax, ax                               
  0c87:0750  07               pop es                                   
  0c87:0751  5f               pop di                                   
  0c87:0752  5e               pop si                                   
  0c87:0753  8be5             mov sp, bp                               
  0c87:0755  5d               pop bp                                   
  0c87:0756  cb               retf                                     

proc_0c87_0757:
  0c87:0757  55               push bp                                  
  0c87:0758  8bec             mov bp, sp                               
  0c87:075a  56               push si                                  
  0c87:075b  57               push di                                  
  0c87:075c  06               push es                                  
  0c87:075d  c47e06           les di, ptr [bp + 6]                     
  0c87:0760  33c0             xor ax, ax                               
  0c87:0762  33d2             xor dx, dx                               
  0c87:0764  26f6450418       test byte ptr es:[di + 4], 0x18          
  0c87:0769  749d             je 0x708                                 
  0c87:076b  07               pop es                                   
  0c87:076c  5f               pop di                                   
  0c87:076d  5e               pop si                                   
  0c87:076e  8be5             mov sp, bp                               
  0c87:0770  5d               pop bp                                   
  0c87:0771  cb               retf                                     

proc_0c87_0772:
  0c87:0772  55               push bp                                  
  0c87:0773  8bec             mov bp, sp                               
  0c87:0775  06               push es                                  
  0c87:0776  56               push si                                  
  0c87:0777  57               push di                                  
  0c87:0778  8cc1             mov cx, es                               
  0c87:077a  c47e06           les di, ptr [bp + 6]                     
  0c87:077d  26f6450408       test byte ptr es:[di + 4], 8             
  0c87:0782  7407             je 0x78b                                 
  0c87:0784  33c0             xor ax, ax                               
  0c87:0786  8bd0             mov dx, ax                               
  0c87:0788  eb12             jmp 0x79c                                
  0c87:078a  90               nop                                      
  0c87:078b  268b4502         mov ax, word ptr es:[di + 2]             
  0c87:078f  48               dec ax                                   
  0c87:0790  8ec0             mov es, ax                               
  0c87:0792  26a10200         mov ax, word ptr es:[2]                  
  0c87:0796  48               dec ax                                   
  0c87:0797  bb1000           mov bx, 0x10                             
  0c87:079a  f7e3             mul bx                                   
  0c87:079c  5f               pop di                                   
  0c87:079d  5e               pop si                                   
  0c87:079e  07               pop es                                   
  0c87:079f  8be5             mov sp, bp                               
  0c87:07a1  5d               pop bp                                   
  0c87:07a2  cb               retf                                     

proc_0c87_07a3:
  0c87:07a3  55               push bp                                  
  0c87:07a4  8bec             mov bp, sp                               
  0c87:07a6  56               push si                                  
  0c87:07a7  57               push di                                  
  0c87:07a8  8cc1             mov cx, es                               
  0c87:07aa  c47e06           les di, ptr [bp + 6]                     
  0c87:07ad  a1960b           mov ax, word ptr [0xb96]                 
  0c87:07b0  8cc3             mov bx, es                               
  0c87:07b2  3bc3             cmp ax, bx                               
  0c87:07b4  7402             je 0x7b8                                 
  0c87:07b6  7507             jne 0x7bf                                
  0c87:07b8  a19a0b           mov ax, word ptr [0xb9a]                 
  0c87:07bb  3bf8             cmp di, ax                               
  0c87:07bd  721d             jb 0x7dc                                 
  0c87:07bf  c706a20b0400     mov word ptr [0xba2], 4                  
  0c87:07c5  a1a60b           mov ax, word ptr [0xba6]                 
  0c87:07c8  0b06a80b         or ax, word ptr [0xba8]                  
  0c87:07cc  740b             je 0x7d9                                 
  0c87:07ce  33c0             xor ax, ax                               
  0c87:07d0  50               push ax                                  
  0c87:07d1  50               push ax                                  
  0c87:07d2  ff1ea60b         lcall [0xba6]                            
  0c87:07d6  83c404           add sp, 4                                
  0c87:07d9  eb1c             jmp 0x7f7                                
  0c87:07db  90               nop                                      
  0c87:07dc  26f6450408       test byte ptr es:[di + 4], 8             
  0c87:07e1  7514             jne 0x7f7                                
  0c87:07e3  06               push es                                  
  0c87:07e4  268b5502         mov dx, word ptr es:[di + 2]             
  0c87:07e8  4a               dec dx                                   
  0c87:07e9  8ec2             mov es, dx                               
  0c87:07eb  2680260800df     and byte ptr es:[8], 0xdf                
  0c87:07f1  07               pop es                                   
  0c87:07f2  26806504df       and byte ptr es:[di + 4], 0xdf           
  0c87:07f7  8ec1             mov es, cx                               
  0c87:07f9  5f               pop di                                   
  0c87:07fa  5e               pop si                                   
  0c87:07fb  8be5             mov sp, bp                               
  0c87:07fd  5d               pop bp                                   
  0c87:07fe  cb               retf                                     

proc_0c87_07ff:
  0c87:07ff  55               push bp                                  
  0c87:0800  8bec             mov bp, sp                               
  0c87:0802  06               push es                                  
  0c87:0803  56               push si                                  
  0c87:0804  57               push di                                  
  0c87:0805  33d2             xor dx, dx                               
  0c87:0807  33c9             xor cx, cx                               
  0c87:0809  33f6             xor si, si                               
  0c87:080b  8b1e9c0b         mov bx, word ptr [0xb9c]                 
  0c87:080f  8ec3             mov es, bx                               
  0c87:0811  26a10200         mov ax, word ptr es:[2]                  
  0c87:0815  48               dec ax                                   
  0c87:0816  26f606080080     test byte ptr es:[8], 0x80               
  0c87:081c  750b             jne 0x829                                
  0c87:081e  03c8             add cx, ax                               
  0c87:0820  3bd0             cmp dx, ax                               
  0c87:0822  770f             ja 0x833                                 
  0c87:0824  8bd0             mov dx, ax                               
  0c87:0826  eb0b             jmp 0x833                                
  0c87:0828  90               nop                                      
  0c87:0829  26f606080020     test byte ptr es:[8], 0x20               
  0c87:082f  7402             je 0x833                                 
  0c87:0831  03f0             add si, ax                               
  0c87:0833  03d8             add bx, ax                               
  0c87:0835  43               inc bx                                   
  0c87:0836  3b1ea00b         cmp bx, word ptr [0xba0]                 
  0c87:083a  75d3             jne 0x80f                                
  0c87:083c  8bc1             mov ax, cx                               
  0c87:083e  33db             xor bx, bx                               
  0c87:0840  d1e0             shl ax, 1                                
  0c87:0842  d1d3             rcl bx, 1                                
  0c87:0844  d1e0             shl ax, 1                                
  0c87:0846  d1d3             rcl bx, 1                                
  0c87:0848  d1e0             shl ax, 1                                
  0c87:084a  d1d3             rcl bx, 1                                
  0c87:084c  d1e0             shl ax, 1                                
  0c87:084e  d1d3             rcl bx, 1                                
  0c87:0850  c47e06           les di, ptr [bp + 6]                     
  0c87:0853  268905           mov word ptr es:[di], ax                 
  0c87:0856  26895d02         mov word ptr es:[di + 2], bx             
  0c87:085a  8bc2             mov ax, dx                               
  0c87:085c  33db             xor bx, bx                               
  0c87:085e  d1e0             shl ax, 1                                
  0c87:0860  d1d3             rcl bx, 1                                
  0c87:0862  d1e0             shl ax, 1                                
  0c87:0864  d1d3             rcl bx, 1                                
  0c87:0866  d1e0             shl ax, 1                                
  0c87:0868  d1d3             rcl bx, 1                                
  0c87:086a  d1e0             shl ax, 1                                
  0c87:086c  d1d3             rcl bx, 1                                
  0c87:086e  c47e0a           les di, ptr [bp + 0xa]                   
  0c87:0871  268905           mov word ptr es:[di], ax                 
  0c87:0874  26895d02         mov word ptr es:[di + 2], bx             
  0c87:0878  8bc6             mov ax, si                               
  0c87:087a  33db             xor bx, bx                               
  0c87:087c  d1e0             shl ax, 1                                
  0c87:087e  d1d3             rcl bx, 1                                
  0c87:0880  d1e0             shl ax, 1                                
  0c87:0882  d1d3             rcl bx, 1                                
  0c87:0884  d1e0             shl ax, 1                                
  0c87:0886  d1d3             rcl bx, 1                                
  0c87:0888  d1e0             shl ax, 1                                
  0c87:088a  d1d3             rcl bx, 1                                
  0c87:088c  c47e0e           les di, ptr [bp + 0xe]                   
  0c87:088f  268905           mov word ptr es:[di], ax                 
  0c87:0892  26895d02         mov word ptr es:[di + 2], bx             
  0c87:0896  5f               pop di                                   
  0c87:0897  5e               pop si                                   
  0c87:0898  07               pop es                                   
  0c87:0899  8be5             mov sp, bp                               
  0c87:089b  5d               pop bp                                   
  0c87:089c  cb               retf                                     

proc_0c87_089d:
  0c87:089d  55               push bp                                  
  0c87:089e  8bec             mov bp, sp                               
  0c87:08a0  06               push es                                  
  0c87:08a1  56               push si                                  
  0c87:08a2  57               push di                                  
  0c87:08a3  c47e06           les di, ptr [bp + 6]                     
  0c87:08a6  06               push es                                  
  0c87:08a7  57               push di                                  
  0c87:08a8  0e               push cs                                  
  0c87:08a9  e8e8fd           call 0x694                               -> 0c87:0694
  0c87:08ac  83c404           add sp, 4                                
  0c87:08af  c47e06           les di, ptr [bp + 6]                     
  0c87:08b2  06               push es                                  
  0c87:08b3  c4460a           les ax, ptr [bp + 0xa]                   
  0c87:08b6  8cc2             mov dx, es                               
  0c87:08b8  07               pop es                                   
  0c87:08b9  8bc8             mov cx, ax                               
  0c87:08bb  0bca             or cx, dx                                
  0c87:08bd  7503             jne 0x8c2                                
  0c87:08bf  e96101           jmp 0xa23                                
  0c87:08c2  8cc3             mov bx, es                               
  0c87:08c4  8bc8             mov cx, ax                               
  0c87:08c6  d1ea             shr dx, 1                                
  0c87:08c8  d1d8             rcr ax, 1                                
  0c87:08ca  d1ea             shr dx, 1                                
  0c87:08cc  d1d8             rcr ax, 1                                
  0c87:08ce  d1ea             shr dx, 1                                
  0c87:08d0  d1d8             rcr ax, 1                                
  0c87:08d2  d1ea             shr dx, 1                                
  0c87:08d4  d1d8             rcr ax, 1                                
  0c87:08d6  83fa00           cmp dx, 0                                
  0c87:08d9  750b             jne 0x8e6                                
  0c87:08db  83e10f           and cx, 0xf                              
  0c87:08de  7403             je 0x8e3                                 
  0c87:08e0  40               inc ax                                   
  0c87:08e1  7203             jb 0x8e6                                 
  0c87:08e3  40               inc ax                                   
  0c87:08e4  7303             jae 0x8e9                                
  0c87:08e6  e93a01           jmp 0xa23                                
  0c87:08e9  8bd0             mov dx, ax                               
  0c87:08eb  268b4502         mov ax, word ptr es:[di + 2]             
  0c87:08ef  48               dec ax                                   
  0c87:08f0  8ec0             mov es, ax                               
  0c87:08f2  26a10200         mov ax, word ptr es:[2]                  
  0c87:08f6  3bc2             cmp ax, dx                               
  0c87:08f8  7208             jb 0x902                                 
  0c87:08fa  7403             je 0x8ff                                 
  0c87:08fc  e9c200           jmp 0x9c1                                
  0c87:08ff  e92601           jmp 0xa28                                
  0c87:0902  8cc3             mov bx, es                               
  0c87:0904  268b0e0200       mov cx, word ptr es:[2]                  
  0c87:0909  8cc0             mov ax, es                               
  0c87:090b  03c1             add ax, cx                               
  0c87:090d  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:0911  7460             je 0x973                                 
  0c87:0913  8ec0             mov es, ax                               
  0c87:0915  26f606080080     test byte ptr es:[8], 0x80               
  0c87:091b  7556             jne 0x973                                
  0c87:091d  26a10200         mov ax, word ptr es:[2]                  
  0c87:0921  03c1             add ax, cx                               
  0c87:0923  3bc2             cmp ax, dx                               
  0c87:0925  724c             jb 0x973                                 
  0c87:0927  770f             ja 0x938                                 
  0c87:0929  26a10200         mov ax, word ptr es:[2]                  
  0c87:092d  03c1             add ax, cx                               
  0c87:092f  8ec3             mov es, bx                               
  0c87:0931  26a30200         mov word ptr es:[2], ax                  
  0c87:0935  eb23             jmp 0x95a                                
  0c87:0937  90               nop                                      
  0c87:0938  2bc2             sub ax, dx                               
  0c87:093a  3d0100           cmp ax, 1                                
  0c87:093d  74ea             je 0x929                                 
  0c87:093f  891e9e0b         mov word ptr [0xb9e], bx                 
  0c87:0943  8ec3             mov es, bx                               
  0c87:0945  2689160200       mov word ptr es:[2], dx                  
  0c87:094a  03d3             add dx, bx                               
  0c87:094c  8ec2             mov es, dx                               
  0c87:094e  e835fd           call 0x686                               -> 0c87:0686
  0c87:0951  26891e0000       mov word ptr es:[0], bx                  
  0c87:0956  26a30200         mov word ptr es:[2], ax                  
  0c87:095a  8cc0             mov ax, es                               
  0c87:095c  8bd0             mov dx, ax                               
  0c87:095e  2603060200       add ax, word ptr es:[2]                  
  0c87:0963  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:0967  7407             je 0x970                                 
  0c87:0969  8ec0             mov es, ax                               
  0c87:096b  2689160000       mov word ptr es:[0], dx                  
  0c87:0970  e9b500           jmp 0xa28                                
  0c87:0973  53               push bx                                  
  0c87:0974  8bc2             mov ax, dx                               
  0c87:0976  e8bdfb           call 0x536                               -> 0c87:0536
  0c87:0979  7504             jne 0x97f                                
  0c87:097b  5b               pop bx                                   
  0c87:097c  e9a400           jmp 0xa23                                
  0c87:097f  8cc0             mov ax, es                               
  0c87:0981  a39e0b           mov word ptr [0xb9e], ax                 
  0c87:0984  58               pop ax                                   
  0c87:0985  1e               push ds                                  
  0c87:0986  8ed8             mov ds, ax                               
  0c87:0988  8b0e0200         mov cx, word ptr [2]                     
  0c87:098c  52               push dx                                  
  0c87:098d  33d2             xor dx, dx                               
  0c87:098f  d1e1             shl cx, 1                                
  0c87:0991  d1d2             rcl dx, 1                                
  0c87:0993  d1e1             shl cx, 1                                
  0c87:0995  d1d2             rcl dx, 1                                
  0c87:0997  d1e1             shl cx, 1                                
  0c87:0999  d1d2             rcl dx, 1                                
  0c87:099b  83c106           add cx, 6                                
  0c87:099e  83d200           adc dx, 0                                
  0c87:09a1  be0400           mov si, 4                                
  0c87:09a4  8bfe             mov di, si                               
  0c87:09a6  e83802           call 0xbe1                               -> 0c87:0be1
  0c87:09a9  5a               pop dx                                   
  0c87:09aa  8cc0             mov ax, es                               
  0c87:09ac  8cdb             mov bx, ds                               
  0c87:09ae  8ec3             mov es, bx                               
  0c87:09b0  1f               pop ds                                   
  0c87:09b1  50               push ax                                  
  0c87:09b2  e852fc           call 0x607                               -> 0c87:0607
  0c87:09b5  58               pop ax                                   
  0c87:09b6  c47e06           les di, ptr [bp + 6]                     
  0c87:09b9  40               inc ax                                   
  0c87:09ba  26894502         mov word ptr es:[di + 2], ax             
  0c87:09be  eb68             jmp 0xa28                                
  0c87:09c0  90               nop                                      
  0c87:09c1  2bc2             sub ax, dx                               
  0c87:09c3  3d0100           cmp ax, 1                                
  0c87:09c6  7460             je 0xa28                                 
  0c87:09c8  8bd0             mov dx, ax                               
  0c87:09ca  8cc3             mov bx, es                               
  0c87:09cc  891e9e0b         mov word ptr [0xb9e], bx                 
  0c87:09d0  268b0e0200       mov cx, word ptr es:[2]                  
  0c87:09d5  8cc0             mov ax, es                               
  0c87:09d7  03c1             add ax, cx                               
  0c87:09d9  2bca             sub cx, dx                               
  0c87:09db  26890e0200       mov word ptr es:[2], cx                  
  0c87:09e0  8ec0             mov es, ax                               
  0c87:09e2  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:09e6  7408             je 0x9f0                                 
  0c87:09e8  26f606080080     test byte ptr es:[8], 0x80               
  0c87:09ee  742c             je 0xa1c                                 
  0c87:09f0  8bc3             mov ax, bx                               
  0c87:09f2  03c1             add ax, cx                               
  0c87:09f4  8ec0             mov es, ax                               
  0c87:09f6  e88dfc           call 0x686                               -> 0c87:0686
  0c87:09f9  26891e0000       mov word ptr es:[0], bx                  
  0c87:09fe  2689160200       mov word ptr es:[2], dx                  
  0c87:0a03  8cc0             mov ax, es                               
  0c87:0a05  8bd0             mov dx, ax                               
  0c87:0a07  2603060200       add ax, word ptr es:[2]                  
  0c87:0a0c  3b06a00b         cmp ax, word ptr [0xba0]                 
  0c87:0a10  7407             je 0xa19                                 
  0c87:0a12  8ec0             mov es, ax                               
  0c87:0a14  2689160000       mov word ptr es:[0], dx                  
  0c87:0a19  eb0d             jmp 0xa28                                
  0c87:0a1b  90               nop                                      
  0c87:0a1c  2603160200       add dx, word ptr es:[2]                  
  0c87:0a21  ebcd             jmp 0x9f0                                
  0c87:0a23  33c0             xor ax, ax                               
  0c87:0a25  eb04             jmp 0xa2b                                
  0c87:0a27  90               nop                                      
  0c87:0a28  b8ffff           mov ax, 0xffff                           
  0c87:0a2b  5f               pop di                                   
  0c87:0a2c  5e               pop si                                   
  0c87:0a2d  07               pop es                                   
  0c87:0a2e  8be5             mov sp, bp                               
  0c87:0a30  5d               pop bp                                   
  0c87:0a31  cb               retf                                     

proc_0c87_0a32:
  0c87:0a32  55               push bp                                  
  0c87:0a33  8bec             mov bp, sp                               
  0c87:0a35  06               push es                                  
  0c87:0a36  57               push di                                  
  0c87:0a37  a1960b           mov ax, word ptr [0xb96]                 
  0c87:0a3a  c47e06           les di, ptr [bp + 6]                     
  0c87:0a3d  8cc2             mov dx, es                               
  0c87:0a3f  0bd7             or dx, di                                
  0c87:0a41  742f             je 0xa72                                 
  0c87:0a43  8cc2             mov dx, es                               
  0c87:0a45  8ec0             mov es, ax                               
  0c87:0a47  26893e0000       mov word ptr es:[0], di                  
  0c87:0a4c  2689160200       mov word ptr es:[2], dx                  
  0c87:0a51  33c0             xor ax, ax                               
  0c87:0a53  50               push ax                                  
  0c87:0a54  ff760a           push word ptr [bp + 0xa]                 
  0c87:0a57  06               push es                                  
  0c87:0a58  50               push ax                                  
  0c87:0a59  0e               push cs                                  
  0c87:0a5a  e840fe           call 0x89d                               -> 0c87:089d
  0c87:0a5d  83c408           add sp, 8                                
  0c87:0a60  a1960b           mov ax, word ptr [0xb96]                 
  0c87:0a63  26a10000         mov ax, word ptr es:[0]                  
  0c87:0a67  268b160200       mov dx, word ptr es:[2]                  
  0c87:0a6c  5f               pop di                                   
  0c87:0a6d  07               pop es                                   
  0c87:0a6e  8be5             mov sp, bp                               
  0c87:0a70  5d               pop bp                                   
  0c87:0a71  cb               retf                                     
  0c87:0a72  ff760a           push word ptr [bp + 0xa]                 
  0c87:0a75  0e               push cs                                  
  0c87:0a76  e856f7           call 0x1cf                               -> 0c87:01cf
  0c87:0a79  83c402           add sp, 2                                
  0c87:0a7c  ebee             jmp 0xa6c                                
  0c87:0a7e  833eb40b00       cmp word ptr [0xbb4], 0                  
  0c87:0a83  7502             jne 0xa87                                
  0c87:0a85  f9               stc                                      
  0c87:0a86  c3               ret                                      
  0c87:0a87  55               push bp                                  
  0c87:0a88  50               push ax                                  
  0c87:0a89  8b169e0b         mov dx, word ptr [0xb9e]                 
  0c87:0a8d  8bca             mov cx, dx                               
  0c87:0a8f  8ec2             mov es, dx                               
  0c87:0a91  33f6             xor si, si                               
  0c87:0a93  33ff             xor di, di                               
  0c87:0a95  26f606080080     test byte ptr es:[8], 0x80               
  0c87:0a9b  744d             je 0xaea                                 
  0c87:0a9d  26f606080020     test byte ptr es:[8], 0x20               
  0c87:0aa3  7545             jne 0xaea                                
  0c87:0aa5  06               push es                                  
  0c87:0aa6  268b1e0200       mov bx, word ptr es:[2]                  
  0c87:0aab  8cc2             mov dx, es                               
  0c87:0aad  03d3             add dx, bx                               
  0c87:0aaf  3b16a00b         cmp dx, word ptr [0xba0]                 
  0c87:0ab3  740f             je 0xac4                                 
  0c87:0ab5  8ec2             mov es, dx                               
  0c87:0ab7  26f606080080     test byte ptr es:[8], 0x80               
  0c87:0abd  7505             jne 0xac4                                
  0c87:0abf  26031e0200       add bx, word ptr es:[2]                  
  0c87:0ac4  07               pop es                                   
  0c87:0ac5  06               push es                                  
  0c87:0ac6  268b160000       mov dx, word ptr es:[0]                  
  0c87:0acb  83fa00           cmp dx, 0                                
  0c87:0ace  740d             je 0xadd                                 
  0c87:0ad0  26f606080080     test byte ptr es:[8], 0x80               
  0c87:0ad6  7505             jne 0xadd                                
  0c87:0ad8  26031e0200       add bx, word ptr es:[2]                  
  0c87:0add  07               pop es                                   
  0c87:0ade  3bc3             cmp ax, bx                               
  0c87:0ae0  7633             jbe 0xb15                                
  0c87:0ae2  3bde             cmp bx, si                               
  0c87:0ae4  7604             jbe 0xaea                                
  0c87:0ae6  8bf3             mov si, bx                               
  0c87:0ae8  8cc7             mov di, es                               
  0c87:0aea  8cc2             mov dx, es                               
  0c87:0aec  2603160200       add dx, word ptr es:[2]                  
  0c87:0af1  3b16a00b         cmp dx, word ptr [0xba0]                 
  0c87:0af5  7504             jne 0xafb                                
  0c87:0af7  8b169c0b         mov dx, word ptr [0xb9c]                 
  0c87:0afb  3bd1             cmp dx, cx                               
  0c87:0afd  7404             je 0xb03                                 
  0c87:0aff  8ec2             mov es, dx                               
  0c87:0b01  eb92             jmp 0xa95                                
  0c87:0b03  83fe00           cmp si, 0                                
  0c87:0b06  7504             jne 0xb0c                                
  0c87:0b08  58               pop ax                                   
  0c87:0b09  5d               pop bp                                   
  0c87:0b0a  f9               stc                                      
  0c87:0b0b  c3               ret                                      
  0c87:0b0c  58               pop ax                                   
  0c87:0b0d  2bc6             sub ax, si                               
  0c87:0b0f  50               push ax                                  
  0c87:0b10  8ec7             mov es, di                               
  0c87:0b12  eb04             jmp 0xb18                                
  0c87:0b14  90               nop                                      
  0c87:0b15  be0000           mov si, 0                                
  0c87:0b18  56               push si                                  
  0c87:0b19  26a10200         mov ax, word ptr es:[2]                  
  0c87:0b1d  50               push ax                                  
  0c87:0b1e  b105             mov cl, 5                                
  0c87:0b20  d3f8             sar ax, cl                               
  0c87:0b22  59               pop cx                                   
  0c87:0b23  80e11f           and cl, 0x1f                             
  0c87:0b26  7401             je 0xb29                                 
  0c87:0b28  40               inc ax                                   
  0c87:0b29  bbb40b           mov bx, 0xbb4                            
  0c87:0b2c  b200             mov dl, 0                                
  0c87:0b2e  8b37             mov si, word ptr [bx]                    
  0c87:0b30  83fe00           cmp si, 0                                
  0c87:0b33  7446             je 0xb7b                                 
  0c87:0b35  39440c           cmp word ptr [si + 0xc], ax              
  0c87:0b38  7d07             jge 0xb41                                
  0c87:0b3a  83c302           add bx, 2                                
  0c87:0b3d  fec2             inc dl                                   
  0c87:0b3f  ebed             jmp 0xb2e                                
  0c87:0b41  06               push es                                  
  0c87:0b42  52               push dx                                  
  0c87:0b43  ff5402           call word ptr [si + 2]                   
  0c87:0b46  5a               pop dx                                   
  0c87:0b47  07               pop es                                   
  0c87:0b48  06               push es                                  
  0c87:0b49  268b0e0200       mov cx, word ptr es:[2]                  
  0c87:0b4e  268b3e0400       mov di, word ptr es:[4]                  
  0c87:0b53  a1960b           mov ax, word ptr [0xb96]                 
  0c87:0b56  8ec0             mov es, ax                               
  0c87:0b58  26804d0408       or byte ptr es:[di + 4], 8               
  0c87:0b5d  26806504f8       and byte ptr es:[di + 4], 0xf8           
  0c87:0b62  26085504         or byte ptr es:[di + 4], dl              
  0c87:0b66  26892d           mov word ptr es:[di], bp                 
  0c87:0b69  26894d02         mov word ptr es:[di + 2], cx             
  0c87:0b6d  07               pop es                                   
  0c87:0b6e  e896fa           call 0x607                               -> 0c87:0607
  0c87:0b71  5e               pop si                                   
  0c87:0b72  58               pop ax                                   
  0c87:0b73  83fe00           cmp si, 0                                
  0c87:0b76  7408             je 0xb80                                 
  0c87:0b78  e90dff           jmp 0xa88                                
  0c87:0b7b  5e               pop si                                   
  0c87:0b7c  58               pop ax                                   
  0c87:0b7d  5d               pop bp                                   
  0c87:0b7e  f9               stc                                      
  0c87:0b7f  c3               ret                                      
  0c87:0b80  5d               pop bp                                   
  0c87:0b81  f8               clc                                      
  0c87:0b82  c3               ret                                      
  0c87:0b83  53               push bx                                  
  0c87:0b84  89440e           mov word ptr [si + 0xe], ax              
  0c87:0b87  8b5c0a           mov bx, word ptr [si + 0xa]              
  0c87:0b8a  b104             mov cl, 4                                
  0c87:0b8c  d3eb             shr bx, cl                               
  0c87:0b8e  03d8             add bx, ax                               
  0c87:0b90  53               push bx                                  
  0c87:0b91  8b440e           mov ax, word ptr [si + 0xe]              
  0c87:0b94  8ec0             mov es, ax                               
  0c87:0b96  8b4c0a           mov cx, word ptr [si + 0xa]              
  0c87:0b99  d1e9             shr cx, 1                                
  0c87:0b9b  b8ffff           mov ax, 0xffff                           
  0c87:0b9e  33ff             xor di, di                               
  0c87:0ba0  f3ab             rep stosw word ptr es:[di], ax           
  0c87:0ba2  58               pop ax                                   
  0c87:0ba3  5b               pop bx                                   
  0c87:0ba4  c3               ret                                      
  0c87:0ba5  8b440e           mov ax, word ptr [si + 0xe]              
  0c87:0ba8  8ec0             mov es, ax                               
  0c87:0baa  268b07           mov ax, word ptr es:[bx]                 
  0c87:0bad  26c707ffff       mov word ptr es:[bx], 0xffff             
  0c87:0bb2  ff440c           inc word ptr [si + 0xc]                  
  0c87:0bb5  3dfeff           cmp ax, 0xfffe                           
  0c87:0bb8  7404             je 0xbbe                                 
  0c87:0bba  8bd8             mov bx, ax                               
  0c87:0bbc  ebec             jmp 0xbaa                                
  0c87:0bbe  c3               ret                                      
  0c87:0bbf  06               push es                                  
  0c87:0bc0  56               push si                                  
  0c87:0bc1  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0bc4  8ec0             mov es, ax                               
  0c87:0bc6  33f6             xor si, si                               
  0c87:0bc8  b9ffff           mov cx, 0xffff                           
  0c87:0bcb  8b570a           mov dx, word ptr [bx + 0xa]              
  0c87:0bce  26390c           cmp word ptr es:[si], cx                 
  0c87:0bd1  7406             je 0xbd9                                 
  0c87:0bd3  46               inc si                                   
  0c87:0bd4  46               inc si                                   
  0c87:0bd5  3bd6             cmp dx, si                               
  0c87:0bd7  75f5             jne 0xbce                                
  0c87:0bd9  8bd6             mov dx, si                               
  0c87:0bdb  ff4f0c           dec word ptr [bx + 0xc]                  
  0c87:0bde  5e               pop si                                   
  0c87:0bdf  07               pop es                                   
  0c87:0be0  c3               ret                                      
  0c87:0be1  06               push es                                  
  0c87:0be2  1e               push ds                                  
  0c87:0be3  53               push bx                                  
  0c87:0be4  8bd9             mov bx, cx                               
  0c87:0be6  83fa00           cmp dx, 0                                
  0c87:0be9  751d             jne 0xc08                                
  0c87:0beb  81fbf87f         cmp bx, 0x7ff8                           
  0c87:0bef  7717             ja 0xc08                                 
  0c87:0bf1  8bcb             mov cx, bx                               
  0c87:0bf3  f6c101           test cl, 1                               
  0c87:0bf6  7407             je 0xbff                                 
  0c87:0bf8  90               nop                                      
  0c87:0bf9  90               nop                                      
  0c87:0bfa  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0c87:0bfc  eb06             jmp 0xc04                                
  0c87:0bfe  90               nop                                      
  0c87:0bff  d1c9             ror cx, 1                                
  0c87:0c01  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0c87:0c04  5b               pop bx                                   
  0c87:0c05  1f               pop ds                                   
  0c87:0c06  07               pop es                                   
  0c87:0c07  c3               ret                                      
  0c87:0c08  56               push si                                  
  0c87:0c09  57               push di                                  
  0c87:0c0a  b9f87f           mov cx, 0x7ff8                           
  0c87:0c0d  d1c9             ror cx, 1                                
  0c87:0c0f  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0c87:0c12  8cd8             mov ax, ds                               
  0c87:0c14  05ff0f           add ax, 0xfff                            
  0c87:0c17  8ed8             mov ds, ax                               
  0c87:0c19  8cc0             mov ax, es                               
  0c87:0c1b  05ff0f           add ax, 0xfff                            
  0c87:0c1e  8ec0             mov es, ax                               
  0c87:0c20  81ebf87f         sub bx, 0x7ff8                           
  0c87:0c24  83da00           sbb dx, 0                                
  0c87:0c27  5f               pop di                                   
  0c87:0c28  5e               pop si                                   
  0c87:0c29  ebbb             jmp 0xbe6                                
  0c87:0c2b  005657           add byte ptr [bp + 0x57], dl             
  0c87:0c2e  8bf3             mov si, bx                               
  0c87:0c30  8bf8             mov di, ax                               
  0c87:0c32  8bca             mov cx, dx                               
  0c87:0c34  b442             mov ah, 0x42                             
  0c87:0c36  cd67             int 0x67                                 
  0c87:0c38  3bdf             cmp bx, di                               
  0c87:0c3a  7c22             jl 0xc5e                                 
  0c87:0c3c  8bc1             mov ax, cx                               
  0c87:0c3e  3bc3             cmp ax, bx                               
  0c87:0c40  7202             jb 0xc44                                 
  0c87:0c42  8bc3             mov ax, bx                               
  0c87:0c44  8bd8             mov bx, ax                               
  0c87:0c46  b105             mov cl, 5                                
  0c87:0c48  d3e0             shl ax, cl                               
  0c87:0c4a  89440c           mov word ptr [si + 0xc], ax              
  0c87:0c4d  d1e0             shl ax, 1                                
  0c87:0c4f  89440a           mov word ptr [si + 0xa], ax              
  0c87:0c52  b443             mov ah, 0x43                             
  0c87:0c54  cd67             int 0x67                                 
  0c87:0c56  8916d90b         mov word ptr [0xbd9], dx                 
  0c87:0c5a  f8               clc                                      
  0c87:0c5b  eb02             jmp 0xc5f                                
  0c87:0c5d  90               nop                                      
  0c87:0c5e  f9               stc                                      
  0c87:0c5f  8bde             mov bx, si                               
  0c87:0c61  5f               pop di                                   
  0c87:0c62  5e               pop si                                   
  0c87:0c63  c3               ret                                      
  0c87:0c64  8b16d90b         mov dx, word ptr [0xbd9]                 
  0c87:0c68  b445             mov ah, 0x45                             
  0c87:0c6a  cd67             int 0x67                                 
  0c87:0c6c  c3               ret                                      
  0c87:0c6d  268b160200       mov dx, word ptr es:[2]                  
  0c87:0c72  4a               dec dx                                   
  0c87:0c73  8916dd0b         mov word ptr [0xbdd], dx                 
  0c87:0c77  8bde             mov bx, si                               
  0c87:0c79  8cc0             mov ax, es                               
  0c87:0c7b  40               inc ax                                   
  0c87:0c7c  8ec0             mov es, ax                               
  0c87:0c7e  bfffff           mov di, 0xffff                           
  0c87:0c81  e83bff           call 0xbbf                               -> 0c87:0bbf
  0c87:0c84  83ffff           cmp di, -1                               
  0c87:0c87  740d             je 0xc96                                 
  0c87:0c89  06               push es                                  
  0c87:0c8a  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0c8d  8ec0             mov es, ax                               
  0c87:0c8f  268915           mov word ptr es:[di], dx                 
  0c87:0c92  07               pop es                                   
  0c87:0c93  eb03             jmp 0xc98                                
  0c87:0c95  90               nop                                      
  0c87:0c96  8bea             mov bp, dx                               
  0c87:0c98  b92000           mov cx, 0x20                             
  0c87:0c9b  3b0edd0b         cmp cx, word ptr [0xbdd]                 
  0c87:0c9f  7204             jb 0xca5                                 
  0c87:0ca1  8b0edd0b         mov cx, word ptr [0xbdd]                 
  0c87:0ca5  33f6             xor si, si                               
  0c87:0ca7  1e               push ds                                  
  0c87:0ca8  06               push es                                  
  0c87:0ca9  e87e00           call 0xd2a                               -> 0c87:0d2a
  0c87:0cac  1f               pop ds                                   
  0c87:0cad  51               push cx                                  
  0c87:0cae  d1e1             shl cx, 1                                
  0c87:0cb0  d1e1             shl cx, 1                                
  0c87:0cb2  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0c87:0cb5  59               pop cx                                   
  0c87:0cb6  1e               push ds                                  
  0c87:0cb7  58               pop ax                                   
  0c87:0cb8  03c1             add ax, cx                               
  0c87:0cba  8ec0             mov es, ax                               
  0c87:0cbc  1f               pop ds                                   
  0c87:0cbd  290edd0b         sub word ptr [0xbdd], cx                 
  0c87:0cc1  8bfa             mov di, dx                               
  0c87:0cc3  06               push es                                  
  0c87:0cc4  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0cc7  8ec0             mov es, ax                               
  0c87:0cc9  26c705feff       mov word ptr es:[di], 0xfffe             
  0c87:0cce  07               pop es                                   
  0c87:0ccf  75b0             jne 0xc81                                
  0c87:0cd1  c3               ret                                      
  0c87:0cd2  4a               dec dx                                   
  0c87:0cd3  8916dd0b         mov word ptr [0xbdd], dx                 
  0c87:0cd7  8bd3             mov dx, bx                               
  0c87:0cd9  8bde             mov bx, si                               
  0c87:0cdb  8cc0             mov ax, es                               
  0c87:0cdd  40               inc ax                                   
  0c87:0cde  8ec0             mov es, ax                               
  0c87:0ce0  06               push es                                  
  0c87:0ce1  b92000           mov cx, 0x20                             
  0c87:0ce4  3b0edd0b         cmp cx, word ptr [0xbdd]                 
  0c87:0ce8  7204             jb 0xcee                                 
  0c87:0cea  8b0edd0b         mov cx, word ptr [0xbdd]                 
  0c87:0cee  06               push es                                  
  0c87:0cef  1e               push ds                                  
  0c87:0cf0  06               push es                                  
  0c87:0cf1  e83600           call 0xd2a                               -> 0c87:0d2a
  0c87:0cf4  8cc0             mov ax, es                               
  0c87:0cf6  8ed8             mov ds, ax                               
  0c87:0cf8  8bf7             mov si, di                               
  0c87:0cfa  07               pop es                                   
  0c87:0cfb  51               push cx                                  
  0c87:0cfc  d1e1             shl cx, 1                                
  0c87:0cfe  d1e1             shl cx, 1                                
  0c87:0d00  33ff             xor di, di                               
  0c87:0d02  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0c87:0d05  59               pop cx                                   
  0c87:0d06  1f               pop ds                                   
  0c87:0d07  58               pop ax                                   
  0c87:0d08  03c1             add ax, cx                               
  0c87:0d0a  50               push ax                                  
  0c87:0d0b  290edd0b         sub word ptr [0xbdd], cx                 
  0c87:0d0f  9c               pushf                                    
  0c87:0d10  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0d13  8ec0             mov es, ax                               
  0c87:0d15  8bf2             mov si, dx                               
  0c87:0d17  268b0c           mov cx, word ptr es:[si]                 
  0c87:0d1a  26c704ffff       mov word ptr es:[si], 0xffff             
  0c87:0d1f  ff470c           inc word ptr [bx + 0xc]                  
  0c87:0d22  8bd1             mov dx, cx                               
  0c87:0d24  9d               popf                                     
  0c87:0d25  07               pop es                                   
  0c87:0d26  75b9             jne 0xce1                                
  0c87:0d28  07               pop es                                   
  0c87:0d29  c3               ret                                      
  0c87:0d2a  52               push dx                                  
  0c87:0d2b  51               push cx                                  
  0c87:0d2c  53               push bx                                  
  0c87:0d2d  52               push dx                                  
  0c87:0d2e  8bda             mov bx, dx                               
  0c87:0d30  8b16d90b         mov dx, word ptr [0xbd9]                 
  0c87:0d34  b80044           mov ax, 0x4400                           
  0c87:0d37  b106             mov cl, 6                                
  0c87:0d39  d3eb             shr bx, cl                               
  0c87:0d3b  cd67             int 0x67                                 
  0c87:0d3d  a1db0b           mov ax, word ptr [0xbdb]                 
  0c87:0d40  8ec0             mov es, ax                               
  0c87:0d42  5f               pop di                                   
  0c87:0d43  83e73f           and di, 0x3f                             
  0c87:0d46  b108             mov cl, 8                                
  0c87:0d48  d3e7             shl di, cl                               
  0c87:0d4a  5b               pop bx                                   
  0c87:0d4b  59               pop cx                                   
  0c87:0d4c  5a               pop dx                                   
  0c87:0d4d  c3               ret                                      
  0c87:0d4e  53               push bx                                  
  0c87:0d4f  bace0b           mov dx, 0xbce                             ; "EMMXXXX0"
  0c87:0d52  b8003d           mov ax, 0x3d00                           
  0c87:0d55  cd21             int 0x21                                 
  0c87:0d57  7234             jb 0xd8d                                 
  0c87:0d59  8bd8             mov bx, ax                               
  0c87:0d5b  b80044           mov ax, 0x4400                           
  0c87:0d5e  cd21             int 0x21                                 
  0c87:0d60  7227             jb 0xd89                                 
  0c87:0d62  81e28000         and dx, 0x80                             
  0c87:0d66  7421             je 0xd89                                 
  0c87:0d68  b80744           mov ax, 0x4407                           
  0c87:0d6b  cd21             int 0x21                                 
  0c87:0d6d  721a             jb 0xd89                                 
  0c87:0d6f  0ac0             or al, al                                
  0c87:0d71  7416             je 0xd89                                 
  0c87:0d73  b43e             mov ah, 0x3e                             
  0c87:0d75  cd21             int 0x21                                 
  0c87:0d77  7210             jb 0xd89                                 
  0c87:0d79  b441             mov ah, 0x41                             
  0c87:0d7b  cd67             int 0x67                                 
  0c87:0d7d  80fc00           cmp ah, 0                                
  0c87:0d80  750b             jne 0xd8d                                
  0c87:0d82  891edb0b         mov word ptr [0xbdb], bx                 
  0c87:0d86  f8               clc                                      
  0c87:0d87  5b               pop bx                                   
  0c87:0d88  c3               ret                                      
  0c87:0d89  b43e             mov ah, 0x3e                             
  0c87:0d8b  cd21             int 0x21                                 
  0c87:0d8d  f9               stc                                      
  0c87:0d8e  5b               pop bx                                   
  0c87:0d8f  c3               ret                                      
  0c87:0d90  8bc2             mov ax, dx                               
  0c87:0d92  b105             mov cl, 5                                
  0c87:0d94  d3e0             shl ax, cl                               
  0c87:0d96  89470c           mov word ptr [bx + 0xc], ax              
  0c87:0d99  d1e0             shl ax, 1                                
  0c87:0d9b  89470a           mov word ptr [bx + 0xa], ax              
  0c87:0d9e  f8               clc                                      
  0c87:0d9f  c3               ret                                      
  0c87:0da0  53               push bx                                  
  0c87:0da1  8b1ef40b         mov bx, word ptr [0xbf4]                 
  0c87:0da5  b43e             mov ah, 0x3e                             
  0c87:0da7  cd21             int 0x21                                 
  0c87:0da9  5b               pop bx                                   
  0c87:0daa  c3               ret                                      
  0c87:0dab  268b160200       mov dx, word ptr es:[2]                  
  0c87:0db0  4a               dec dx                                   
  0c87:0db1  8916f60b         mov word ptr [0xbf6], dx                 
  0c87:0db5  8bde             mov bx, si                               
  0c87:0db7  8cc0             mov ax, es                               
  0c87:0db9  40               inc ax                                   
  0c87:0dba  8ec0             mov es, ax                               
  0c87:0dbc  bfffff           mov di, 0xffff                           
  0c87:0dbf  e8fdfd           call 0xbbf                               -> 0c87:0bbf
  0c87:0dc2  83ffff           cmp di, -1                               
  0c87:0dc5  740d             je 0xdd4                                 
  0c87:0dc7  06               push es                                  
  0c87:0dc8  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0dcb  8ec0             mov es, ax                               
  0c87:0dcd  268915           mov word ptr es:[di], dx                 
  0c87:0dd0  07               pop es                                   
  0c87:0dd1  eb03             jmp 0xdd6                                
  0c87:0dd3  90               nop                                      
  0c87:0dd4  8bea             mov bp, dx                               
  0c87:0dd6  b92000           mov cx, 0x20                             
  0c87:0dd9  3b0ef60b         cmp cx, word ptr [0xbf6]                 
  0c87:0ddd  7204             jb 0xde3                                 
  0c87:0ddf  8b0ef60b         mov cx, word ptr [0xbf6]                 
  0c87:0de3  51               push cx                                  
  0c87:0de4  d1e1             shl cx, 1                                
  0c87:0de6  d1e1             shl cx, 1                                
  0c87:0de8  d1e1             shl cx, 1                                
  0c87:0dea  d1e1             shl cx, 1                                
  0c87:0dec  53               push bx                                  
  0c87:0ded  51               push cx                                  
  0c87:0dee  52               push dx                                  
  0c87:0def  e88a00           call 0xe7c                               -> 0c87:0e7c
  0c87:0df2  1e               push ds                                  
  0c87:0df3  8cc0             mov ax, es                               
  0c87:0df5  8ed8             mov ds, ax                               
  0c87:0df7  33d2             xor dx, dx                               
  0c87:0df9  b440             mov ah, 0x40                             
  0c87:0dfb  cd21             int 0x21                                 
  0c87:0dfd  1f               pop ds                                   
  0c87:0dfe  5a               pop dx                                   
  0c87:0dff  59               pop cx                                   
  0c87:0e00  5b               pop bx                                   
  0c87:0e01  59               pop cx                                   
  0c87:0e02  8cc0             mov ax, es                               
  0c87:0e04  03c1             add ax, cx                               
  0c87:0e06  8ec0             mov es, ax                               
  0c87:0e08  290ef60b         sub word ptr [0xbf6], cx                 
  0c87:0e0c  8bfa             mov di, dx                               
  0c87:0e0e  06               push es                                  
  0c87:0e0f  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0e12  8ec0             mov es, ax                               
  0c87:0e14  26c705feff       mov word ptr es:[di], 0xfffe             
  0c87:0e19  07               pop es                                   
  0c87:0e1a  75a3             jne 0xdbf                                
  0c87:0e1c  c3               ret                                      
  0c87:0e1d  4a               dec dx                                   
  0c87:0e1e  8916f60b         mov word ptr [0xbf6], dx                 
  0c87:0e22  53               push bx                                  
  0c87:0e23  56               push si                                  
  0c87:0e24  5b               pop bx                                   
  0c87:0e25  5e               pop si                                   
  0c87:0e26  8cc0             mov ax, es                               
  0c87:0e28  40               inc ax                                   
  0c87:0e29  8ec0             mov es, ax                               
  0c87:0e2b  06               push es                                  
  0c87:0e2c  b92000           mov cx, 0x20                             
  0c87:0e2f  3b0ef60b         cmp cx, word ptr [0xbf6]                 
  0c87:0e33  7204             jb 0xe39                                 
  0c87:0e35  8b0ef60b         mov cx, word ptr [0xbf6]                 
  0c87:0e39  51               push cx                                  
  0c87:0e3a  d1e1             shl cx, 1                                
  0c87:0e3c  d1e1             shl cx, 1                                
  0c87:0e3e  d1e1             shl cx, 1                                
  0c87:0e40  d1e1             shl cx, 1                                
  0c87:0e42  53               push bx                                  
  0c87:0e43  51               push cx                                  
  0c87:0e44  8bd6             mov dx, si                               
  0c87:0e46  e83300           call 0xe7c                               -> 0c87:0e7c
  0c87:0e49  1e               push ds                                  
  0c87:0e4a  8cc0             mov ax, es                               
  0c87:0e4c  8ed8             mov ds, ax                               
  0c87:0e4e  33d2             xor dx, dx                               
  0c87:0e50  b43f             mov ah, 0x3f                             
  0c87:0e52  cd21             int 0x21                                 
  0c87:0e54  1f               pop ds                                   
  0c87:0e55  59               pop cx                                   
  0c87:0e56  5b               pop bx                                   
  0c87:0e57  59               pop cx                                   
  0c87:0e58  8cc0             mov ax, es                               
  0c87:0e5a  03c1             add ax, cx                               
  0c87:0e5c  8ec0             mov es, ax                               
  0c87:0e5e  290ef60b         sub word ptr [0xbf6], cx                 
  0c87:0e62  9c               pushf                                    
  0c87:0e63  06               push es                                  
  0c87:0e64  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0e67  8ec0             mov es, ax                               
  0c87:0e69  268b04           mov ax, word ptr es:[si]                 
  0c87:0e6c  26c704ffff       mov word ptr es:[si], 0xffff             
  0c87:0e71  ff470c           inc word ptr [bx + 0xc]                  
  0c87:0e74  8bf0             mov si, ax                               
  0c87:0e76  07               pop es                                   
  0c87:0e77  9d               popf                                     
  0c87:0e78  75b2             jne 0xe2c                                
  0c87:0e7a  07               pop es                                   
  0c87:0e7b  c3               ret                                      
  0c87:0e7c  51               push cx                                  
  0c87:0e7d  52               push dx                                  
  0c87:0e7e  33c9             xor cx, cx                               
  0c87:0e80  d1e2             shl dx, 1                                
  0c87:0e82  d1d1             rcl cx, 1                                
  0c87:0e84  d1e2             shl dx, 1                                
  0c87:0e86  d1d1             rcl cx, 1                                
  0c87:0e88  d1e2             shl dx, 1                                
  0c87:0e8a  d1d1             rcl cx, 1                                
  0c87:0e8c  d1e2             shl dx, 1                                
  0c87:0e8e  d1d1             rcl cx, 1                                
  0c87:0e90  d1e2             shl dx, 1                                
  0c87:0e92  d1d1             rcl cx, 1                                
  0c87:0e94  d1e2             shl dx, 1                                
  0c87:0e96  d1d1             rcl cx, 1                                
  0c87:0e98  d1e2             shl dx, 1                                
  0c87:0e9a  d1d1             rcl cx, 1                                
  0c87:0e9c  d1e2             shl dx, 1                                
  0c87:0e9e  d1d1             rcl cx, 1                                
  0c87:0ea0  8b1ef40b         mov bx, word ptr [0xbf4]                 
  0c87:0ea4  b80042           mov ax, 0x4200                           
  0c87:0ea7  cd21             int 0x21                                 
  0c87:0ea9  5a               pop dx                                   
  0c87:0eaa  59               pop cx                                   
  0c87:0eab  c3               ret                                      
  0c87:0eac  1e               push ds                                  
  0c87:0ead  c516f00b         lds dx, ptr [0xbf0]                      
  0c87:0eb1  b8023d           mov ax, 0x3d02                           
  0c87:0eb4  cd21             int 0x21                                 
  0c87:0eb6  1f               pop ds                                   
  0c87:0eb7  a3f40b           mov word ptr [0xbf4], ax                 
  0c87:0eba  c3               ret                                      
  0c87:0ebb  005657           add byte ptr [bp + 0x57], dl             
  0c87:0ebe  8bf3             mov si, bx                               
  0c87:0ec0  8bf8             mov di, ax                               
  0c87:0ec2  52               push dx                                  
  0c87:0ec3  b408             mov ah, 8                                
  0c87:0ec5  53               push bx                                  
  0c87:0ec6  ff1e0e0c         lcall [0xc0e]                            
  0c87:0eca  5b               pop bx                                   
  0c87:0ecb  5a               pop dx                                   
  0c87:0ecc  b104             mov cl, 4                                
  0c87:0ece  d3f8             sar ax, cl                               
  0c87:0ed0  3bc7             cmp ax, di                               
  0c87:0ed2  722f             jb 0xf03                                 
  0c87:0ed4  3bc2             cmp ax, dx                               
  0c87:0ed6  7202             jb 0xeda                                 
  0c87:0ed8  8bc2             mov ax, dx                               
  0c87:0eda  8bd8             mov bx, ax                               
  0c87:0edc  b105             mov cl, 5                                
  0c87:0ede  d3e0             shl ax, cl                               
  0c87:0ee0  89440c           mov word ptr [si + 0xc], ax              
  0c87:0ee3  d1e0             shl ax, 1                                
  0c87:0ee5  89440a           mov word ptr [si + 0xa], ax              
  0c87:0ee8  d1f8             sar ax, 1                                
  0c87:0eea  d1f8             sar ax, 1                                
  0c87:0eec  8bd0             mov dx, ax                               
  0c87:0eee  b409             mov ah, 9                                
  0c87:0ef0  53               push bx                                  
  0c87:0ef1  ff1e0e0c         lcall [0xc0e]                            
  0c87:0ef5  5b               pop bx                                   
  0c87:0ef6  3d0000           cmp ax, 0                                
  0c87:0ef9  7408             je 0xf03                                 
  0c87:0efb  89160a0c         mov word ptr [0xc0a], dx                 
  0c87:0eff  f8               clc                                      
  0c87:0f00  eb02             jmp 0xf04                                
  0c87:0f02  90               nop                                      
  0c87:0f03  f9               stc                                      
  0c87:0f04  8bde             mov bx, si                               
  0c87:0f06  5f               pop di                                   
  0c87:0f07  5e               pop si                                   
  0c87:0f08  c3               ret                                      
  0c87:0f09  8b160a0c         mov dx, word ptr [0xc0a]                 
  0c87:0f0d  b40a             mov ah, 0xa                              
  0c87:0f0f  ff1e0e0c         lcall [0xc0e]                            
  0c87:0f13  c3               ret                                      
  0c87:0f14  c706140c0000     mov word ptr [0xc14], 0                  
  0c87:0f1a  c706160c0000     mov word ptr [0xc16], 0                  
  0c87:0f20  a10a0c           mov ax, word ptr [0xc0a]                 
  0c87:0f23  a31c0c           mov word ptr [0xc1c], ax                 
  0c87:0f26  268b160200       mov dx, word ptr es:[2]                  
  0c87:0f2b  4a               dec dx                                   
  0c87:0f2c  8916220c         mov word ptr [0xc22], dx                 
  0c87:0f30  8bde             mov bx, si                               
  0c87:0f32  8cc0             mov ax, es                               
  0c87:0f34  40               inc ax                                   
  0c87:0f35  a31a0c           mov word ptr [0xc1a], ax                 
  0c87:0f38  c706180c0000     mov word ptr [0xc18], 0                  
  0c87:0f3e  bfffff           mov di, 0xffff                           
  0c87:0f41  e87bfc           call 0xbbf                               -> 0c87:0bbf
  0c87:0f44  83ffff           cmp di, -1                               
  0c87:0f47  740b             je 0xf54                                 
  0c87:0f49  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0f4c  8ec0             mov es, ax                               
  0c87:0f4e  268915           mov word ptr es:[di], dx                 
  0c87:0f51  eb03             jmp 0xf56                                
  0c87:0f53  90               nop                                      
  0c87:0f54  8bea             mov bp, dx                               
  0c87:0f56  52               push dx                                  
  0c87:0f57  33c9             xor cx, cx                               
  0c87:0f59  d1e2             shl dx, 1                                
  0c87:0f5b  d1d1             rcl cx, 1                                
  0c87:0f5d  d1e2             shl dx, 1                                
  0c87:0f5f  d1d1             rcl cx, 1                                
  0c87:0f61  d1e2             shl dx, 1                                
  0c87:0f63  d1d1             rcl cx, 1                                
  0c87:0f65  d1e2             shl dx, 1                                
  0c87:0f67  d1d1             rcl cx, 1                                
  0c87:0f69  d1e2             shl dx, 1                                
  0c87:0f6b  d1d1             rcl cx, 1                                
  0c87:0f6d  d1e2             shl dx, 1                                
  0c87:0f6f  d1d1             rcl cx, 1                                
  0c87:0f71  d1e2             shl dx, 1                                
  0c87:0f73  d1d1             rcl cx, 1                                
  0c87:0f75  d1e2             shl dx, 1                                
  0c87:0f77  d1d1             rcl cx, 1                                
  0c87:0f79  89161e0c         mov word ptr [0xc1e], dx                 
  0c87:0f7d  890e200c         mov word ptr [0xc20], cx                 
  0c87:0f81  b92000           mov cx, 0x20                             
  0c87:0f84  3b0e220c         cmp cx, word ptr [0xc22]                 
  0c87:0f88  7204             jb 0xf8e                                 
  0c87:0f8a  8b0e220c         mov cx, word ptr [0xc22]                 
  0c87:0f8e  51               push cx                                  
  0c87:0f8f  d1e1             shl cx, 1                                
  0c87:0f91  d1e1             shl cx, 1                                
  0c87:0f93  d1e1             shl cx, 1                                
  0c87:0f95  d1e1             shl cx, 1                                
  0c87:0f97  890e120c         mov word ptr [0xc12], cx                 
  0c87:0f9b  b40b             mov ah, 0xb                              
  0c87:0f9d  be120c           mov si, 0xc12                            
  0c87:0fa0  53               push bx                                  
  0c87:0fa1  ff1e0e0c         lcall [0xc0e]                            
  0c87:0fa5  5b               pop bx                                   
  0c87:0fa6  59               pop cx                                   
  0c87:0fa7  5a               pop dx                                   
  0c87:0fa8  010e1a0c         add word ptr [0xc1a], cx                 
  0c87:0fac  290e220c         sub word ptr [0xc22], cx                 
  0c87:0fb0  8bfa             mov di, dx                               
  0c87:0fb2  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:0fb5  8ec0             mov es, ax                               
  0c87:0fb7  26c705feff       mov word ptr es:[di], 0xfffe             
  0c87:0fbc  7583             jne 0xf41                                
  0c87:0fbe  c3               ret                                      
  0c87:0fbf  c706140c0000     mov word ptr [0xc14], 0                  
  0c87:0fc5  c7061c0c0000     mov word ptr [0xc1c], 0                  
  0c87:0fcb  a10a0c           mov ax, word ptr [0xc0a]                 
  0c87:0fce  a3160c           mov word ptr [0xc16], ax                 
  0c87:0fd1  4a               dec dx                                   
  0c87:0fd2  8916220c         mov word ptr [0xc22], dx                 
  0c87:0fd6  8bd3             mov dx, bx                               
  0c87:0fd8  8bde             mov bx, si                               
  0c87:0fda  8cc0             mov ax, es                               
  0c87:0fdc  40               inc ax                                   
  0c87:0fdd  50               push ax                                  
  0c87:0fde  a3200c           mov word ptr [0xc20], ax                 
  0c87:0fe1  c7061e0c0000     mov word ptr [0xc1e], 0                  
  0c87:0fe7  52               push dx                                  
  0c87:0fe8  33c9             xor cx, cx                               
  0c87:0fea  d1e2             shl dx, 1                                
  0c87:0fec  d1d1             rcl cx, 1                                
  0c87:0fee  d1e2             shl dx, 1                                
  0c87:0ff0  d1d1             rcl cx, 1                                
  0c87:0ff2  d1e2             shl dx, 1                                
  0c87:0ff4  d1d1             rcl cx, 1                                
  0c87:0ff6  d1e2             shl dx, 1                                
  0c87:0ff8  d1d1             rcl cx, 1                                
  0c87:0ffa  d1e2             shl dx, 1                                
  0c87:0ffc  d1d1             rcl cx, 1                                
  0c87:0ffe  d1e2             shl dx, 1                                
  0c87:1000  d1d1             rcl cx, 1                                
  0c87:1002  d1e2             shl dx, 1                                
  0c87:1004  d1d1             rcl cx, 1                                
  0c87:1006  d1e2             shl dx, 1                                
  0c87:1008  d1d1             rcl cx, 1                                
  0c87:100a  8916180c         mov word ptr [0xc18], dx                 
  0c87:100e  890e1a0c         mov word ptr [0xc1a], cx                 
  0c87:1012  b92000           mov cx, 0x20                             
  0c87:1015  3b0e220c         cmp cx, word ptr [0xc22]                 
  0c87:1019  7204             jb 0x101f                                
  0c87:101b  8b0e220c         mov cx, word ptr [0xc22]                 
  0c87:101f  51               push cx                                  
  0c87:1020  d1e1             shl cx, 1                                
  0c87:1022  d1e1             shl cx, 1                                
  0c87:1024  d1e1             shl cx, 1                                
  0c87:1026  d1e1             shl cx, 1                                
  0c87:1028  890e120c         mov word ptr [0xc12], cx                 
  0c87:102c  b40b             mov ah, 0xb                              
  0c87:102e  be120c           mov si, 0xc12                            
  0c87:1031  53               push bx                                  
  0c87:1032  ff1e0e0c         lcall [0xc0e]                            
  0c87:1036  5b               pop bx                                   
  0c87:1037  59               pop cx                                   
  0c87:1038  5a               pop dx                                   
  0c87:1039  010e200c         add word ptr [0xc20], cx                 
  0c87:103d  290e220c         sub word ptr [0xc22], cx                 
  0c87:1041  9c               pushf                                    
  0c87:1042  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:1045  8ec0             mov es, ax                               
  0c87:1047  8bfa             mov di, dx                               
  0c87:1049  268b0d           mov cx, word ptr es:[di]                 
  0c87:104c  26c705ffff       mov word ptr es:[di], 0xffff             
  0c87:1051  ff470c           inc word ptr [bx + 0xc]                  
  0c87:1054  8bd1             mov dx, cx                               
  0c87:1056  9d               popf                                     
  0c87:1057  758e             jne 0xfe7                                
  0c87:1059  07               pop es                                   
  0c87:105a  c3               ret                                      
  0c87:105b  b80043           mov ax, 0x4300                           
  0c87:105e  cd2f             int 0x2f                                 
  0c87:1060  3c80             cmp al, 0x80                             
  0c87:1062  7513             jne 0x1077                               
  0c87:1064  53               push bx                                  
  0c87:1065  06               push es                                  
  0c87:1066  b81043           mov ax, 0x4310                           
  0c87:1069  cd2f             int 0x2f                                 
  0c87:106b  891e0e0c         mov word ptr [0xc0e], bx                 
  0c87:106f  8c06100c         mov word ptr [0xc10], es                 
  0c87:1073  07               pop es                                   
  0c87:1074  5b               pop bx                                   
  0c87:1075  f8               clc                                      
  0c87:1076  c3               ret                                      
  0c87:1077  f9               stc                                      
  0c87:1078  c3               ret                                      
  0c87:1079  005657           add byte ptr [bp + 0x57], dl             
  0c87:107c  8bf3             mov si, bx                               
  0c87:107e  8bf8             mov di, ax                               
  0c87:1080  b488             mov ah, 0x88                             
  0c87:1082  cd15             int 0x15                                 
  0c87:1084  833e540c00       cmp word ptr [0xc54], 0                  
  0c87:1089  7407             je 0x1092                                
  0c87:108b  050004           add ax, 0x400                            
  0c87:108e  2b06520c         sub ax, word ptr [0xc52]                 
  0c87:1092  b104             mov cl, 4                                
  0c87:1094  d3f8             sar ax, cl                               
  0c87:1096  3bc7             cmp ax, di                               
  0c87:1098  7303             jae 0x109d                               
  0c87:109a  e9ba00           jmp 0x1157                               
  0c87:109d  3bc2             cmp ax, dx                               
  0c87:109f  7202             jb 0x10a3                                
  0c87:10a1  8bc2             mov ax, dx                               
  0c87:10a3  8bd8             mov bx, ax                               
  0c87:10a5  b105             mov cl, 5                                
  0c87:10a7  d3e0             shl ax, cl                               
  0c87:10a9  89440c           mov word ptr [si + 0xc], ax              
  0c87:10ac  d1e0             shl ax, 1                                
  0c87:10ae  89440a           mov word ptr [si + 0xa], ax              
  0c87:10b1  d1f8             sar ax, 1                                
  0c87:10b3  d1f8             sar ax, 1                                
  0c87:10b5  a3560c           mov word ptr [0xc56], ax                 
  0c87:10b8  833e540c00       cmp word ptr [0xc54], 0                  
  0c87:10bd  7464             je 0x1123                                
  0c87:10bf  8b0e520c         mov cx, word ptr [0xc52]                 
  0c87:10c3  890e880c         mov word ptr [0xc88], cx                 
  0c87:10c7  0106520c         add word ptr [0xc52], ax                 
  0c87:10cb  b94000           mov cx, 0x40                             
  0c87:10ce  f7e1             mul cx                                   
  0c87:10d0  8b0e540c         mov cx, word ptr [0xc54]                 
  0c87:10d4  8ec1             mov es, cx                               
  0c87:10d6  bf2c00           mov di, 0x2c                             
  0c87:10d9  260105           add word ptr es:[di], ax                 
  0c87:10dc  26105502         adc byte ptr es:[di + 2], dl             
  0c87:10e0  56               push si                                  
  0c87:10e1  b92000           mov cx, 0x20                             
  0c87:10e4  be580c           mov si, 0xc58                            
  0c87:10e7  894c10           mov word ptr [si + 0x10], cx             
  0c87:10ea  894c18           mov word ptr [si + 0x18], cx             
  0c87:10ed  c7441a0000       mov word ptr [si + 0x1a], 0              
  0c87:10f2  c6441c10         mov byte ptr [si + 0x1c], 0x10           
  0c87:10f6  33db             xor bx, bx                               
  0c87:10f8  8cd8             mov ax, ds                               
  0c87:10fa  d1e0             shl ax, 1                                
  0c87:10fc  d1d3             rcl bx, 1                                
  0c87:10fe  d1e0             shl ax, 1                                
  0c87:1100  d1d3             rcl bx, 1                                
  0c87:1102  d1e0             shl ax, 1                                
  0c87:1104  d1d3             rcl bx, 1                                
  0c87:1106  d1e0             shl ax, 1                                
  0c87:1108  d1d3             rcl bx, 1                                
  0c87:110a  885c14           mov byte ptr [si + 0x14], bl             
  0c87:110d  05340c           add ax, 0xc34                            
  0c87:1110  894412           mov word ptr [si + 0x12], ax             
  0c87:1113  b91000           mov cx, 0x10                             
  0c87:1116  8cd8             mov ax, ds                               
  0c87:1118  8ec0             mov es, ax                               
  0c87:111a  b487             mov ah, 0x87                             
  0c87:111c  cd15             int 0x15                                 
  0c87:111e  5e               pop si                                   
  0c87:111f  f8               clc                                      
  0c87:1120  eb36             jmp 0x1158                               
  0c87:1122  90               nop                                      
  0c87:1123  8bd0             mov dx, ax                               
  0c87:1125  b488             mov ah, 0x88                             
  0c87:1127  cd15             int 0x15                                 
  0c87:1129  2bc2             sub ax, dx                               
  0c87:112b  2ea36f11         mov word ptr cs:[0x116f], ax             
  0c87:112f  050004           add ax, 0x400                            
  0c87:1132  a3880c           mov word ptr [0xc88], ax                 
  0c87:1135  b81535           mov ax, 0x3515                           
  0c87:1138  cd21             int 0x21                                 
  0c87:113a  2e891e7111       mov word ptr cs:[0x1171], bx             
  0c87:113f  8cc0             mov ax, es                               
  0c87:1141  2ea37311         mov word ptr cs:[0x1173], ax             
  0c87:1145  ba7511           mov dx, 0x1175                           
  0c87:1148  1e               push ds                                  
  0c87:1149  8cc8             mov ax, cs                               
  0c87:114b  8ed8             mov ds, ax                               
  0c87:114d  b81525           mov ax, 0x2515                           
  0c87:1150  cd21             int 0x21                                 
  0c87:1152  1f               pop ds                                   
  0c87:1153  f8               clc                                      
  0c87:1154  eb02             jmp 0x1158                               
  0c87:1156  90               nop                                      
  0c87:1157  f9               stc                                      
  0c87:1158  9c               pushf                                    
  0c87:1159  a1880c           mov ax, word ptr [0xc88]                 
  0c87:115c  b90004           mov cx, 0x400                            
  0c87:115f  f7e9             imul cx                                  
  0c87:1161  8826880c         mov byte ptr [0xc88], ah                 
  0c87:1165  8816890c         mov byte ptr [0xc89], dl                 
  0c87:1169  9d               popf                                     
  0c87:116a  8bde             mov bx, si                               
  0c87:116c  5f               pop di                                   
  0c87:116d  5e               pop si                                   
  0c87:116e  c3               ret                                      
  0c87:116f  0000             add byte ptr [bx + si], al               
  0c87:1171  0000             add byte ptr [bx + si], al               
  0c87:1173  0000             add byte ptr [bx + si], al               
  0c87:1175  9c               pushf                                    
  0c87:1176  80fc88           cmp ah, 0x88                             
  0c87:1179  7406             je 0x1181                                
  0c87:117b  9d               popf                                     
  0c87:117c  2eff2e7111       ljmp cs:[0x1171]                         
  0c87:1181  2ea16f11         mov ax, word ptr cs:[0x116f]             
  0c87:1185  cf               iret                                     
  0c87:1186  53               push bx                                  
  0c87:1187  a1560c           mov ax, word ptr [0xc56]                 
  0c87:118a  833e540c00       cmp word ptr [0xc54], 0                  
  0c87:118f  7458             je 0x11e9                                
  0c87:1191  2906520c         sub word ptr [0xc52], ax                 
  0c87:1195  b94000           mov cx, 0x40                             
  0c87:1198  f7e1             mul cx                                   
  0c87:119a  8b0e540c         mov cx, word ptr [0xc54]                 
  0c87:119e  8ec1             mov es, cx                               
  0c87:11a0  bf2c00           mov di, 0x2c                             
  0c87:11a3  262905           sub word ptr es:[di], ax                 
  0c87:11a6  26185502         sbb byte ptr es:[di + 2], dl             
  0c87:11aa  b92000           mov cx, 0x20                             
  0c87:11ad  be580c           mov si, 0xc58                            
  0c87:11b0  894c10           mov word ptr [si + 0x10], cx             
  0c87:11b3  894c18           mov word ptr [si + 0x18], cx             
  0c87:11b6  c7441a0000       mov word ptr [si + 0x1a], 0              
  0c87:11bb  c6441c10         mov byte ptr [si + 0x1c], 0x10           
  0c87:11bf  33db             xor bx, bx                               
  0c87:11c1  8cd8             mov ax, ds                               
  0c87:11c3  d1e0             shl ax, 1                                
  0c87:11c5  d1d3             rcl bx, 1                                
  0c87:11c7  d1e0             shl ax, 1                                
  0c87:11c9  d1d3             rcl bx, 1                                
  0c87:11cb  d1e0             shl ax, 1                                
  0c87:11cd  d1d3             rcl bx, 1                                
  0c87:11cf  d1e0             shl ax, 1                                
  0c87:11d1  d1d3             rcl bx, 1                                
  0c87:11d3  885c14           mov byte ptr [si + 0x14], bl             
  0c87:11d6  05340c           add ax, 0xc34                            
  0c87:11d9  894412           mov word ptr [si + 0x12], ax             
  0c87:11dc  b91000           mov cx, 0x10                             
  0c87:11df  8cd8             mov ax, ds                               
  0c87:11e1  8ec0             mov es, ax                               
  0c87:11e3  b487             mov ah, 0x87                             
  0c87:11e5  cd15             int 0x15                                 
  0c87:11e7  5b               pop bx                                   
  0c87:11e8  c3               ret                                      
  0c87:11e9  1e               push ds                                  
  0c87:11ea  2ec5167111       lds dx, ptr cs:[0x1171]                  
  0c87:11ef  b81525           mov ax, 0x2515                           
  0c87:11f2  cd21             int 0x21                                 
  0c87:11f4  1f               pop ds                                   
  0c87:11f5  5b               pop bx                                   
  0c87:11f6  c3               ret                                      
  0c87:11f7  268b160200       mov dx, word ptr es:[2]                  
  0c87:11fc  4a               dec dx                                   
  0c87:11fd  89168f0c         mov word ptr [0xc8f], dx                 
  0c87:1201  8bde             mov bx, si                               
  0c87:1203  8cc0             mov ax, es                               
  0c87:1205  40               inc ax                                   
  0c87:1206  33c9             xor cx, cx                               
  0c87:1208  d1e0             shl ax, 1                                
  0c87:120a  d1d1             rcl cx, 1                                
  0c87:120c  d1e0             shl ax, 1                                
  0c87:120e  d1d1             rcl cx, 1                                
  0c87:1210  d1e0             shl ax, 1                                
  0c87:1212  d1d1             rcl cx, 1                                
  0c87:1214  d1e0             shl ax, 1                                
  0c87:1216  d1d1             rcl cx, 1                                
  0c87:1218  a36a0c           mov word ptr [0xc6a], ax                 
  0c87:121b  880e6c0c         mov byte ptr [0xc6c], cl                 
  0c87:121f  bfffff           mov di, 0xffff                           
  0c87:1222  e89af9           call 0xbbf                               -> 0c87:0bbf
  0c87:1225  83ffff           cmp di, -1                               
  0c87:1228  740b             je 0x1235                                
  0c87:122a  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:122d  8ec0             mov es, ax                               
  0c87:122f  268915           mov word ptr es:[di], dx                 
  0c87:1232  eb03             jmp 0x1237                               
  0c87:1234  90               nop                                      
  0c87:1235  8bea             mov bp, dx                               
  0c87:1237  52               push dx                                  
  0c87:1238  be720c           mov si, 0xc72                            
  0c87:123b  e8d000           call 0x130e                              -> 0c87:130e
  0c87:123e  b92000           mov cx, 0x20                             
  0c87:1241  3b0e8f0c         cmp cx, word ptr [0xc8f]                 
  0c87:1245  7204             jb 0x124b                                
  0c87:1247  8b0e8f0c         mov cx, word ptr [0xc8f]                 
  0c87:124b  51               push cx                                  
  0c87:124c  d1e1             shl cx, 1                                
  0c87:124e  d1e1             shl cx, 1                                
  0c87:1250  d1e1             shl cx, 1                                
  0c87:1252  d1e1             shl cx, 1                                
  0c87:1254  890e680c         mov word ptr [0xc68], cx                 
  0c87:1258  890e700c         mov word ptr [0xc70], cx                 
  0c87:125c  51               push cx                                  
  0c87:125d  d1e9             shr cx, 1                                
  0c87:125f  be580c           mov si, 0xc58                            
  0c87:1262  8cd8             mov ax, ds                               
  0c87:1264  8ec0             mov es, ax                               
  0c87:1266  b487             mov ah, 0x87                             
  0c87:1268  cd15             int 0x15                                 
  0c87:126a  59               pop cx                                   
  0c87:126b  010e6a0c         add word ptr [0xc6a], cx                 
  0c87:126f  80166c0c00       adc byte ptr [0xc6c], 0                  
  0c87:1274  59               pop cx                                   
  0c87:1275  5a               pop dx                                   
  0c87:1276  290e8f0c         sub word ptr [0xc8f], cx                 
  0c87:127a  8bfa             mov di, dx                               
  0c87:127c  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:127f  8ec0             mov es, ax                               
  0c87:1281  26c705feff       mov word ptr es:[di], 0xfffe             
  0c87:1286  759a             jne 0x1222                               
  0c87:1288  c3               ret                                      
  0c87:1289  4a               dec dx                                   
  0c87:128a  89168f0c         mov word ptr [0xc8f], dx                 
  0c87:128e  8bd3             mov dx, bx                               
  0c87:1290  8bde             mov bx, si                               
  0c87:1292  8cc0             mov ax, es                               
  0c87:1294  40               inc ax                                   
  0c87:1295  50               push ax                                  
  0c87:1296  33c9             xor cx, cx                               
  0c87:1298  d1e0             shl ax, 1                                
  0c87:129a  d1d1             rcl cx, 1                                
  0c87:129c  d1e0             shl ax, 1                                
  0c87:129e  d1d1             rcl cx, 1                                
  0c87:12a0  d1e0             shl ax, 1                                
  0c87:12a2  d1d1             rcl cx, 1                                
  0c87:12a4  d1e0             shl ax, 1                                
  0c87:12a6  d1d1             rcl cx, 1                                
  0c87:12a8  a3720c           mov word ptr [0xc72], ax                 
  0c87:12ab  880e740c         mov byte ptr [0xc74], cl                 
  0c87:12af  52               push dx                                  
  0c87:12b0  be6a0c           mov si, 0xc6a                            
  0c87:12b3  e85800           call 0x130e                              -> 0c87:130e
  0c87:12b6  b92000           mov cx, 0x20                             
  0c87:12b9  3b0e8f0c         cmp cx, word ptr [0xc8f]                 
  0c87:12bd  7204             jb 0x12c3                                
  0c87:12bf  8b0e8f0c         mov cx, word ptr [0xc8f]                 
  0c87:12c3  51               push cx                                  
  0c87:12c4  d1e1             shl cx, 1                                
  0c87:12c6  d1e1             shl cx, 1                                
  0c87:12c8  d1e1             shl cx, 1                                
  0c87:12ca  d1e1             shl cx, 1                                
  0c87:12cc  890e680c         mov word ptr [0xc68], cx                 
  0c87:12d0  890e700c         mov word ptr [0xc70], cx                 
  0c87:12d4  51               push cx                                  
  0c87:12d5  d1e9             shr cx, 1                                
  0c87:12d7  be580c           mov si, 0xc58                            
  0c87:12da  8cd8             mov ax, ds                               
  0c87:12dc  8ec0             mov es, ax                               
  0c87:12de  b487             mov ah, 0x87                             
  0c87:12e0  cd15             int 0x15                                 
  0c87:12e2  59               pop cx                                   
  0c87:12e3  010e720c         add word ptr [0xc72], cx                 
  0c87:12e7  8016740c00       adc byte ptr [0xc74], 0                  
  0c87:12ec  59               pop cx                                   
  0c87:12ed  5a               pop dx                                   
  0c87:12ee  290e8f0c         sub word ptr [0xc8f], cx                 
  0c87:12f2  9c               pushf                                    
  0c87:12f3  8b470e           mov ax, word ptr [bx + 0xe]              
  0c87:12f6  8ec0             mov es, ax                               
  0c87:12f8  57               push di                                  
  0c87:12f9  8bfa             mov di, dx                               
  0c87:12fb  268b0d           mov cx, word ptr es:[di]                 
  0c87:12fe  26c705ffff       mov word ptr es:[di], 0xffff             
  0c87:1303  ff470c           inc word ptr [bx + 0xc]                  
  0c87:1306  8bd1             mov dx, cx                               
  0c87:1308  5f               pop di                                   
  0c87:1309  9d               popf                                     
  0c87:130a  75a3             jne 0x12af                               
  0c87:130c  07               pop es                                   
  0c87:130d  c3               ret                                      
  0c87:130e  8bc2             mov ax, dx                               
  0c87:1310  33c9             xor cx, cx                               
  0c87:1312  d1e0             shl ax, 1                                
  0c87:1314  d1d1             rcl cx, 1                                
  0c87:1316  d1e0             shl ax, 1                                
  0c87:1318  d1d1             rcl cx, 1                                
  0c87:131a  d1e0             shl ax, 1                                
  0c87:131c  d1d1             rcl cx, 1                                
  0c87:131e  d1e0             shl ax, 1                                
  0c87:1320  d1d1             rcl cx, 1                                
  0c87:1322  d1e0             shl ax, 1                                
  0c87:1324  d1d1             rcl cx, 1                                
  0c87:1326  d1e0             shl ax, 1                                
  0c87:1328  d1d1             rcl cx, 1                                
  0c87:132a  d1e0             shl ax, 1                                
  0c87:132c  d1d1             rcl cx, 1                                
  0c87:132e  d1e0             shl ax, 1                                
  0c87:1330  d1d1             rcl cx, 1                                
  0c87:1332  0226880c         add ah, byte ptr [0xc88]                 
  0c87:1336  120e890c         adc cl, byte ptr [0xc89]                 
  0c87:133a  8904             mov word ptr [si], ax                    
  0c87:133c  884c02           mov byte ptr [si + 2], cl                
  0c87:133f  c3               ret                                      
  0c87:1340  56               push si                                  
  0c87:1341  57               push di                                  
  0c87:1342  53               push bx                                  
  0c87:1343  b488             mov ah, 0x88                             
  0c87:1345  cd15             int 0x15                                 
  0c87:1347  80fc88           cmp ah, 0x88                             
  0c87:134a  7405             je 0x1351                                
  0c87:134c  3d0000           cmp ax, 0                                
  0c87:134f  7503             jne 0x1354                               
  0c87:1351  e9aa00           jmp 0x13fe                               
  0c87:1354  b81935           mov ax, 0x3519                           
  0c87:1357  cd21             int 0x21                                 
  0c87:1359  8cc0             mov ax, es                               
  0c87:135b  a3540c           mov word ptr [0xc54], ax                 
  0c87:135e  bf1200           mov di, 0x12                             
  0c87:1361  be8a0c           mov si, 0xc8a                             ; "VDISK"
  0c87:1364  b90500           mov cx, 5                                
  0c87:1367  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0c87:1369  7409             je 0x1374                                
  0c87:136b  c706540c0000     mov word ptr [0xc54], 0                  
  0c87:1371  e98500           jmp 0x13f9                               
  0c87:1374  b92000           mov cx, 0x20                             
  0c87:1377  be580c           mov si, 0xc58                            
  0c87:137a  894c10           mov word ptr [si + 0x10], cx             
  0c87:137d  894c18           mov word ptr [si + 0x18], cx             
  0c87:1380  c744120000       mov word ptr [si + 0x12], 0              
  0c87:1385  c6441410         mov byte ptr [si + 0x14], 0x10           
  0c87:1389  33db             xor bx, bx                               
  0c87:138b  8cd8             mov ax, ds                               
  0c87:138d  d1e0             shl ax, 1                                
  0c87:138f  d1d3             rcl bx, 1                                
  0c87:1391  d1e0             shl ax, 1                                
  0c87:1393  d1d3             rcl bx, 1                                
  0c87:1395  d1e0             shl ax, 1                                
  0c87:1397  d1d3             rcl bx, 1                                
  0c87:1399  d1e0             shl ax, 1                                
  0c87:139b  d1d3             rcl bx, 1                                
  0c87:139d  885c1c           mov byte ptr [si + 0x1c], bl             
  0c87:13a0  05340c           add ax, 0xc34                            
  0c87:13a3  89441a           mov word ptr [si + 0x1a], ax             
  0c87:13a6  b91000           mov cx, 0x10                             
  0c87:13a9  8cd8             mov ax, ds                               
  0c87:13ab  8ec0             mov es, ax                               
  0c87:13ad  b487             mov ah, 0x87                             
  0c87:13af  cd15             int 0x15                                 
  0c87:13b1  724b             jb 0x13fe                                
  0c87:13b3  bf370c           mov di, 0xc37                            
  0c87:13b6  be8a0c           mov si, 0xc8a                             ; "VDISK"
  0c87:13b9  b90500           mov cx, 5                                
  0c87:13bc  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0c87:13be  753e             jne 0x13fe                               
  0c87:13c0  a1520c           mov ax, word ptr [0xc52]                 
  0c87:13c3  b90004           mov cx, 0x400                            
  0c87:13c6  f7e1             mul cx                                   
  0c87:13c8  8b0e540c         mov cx, word ptr [0xc54]                 
  0c87:13cc  8ec1             mov es, cx                               
  0c87:13ce  bf2c00           mov di, 0x2c                             
  0c87:13d1  263a5502         cmp dl, byte ptr es:[di + 2]             
  0c87:13d5  7505             jne 0x13dc                               
  0c87:13d7  263b05           cmp ax, word ptr es:[di]                 
  0c87:13da  741d             je 0x13f9                                
  0c87:13dc  7c0a             jl 0x13e8                                
  0c87:13de  26885502         mov byte ptr es:[di + 2], dl             
  0c87:13e2  268905           mov word ptr es:[di], ax                 
  0c87:13e5  eb12             jmp 0x13f9                               
  0c87:13e7  90               nop                                      
  0c87:13e8  32f6             xor dh, dh                               
  0c87:13ea  268a5502         mov dl, byte ptr es:[di + 2]             
  0c87:13ee  268b05           mov ax, word ptr es:[di]                 
  0c87:13f1  b94000           mov cx, 0x40                             
  0c87:13f4  f7f1             div cx                                   
  0c87:13f6  a3520c           mov word ptr [0xc52], ax                 
  0c87:13f9  5b               pop bx                                   
  0c87:13fa  5f               pop di                                   
  0c87:13fb  5e               pop si                                   
  0c87:13fc  f8               clc                                      
  0c87:13fd  c3               ret                                      
  0c87:13fe  5b               pop bx                                   
  0c87:13ff  5f               pop di                                   
  0c87:1400  5e               pop si                                   
  0c87:1401  f9               stc                                      
  0c87:1402  c3               ret                                      
  0c87:1403  0000             add byte ptr [bx + si], al               
  0c87:1405  0000             add byte ptr [bx + si], al               
  0c87:1407  0000             add byte ptr [bx + si], al               
  0c87:1409  0000             add byte ptr [bx + si], al               
  0c87:140b  0000             add byte ptr [bx + si], al               
  0c87:140d  0000             add byte ptr [bx + si], al               
  0c87:140f  00               db 00
