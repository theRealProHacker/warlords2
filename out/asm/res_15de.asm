; res_15de file_off 0x17de0
  0009  f4               hlt                                      
  000a  2e253150         and ax, 0x5031                           
  000e  41               inc cx                                   
  000f  54               push sp                                  
  0010  48               dec ax                                   
  0011  3d0000           cmp ax, 0                                

res_15de_0014:  ; ENTRY
  0014  55               push bp                                  
  0015  8bec             mov bp, sp                               
  0017  83ec14           sub sp, 0x14                             
  001a  1e               push ds                                  
  001b  2e8e1e0900       mov ds, word ptr cs:[9]                  
  0020  56               push si                                  
  0021  57               push di                                  
  0022  fc               cld                                      
  0023  833e100100       cmp word ptr [0x110], 0                  
  0028  7503             jne 0x2d                                 
  002a  e90c01           jmp 0x139                                
  002d  e89501           call 0x1c5                               
  0030  732c             jae 0x5e                                 
  0032  8b4606           mov ax, word ptr [bp + 6]                
  0035  0b4608           or ax, word ptr [bp + 8]                 
  0038  750a             jne 0x44                                 
  003a  c746064804       mov word ptr [bp + 6], 0x448             
  003f  c746080e2f       mov word ptr [bp + 8], 0x2f0e            
  0044  e87201           call 0x1b9                               
  0047  7315             jae 0x5e                                 
  0049  e8be01           call 0x20a                               
  004c  7310             jae 0x5e                                 
  004e  b8feff           mov ax, 0xfffe                           
  0051  e9e700           jmp 0x13b                                
  0054  b43e             mov ah, 0x3e                             
  0056  cd21             int 0x21                                 
  0058  b8ffff           mov ax, 0xffff                           
  005b  e9dd00           jmp 0x13b                                
  005e  8bd8             mov bx, ax                               
  0060  891e2801         mov word ptr [0x128], bx                 
  0064  b91400           mov cx, 0x14                             
  0067  e82502           call 0x28f                               
  006a  b9fdff           mov cx, 0xfffd                           
  006d  72e5             jb 0x54                                  
  006f  33c0             xor ax, ax                               
  0071  33d2             xor dx, dx                               
  0073  817eec4d5a       cmp word ptr [bp - 0x14], 0x5a4d         
  0078  7405             je 0x7f                                  
  007a  b9fcff           mov cx, 0xfffc                           
  007d  ebd5             jmp 0x54                                 
  007f  8b46f0           mov ax, word ptr [bp - 0x10]             
  0082  8b4eee           mov cx, word ptr [bp - 0x12]             
  0085  e301             jcxz 0x88                                
  0087  48               dec ax                                   
  0088  ba0002           mov dx, 0x200                            
  008b  f7e2             mul dx                                   
  008d  03c1             add ax, cx                               
  008f  050f00           add ax, 0xf                              
  0092  83d200           adc dx, 0                                
  0095  25f0ff           and ax, 0xfff0                           
  0098  52               push dx                                  
  0099  50               push ax                                  
  009a  8bca             mov cx, dx                               
  009c  8bd0             mov dx, ax                               
  009e  b80042           mov ax, 0x4200                           
  00a1  cd21             int 0x21                                 
  00a3  b91000           mov cx, 0x10                             
  00a6  e8e601           call 0x28f                               
  00a9  58               pop ax                                   
  00aa  5a               pop dx                                   
  00ab  b9fdff           mov cx, 0xfffd                           
  00ae  72a4             jb 0x54                                  
  00b0  051000           add ax, 0x10                             
  00b3  83d200           adc dx, 0                                
  00b6  817eec4642       cmp word ptr [bp - 0x14], 0x4246         
  00bb  b9fcff           mov cx, 0xfffc                           
  00be  7402             je 0xc2                                  
  00c0  eb92             jmp 0x54                                 
  00c2  817eee4f56       cmp word ptr [bp - 0x12], 0x564f         
  00c7  7408             je 0xd1                                  
  00c9  0346f0           add ax, word ptr [bp - 0x10]             
  00cc  1356f2           adc dx, word ptr [bp - 0xe]              
  00cf  ebc7             jmp 0x98                                 
  00d1  a31401           mov word ptr [0x114], ax                 
  00d4  89161601         mov word ptr [0x116], dx                 
  00d8  2e8e060b00       mov es, word ptr cs:[0xb]                
  00dd  8b46f0           mov ax, word ptr [bp - 0x10]             
  00e0  26a38238         mov word ptr es:[0x3882], ax             
  00e4  8b46f2           mov ax, word ptr [bp - 0xe]              
  00e7  26a38438         mov word ptr es:[0x3884], ax             
  00eb  b43e             mov ah, 0x3e                             
  00ed  cd21             int 0x21                                 
  00ef  c70628010000     mov word ptr [0x128], 0                  
  00f5  90               nop                                      
  00f6  0e               push cs                                  
  00f7  e84a00           call 0x144                               
  00fa  8b460c           mov ax, word ptr [bp + 0xc]              
  00fd  40               inc ax                                   
  00fe  a32401           mov word ptr [0x124], ax                 
  0101  a32001           mov word ptr [0x120], ax                 
  0104  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0107  891e2601         mov word ptr [0x126], bx                 
  010b  e89101           call 0x29f                               
  010e  8b1e2601         mov bx, word ptr [0x126]                 
  0112  2b1e2401         sub bx, word ptr [0x124]                 
  0116  3b1e1a01         cmp bx, word ptr [0x11a]                 
  011a  7306             jae 0x122                                
  011c  b9fbff           mov cx, 0xfffb                           
  011f  e932ff           jmp 0x54                                 
  0122  d1eb             shr bx, 1                                
  0124  d1eb             shr bx, 1                                
  0126  891e1801         mov word ptr [0x118], bx                 
  012a  e8f201           call 0x31f                               
  012d  730a             jae 0x139                                
  012f  8b1e2801         mov bx, word ptr [0x128]                 
  0133  b9ffff           mov cx, 0xffff                           
  0136  eb03             jmp 0x13b                                
  0138  90               nop                                      
  0139  33c0             xor ax, ax                               
  013b  5f               pop di                                   
  013c  5e               pop si                                   
  013d  1f               pop ds                                   
  013e  8be5             mov sp, bp                               
  0140  5d               pop bp                                   
  0141  ca0800           retf 8                                   

res_15de_0144:  ; ENTRY
  0144  55               push bp                                  
  0145  8bec             mov bp, sp                               
  0147  1e               push ds                                  
  0148  2e8e1e0900       mov ds, word ptr cs:[9]                  
  014d  a01101           mov al, byte ptr [0x111]                 
  0150  b435             mov ah, 0x35                             
  0152  cd21             int 0x21                                 
  0154  06               push es                                  
  0155  53               push bx                                  
  0156  1e               push ds                                  
  0157  a01101           mov al, byte ptr [0x111]                 
  015a  8b160200         mov dx, word ptr [2]                     
  015e  8e1e0400         mov ds, word ptr [4]                     
  0162  b425             mov ah, 0x25                             
  0164  cd21             int 0x21                                 
  0166  1f               pop ds                                   
  0167  8f060200         pop word ptr [2]                         
  016b  8f060400         pop word ptr [4]                         
  016f  833e280100       cmp word ptr [0x128], 0                  
  0174  7410             je 0x186                                 
  0176  8b1e2801         mov bx, word ptr [0x128]                 
  017a  b43e             mov ah, 0x3e                             
  017c  cd21             int 0x21                                 
  017e  c70628010000     mov word ptr [0x128], 0                  
  0184  eb0e             jmp 0x194                                
  0186  8d168c00         lea dx, [0x8c]                           
  018a  b43d             mov ah, 0x3d                             
  018c  a00600           mov al, byte ptr [6]                     
  018f  cd21             int 0x21                                 
  0191  a32801           mov word ptr [0x128], ax                 
  0194  1f               pop ds                                   
  0195  5d               pop bp                                   
  0196  cb               retf                                     
  0197  55               push bp                                  
  0198  8bec             mov bp, sp                               
  019a  1e               push ds                                  
  019b  2e8e1e0900       mov ds, word ptr cs:[9]                  
  01a0  833e280100       cmp word ptr [0x128], 0                  
  01a5  7405             je 0x1ac                                 
  01a7  90               nop                                      
  01a8  0e               push cs                                  
  01a9  e898ff           call 0x144                               
  01ac  0e               push cs                                  
  01ad  ff168400         call word ptr [0x84]                     
  01b1  0e               push cs                                  
  01b2  ff168200         call word ptr [0x82]                     
  01b6  1f               pop ds                                   
  01b7  5d               pop bp                                   
  01b8  cb               retf                                     

res_15de_01b9:  ; ENTRY
  01b9  1e               push ds                                  
  01ba  8d3e8c00         lea di, [0x8c]                           
  01be  1e               push ds                                  
  01bf  07               pop es                                   
  01c0  e8a400           call 0x267                               
  01c3  1f               pop ds                                   
  01c4  c3               ret                                      

res_15de_01c5:  ; ENTRY
  01c5  b430             mov ah, 0x30                             
  01c7  cd21             int 0x21                                 
  01c9  3c03             cmp al, 3                                
  01cb  723c             jb 0x209                                 
  01cd  c606060020       mov byte ptr [6], 0x20                   
  01d2  1e               push ds                                  
  01d3  b82531           mov ax, 0x3125                           
  01d6  8ed8             mov ds, ax                               
  01d8  8e1e7700         mov ds, word ptr [0x77]                  
  01dc  33f6             xor si, si                               
  01de  fc               cld                                      
  01df  ac               lodsb al, byte ptr [si]                  
  01e0  0ac0             or al, al                                
  01e2  75fb             jne 0x1df                                
  01e4  ac               lodsb al, byte ptr [si]                  
  01e5  0ac0             or al, al                                
  01e7  75f6             jne 0x1df                                
  01e9  ad               lodsw ax, word ptr [si]                  
  01ea  8d3e8c00         lea di, [0x8c]                           
  01ee  b8f42e           mov ax, 0x2ef4                           
  01f1  8ec0             mov es, ax                               
  01f3  8bdf             mov bx, di                               
  01f5  ac               lodsb al, byte ptr [si]                  
  01f6  aa               stosb byte ptr es:[di], al               
  01f7  0ac0             or al, al                                
  01f9  7408             je 0x203                                 
  01fb  3c5c             cmp al, 0x5c                             
  01fd  75f6             jne 0x1f5                                
  01ff  8bdf             mov bx, di                               
  0201  ebf2             jmp 0x1f5                                
  0203  8bfb             mov di, bx                               
  0205  e85f00           call 0x267                               
  0208  1f               pop ds                                   
  0209  c3               ret                                      

res_15de_020a:  ; ENTRY
  020a  1e               push ds                                  
  020b  b82531           mov ax, 0x3125                           
  020e  8ed8             mov ds, ax                               
  0210  8e1e7700         mov ds, word ptr [0x77]                  
  0214  33f6             xor si, si                               
  0216  bf0d00           mov di, 0xd                              
  0219  0e               push cs                                  
  021a  07               pop es                                   
  021b  b90500           mov cx, 5                                
  021e  fc               cld                                      
  021f  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0221  740d             je 0x230                                 
  0223  4e               dec si                                   
  0224  ac               lodsb al, byte ptr [si]                  
  0225  0ac0             or al, al                                
  0227  75fb             jne 0x224                                
  0229  3a04             cmp al, byte ptr [si]                    
  022b  75e9             jne 0x216                                
  022d  1f               pop ds                                   
  022e  f9               stc                                      
  022f  c3               ret                                      
  0230  803c00           cmp byte ptr [si], 0                     
  0233  74f8             je 0x22d                                 
  0235  8d3e8c00         lea di, [0x8c]                           
  0239  b8f42e           mov ax, 0x2ef4                           
  023c  8ec0             mov es, ax                               
  023e  32c0             xor al, al                               
  0240  8ae0             mov ah, al                               
  0242  ac               lodsb al, byte ptr [si]                  
  0243  0ac0             or al, al                                
  0245  7407             je 0x24e                                 
  0247  3c3b             cmp al, 0x3b                             
  0249  7404             je 0x24f                                 
  024b  aa               stosb byte ptr es:[di], al               
  024c  ebf2             jmp 0x240                                
  024e  4e               dec si                                   
  024f  80fc3a           cmp ah, 0x3a                             
  0252  7408             je 0x25c                                 
  0254  80fc5c           cmp ah, 0x5c                             
  0257  7403             je 0x25c                                 
  0259  b05c             mov al, 0x5c                             
  025b  aa               stosb byte ptr es:[di], al               
  025c  1e               push ds                                  
  025d  56               push si                                  
  025e  e80600           call 0x267                               
  0261  5e               pop si                                   
  0262  1f               pop ds                                   
  0263  72cb             jb 0x230                                 
  0265  1f               pop ds                                   
  0266  c3               ret                                      

res_15de_0267:  ; ENTRY
  0267  c57606           lds si, ptr [bp + 6]                     
  026a  8cd8             mov ax, ds                               
  026c  0bc6             or ax, si                                
  026e  740e             je 0x27e                                 
  0270  b90c00           mov cx, 0xc                              
  0273  ac               lodsb al, byte ptr [si]                  
  0274  aa               stosb byte ptr es:[di], al               
  0275  0ac0             or al, al                                
  0277  7405             je 0x27e                                 
  0279  e2f8             loop 0x273                               
  027b  2ac0             sub al, al                               
  027d  aa               stosb byte ptr es:[di], al               
  027e  8d168c00         lea dx, [0x8c]                           
  0282  b8f42e           mov ax, 0x2ef4                           
  0285  8ed8             mov ds, ax                               
  0287  b43d             mov ah, 0x3d                             
  0289  a00600           mov al, byte ptr [6]                     
  028c  cd21             int 0x21                                 
  028e  c3               ret                                      

res_15de_028f:  ; ENTRY
  028f  1e               push ds                                  
  0290  8d56ec           lea dx, [bp - 0x14]                      
  0293  16               push ss                                  
  0294  1f               pop ds                                   
  0295  b43f             mov ah, 0x3f                             
  0297  cd21             int 0x21                                 
  0299  1f               pop ds                                   
  029a  7202             jb 0x29e                                 
  029c  3bc1             cmp ax, cx                               
  029e  c3               ret                                      

res_15de_029f:  ; ENTRY
  029f  b82531           mov ax, 0x3125                           
  02a2  8ec0             mov es, ax                               
  02a4  26a17b00         mov ax, word ptr es:[0x7b]               
  02a8  051000           add ax, 0x10                             
  02ab  2ea31200         mov word ptr cs:[0x12], ax               
  02af  b8052f           mov ax, 0x2f05                           
  02b2  8ec0             mov es, ax                               
  02b4  33db             xor bx, bx                               
  02b6  33ff             xor di, di                               
  02b8  8d36a001         lea si, [0x1a0]                          
  02bc  f744040200       test word ptr [si + 4], 2                
  02c1  7406             je 0x2c9                                 
  02c3  837c0200         cmp word ptr [si + 2], 0                 
  02c7  7503             jne 0x2cc                                
  02c9  eb3f             jmp 0x30a                                
  02cb  90               nop                                      
  02cc  8b04             mov ax, word ptr [si]                    
  02ce  06               push es                                  
  02cf  26a31200         mov word ptr es:[0x12], ax               
  02d3  8ec0             mov es, ax                               
  02d5  26803e1a00ff     cmp byte ptr es:[0x1a], 0xff             
  02db  750b             jne 0x2e8                                
  02dd  07               pop es                                   
  02de  26c70612000000   mov word ptr es:[0x12], 0                
  02e5  eb23             jmp 0x30a                                
  02e7  90               nop                                      
  02e8  58               pop ax                                   
  02e9  26c7061800ca04   mov word ptr es:[0x18], 0x4ca            
  02f0  a11401           mov ax, word ptr [0x114]                 
  02f3  8b161601         mov dx, word ptr [0x116]                 
  02f7  2601060400       add word ptr es:[4], ax                  
  02fc  2611160600       adc word ptr es:[6], dx                  
  0301  e8ad04           call 0x7b1                               
  0304  3bda             cmp bx, dx                               
  0306  7302             jae 0x30a                                
  0308  87da             xchg dx, bx                              
  030a  83c608           add si, 8                                
  030d  81fee805         cmp si, 0x5e8                            
  0311  7302             jae 0x315                                
  0313  eba7             jmp 0x2bc                                
  0315  33c0             xor ax, ax                               
  0317  83c302           add bx, 2                                
  031a  891e1a01         mov word ptr [0x11a], bx                 
  031e  c3               ret                                      

res_15de_031f:  ; ENTRY
  031f  8b0e2201         mov cx, word ptr [0x122]                 
  0323  890e2c01         mov word ptr [0x12c], cx                 
  0327  8bd9             mov bx, cx                               
  0329  8b362401         mov si, word ptr [0x124]                 
  032d  8b3e2601         mov di, word ptr [0x126]                 
  0331  1e               push ds                                  
  0332  8ed9             mov ds, cx                               
  0334  8b0e1200         mov cx, word ptr [0x12]                  
  0338  e32e             jcxz 0x368                               
  033a  8ec1             mov es, cx                               
  033c  26a10400         mov ax, word ptr es:[4]                  
  0340  268b160600       mov dx, word ptr es:[6]                  
  0345  2b060400         sub ax, word ptr [4]                     
  0349  1b160600         sbb dx, word ptr [6]                     
  034d  b91000           mov cx, 0x10                             
  0350  f7f1             div cx                                   
  0352  03c6             add ax, si                               
  0354  3bc7             cmp ax, di                               
  0356  7710             ja 0x368                                 
  0358  89361000         mov word ptr [0x10], si                  
  035c  8bf0             mov si, ax                               
  035e  8cc1             mov cx, es                               
  0360  890e1c00         mov word ptr [0x1c], cx                  
  0364  8cdb             mov bx, ds                               
  0366  ebca             jmp 0x332                                
  0368  8edb             mov ds, bx                               
  036a  c7061c000000     mov word ptr [0x1c], 0                   
  0370  1f               pop ds                                   
  0371  89362001         mov word ptr [0x120], si                 
  0375  a12401           mov ax, word ptr [0x124]                 
  0378  2bf0             sub si, ax                               
  037a  7503             jne 0x37f                                
  037c  eb5f             jmp 0x3dd                                
  037e  90               nop                                      
  037f  b104             mov cl, 4                                
  0381  d3c6             rol si, cl                               
  0383  8bfe             mov di, si                               
  0385  83e70f           and di, 0xf                              
  0388  83e6f0           and si, 0xfff0                           
  038b  8e062c01         mov es, word ptr [0x12c]                 
  038f  268b160400       mov dx, word ptr es:[4]                  
  0394  268b0e0600       mov cx, word ptr es:[6]                  
  0399  e85000           call 0x3ec                               
  039c  7240             jb 0x3de                                 
  039e  a12c01           mov ax, word ptr [0x12c]                 
  03a1  1e               push ds                                  
  03a2  8ec0             mov es, ax                               
  03a4  268b0e0a00       mov cx, word ptr es:[0xa]                
  03a9  e303             jcxz 0x3ae                               
  03ab  e87700           call 0x425                               
  03ae  26833e0c0000     cmp word ptr es:[0xc], 0                 
  03b4  7403             je 0x3b9                                 
  03b6  e8de02           call 0x697                               
  03b9  26a11000         mov ax, word ptr es:[0x10]               
  03bd  48               dec ax                                   
  03be  8ed8             mov ds, ax                               
  03c0  8c060e00         mov word ptr [0xe], es                   
  03c4  06               push es                                  
  03c5  b8ffff           mov ax, 0xffff                           
  03c8  8bd8             mov bx, ax                               
  03ca  2e8e1e0900       mov ds, word ptr cs:[9]                  
  03cf  ff1e8600         lcall [0x86]                             
  03d3  07               pop es                                   
  03d4  26a11c00         mov ax, word ptr es:[0x1c]               
  03d8  0bc0             or ax, ax                                
  03da  75c6             jne 0x3a2                                
  03dc  1f               pop ds                                   
  03dd  f8               clc                                      
  03de  c3               ret                                      
  03df  b104             mov cl, 4                                
  03e1  d3e8             shr ax, cl                               
  03e3  d3ca             ror dx, cl                               
  03e5  81e200f0         and dx, 0xf000                           
  03e9  0bc2             or ax, dx                                
  03eb  c3               ret                                      

res_15de_03ec:  ; ENTRY
  03ec  50               push ax                                  
  03ed  8b1e2801         mov bx, word ptr [0x128]                 
  03f1  b80042           mov ax, 0x4200                           
  03f4  cd21             int 0x21                                 
  03f6  58               pop ax                                   
  03f7  1e               push ds                                  
  03f8  8ed8             mov ds, ax                               
  03fa  eb07             jmp 0x403                                
  03fc  8cd8             mov ax, ds                               
  03fe  05ff0f           add ax, 0xfff                            
  0401  8ed8             mov ds, ax                               
  0403  b9f0ff           mov cx, 0xfff0                           
  0406  0bff             or di, di                                
  0408  7502             jne 0x40c                                
  040a  8bce             mov cx, si                               
  040c  33d2             xor dx, dx                               
  040e  b43f             mov ah, 0x3f                             
  0410  cd21             int 0x21                                 
  0412  720f             jb 0x423                                 
  0414  3bc1             cmp ax, cx                               
  0416  720b             jb 0x423                                 
  0418  2bf0             sub si, ax                               
  041a  83df00           sbb di, 0                                
  041d  8bc6             mov ax, si                               
  041f  0bc7             or ax, di                                
  0421  75d9             jne 0x3fc                                
  0423  1f               pop ds                                   
  0424  c3               ret                                      

res_15de_0425:  ; ENTRY
  0425  1e               push ds                                  
  0426  06               push es                                  
  0427  26a10800         mov ax, word ptr es:[8]                  
  042b  8bf0             mov si, ax                               
  042d  83e60f           and si, 0xf                              
  0430  d1e8             shr ax, 1                                
  0432  d1e8             shr ax, 1                                
  0434  d1e8             shr ax, 1                                
  0436  d1e8             shr ax, 1                                
  0438  268b161000       mov dx, word ptr es:[0x10]               
  043d  03c2             add ax, dx                               
  043f  8ed8             mov ds, ax                               
  0441  8ec2             mov es, dx                               
  0443  d1e9             shr cx, 1                                
  0445  fc               cld                                      
  0446  ad               lodsw ax, word ptr [si]                  
  0447  8bd8             mov bx, ax                               
  0449  268b3f           mov di, word ptr es:[bx]                 
  044c  1e               push ds                                  
  044d  b80e2f           mov ax, 0x2f0e                           
  0450  8ed8             mov ds, ax                               
  0452  8bc7             mov ax, di                               
  0454  83e7f8           and di, 0xfff8                           
  0457  8b15             mov dx, word ptr [di]                    
  0459  268917           mov word ptr es:[bx], dx                 
  045c  a90100           test ax, 1                               
  045f  7403             je 0x464                                 
  0461  e80600           call 0x46a                               
  0464  1f               pop ds                                   
  0465  e2df             loop 0x446                               
  0467  07               pop es                                   
  0468  1f               pop ds                                   
  0469  c3               ret                                      

res_15de_046a:  ; ENTRY
  046a  51               push cx                                  
  046b  8eda             mov ds, dx                               
  046d  268a67ff         mov ah, byte ptr es:[bx - 1]             
  0471  8ac4             mov al, ah                               
  0473  2507f8           and ax, 0xf807                           
  0476  80fcb8           cmp ah, 0xb8                             
  0479  754b             jne 0x4c6                                
  047b  8bc8             mov cx, ax                               
  047d  268a6702         mov ah, byte ptr es:[bx + 2]             
  0481  8ac4             mov al, ah                               
  0483  2507f8           and ax, 0xf807                           
  0486  80fc50           cmp ah, 0x50                             
  0489  753b             jne 0x4c6                                
  048b  3ac1             cmp al, cl                               
  048d  7537             jne 0x4c6                                
  048f  8bd0             mov dx, ax                               
  0491  268a6703         mov ah, byte ptr es:[bx + 3]             
  0495  8ac4             mov al, ah                               
  0497  2507f8           and ax, 0xf807                           
  049a  3bc8             cmp cx, ax                               
  049c  7528             jne 0x4c6                                
  049e  268a6706         mov ah, byte ptr es:[bx + 6]             
  04a2  8ac4             mov al, ah                               
  04a4  2507f8           and ax, 0xf807                           
  04a7  3bc2             cmp ax, dx                               
  04a9  751b             jne 0x4c6                                
  04ab  bf2000           mov di, 0x20                             
  04ae  8b0e0c00         mov cx, word ptr [0xc]                   
  04b2  268b4704         mov ax, word ptr es:[bx + 4]             
  04b6  3b4502           cmp ax, word ptr [di + 2]                
  04b9  7407             je 0x4c2                                 
  04bb  83c705           add di, 5                                
  04be  e2f6             loop 0x4b6                               
  04c0  eb06             jmp 0x4c8                                
  04c2  26897f04         mov word ptr es:[bx + 4], di             
  04c6  59               pop cx                                   
  04c7  c3               ret                                      
  04c8  59               pop cx                                   
  04c9  c3               ret                                      
  04ca  268b360800       mov si, word ptr es:[8]                  
  04cf  33ff             xor di, di                               
  04d1  2603360a00       add si, word ptr es:[0xa]                
  04d6  83d700           adc di, 0                                
  04d9  268b160400       mov dx, word ptr es:[4]                  
  04de  268b0e0600       mov cx, word ptr es:[6]                  
  04e3  26a11000         mov ax, word ptr es:[0x10]               
  04e7  e802ff           call 0x3ec                               
  04ea  720b             jb 0x4f7                                 
  04ec  268b0e0a00       mov cx, word ptr es:[0xa]                
  04f1  e303             jcxz 0x4f6                               
  04f3  e82fff           call 0x425                               
  04f6  f8               clc                                      
  04f7  c3               ret                                      
  04f8  55               push bp                                  
  04f9  8bec             mov bp, sp                               
  04fb  f7c50100         test bp, 1                               
  04ff  7405             je 0x506                                 
  0501  ea4d0e0000       ljmp 0:0xe4d                             
  0506  50               push ax                                  
  0507  53               push bx                                  
  0508  51               push cx                                  
  0509  52               push dx                                  
  050a  56               push si                                  
  050b  57               push di                                  
  050c  1e               push ds                                  
  050d  06               push es                                  
  050e  b8f42e           mov ax, 0x2ef4                           
  0511  8ed8             mov ds, ax                               
  0513  fb               sti                                      
  0514  c45e02           les bx, ptr [bp + 2]                     
  0517  26ff37           push word ptr es:[bx]                    
  051a  836e0202         sub word ptr [bp + 2], 2                 
  051e  7505             jne 0x525                                
  0520  e88500           call 0x5a8                               
  0523  eb18             jmp 0x53d                                
  0525  83c506           add bp, 6                                
  0528  8b4600           mov ax, word ptr [bp]                    
  052b  8746fa           xchg word ptr [bp - 6], ax               
  052e  894600           mov word ptr [bp], ax                    
  0531  e87400           call 0x5a8                               
  0534  8b4600           mov ax, word ptr [bp]                    
  0537  8746fa           xchg word ptr [bp - 6], ax               
  053a  894600           mov word ptr [bp], ax                    
  053d  5b               pop bx                                   
  053e  26a01a00         mov al, byte ptr es:[0x1a]               
  0542  2408             and al, 8                                
  0544  2680261a00f7     and byte ptr es:[0x1a], 0xf7             
  054a  98               cwde                                     
  054b  2e8e1e0900       mov ds, word ptr cs:[9]                  
  0550  ff1e8600         lcall [0x86]                             
  0554  07               pop es                                   
  0555  1f               pop ds                                   
  0556  5f               pop di                                   
  0557  5e               pop si                                   
  0558  5a               pop dx                                   
  0559  59               pop cx                                   
  055a  5b               pop bx                                   
  055b  58               pop ax                                   
  055c  5d               pop bp                                   
  055d  cf               iret                                     

res_15de_055e:  ; ENTRY
  055e  06               push es                                  
  055f  ff062a01         inc word ptr [0x12a]                     
  0563  e84b02           call 0x7b1                               
  0566  eb2e             jmp 0x596                                
  0568  9d               popf                                     
  0569  52               push dx                                  
  056a  7303             jae 0x56f                                
  056c  e8cc00           call 0x63b                               
  056f  8e062c01         mov es, word ptr [0x12c]                 
  0573  26a11c00         mov ax, word ptr es:[0x1c]               
  0577  a32c01           mov word ptr [0x12c], ax                 
  057a  26803e1b0000     cmp byte ptr es:[0x1b], 0                
  0580  7508             jne 0x58a                                
  0582  e89e00           call 0x623                               
  0585  e81d02           call 0x7a5                               
  0588  eb0b             jmp 0x595                                
  058a  26fe0e1b00       dec byte ptr es:[0x1b]                   
  058f  e85601           call 0x6e8                               
  0592  e8a401           call 0x739                               
  0595  5a               pop dx                                   
  0596  e8f001           call 0x789                               
  0599  9c               pushf                                    
  059a  3bd0             cmp dx, ax                               
  059c  77ca             ja 0x568                                 
  059e  9d               popf                                     
  059f  07               pop es                                   
  05a0  a12001           mov ax, word ptr [0x120]                 
  05a3  26a31000         mov word ptr es:[0x10], ax               
  05a7  c3               ret                                      

res_15de_05a8:  ; ENTRY
  05a8  ff061c01         inc word ptr [0x11c]                     
  05ac  26833e100000     cmp word ptr es:[0x10], 0                
  05b2  740f             je 0x5c3                                 
  05b4  26c6061b0001     mov byte ptr es:[0x1b], 1                
  05ba  26800e1a0004     or byte ptr es:[0x1a], 4                 
  05c0  eb1d             jmp 0x5df                                
  05c2  90               nop                                      
  05c3  26800e1a0008     or byte ptr es:[0x1a], 8                 
  05c9  e892ff           call 0x55e                               
  05cc  1e               push ds                                  
  05cd  48               dec ax                                   
  05ce  8ed8             mov ds, ax                               
  05d0  8c060e00         mov word ptr [0xe], es                   
  05d4  1f               pop ds                                   
  05d5  26ff161800       call word ptr es:[0x18]                  
  05da  7242             jb 0x61e                                 
  05dc  e85a01           call 0x739                               
  05df  e89400           call 0x676                               
  05e2  26a01a00         mov al, byte ptr es:[0x1a]               
  05e6  2403             and al, 3                                
  05e8  2600061b00       add byte ptr es:[0x1b], al               
  05ed  06               push es                                  
  05ee  e89801           call 0x789                               
  05f1  8e062c01         mov es, word ptr [0x12c]                 
  05f5  268b0e1c00       mov cx, word ptr es:[0x1c]               
  05fa  e320             jcxz 0x61c                               
  05fc  3b061801         cmp ax, word ptr [0x118]                 
  0600  731a             jae 0x61c                                
  0602  51               push cx                                  
  0603  50               push ax                                  
  0604  26803e1b0000     cmp byte ptr es:[0x1b], 0                
  060a  7404             je 0x610                                 
  060c  33c0             xor ax, ax                               
  060e  eb06             jmp 0x616                                
  0610  e8a200           call 0x6b5                               
  0613  e88f01           call 0x7a5                               
  0616  59               pop cx                                   
  0617  07               pop es                                   
  0618  03c1             add ax, cx                               
  061a  ebd9             jmp 0x5f5                                
  061c  07               pop es                                   
  061d  c3               ret                                      
  061e  ea4d0e0000       ljmp 0:0xe4d                             

res_15de_0623:  ; ENTRY
  0623  e88f00           call 0x6b5                               
  0626  26813e1800ca04   cmp word ptr es:[0x18], 0x4ca            
  062d  7504             jne 0x633                                
  062f  ff168000         call word ptr [0x80]                     
  0633  26c70610000000   mov word ptr es:[0x10], 0                
  063a  c3               ret                                      

res_15de_063b:  ; ENTRY
  063b  a12c01           mov ax, word ptr [0x12c]                 
  063e  33c9             xor cx, cx                               
  0640  41               inc cx                                   
  0641  50               push ax                                  
  0642  8ec0             mov es, ax                               
  0644  26a11c00         mov ax, word ptr es:[0x1c]               
  0648  0bc0             or ax, ax                                
  064a  75f4             jne 0x640                                
  064c  a32c01           mov word ptr [0x12c], ax                 
  064f  a12601           mov ax, word ptr [0x126]                 
  0652  a32001           mov word ptr [0x120], ax                 
  0655  07               pop es                                   
  0656  51               push cx                                  
  0657  a12c01           mov ax, word ptr [0x12c]                 
  065a  26a31c00         mov word ptr es:[0x1c], ax               
  065e  8c062c01         mov word ptr [0x12c], es                 
  0662  e84001           call 0x7a5                               
  0665  29062001         sub word ptr [0x120], ax                 
  0669  e87c00           call 0x6e8                               
  066c  59               pop cx                                   
  066d  e2e6             loop 0x655                               
  066f  a12401           mov ax, word ptr [0x124]                 
  0672  a32001           mov word ptr [0x120], ax                 
  0675  c3               ret                                      

res_15de_0676:  ; ENTRY
  0676  26833e0c0000     cmp word ptr es:[0xc], 0                 
  067c  7501             jne 0x67f                                
  067e  c3               ret                                      
  067f  26803e2000ea     cmp byte ptr es:[0x20], 0xea             
  0685  742d             je 0x6b4                                 
  0687  268b0e0200       mov cx, word ptr es:[2]                  
  068c  e309             jcxz 0x697                               
  068e  26a11000         mov ax, word ptr es:[0x10]               
  0692  8cc2             mov dx, es                               
  0694  e8c000           call 0x757                               

res_15de_0697:  ; ENTRY
  0697  268b1e1000       mov bx, word ptr es:[0x10]               
  069c  268b0e0c00       mov cx, word ptr es:[0xc]                
  06a1  bf2000           mov di, 0x20                             
  06a4  fc               cld                                      
  06a5  268b5502         mov dx, word ptr es:[di + 2]             
  06a9  b0ea             mov al, 0xea                             
  06ab  aa               stosb byte ptr es:[di], al               
  06ac  8bc2             mov ax, dx                               
  06ae  ab               stosw word ptr es:[di], ax               
  06af  8bc3             mov ax, bx                               
  06b1  ab               stosw word ptr es:[di], ax               
  06b2  e2f1             loop 0x6a5                               
  06b4  c3               ret                                      

res_15de_06b5:  ; ENTRY
  06b5  26803e2000cd     cmp byte ptr es:[0x20], 0xcd             
  06bb  742a             je 0x6e7                                 
  06bd  8cc0             mov ax, es                               
  06bf  268b161000       mov dx, word ptr es:[0x10]               
  06c4  33c9             xor cx, cx                               
  06c6  e88e00           call 0x757                               
  06c9  26890e0200       mov word ptr es:[2], cx                  
  06ce  268b0e0c00       mov cx, word ptr es:[0xc]                
  06d3  bf2000           mov di, 0x20                             
  06d6  fc               cld                                      
  06d7  268b5501         mov dx, word ptr es:[di + 1]             
  06db  a11001           mov ax, word ptr [0x110]                 
  06de  ab               stosw word ptr es:[di], ax               
  06df  8bc2             mov ax, dx                               
  06e1  ab               stosw word ptr es:[di], ax               
  06e2  32c0             xor al, al                               
  06e4  aa               stosb byte ptr es:[di], al               
  06e5  e2f0             loop 0x6d7                               
  06e7  c3               ret                                      

res_15de_06e8:  ; ENTRY
  06e8  a12001           mov ax, word ptr [0x120]                 
  06eb  268b161000       mov dx, word ptr es:[0x10]               
  06f0  26a31000         mov word ptr es:[0x10], ax               
  06f4  268b0e0800       mov cx, word ptr es:[8]                  
  06f9  41               inc cx                                   
  06fa  d1e9             shr cx, 1                                
  06fc  33f6             xor si, si                               
  06fe  fc               cld                                      
  06ff  3bc2             cmp ax, dx                               
  0701  7206             jb 0x709                                 
  0703  8bf1             mov si, cx                               
  0705  4e               dec si                                   
  0706  d1e6             shl si, 1                                
  0708  fd               std                                      
  0709  8bfe             mov di, si                               
  070b  1e               push ds                                  
  070c  06               push es                                  
  070d  8eda             mov ds, dx                               
  070f  8ec0             mov es, ax                               
  0711  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0713  fc               cld                                      
  0714  48               dec ax                                   
  0715  8ed8             mov ds, ax                               
  0717  07               pop es                                   
  0718  8c060e00         mov word ptr [0xe], es                   
  071c  40               inc ax                                   
  071d  1f               pop ds                                   
  071e  26803e2000cd     cmp byte ptr es:[0x20], 0xcd             
  0724  7412             je 0x738                                 
  0726  e83a00           call 0x763                               
  0729  268b0e0c00       mov cx, word ptr es:[0xc]                
  072e  bf2300           mov di, 0x23                             
  0731  fc               cld                                      
  0732  ab               stosw word ptr es:[di], ax               
  0733  83c703           add di, 3                                
  0736  e2fa             loop 0x732                               
  0738  c3               ret                                      

res_15de_0739:  ; ENTRY
  0739  e86900           call 0x7a5                               
  073c  01062001         add word ptr [0x120], ax                 
  0740  1e               push ds                                  
  0741  b8052f           mov ax, 0x2f05                           
  0744  8ed8             mov ds, ax                               
  0746  a11c00           mov ax, word ptr [0x1c]                  
  0749  0bc0             or ax, ax                                
  074b  75f7             jne 0x744                                
  074d  8c061c00         mov word ptr [0x1c], es                  
  0751  26a31c00         mov word ptr es:[0x1c], ax               
  0755  1f               pop ds                                   
  0756  c3               ret                                      

res_15de_0757:  ; ENTRY
  0757  e80900           call 0x763                               
  075a  0bdb             or bx, bx                                
  075c  7404             je 0x762                                 
  075e  36874f02         xchg word ptr ss:[bx + 2], cx            
  0762  c3               ret                                      

res_15de_0763:  ; ENTRY
  0763  33db             xor bx, bx                               
  0765  51               push cx                                  
  0766  55               push bp                                  
  0767  eb04             jmp 0x76d                                
  0769  d1e1             shl cx, 1                                
  076b  8be9             mov bp, cx                               
  076d  8b4e00           mov cx, word ptr [bp]                    
  0770  d1e9             shr cx, 1                                
  0772  7412             je 0x786                                 
  0774  72f3             jb 0x769                                 
  0776  3b5604           cmp dx, word ptr [bp + 4]                
  0779  75ee             jne 0x769                                
  077b  894604           mov word ptr [bp + 4], ax                
  077e  0bdb             or bx, bx                                
  0780  75e7             jne 0x769                                
  0782  8bdd             mov bx, bp                               
  0784  ebe3             jmp 0x769                                
  0786  5d               pop bp                                   
  0787  59               pop cx                                   
  0788  c3               ret                                      

res_15de_0789:  ; ENTRY
  0789  a12c01           mov ax, word ptr [0x12c]                 
  078c  0bc0             or ax, ax                                
  078e  740c             je 0x79c                                 
  0790  8ec0             mov es, ax                               
  0792  26a11000         mov ax, word ptr es:[0x10]               
  0796  2b062001         sub ax, word ptr [0x120]                 
  079a  7308             jae 0x7a4                                
  079c  a12601           mov ax, word ptr [0x126]                 
  079f  2b062001         sub ax, word ptr [0x120]                 
  07a3  f9               stc                                      
  07a4  c3               ret                                      

res_15de_07a5:  ; ENTRY
  07a5  26a10800         mov ax, word ptr es:[8]                  
  07a9  051100           add ax, 0x11                             
  07ac  b104             mov cl, 4                                
  07ae  d3e8             shr ax, cl                               
  07b0  c3               ret                                      

res_15de_07b1:  ; ENTRY
  07b1  b104             mov cl, 4                                
  07b3  26a10800         mov ax, word ptr es:[8]                  
  07b7  051100           add ax, 0x11                             
  07ba  d3e8             shr ax, cl                               
  07bc  268b160a00       mov dx, word ptr es:[0xa]                
  07c1  83c20f           add dx, 0xf                              
  07c4  d3ea             shr dx, cl                               
  07c6  03d0             add dx, ax                               
  07c8  c3               ret                                      
  07c9  1e               push ds                                  
  07ca  06               push es                                  
  07cb  2e8e1e0900       mov ds, word ptr cs:[9]                  
  07d0  3b062401         cmp ax, word ptr [0x124]                 
  07d4  7223             jb 0x7f9                                 
  07d6  3b062601         cmp ax, word ptr [0x126]                 
  07da  731d             jae 0x7f9                                
  07dc  48               dec ax                                   
  07dd  8ec0             mov es, ax                               
  07df  268e060e00       mov es, word ptr es:[0xe]                
  07e4  40               inc ax                                   
  07e5  8b1e1001         mov bx, word ptr [0x110]                 
  07e9  263b1e0000       cmp bx, word ptr es:[0]                  
  07ee  7509             jne 0x7f9                                
  07f0  263b061000       cmp ax, word ptr es:[0x10]               
  07f5  8cc0             mov ax, es                               
  07f7  7403             je 0x7fc                                 
  07f9  33c0             xor ax, ax                               
  07fb  f9               stc                                      
  07fc  07               pop es                                   
  07fd  1f               pop ds                                   
  07fe  cb               retf                                     
  07ff  55               push bp                                  
  0800  8bec             mov bp, sp                               
  0802  83ec02           sub sp, 2                                
  0805  c646fe00         mov byte ptr [bp - 2], 0                 
  0809  1e               push ds                                  
  080a  2e8e1e0900       mov ds, word ptr cs:[9]                  
  080f  56               push si                                  
  0810  57               push di                                  
  0811  8bdd             mov bx, bp                               
  0813  a11001           mov ax, word ptr [0x110]                 
  0816  8b162401         mov dx, word ptr [0x124]                 
  081a  eb04             jmp 0x820                                
  081c  d1e6             shl si, 1                                
  081e  8bde             mov bx, si                               
  0820  3bd9             cmp bx, cx                               
  0822  732a             jae 0x84e                                
  0824  368b37           mov si, word ptr ss:[bx]                 
  0827  d1ee             shr si, 1                                
  0829  7423             je 0x84e                                 
  082b  72ef             jb 0x81c                                 
  082d  368b7f04         mov di, word ptr ss:[bx + 4]             
  0831  3bfa             cmp di, dx                               
  0833  73e7             jae 0x81c                                
  0835  8ec7             mov es, di                               
  0837  368b7f02         mov di, word ptr ss:[bx + 2]             
  083b  0bff             or di, di                                
  083d  75dd             jne 0x81c                                
  083f  263905           cmp word ptr es:[di], ax                 
  0842  75d8             jne 0x81c                                
  0844  c646fe01         mov byte ptr [bp - 2], 1                 
  0848  26897d02         mov word ptr es:[di + 2], di             
  084c  ebce             jmp 0x81c                                
  084e  807efe01         cmp byte ptr [bp - 2], 1                 
  0852  7407             je 0x85b                                 
  0854  eb3a             jmp 0x890                                
  0856  90               nop                                      
  0857  d1e6             shl si, 1                                
  0859  8bde             mov bx, si                               
  085b  368b37           mov si, word ptr ss:[bx]                 
  085e  d1ee             shr si, 1                                
  0860  742e             je 0x890                                 
  0862  72f3             jb 0x857                                 
  0864  368b7f04         mov di, word ptr ss:[bx + 4]             
  0868  3bfa             cmp di, dx                               
  086a  73eb             jae 0x857                                
  086c  8ec7             mov es, di                               
  086e  368b7f02         mov di, word ptr ss:[bx + 2]             
  0872  0bff             or di, di                                
  0874  74e1             je 0x857                                 
  0876  2639060000       cmp word ptr es:[0], ax                  
  087b  75da             jne 0x857                                
  087d  26833e020000     cmp word ptr es:[2], 0                   
  0883  75d2             jne 0x857                                
  0885  26873e0200       xchg word ptr es:[2], di                 
  088a  36897f02         mov word ptr ss:[bx + 2], di             
  088e  ebc7             jmp 0x857                                
  0890  5f               pop di                                   
  0891  5e               pop si                                   
  0892  1f               pop ds                                   
  0893  8be5             mov sp, bp                               
  0895  5d               pop bp                                   
  0896  cb               retf                                     
  0897  55               push bp                                  
  0898  8bec             mov bp, sp                               
  089a  1e               push ds                                  
  089b  2e8e1e0900       mov ds, word ptr cs:[9]                  
  08a0  8e4608           mov es, word ptr [bp + 8]                
  08a3  8b0e1001         mov cx, word ptr [0x110]                 
  08a7  263b0e0000       cmp cx, word ptr es:[0]                  
  08ac  753e             jne 0x8ec                                
  08ae  26833e100000     cmp word ptr es:[0x10], 0                
  08b4  7408             je 0x8be                                 
  08b6  26803e2000cd     cmp byte ptr es:[0x20], 0xcd             
  08bc  7527             jne 0x8e5                                
  08be  c746080000       mov word ptr [bp + 8], 0                 
  08c3  56               push si                                  
  08c4  57               push di                                  
  08c5  e8e0fc           call 0x5a8                               
  08c8  5f               pop di                                   
  08c9  5e               pop si                                   
  08ca  8b5e06           mov bx, word ptr [bp + 6]                
  08cd  06               push es                                  
  08ce  26a01a00         mov al, byte ptr es:[0x1a]               
  08d2  2408             and al, 8                                
  08d4  2680261a00f7     and byte ptr es:[0x1a], 0xf7             
  08da  98               cwde                                     
  08db  2e8e1e0900       mov ds, word ptr cs:[9]                  
  08e0  ff1e8600         lcall [0x86]                             
  08e4  07               pop es                                   
  08e5  26a11000         mov ax, word ptr es:[0x10]               
  08e9  894608           mov word ptr [bp + 8], ax                
  08ec  1f               pop ds                                   
  08ed  5d               pop bp                                   
  08ee  cb               retf                                     

res_15de_08ef:  ; ENTRY
  08ef  55               push bp                                  
  08f0  8bec             mov bp, sp                               
  08f2  1e               push ds                                  
  08f3  2e8e1e0900       mov ds, word ptr cs:[9]                  
  08f8  f606100001       test byte ptr [0x10], 1                  
  08fd  7406             je 0x905                                 
  08ff  b8ffff           mov ax, 0xffff                           
  0902  e9c700           jmp 0x9cc                                
  0905  837e0600         cmp word ptr [bp + 6], 0                 
  0909  7411             je 0x91c                                 
  090b  8b4e0a           mov cx, word ptr [bp + 0xa]              
  090e  e3ef             jcxz 0x8ff                                ; "vectoring"
  0910  3b4e08           cmp cx, word ptr [bp + 8]                
  0913  76ea             jbe 0x8ff                                
  0915  800e380001       or byte ptr [0x38], 1                    
  091a  eb1d             jmp 0x939                                
  091c  90               nop                                      
  091d  0e               push cs                                  
  091e  e86e04           call 0xd8f                               
  0921  0bc0             or ax, ax                                
  0923  74da             je 0x8ff                                 
  0925  8b5e08           mov bx, word ptr [bp + 8]                
  0928  3bd8             cmp bx, ax                               
  092a  73d3             jae 0x8ff                                
  092c  2bc3             sub ax, bx                               
  092e  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0931  e304             jcxz 0x937                               
  0933  3bc8             cmp cx, ax                               
  0935  7202             jb 0x939                                 
  0937  8bc8             mov cx, ax                               
  0939  2e8e060b00       mov es, word ptr cs:[0xb]                
  093e  bb0040           mov bx, 0x4000                           
  0941  26a18238         mov ax, word ptr es:[0x3882]             
  0945  268b168438       mov dx, word ptr es:[0x3884]             
  094a  05ff3f           add ax, 0x3fff                           
  094d  83d200           adc dx, 0                                
  0950  f7f3             div bx                                   
  0952  3bc8             cmp cx, ax                               
  0954  7602             jbe 0x958                                
  0956  8bc8             mov cx, ax                               
  0958  83f904           cmp cx, 4                                
  095b  730d             jae 0x96a                                
  095d  b80004           mov ax, 0x400                            
  0960  f7e1             mul cx                                   
  0962  3b061a01         cmp ax, word ptr [0x11a]                 
  0966  7302             jae 0x96a                                
  0968  eb95             jmp 0x8ff                                
  096a  ff7606           push word ptr [bp + 6]                   
  096d  ff7608           push word ptr [bp + 8]                   
  0970  894e0a           mov word ptr [bp + 0xa], cx              
  0973  51               push cx                                  
  0974  90               nop                                      
  0975  0e               push cs                                  
  0976  e8c804           call 0xe41                               
  0979  0bc0             or ax, ax                                
  097b  754f             jne 0x9cc                                
  097d  57               push di                                  
  097e  bf4001           mov di, 0x140                            
  0981  1e               push ds                                  
  0982  07               pop es                                   
  0983  fc               cld                                      
  0984  b80040           mov ax, 0x4000                           
  0987  f76608           mul word ptr [bp + 8]                    
  098a  8bd8             mov bx, ax                               
  098c  ab               stosw word ptr es:[di], ax               
  098d  8bca             mov cx, dx                               
  098f  8bc2             mov ax, dx                               
  0991  ab               stosw word ptr es:[di], ax               
  0992  b80040           mov ax, 0x4000                           
  0995  f7660a           mul word ptr [bp + 0xa]                  
  0998  03c3             add ax, bx                               
  099a  13d1             adc dx, cx                               
  099c  ab               stosw word ptr es:[di], ax               
  099d  8bc2             mov ax, dx                               
  099f  ab               stosw word ptr es:[di], ax               
  09a0  8bc3             mov ax, bx                               
  09a2  ab               stosw word ptr es:[di], ax               
  09a3  8bc1             mov ax, cx                               
  09a5  ab               stosw word ptr es:[di], ax               
  09a6  c7064c014f0a     mov word ptr [0x14c], 0xa4f              
  09ac  c7064e010000     mov word ptr [0x14e], 0                  
  09b2  c70612010100     mov word ptr [0x112], 1                  
  09b8  800e100002       or byte ptr [0x10], 2                    
  09bd  c7068400a60e     mov word ptr [0x84], 0xea6               
  09c3  c7068000150d     mov word ptr [0x80], 0xd15               
  09c9  33c0             xor ax, ax                               
  09cb  5f               pop di                                   
  09cc  1f               pop ds                                   
  09cd  5d               pop bp                                   
  09ce  cb               retf                                     

res_15de_09cf:  ; ENTRY
  09cf  b8082f           mov ax, 0x2f08                           
  09d2  e85d02           call 0xc32                               
  09d5  7277             jb 0xa4e                                 
  09d7  06               push es                                  
  09d8  50               push ax                                  
  09d9  53               push bx                                  
  09da  51               push cx                                  
  09db  52               push dx                                  
  09dc  b80100           mov ax, 1                                
  09df  ff1e8600         lcall [0x86]                             
  09e3  5a               pop dx                                   
  09e4  59               pop cx                                   
  09e5  5b               pop bx                                   
  09e6  58               pop ax                                   
  09e7  07               pop es                                   
  09e8  8bc3             mov ax, bx                               
  09ea  8bd1             mov dx, cx                               
  09ec  bb0040           mov bx, 0x4000                           
  09ef  f7f3             div bx                                   
  09f1  8bd8             mov bx, ax                               
  09f3  8bfa             mov di, dx                               
  09f5  8b163200         mov dx, word ptr [0x32]                  
  09f9  b447             mov ah, 0x47                             
  09fb  cd67             int 0x67                                 
  09fd  d0e4             shl ah, 1                                
  09ff  7248             jb 0xa49                                 
  0a01  268b160800       mov dx, word ptr es:[8]                  
  0a06  33f6             xor si, si                               
  0a08  b90040           mov cx, 0x4000                           
  0a0b  2bcf             sub cx, di                               
  0a0d  3bca             cmp cx, dx                               
  0a0f  7202             jb 0xa13                                 
  0a11  8bca             mov cx, dx                               
  0a13  2bd1             sub dx, cx                               
  0a15  52               push dx                                  
  0a16  8b163200         mov dx, word ptr [0x32]                  
  0a1a  b80044           mov ax, 0x4400                           
  0a1d  cd67             int 0x67                                 
  0a1f  5a               pop dx                                   
  0a20  d0e4             shl ah, 1                                
  0a22  7219             jb 0xa3d                                 
  0a24  1e               push ds                                  
  0a25  06               push es                                  
  0a26  a13000           mov ax, word ptr [0x30]                  
  0a29  268e1e1000       mov ds, word ptr es:[0x10]               
  0a2e  8ec0             mov es, ax                               
  0a30  fc               cld                                      
  0a31  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0a33  07               pop es                                   
  0a34  1f               pop ds                                   
  0a35  43               inc bx                                   
  0a36  33ff             xor di, di                               
  0a38  0bd2             or dx, dx                                
  0a3a  75cc             jne 0xa08                                
  0a3c  f8               clc                                      
  0a3d  9c               pushf                                    
  0a3e  8b163200         mov dx, word ptr [0x32]                  
  0a42  b448             mov ah, 0x48                             
  0a44  cd67             int 0x67                                 
  0a46  9d               popf                                     
  0a47  7305             jae 0xa4e                                
  0a49  ea4d0e0000       ljmp 0:0xe4d                             
  0a4e  c3               ret                                      
  0a4f  8b163200         mov dx, word ptr [0x32]                  
  0a53  b447             mov ah, 0x47                             
  0a55  cd67             int 0x67                                 
  0a57  d0e4             shl ah, 1                                
  0a59  7258             jb 0xab3                                 
  0a5b  26a11400         mov ax, word ptr es:[0x14]               
  0a5f  268b161600       mov dx, word ptr es:[0x16]               
  0a64  bb0040           mov bx, 0x4000                           
  0a67  f7f3             div bx                                   
  0a69  8bd8             mov bx, ax                               
  0a6b  8bf2             mov si, dx                               
  0a6d  268b160800       mov dx, word ptr es:[8]                  
  0a72  33ff             xor di, di                               
  0a74  b90040           mov cx, 0x4000                           
  0a77  2bce             sub cx, si                               
  0a79  3bca             cmp cx, dx                               
  0a7b  7202             jb 0xa7f                                 
  0a7d  8bca             mov cx, dx                               
  0a7f  2bd1             sub dx, cx                               
  0a81  52               push dx                                  
  0a82  8b163200         mov dx, word ptr [0x32]                  
  0a86  b80044           mov ax, 0x4400                           
  0a89  cd67             int 0x67                                 
  0a8b  5a               pop dx                                   
  0a8c  d0e4             shl ah, 1                                
  0a8e  7217             jb 0xaa7                                 
  0a90  1e               push ds                                  
  0a91  06               push es                                  
  0a92  8e1e3000         mov ds, word ptr [0x30]                  
  0a96  268e061000       mov es, word ptr es:[0x10]               
  0a9b  fc               cld                                      
  0a9c  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0a9e  07               pop es                                   
  0a9f  1f               pop ds                                   
  0aa0  43               inc bx                                   
  0aa1  33f6             xor si, si                               
  0aa3  0bd2             or dx, dx                                
  0aa5  75cd             jne 0xa74                                
  0aa7  9c               pushf                                    
  0aa8  8b163200         mov dx, word ptr [0x32]                  
  0aac  b448             mov ah, 0x48                             
  0aae  cd67             int 0x67                                 
  0ab0  9d               popf                                     
  0ab1  7305             jae 0xab8                                
  0ab3  ea4d0e0000       ljmp 0:0xe4d                             
  0ab8  c3               ret                                      

res_15de_0ab9:  ; ENTRY
  0ab9  55               push bp                                  
  0aba  8bec             mov bp, sp                               
  0abc  83ec02           sub sp, 2                                
  0abf  1e               push ds                                  
  0ac0  2e8e1e0900       mov ds, word ptr cs:[9]                  
  0ac5  56               push si                                  
  0ac6  57               push di                                  
  0ac7  f606100002       test byte ptr [0x10], 2                  
  0acc  7405             je 0xad3                                 
  0ace  33c0             xor ax, ax                               
  0ad0  e9f900           jmp 0xbcc                                
  0ad3  c646fe00         mov byte ptr [bp - 2], 0                 
  0ad7  90               nop                                      
  0ad8  0e               push cs                                  
  0ad9  e8f503           call 0xed1                               
  0adc  0bc2             or ax, dx                                
  0ade  7506             jne 0xae6                                
  0ae0  b8ffff           mov ax, 0xffff                           
  0ae3  e9e600           jmp 0xbcc                                
  0ae6  8b5e06           mov bx, word ptr [bp + 6]                
  0ae9  8b4e08           mov cx, word ptr [bp + 8]                
  0aec  3b0e3c00         cmp cx, word ptr [0x3c]                  
  0af0  7208             jb 0xafa                                 
  0af2  770e             ja 0xb02                                 
  0af4  3b1e3a00         cmp bx, word ptr [0x3a]                  
  0af8  7308             jae 0xb02                                
  0afa  8b0e3c00         mov cx, word ptr [0x3c]                  
  0afe  8b1e3a00         mov bx, word ptr [0x3a]                  
  0b02  3b0e4000         cmp cx, word ptr [0x40]                  
  0b06  77d8             ja 0xae0                                 
  0b08  7206             jb 0xb10                                 
  0b0a  3b1e3e00         cmp bx, word ptr [0x3e]                  
  0b0e  77d0             ja 0xae0                                 
  0b10  895e06           mov word ptr [bp + 6], bx                
  0b13  894e08           mov word ptr [bp + 8], cx                
  0b16  a13e00           mov ax, word ptr [0x3e]                  
  0b19  8b164000         mov dx, word ptr [0x40]                  
  0b1d  2bc3             sub ax, bx                               
  0b1f  1bd1             sbb dx, cx                               
  0b21  8b760a           mov si, word ptr [bp + 0xa]              
  0b24  0b760c           or si, word ptr [bp + 0xc]               
  0b27  7413             je 0xb3c                                 
  0b29  3b560c           cmp dx, word ptr [bp + 0xc]              
  0b2c  720e             jb 0xb3c                                 
  0b2e  7706             ja 0xb36                                 
  0b30  3b063e00         cmp ax, word ptr [0x3e]                  
  0b34  7606             jbe 0xb3c                                
  0b36  8b460a           mov ax, word ptr [bp + 0xa]              
  0b39  8b560c           mov dx, word ptr [bp + 0xc]              
  0b3c  2e8e060b00       mov es, word ptr cs:[0xb]                
  0b41  263b168438       cmp dx, word ptr es:[0x3884]             
  0b46  7212             jb 0xb5a                                 
  0b48  7707             ja 0xb51                                 
  0b4a  263b068238       cmp ax, word ptr es:[0x3882]             
  0b4f  7609             jbe 0xb5a                                
  0b51  268b168438       mov dx, word ptr es:[0x3884]             
  0b56  26a18238         mov ax, word ptr es:[0x3882]             
  0b5a  89460a           mov word ptr [bp + 0xa], ax              
  0b5d  89560c           mov word ptr [bp + 0xc], dx              
  0b60  0bd2             or dx, dx                                
  0b62  750e             jne 0xb72                                
  0b64  50               push ax                                  
  0b65  c1e804           shr ax, 4                                
  0b68  3b061a01         cmp ax, word ptr [0x11a]                 
  0b6c  58               pop ax                                   
  0b6d  7303             jae 0xb72                                
  0b6f  e96eff           jmp 0xae0                                
  0b72  51               push cx                                  
  0b73  53               push bx                                  
  0b74  52               push dx                                  
  0b75  50               push ax                                  
  0b76  bf3001           mov di, 0x130                            
  0b79  1e               push ds                                  
  0b7a  07               pop es                                   
  0b7b  fc               cld                                      
  0b7c  50               push ax                                  
  0b7d  8bc3             mov ax, bx                               
  0b7f  ab               stosw word ptr es:[di], ax               
  0b80  8bc1             mov ax, cx                               
  0b82  ab               stosw word ptr es:[di], ax               
  0b83  58               pop ax                                   
  0b84  03c3             add ax, bx                               
  0b86  13d1             adc dx, cx                               
  0b88  ab               stosw word ptr es:[di], ax               
  0b89  8bc2             mov ax, dx                               
  0b8b  ab               stosw word ptr es:[di], ax               
  0b8c  8bc3             mov ax, bx                               
  0b8e  ab               stosw word ptr es:[di], ax               
  0b8f  8bc1             mov ax, cx                               
  0b91  ab               stosw word ptr es:[di], ax               
  0b92  90               nop                                      
  0b93  0e               push cs                                  
  0b94  e8ea04           call 0x1081                              
  0b97  0bc0             or ax, ax                                
  0b99  7531             jne 0xbcc                                
  0b9b  807efe00         cmp byte ptr [bp - 2], 0                 
  0b9f  7506             jne 0xba7                                
  0ba1  fe46fe           inc byte ptr [bp - 2]                    
  0ba4  e93fff           jmp 0xae6                                
  0ba7  c7063c01020c     mov word ptr [0x13c], 0xc02              
  0bad  c7063e010000     mov word ptr [0x13e], 0                  
  0bb3  c70612010100     mov word ptr [0x112], 1                  
  0bb9  800e100001       or byte ptr [0x10], 1                    
  0bbe  c70682005911     mov word ptr [0x82], 0x1159              
  0bc4  c7068000150d     mov word ptr [0x80], 0xd15               
  0bca  33c0             xor ax, ax                               
  0bcc  5f               pop di                                   
  0bcd  5e               pop si                                   
  0bce  1f               pop ds                                   
  0bcf  8be5             mov sp, bp                               
  0bd1  5d               pop bp                                   
  0bd2  cb               retf                                     

res_15de_0bd3:  ; ENTRY
  0bd3  b8072f           mov ax, 0x2f07                           
  0bd6  e85900           call 0xc32                               
  0bd9  7226             jb 0xc01                                 
  0bdb  06               push es                                  
  0bdc  50               push ax                                  
  0bdd  53               push bx                                  
  0bde  51               push cx                                  
  0bdf  52               push dx                                  
  0be0  b80100           mov ax, 1                                
  0be3  ff1e8600         lcall [0x86]                             
  0be7  5a               pop dx                                   
  0be8  59               pop cx                                   
  0be9  5b               pop bx                                   
  0bea  58               pop ax                                   
  0beb  07               pop es                                   
  0bec  51               push cx                                  
  0bed  26a11000         mov ax, word ptr es:[0x10]               
  0bf1  ba1000           mov dx, 0x10                             
  0bf4  f7e2             mul dx                                   
  0bf6  59               pop cx                                   
  0bf7  e8b305           call 0x11ad                              
  0bfa  7305             jae 0xc01                                
  0bfc  ea4d0e0000       ljmp 0:0xe4d                             
  0c01  c3               ret                                      
  0c02  e82100           call 0xc26                               
  0c05  26a11000         mov ax, word ptr es:[0x10]               
  0c09  ba1000           mov dx, 0x10                             
  0c0c  f7e2             mul dx                                   
  0c0e  8bd8             mov bx, ax                               
  0c10  8bca             mov cx, dx                               
  0c12  26a11400         mov ax, word ptr es:[0x14]               
  0c16  268b161600       mov dx, word ptr es:[0x16]               
  0c1b  e88f05           call 0x11ad                              
  0c1e  7305             jae 0xc25                                
  0c20  ea4d0e0000       ljmp 0:0xe4d                             
  0c25  c3               ret                                      

res_15de_0c26:  ; ENTRY
  0c26  268b360800       mov si, word ptr es:[8]                  
  0c2b  46               inc si                                   
  0c2c  83e6fe           and si, 0xfffe                           
  0c2f  33ff             xor di, di                               
  0c31  c3               ret                                      

res_15de_0c32:  ; ENTRY
  0c32  1e               push ds                                  
  0c33  8ed8             mov ds, ax                               
  0c35  55               push bp                                  
  0c36  06               push es                                  
  0c37  a10400           mov ax, word ptr [4]                     
  0c3a  8b1e0800         mov bx, word ptr [8]                     
  0c3e  2bc3             sub ax, bx                               
  0c40  50               push ax                                  
  0c41  8b160600         mov dx, word ptr [6]                     
  0c45  8b0e0a00         mov cx, word ptr [0xa]                   
  0c49  1bd1             sbb dx, cx                               
  0c4b  52               push dx                                  
  0c4c  e8d7ff           call 0xc26                               
  0c4f  2bc6             sub ax, si                               
  0c51  1bd7             sbb dx, di                               
  0c53  7340             jae 0xc95                                
  0c55  5f               pop di                                   
  0c56  5e               pop si                                   
  0c57  8b2e0c00         mov bp, word ptr [0xc]                   
  0c5b  e87b00           call 0xcd9                               
  0c5e  0bc0             or ax, ax                                
  0c60  741c             je 0xc7e                                 
  0c62  8ec0             mov es, ax                               
  0c64  8b160e00         mov dx, word ptr [0xe]                   
  0c68  26a10e00         mov ax, word ptr es:[0xe]                
  0c6c  a30e00           mov word ptr [0xe], ax                   
  0c6f  26c7060e000000   mov word ptr es:[0xe], 0                 
  0c76  e88f00           call 0xd08                               
  0c79  2689160e00       mov word ptr es:[0xe], dx                
  0c7e  8b1e0000         mov bx, word ptr [0]                     
  0c82  891e0800         mov word ptr [8], bx                     
  0c86  8b0e0200         mov cx, word ptr [2]                     
  0c8a  890e0a00         mov word ptr [0xa], cx                   
  0c8e  07               pop es                                   
  0c8f  06               push es                                  
  0c90  e893ff           call 0xc26                               
  0c93  eb03             jmp 0xc98                                
  0c95  83c404           add sp, 4                                
  0c98  bdca04           mov bp, 0x4ca                            
  0c9b  e83b00           call 0xcd9                               
  0c9e  0bc0             or ax, ax                                
  0ca0  7409             je 0xcab                                 
  0ca2  8ec0             mov es, ax                               
  0ca4  26a10e00         mov ax, word ptr es:[0xe]                
  0ca8  a30e00           mov word ptr [0xe], ax                   
  0cab  07               pop es                                   
  0cac  5d               pop bp                                   
  0cad  01360800         add word ptr [8], si                     
  0cb1  113e0a00         adc word ptr [0xa], di                   
  0cb5  26891e1400       mov word ptr es:[0x14], bx               
  0cba  26890e1600       mov word ptr es:[0x16], cx               
  0cbf  a10c00           mov ax, word ptr [0xc]                   
  0cc2  26a31800         mov word ptr es:[0x18], ax               
  0cc6  8cc2             mov dx, es                               
  0cc8  e83d00           call 0xd08                               
  0ccb  2689160e00       mov word ptr es:[0xe], dx                
  0cd0  8ec2             mov es, dx                               
  0cd2  26a30e00         mov word ptr es:[0xe], ax                
  0cd6  f8               clc                                      
  0cd7  1f               pop ds                                   
  0cd8  c3               ret                                      

res_15de_0cd9:  ; ENTRY
  0cd9  1e               push ds                                  
  0cda  33c0             xor ax, ax                               
  0cdc  8ec0             mov es, ax                               
  0cde  eb1d             jmp 0xcfd                                
  0ce0  8ed8             mov ds, ax                               
  0ce2  a11400           mov ax, word ptr [0x14]                  
  0ce5  2bc3             sub ax, bx                               
  0ce7  8b161600         mov dx, word ptr [0x16]                  
  0ceb  1bd1             sbb dx, cx                               
  0ced  7215             jb 0xd04                                 
  0cef  2bc6             sub ax, si                               
  0cf1  1bd7             sbb dx, di                               
  0cf3  730f             jae 0xd04                                
  0cf5  892e1800         mov word ptr [0x18], bp                  
  0cf9  8cd8             mov ax, ds                               
  0cfb  8ec0             mov es, ax                               
  0cfd  a10e00           mov ax, word ptr [0xe]                   
  0d00  0bc0             or ax, ax                                
  0d02  75dc             jne 0xce0                                
  0d04  8cc0             mov ax, es                               
  0d06  1f               pop ds                                   
  0d07  c3               ret                                      

res_15de_0d08:  ; ENTRY
  0d08  8cd8             mov ax, ds                               
  0d0a  8ec0             mov es, ax                               
  0d0c  26a10e00         mov ax, word ptr es:[0xe]                
  0d10  0bc0             or ax, ax                                
  0d12  75f6             jne 0xd0a                                
  0d14  c3               ret                                      
  0d15  f606100001       test byte ptr [0x10], 1                  
  0d1a  7404             je 0xd20                                 
  0d1c  e8b4fe           call 0xbd3                               
  0d1f  c3               ret                                      
  0d20  f606100002       test byte ptr [0x10], 2                  
  0d25  7403             je 0xd2a                                 
  0d27  e8a5fc           call 0x9cf                               
  0d2a  c3               ret                                      
  0d2b  1e               push ds                                  
  0d2c  56               push si                                  
  0d2d  57               push di                                  
  0d2e  b8f42e           mov ax, 0x2ef4                           
  0d31  8ed8             mov ds, ax                               
  0d33  e869f5           call 0x29f                               
  0d36  8b1e1a01         mov bx, word ptr [0x11a]                 
  0d3a  b82531           mov ax, 0x3125                           
  0d3d  8ed8             mov ds, ax                               
  0d3f  b82531           mov ax, 0x3125                           
  0d42  8ec0             mov es, ax                               
  0d44  263b1ecc26       cmp bx, word ptr es:[0x26cc]             
  0d49  7307             jae 0xd52                                
  0d4b  268b1ecc26       mov bx, word ptr es:[0x26cc]             
  0d50  eb02             jmp 0xd54                                
  0d52  d1e3             shl bx, 1                                
  0d54  43               inc bx                                   
  0d55  53               push bx                                  
  0d56  b81000           mov ax, 0x10                             
  0d59  f7e3             mul bx                                   
  0d5b  52               push dx                                  
  0d5c  50               push ax                                  
  0d5d  9aea330000       lcall 0, 0x33ea                          -> 0000:33ea
  0d62  5b               pop bx                                   
  0d63  5b               pop bx                                   
  0d64  5b               pop bx                                   
  0d65  8bc8             mov cx, ax                               
  0d67  0bca             or cx, dx                                
  0d69  e316             jcxz 0xd81                               
  0d6b  42               inc dx                                   
  0d6c  03da             add bx, dx                               
  0d6e  52               push dx                                  
  0d6f  53               push bx                                  
  0d70  33c0             xor ax, ax                               
  0d72  50               push ax                                  
  0d73  50               push ax                                  
  0d74  90               nop                                      
  0d75  0e               push cs                                  
  0d76  e89bf2           call 0x14                                
  0d79  0bc0             or ax, ax                                
  0d7b  7504             jne 0xd81                                
  0d7d  5f               pop di                                   
  0d7e  5e               pop si                                   
  0d7f  1f               pop ds                                   
  0d80  cb               retf                                     
  0d81  ea7a020000       ljmp 0:0x27a                             
  0d86  45               inc bp                                   
  0d87  4d               dec bp                                   
  0d88  4d               dec bp                                   
  0d89  58               pop ax                                   
  0d8a  58               pop ax                                   
  0d8b  58               pop ax                                   
  0d8c  58               pop ax                                   
  0d8d  3000             xor byte ptr [bx + si], al               

res_15de_0d8f:  ; ENTRY
  0d8f  55               push bp                                  
  0d90  8bec             mov bp, sp                               
  0d92  81ec0201         sub sp, 0x102                            
  0d96  1e               push ds                                  
  0d97  2e8e1e0900       mov ds, word ptr cs:[9]                  
  0d9c  56               push si                                  
  0d9d  57               push di                                  
  0d9e  f606380001       test byte ptr [0x38], 1                  
  0da3  7410             je 0xdb5                                 
  0da5  f606380002       test byte ptr [0x38], 2                  
  0daa  7503             jne 0xdaf                                
  0dac  eb6f             jmp 0xe1d                                
  0dae  90               nop                                      
  0daf  a13600           mov ax, word ptr [0x36]                  
  0db2  e98500           jmp 0xe3a                                
  0db5  1e               push ds                                  
  0db6  0e               push cs                                  
  0db7  1f               pop ds                                   
  0db8  ba860d           mov dx, 0xd86                            
  0dbb  b8003d           mov ax, 0x3d00                           
  0dbe  cd21             int 0x21                                 
  0dc0  1f               pop ds                                   
  0dc1  8bd8             mov bx, ax                               
  0dc3  7222             jb 0xde7                                 
  0dc5  b80044           mov ax, 0x4400                           
  0dc8  cd21             int 0x21                                 
  0dca  7217             jb 0xde3                                 
  0dcc  f7c28000         test dx, 0x80                            
  0dd0  7411             je 0xde3                                 
  0dd2  b80744           mov ax, 0x4407                           
  0dd5  cd21             int 0x21                                 
  0dd7  720a             jb 0xde3                                 
  0dd9  50               push ax                                  
  0dda  b43e             mov ah, 0x3e                             
  0ddc  cd21             int 0x21                                 
  0dde  58               pop ax                                   
  0ddf  3cff             cmp al, 0xff                             
  0de1  7407             je 0xdea                                 
  0de3  b43e             mov ah, 0x3e                             
  0de5  cd21             int 0x21                                 
  0de7  eb4a             jmp 0xe33                                
  0de9  90               nop                                      
  0dea  b86735           mov ax, 0x3567                           
  0ded  cd21             int 0x21                                 
  0def  8cc0             mov ax, es                               
  0df1  0bc3             or ax, bx                                
  0df3  74f2             je 0xde7                                 
  0df5  b440             mov ah, 0x40                             
  0df7  cd67             int 0x67                                 
  0df9  0ae4             or ah, ah                                
  0dfb  75ea             jne 0xde7                                
  0dfd  c606380001       mov byte ptr [0x38], 1                   
  0e02  b446             mov ah, 0x46                             
  0e04  cd67             int 0x67                                 
  0e06  0ae4             or ah, ah                                
  0e08  75dd             jne 0xde7                                
  0e0a  3c32             cmp al, 0x32                             
  0e0c  72d9             jb 0xde7                                 
  0e0e  a23900           mov byte ptr [0x39], al                  
  0e11  b441             mov ah, 0x41                             
  0e13  cd67             int 0x67                                 
  0e15  0ae4             or ah, ah                                
  0e17  75ce             jne 0xde7                                
  0e19  891e3000         mov word ptr [0x30], bx                  
  0e1d  b442             mov ah, 0x42                             
  0e1f  cd67             int 0x67                                 
  0e21  0ae4             or ah, ah                                
  0e23  750e             jne 0xe33                                
  0e25  891e3600         mov word ptr [0x36], bx                  
  0e29  c7063200ffff     mov word ptr [0x32], 0xffff              
  0e2f  8bc3             mov ax, bx                               
  0e31  eb07             jmp 0xe3a                                
  0e33  33c0             xor ax, ax                               
  0e35  c606380000       mov byte ptr [0x38], 0                   
  0e3a  5f               pop di                                   
  0e3b  5e               pop si                                   
  0e3c  1f               pop ds                                   
  0e3d  8be5             mov sp, bp                               
  0e3f  5d               pop bp                                   
  0e40  cb               retf                                     

res_15de_0e41:  ; ENTRY
  0e41  55               push bp                                  
  0e42  8bec             mov bp, sp                               
  0e44  1e               push ds                                  
  0e45  2e8e1e0900       mov ds, word ptr cs:[9]                  
  0e4a  f606380001       test byte ptr [0x38], 1                  
  0e4f  7503             jne 0xe54                                
  0e51  eb4b             jmp 0xe9e                                
  0e53  90               nop                                      
  0e54  f606380002       test byte ptr [0x38], 2                  
  0e59  7405             je 0xe60                                 
  0e5b  33c0             xor ax, ax                               
  0e5d  eb42             jmp 0xea1                                
  0e5f  90               nop                                      
  0e60  800e380002       or byte ptr [0x38], 2                    
  0e65  8b4608           mov ax, word ptr [bp + 8]                
  0e68  a33400           mov word ptr [0x34], ax                  
  0e6b  8b5e06           mov bx, word ptr [bp + 6]                
  0e6e  891e3600         mov word ptr [0x36], bx                  
  0e72  8b560a           mov dx, word ptr [bp + 0xa]              
  0e75  0bd2             or dx, dx                                
  0e77  750d             jne 0xe86                                
  0e79  b443             mov ah, 0x43                             
  0e7b  cd67             int 0x67                                 
  0e7d  0ae4             or ah, ah                                
  0e7f  751d             jne 0xe9e                                
  0e81  800e380004       or byte ptr [0x38], 4                    
  0e86  89163200         mov word ptr [0x32], dx                  
  0e8a  b447             mov ah, 0x47                             
  0e8c  cd67             int 0x67                                 
  0e8e  0ae4             or ah, ah                                
  0e90  750c             jne 0xe9e                                
  0e92  8b163200         mov dx, word ptr [0x32]                  
  0e96  b448             mov ah, 0x48                             
  0e98  cd67             int 0x67                                 
  0e9a  8ac4             mov al, ah                               
  0e9c  eb03             jmp 0xea1                                
  0e9e  b8ffff           mov ax, 0xffff                           
  0ea1  1f               pop ds                                   
  0ea2  5d               pop bp                                   
  0ea3  ca0600           retf 6                                   
  0ea6  55               push bp                                  
  0ea7  8bec             mov bp, sp                               
  0ea9  1e               push ds                                  
  0eaa  2e8e1e0900       mov ds, word ptr cs:[9]                  
  0eaf  f606380004       test byte ptr [0x38], 4                  
  0eb4  7418             je 0xece                                 
  0eb6  8b163200         mov dx, word ptr [0x32]                  
  0eba  83faff           cmp dx, -1                               
  0ebd  740f             je 0xece                                 
  0ebf  b445             mov ah, 0x45                             
  0ec1  cd67             int 0x67                                 
  0ec3  c7063200ffff     mov word ptr [0x32], 0xffff              
  0ec9  c606380000       mov byte ptr [0x38], 0                   
  0ece  1f               pop ds                                   
  0ecf  5d               pop bp                                   
  0ed0  cb               retf                                     

res_15de_0ed1:  ; ENTRY
  0ed1  55               push bp                                  
  0ed2  8bec             mov bp, sp                               
  0ed4  83ec22           sub sp, 0x22                             
  0ed7  1e               push ds                                  
  0ed8  2e8e1e0900       mov ds, word ptr cs:[9]                  
  0edd  56               push si                                  
  0ede  57               push di                                  
  0edf  f606420001       test byte ptr [0x42], 1                  
  0ee4  740a             je 0xef0                                 
  0ee6  f606420002       test byte ptr [0x42], 2                  
  0eeb  7408             je 0xef5                                 
  0eed  e97601           jmp 0x1066                               
  0ef0  c606420001       mov byte ptr [0x42], 1                   
  0ef5  c7063a000000     mov word ptr [0x3a], 0                   
  0efb  c7063c001000     mov word ptr [0x3c], 0x10                
  0f01  c7063e000000     mov word ptr [0x3e], 0                   
  0f07  c70640001000     mov word ptr [0x40], 0x10                
  0f0d  54               push sp                                  
  0f0e  58               pop ax                                   
  0f0f  3bc4             cmp ax, sp                               
  0f11  7508             jne 0xf1b                                
  0f13  b430             mov ah, 0x30                             
  0f15  cd21             int 0x21                                 
  0f17  3c0a             cmp al, 0xa                              
  0f19  7203             jb 0xf1e                                 
  0f1b  e95901           jmp 0x1077                               
  0f1e  86c4             xchg ah, al                              
  0f20  8946de           mov word ptr [bp - 0x22], ax             
  0f23  b800f0           mov ax, 0xf000                           
  0f26  8ec0             mov es, ax                               
  0f28  26a0feff         mov al, byte ptr es:[0xfffe]             
  0f2c  3cfc             cmp al, 0xfc                             
  0f2e  77eb             ja 0xf1b                                 
  0f30  3cfb             cmp al, 0xfb                             
  0f32  74e7             je 0xf1b                                 
  0f34  3cf9             cmp al, 0xf9                             
  0f36  74e3             je 0xf1b                                 
  0f38  837ede31         cmp word ptr [bp - 0x22], 0x31           
  0f3c  7303             jae 0xf41                                
  0f3e  e97f00           jmp 0xfc0                                
  0f41  b80043           mov ax, 0x4300                           
  0f44  cd2f             int 0x2f                                 
  0f46  3c80             cmp al, 0x80                             
  0f48  75f4             jne 0xf3e                                
  0f4a  b81043           mov ax, 0x4310                           
  0f4d  cd2f             int 0x2f                                 
  0f4f  891e4300         mov word ptr [0x43], bx                  
  0f53  8c064500         mov word ptr [0x45], es                  
  0f57  33c0             xor ax, ax                               
  0f59  ff1e4300         lcall [0x43]                             
  0f5d  80fc02           cmp ah, 2                                
  0f60  725e             jb 0xfc0                                 
  0f62  b408             mov ah, 8                                
  0f64  ff1e4300         lcall [0x43]                             
  0f68  0bc0             or ax, ax                                
  0f6a  7451             je 0xfbd                                 
  0f6c  8bf0             mov si, ax                               
  0f6e  92               xchg dx, ax                              
  0f6f  b409             mov ah, 9                                
  0f71  ff1e4300         lcall [0x43]                             
  0f75  0bc0             or ax, ax                                
  0f77  7444             je 0xfbd                                 
  0f79  89164700         mov word ptr [0x47], dx                  
  0f7d  b40c             mov ah, 0xc                              
  0f7f  ff1e4300         lcall [0x43]                             
  0f83  0bc0             or ax, ax                                
  0f85  741c             je 0xfa3                                 
  0f87  891e3a00         mov word ptr [0x3a], bx                  
  0f8b  89163c00         mov word ptr [0x3c], dx                  
  0f8f  b80004           mov ax, 0x400                            
  0f92  f7e6             mul si                                   
  0f94  03063a00         add ax, word ptr [0x3a]                  
  0f98  13163c00         adc dx, word ptr [0x3c]                  
  0f9c  a33e00           mov word ptr [0x3e], ax                  
  0f9f  89164000         mov word ptr [0x40], dx                  
  0fa3  b40d             mov ah, 0xd                              
  0fa5  8b164700         mov dx, word ptr [0x47]                  
  0fa9  ff1e4300         lcall [0x43]                             
  0fad  b40a             mov ah, 0xa                              
  0faf  8b164700         mov dx, word ptr [0x47]                  
  0fb3  ff1e4300         lcall [0x43]                             
  0fb7  c70647000000     mov word ptr [0x47], 0                   
  0fbd  e9a600           jmp 0x1066                               
  0fc0  b488             mov ah, 0x88                             
  0fc2  cd15             int 0x15                                 
  0fc4  0bc0             or ax, ax                                
  0fc6  7503             jne 0xfcb                                
  0fc8  e9ac00           jmp 0x1077                               
  0fcb  ba0004           mov dx, 0x400                            
  0fce  f7e2             mul dx                                   
  0fd0  80c210           add dl, 0x10                             
  0fd3  a33e00           mov word ptr [0x3e], ax                  
  0fd6  89164000         mov word ptr [0x40], dx                  
  0fda  8b0e4300         mov cx, word ptr [0x43]                  
  0fde  0b0e4500         or cx, word ptr [0x45]                   
  0fe2  e30b             jcxz 0xfef                               
  0fe4  c6063c0011       mov byte ptr [0x3c], 0x11                
  0fe9  c7063a000000     mov word ptr [0x3a], 0                   
  0fef  8cd0             mov ax, ss                               
  0ff1  ba1000           mov dx, 0x10                             
  0ff4  f7e2             mul dx                                   
  0ff6  8d5ee0           lea bx, [bp - 0x20]                      
  0ff9  33c9             xor cx, cx                               
  0ffb  03d8             add bx, ax                               
  0ffd  13ca             adc cx, dx                               
  0fff  b80000           mov ax, 0                                
  1002  ba1000           mov dx, 0x10                             
  1005  be2000           mov si, 0x20                             
  1008  33ff             xor di, di                               
  100a  e8a001           call 0x11ad                              
  100d  72b9             jb 0xfc8                                 
  100f  8d7ee3           lea di, [bp - 0x1d]                      
  1012  16               push ss                                  
  1013  07               pop es                                   
  1014  8d362000         lea si, [0x20]                           
  1018  b90500           mov cx, 5                                
  101b  fc               cld                                      
  101c  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  101e  7510             jne 0x1030                               
  1020  8b46eb           mov ax, word ptr [bp - 0x15]             
  1023  f766f3           mul word ptr [bp - 0xd]                  
  1026  80c210           add dl, 0x10                             
  1029  a33a00           mov word ptr [0x3a], ax                  
  102c  88163c00         mov byte ptr [0x3c], dl                  
  1030  33c0             xor ax, ax                               
  1032  8ec0             mov es, ax                               
  1034  268e066600       mov es, word ptr es:[0x66]               
  1039  bf1200           mov di, 0x12                             
  103c  8d362000         lea si, [0x20]                           
  1040  b90500           mov cx, 5                                
  1043  fc               cld                                      
  1044  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  1046  751e             jne 0x1066                               
  1048  26a12c00         mov ax, word ptr es:[0x2c]               
  104c  268a162e00       mov dl, byte ptr es:[0x2e]               
  1051  3a163c00         cmp dl, byte ptr [0x3c]                  
  1055  720f             jb 0x1066                                
  1057  7706             ja 0x105f                                
  1059  3b063a00         cmp ax, word ptr [0x3a]                  
  105d  7607             jbe 0x1066                               
  105f  a33a00           mov word ptr [0x3a], ax                  
  1062  88163c00         mov byte ptr [0x3c], dl                  
  1066  a13e00           mov ax, word ptr [0x3e]                  
  1069  8b164000         mov dx, word ptr [0x40]                  
  106d  2b063a00         sub ax, word ptr [0x3a]                  
  1071  1b163c00         sbb dx, word ptr [0x3c]                  
  1075  eb03             jmp 0x107a                               
  1077  33c0             xor ax, ax                               
  1079  99               cdq                                      
  107a  5f               pop di                                   
  107b  5e               pop si                                   
  107c  1f               pop ds                                   
  107d  8be5             mov sp, bp                               
  107f  5d               pop bp                                   
  1080  cb               retf                                     

res_15de_1081:  ; ENTRY
  1081  55               push bp                                  
  1082  8bec             mov bp, sp                               
  1084  1e               push ds                                  
  1085  2e8e1e0900       mov ds, word ptr cs:[9]                  
  108a  56               push si                                  
  108b  57               push di                                  
  108c  f606420001       test byte ptr [0x42], 1                  
  1091  7503             jne 0x1096                               
  1093  e9b900           jmp 0x114f                               
  1096  f606420002       test byte ptr [0x42], 2                  
  109b  7405             je 0x10a2                                
  109d  33c0             xor ax, ax                               
  109f  e9b000           jmp 0x1152                               
  10a2  800e420002       or byte ptr [0x42], 2                    
  10a7  8b460a           mov ax, word ptr [bp + 0xa]              
  10aa  8b560c           mov dx, word ptr [bp + 0xc]              
  10ad  8b7606           mov si, word ptr [bp + 6]                
  10b0  8b7e08           mov di, word ptr [bp + 8]                
  10b3  8b1e4300         mov bx, word ptr [0x43]                  
  10b7  0b1e4500         or bx, word ptr [0x45]                   
  10bb  7443             je 0x1100                                
  10bd  8bc6             mov ax, si                               
  10bf  8bd7             mov dx, di                               
  10c1  05ff03           add ax, 0x3ff                            
  10c4  83d200           adc dx, 0                                
  10c7  bb0004           mov bx, 0x400                            
  10ca  f7f3             div bx                                   
  10cc  92               xchg dx, ax                              
  10cd  b409             mov ah, 9                                
  10cf  ff1e4300         lcall [0x43]                             
  10d3  0bc0             or ax, ax                                
  10d5  7426             je 0x10fd                                
  10d7  89164700         mov word ptr [0x47], dx                  
  10db  b40c             mov ah, 0xc                              
  10dd  ff1e4300         lcall [0x43]                             
  10e1  0bc0             or ax, ax                                
  10e3  7418             je 0x10fd                                
  10e5  891e3a00         mov word ptr [0x3a], bx                  
  10e9  89163c00         mov word ptr [0x3c], dx                  
  10ed  891e4900         mov word ptr [0x49], bx                  
  10f1  89164b00         mov word ptr [0x4b], dx                  
  10f5  8bc3             mov ax, bx                               
  10f7  03c6             add ax, si                               
  10f9  13d7             adc dx, di                               
  10fb  eb47             jmp 0x1144                               
  10fd  eb50             jmp 0x114f                               
  10ff  90               nop                                      
  1100  a33a00           mov word ptr [0x3a], ax                  
  1103  89163c00         mov word ptr [0x3c], dx                  
  1107  33db             xor bx, bx                               
  1109  8ec3             mov es, bx                               
  110b  1e               push ds                                  
  110c  bb092f           mov bx, 0x2f09                           
  110f  8edb             mov ds, bx                               
  1111  268b1e6400       mov bx, word ptr es:[0x64]               
  1116  891e2f00         mov word ptr [0x2f], bx                  
  111a  268b1e6600       mov bx, word ptr es:[0x66]               
  111f  891e3100         mov word ptr [0x31], bx                  
  1123  26c70664003f00   mov word ptr es:[0x64], 0x3f             
  112a  26c7066600092f   mov word ptr es:[0x66], 0x2f09           
  1131  a33a00           mov word ptr [0x3a], ax                  
  1134  88163c00         mov byte ptr [0x3c], dl                  
  1138  03c6             add ax, si                               
  113a  13d7             adc dx, di                               
  113c  a32c00           mov word ptr [0x2c], ax                  
  113f  88162e00         mov byte ptr [0x2e], dl                  
  1143  1f               pop ds                                   
  1144  a33e00           mov word ptr [0x3e], ax                  
  1147  89164000         mov word ptr [0x40], dx                  
  114b  33c0             xor ax, ax                               
  114d  eb03             jmp 0x1152                               
  114f  b8ffff           mov ax, 0xffff                           
  1152  5f               pop di                                   
  1153  5e               pop si                                   
  1154  1f               pop ds                                   
  1155  5d               pop bp                                   
  1156  ca0800           retf 8                                   
  1159  55               push bp                                  
  115a  8bec             mov bp, sp                               
  115c  1e               push ds                                  
  115d  2e8e1e0900       mov ds, word ptr cs:[9]                  
  1162  803e420000       cmp byte ptr [0x42], 0                   
  1167  7441             je 0x11aa                                
  1169  833e470000       cmp word ptr [0x47], 0                   
  116e  7416             je 0x1186                                
  1170  b40d             mov ah, 0xd                              
  1172  8b164700         mov dx, word ptr [0x47]                  
  1176  ff1e4300         lcall [0x43]                             
  117a  b40a             mov ah, 0xa                              
  117c  8b164700         mov dx, word ptr [0x47]                  
  1180  ff1e4300         lcall [0x43]                             
  1184  eb24             jmp 0x11aa                               
  1186  33c0             xor ax, ax                               
  1188  8ec0             mov es, ax                               
  118a  26a16600         mov ax, word ptr es:[0x66]               
  118e  3d092f           cmp ax, 0x2f09                           
  1191  7517             jne 0x11aa                               
  1193  1e               push ds                                  
  1194  8ed8             mov ds, ax                               
  1196  a12f00           mov ax, word ptr [0x2f]                  
  1199  26a36400         mov word ptr es:[0x64], ax               
  119d  a13100           mov ax, word ptr [0x31]                  
  11a0  26a36600         mov word ptr es:[0x66], ax               
  11a4  1f               pop ds                                   
  11a5  c606420000       mov byte ptr [0x42], 0                   
  11aa  1f               pop ds                                   
  11ab  5d               pop bp                                   
  11ac  cb               retf                                     

res_15de_11ad:  ; ENTRY
  11ad  1e               push ds                                  
  11ae  06               push es                                  
  11af  83c601           add si, 1                                
  11b2  83d700           adc di, 0                                
  11b5  83e6fe           and si, 0xfffe                           
  11b8  fc               cld                                      
  11b9  2e8e1e0900       mov ds, word ptr cs:[9]                  
  11be  833e470000       cmp word ptr [0x47], 0                   
  11c3  746a             je 0x122f                                
  11c5  89364d00         mov word ptr [0x4d], si                  
  11c9  893e4f00         mov word ptr [0x4f], di                  
  11cd  80fa10           cmp dl, 0x10                             
  11d0  7213             jb 0x11e5                                
  11d2  8b364700         mov si, word ptr [0x47]                  
  11d6  89365100         mov word ptr [0x51], si                  
  11da  2b064900         sub ax, word ptr [0x49]                  
  11de  1b164b00         sbb dx, word ptr [0x4b]                  
  11e2  eb0a             jmp 0x11ee                               
  11e4  90               nop                                      
  11e5  c70651000000     mov word ptr [0x51], 0                   
  11eb  c1ca04           ror dx, 4                                
  11ee  a35300           mov word ptr [0x53], ax                  
  11f1  89165500         mov word ptr [0x55], dx                  
  11f5  80f910           cmp cl, 0x10                             
  11f8  7213             jb 0x120d                                
  11fa  8b364700         mov si, word ptr [0x47]                  
  11fe  89365700         mov word ptr [0x57], si                  
  1202  2b1e4900         sub bx, word ptr [0x49]                  
  1206  1b0e4b00         sbb cx, word ptr [0x4b]                  
  120a  eb0a             jmp 0x1216                               
  120c  90               nop                                      
  120d  c70657000000     mov word ptr [0x57], 0                   
  1213  c1c904           ror cx, 4                                
  1216  891e5900         mov word ptr [0x59], bx                  
  121a  890e5b00         mov word ptr [0x5b], cx                  
  121e  b40b             mov ah, 0xb                              
  1220  8d364d00         lea si, [0x4d]                           
  1224  ff1e4300         lcall [0x43]                             
  1228  0bc0             or ax, ax                                
  122a  7529             jne 0x1255                               
  122c  f9               stc                                      
  122d  eb21             jmp 0x1250                               
  122f  d1ef             shr di, 1                                
  1231  d1de             rcr si, 1                                
  1233  a35f00           mov word ptr [0x5f], ax                  
  1236  88166100         mov byte ptr [0x61], dl                  
  123a  891e6700         mov word ptr [0x67], bx                  
  123e  880e6900         mov byte ptr [0x69], cl                  
  1242  8bce             mov cx, si                               
  1244  8d364d00         lea si, [0x4d]                           
  1248  1e               push ds                                  
  1249  07               pop es                                   
  124a  b487             mov ah, 0x87                             
  124c  cd15             int 0x15                                 
  124e  7305             jae 0x1255                               
  1250  1bc0             sbb ax, ax                               
  1252  f9               stc                                      
  1253  eb02             jmp 0x1257                               
  1255  33c0             xor ax, ax                               
  1257  07               pop es                                   
  1258  1f               pop ds                                   
  1259  c3               ret                                      
  125a  c3               ret                                      
  125b  cb               retf                                     
  125c  00               db 00                                    
