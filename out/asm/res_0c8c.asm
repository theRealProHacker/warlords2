; res_0c8c file_off 0xe8c0

res_0c8c_0007:  ; ENTRY
  0007  55               push bp                                  
  0008  8bec             mov bp, sp                               
  000a  81ec4201         sub sp, 0x142                            
  000e  56               push si                                  
  000f  57               push di                                  
  0010  66833e625e00     cmp dword ptr [0x5e62], 0                
  0016  7503             jne 0x1b                                 
  0018  e97801           jmp 0x193                                
  001b  16               push ss                                  
  001c  8d46fc           lea ax, [bp - 4]                         
  001f  50               push ax                                  
  0020  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0025  83c404           add sp, 4                                
  0028  837e0600         cmp word ptr [bp + 6], 0                 
  002c  742f             je 0x5d                                  
  002e  8b46fc           mov ax, word ptr [bp - 4]                
  0031  05f0ff           add ax, 0xfff0                           
  0034  bb2800           mov bx, 0x28                             
  0037  99               cdq                                      
  0038  f7fb             idiv bx                                  
  003a  ba042c           mov dx, 0x2c04                           
  003d  8ec2             mov es, dx                               
  003f  268b367701       mov si, word ptr es:[0x177]              
  0044  03f0             add si, ax                               
  0046  8b46fe           mov ax, word ptr [bp - 2]                
  0049  05e2ff           add ax, 0xffe2                           
  004c  99               cdq                                      
  004d  f7fb             idiv bx                                  
  004f  ba042c           mov dx, 0x2c04                           
  0052  8ec2             mov es, dx                               
  0054  268b3e7501       mov di, word ptr es:[0x175]              
  0059  03f8             add di, ax                               
  005b  eb1a             jmp 0x77                                 
  005d  8b46fc           mov ax, word ptr [bp - 4]                
  0060  0570fe           add ax, 0xfe70                           
  0063  99               cdq                                      
  0064  2bc2             sub ax, dx                               
  0066  8bf0             mov si, ax                               
  0068  d1fe             sar si, 1                                
  006a  8b46fe           mov ax, word ptr [bp - 2]                
  006d  05e2ff           add ax, 0xffe2                           
  0070  99               cdq                                      
  0071  2bc2             sub ax, dx                               
  0073  8bf8             mov di, ax                               
  0075  d1ff             sar di, 1                                
  0077  57               push di                                  
  0078  56               push si                                  
  0079  6a01             push 1                                   
  007b  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  0080  83c406           add sp, 6                                
  0083  0bc0             or ax, ax                                
  0085  7503             jne 0x8a                                 
  0087  e90901           jmp 0x193                                
  008a  c41e625e         les bx, ptr [0x5e62]                     
  008e  263937           cmp word ptr es:[bx], si                 
  0091  7545             jne 0xd8                                 
  0093  26397f02         cmp word ptr es:[bx + 2], di             
  0097  753f             jne 0xd8                                 
  0099  33d2             xor dx, dx                               
  009b  eb2e             jmp 0xcb                                 
  009d  8bda             mov bx, dx                               
  009f  c1e302           shl bx, 2                                
  00a2  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  00a6  0b87405e         or ax, word ptr [bx + 0x5e40]            
  00aa  741e             je 0xca                                  
  00ac  8bda             mov bx, dx                               
  00ae  c1e302           shl bx, 2                                
  00b1  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  00b5  26c74712ffff     mov word ptr es:[bx + 0x12], 0xffff      
  00bb  8bda             mov bx, dx                               
  00bd  c1e302           shl bx, 2                                
  00c0  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  00c4  26c74714ffff     mov word ptr es:[bx + 0x14], 0xffff      
  00ca  42               inc dx                                   
  00cb  83fa08           cmp dx, 8                                
  00ce  7ccd             jl 0x9d                                  
  00d0  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  00d5  e9bb00           jmp 0x193                                
  00d8  33d2             xor dx, dx                               
  00da  eb2a             jmp 0x106                                
  00dc  8bda             mov bx, dx                               
  00de  c1e302           shl bx, 2                                
  00e1  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  00e5  0b87405e         or ax, word ptr [bx + 0x5e40]            
  00e9  741a             je 0x105                                 
  00eb  8bda             mov bx, dx                               
  00ed  c1e302           shl bx, 2                                
  00f0  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  00f4  26897712         mov word ptr es:[bx + 0x12], si          
  00f8  8bda             mov bx, dx                               
  00fa  c1e302           shl bx, 2                                
  00fd  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  0101  26897f14         mov word ptr es:[bx + 0x14], di          
  0105  42               inc dx                                   
  0106  83fa08           cmp dx, 8                                
  0109  7cd1             jl 0xdc                                  
  010b  16               push ss                                  
  010c  8d8632ff         lea ax, [bp - 0xce]                      
  0110  50               push ax                                  
  0111  16               push ss                                  
  0112  8d8622ff         lea ax, [bp - 0xde]                      
  0116  50               push ax                                  
  0117  9a68185505       lcall 0x555, 0x1868                      -> 0555:1868
  011c  83c408           add sp, 8                                
  011f  16               push ss                                  
  0120  8d8622ff         lea ax, [bp - 0xde]                      
  0124  50               push ax                                  
  0125  9a0a005505       lcall 0x555, 0xa                         -> 0555:000a
  012a  83c404           add sp, 4                                
  012d  0bc0             or ax, ax                                
  012f  7507             jne 0x138                                
  0131  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  0136  eb5b             jmp 0x193                                
  0138  16               push ss                                  
  0139  8d8632ff         lea ax, [bp - 0xce]                      
  013d  50               push ax                                  
  013e  c41e625e         les bx, ptr [0x5e62]                     
  0142  26ff7702         push word ptr es:[bx + 2]                
  0146  26ff37           push word ptr es:[bx]                    
  0149  90               nop                                      
  014a  0e               push cs                                  
  014b  e81508           call 0x963                               
  014e  83c408           add sp, 8                                
  0151  833eda2b00       cmp word ptr [0x2bda], 0                 
  0156  7405             je 0x15d                                 
  0158  a1005e           mov ax, word ptr [0x5e00]                
  015b  eb09             jmp 0x166                                
  015d  c41e625e         les bx, ptr [0x5e62]                     
  0161  268a4707         mov al, byte ptr es:[bx + 7]             
  0165  98               cwde                                     
  0166  8946fa           mov word ptr [bp - 6], ax                
  0169  16               push ss                                  
  016a  8d86befe         lea ax, [bp - 0x142]                     
  016e  50               push ax                                  
  016f  ff76fa           push word ptr [bp - 6]                   
  0172  16               push ss                                  
  0173  8d8622ff         lea ax, [bp - 0xde]                      
  0177  50               push ax                                  
  0178  9abe185505       lcall 0x555, 0x18be                      -> 0555:18be
  017d  83c40a           add sp, 0xa                              
  0180  a3aa2e           mov word ptr [0x2eaa], ax                
  0183  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0188  837e0800         cmp word ptr [bp + 8], 0                 
  018c  7405             je 0x193                                 
  018e  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  0193  5f               pop di                                   
  0194  5e               pop si                                   
  0195  c9               leave                                    
  0196  cb               retf                                     

res_0c8c_0197:  ; ENTRY
  0197  55               push bp                                  
  0198  8bec             mov bp, sp                               
  019a  8a5e06           mov bl, byte ptr [bp + 6]                
  019d  80fb35           cmp bl, 0x35                             
  01a0  7507             jne 0x1a9                                
  01a2  9a4300f930       lcall 0x30f9, 0x43                       -> ovl64:0565
  01a7  eb40             jmp 0x1e9                                
  01a9  8ac3             mov al, bl                               
  01ab  98               cwde                                     
  01ac  2d3100           sub ax, 0x31                             
  01af  8bd8             mov bx, ax                               
  01b1  83fb08           cmp bx, 8                                
  01b4  772c             ja 0x1e2                                 
  01b6  d1e3             shl bx, 1                                
  01b8  2effa7eb01       jmp word ptr cs:[bx + 0x1eb]             
res_0c8c_01bd:  ; case
  01bd  33d2             xor dx, dx                               
  01bf  eb21             jmp 0x1e2                                
res_0c8c_01c1:  ; case
  01c1  ba0100           mov dx, 1                                
  01c4  eb1c             jmp 0x1e2                                
res_0c8c_01c6:  ; case
  01c6  ba0200           mov dx, 2                                
  01c9  eb17             jmp 0x1e2                                
res_0c8c_01cb:  ; case
  01cb  ba0300           mov dx, 3                                
  01ce  eb12             jmp 0x1e2                                
res_0c8c_01d0:  ; case
  01d0  ba0400           mov dx, 4                                
  01d3  eb0d             jmp 0x1e2                                
res_0c8c_01d5:  ; case
  01d5  ba0500           mov dx, 5                                
  01d8  eb08             jmp 0x1e2                                
res_0c8c_01da:  ; case
  01da  ba0600           mov dx, 6                                
  01dd  eb03             jmp 0x1e2                                
res_0c8c_01df:  ; case
  01df  ba0700           mov dx, 7                                
res_0c8c_01e2:  ; case
  01e2  52               push dx                                  
  01e3  90               nop                                      
  01e4  0e               push cs                                  
  01e5  e83702           call 0x41f                               
  01e8  59               pop cx                                   
  01e9  5d               pop bp                                   
  01ea  cb               retf                                     
  01eb  d501d001cb01da01 dw 01d5,01d0,01cb,01da,01e2,01c6,01df,01bd,01c1 jump table

res_0c8c_01fd:  ; ENTRY
  01fd  55               push bp                                  
  01fe  8bec             mov bp, sp                               
  0200  83ec08           sub sp, 8                                
  0203  56               push si                                  
  0204  57               push di                                  
  0205  8b4e06           mov cx, word ptr [bp + 6]                
  0208  8b4608           mov ax, word ptr [bp + 8]                
  020b  66833e625e00     cmp dword ptr [0x5e62], 0                
  0211  7412             je 0x225                                 
  0213  0bc9             or cx, cx                                
  0215  7c0e             jl 0x225                                 
  0217  0bc0             or ax, ax                                
  0219  7c0a             jl 0x225                                 
  021b  83f970           cmp cx, 0x70                             
  021e  7d05             jge 0x225                                
  0220  3d9c00           cmp ax, 0x9c                             
  0223  7c05             jl 0x22a                                 
  0225  33c0             xor ax, ax                               
  0227  e9f101           jmp 0x41b                                
  022a  0bc9             or cx, cx                                
  022c  753f             jne 0x26d                                
  022e  0bc0             or ax, ax                                
  0230  753b             jne 0x26d                                
  0232  16               push ss                                  
  0233  8d46fa           lea ax, [bp - 6]                         
  0236  50               push ax                                  
  0237  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  023c  83c404           add sp, 4                                
  023f  8b46fa           mov ax, word ptr [bp - 6]                
  0242  05f0ff           add ax, 0xfff0                           
  0245  bb2800           mov bx, 0x28                             
  0248  99               cdq                                      
  0249  f7fb             idiv bx                                  
  024b  ba042c           mov dx, 0x2c04                           
  024e  8ec2             mov es, dx                               
  0250  268b0e7701       mov cx, word ptr es:[0x177]              
  0255  03c8             add cx, ax                               
  0257  8b46fc           mov ax, word ptr [bp - 4]                
  025a  05e2ff           add ax, 0xffe2                           
  025d  99               cdq                                      
  025e  f7fb             idiv bx                                  
  0260  ba042c           mov dx, 0x2c04                           
  0263  8ec2             mov es, dx                               
  0265  50               push ax                                  
  0266  26a17501         mov ax, word ptr es:[0x175]              
  026a  5a               pop dx                                   
  026b  03c2             add ax, dx                               
  026d  6a00             push 0                                   
  026f  50               push ax                                  
  0270  51               push cx                                  
  0271  9a4f0c8b0a       lcall 0xa8b, 0xc4f                       -> 0a8b:0c4f
  0276  83c406           add sp, 6                                
  0279  8946fe           mov word ptr [bp - 2], ax                
  027c  c41e625e         les bx, ptr [0x5e62]                     
  0280  268b4712         mov ax, word ptr es:[bx + 0x12]          
  0284  263b07           cmp ax, word ptr es:[bx]                 
  0287  7515             jne 0x29e                                
  0289  268b4702         mov ax, word ptr es:[bx + 2]             
  028d  263b4714         cmp ax, word ptr es:[bx + 0x14]          
  0291  750b             jne 0x29e                                
  0293  b8ffff           mov ax, 0xffff                           
  0296  26894714         mov word ptr es:[bx + 0x14], ax          
  029a  26894712         mov word ptr es:[bx + 0x12], ax          
  029e  837efe00         cmp word ptr [bp - 2], 0                 
  02a2  7505             jne 0x2a9                                
  02a4  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  02a9  837efe02         cmp word ptr [bp - 2], 2                 
  02ad  754a             jne 0x2f9                                
  02af  9a43001931       lcall 0x3119, 0x43                       -> ovl67:08fb
  02b4  666801000100     push 0x10001                             
  02ba  6a01             push 1                                   
  02bc  9ab308620b       lcall 0xb62, 0x8b3                       -> 0b62:08b3
  02c1  83c406           add sp, 6                                
  02c4  b8042c           mov ax, 0x2c04                           
  02c7  8ec0             mov es, ax                               
  02c9  26833e2e0100     cmp word ptr es:[0x12e], 0               
  02cf  7422             je 0x2f3                                 
  02d1  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  02d6  3d0100           cmp ax, 1                                
  02d9  7518             jne 0x2f3                                
  02db  666819000900     push 0x90019                             
  02e1  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  02e6  83c404           add sp, 4                                
  02e9  52               push dx                                  
  02ea  50               push ax                                  
  02eb  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  02f0  83c404           add sp, 4                                
  02f3  b80200           mov ax, 2                                
  02f6  e92201           jmp 0x41b                                
  02f9  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  02fe  b8042c           mov ax, 0x2c04                           
  0301  8ec0             mov es, ax                               
  0303  26833e2e0100     cmp word ptr es:[0x12e], 0               
  0309  7503             jne 0x30e                                
  030b  e90a01           jmp 0x418                                
  030e  8ec0             mov es, ax                               
  0310  26a03401         mov al, byte ptr es:[0x134]              
  0314  c1e804           shr ax, 4                                
  0317  250100           and ax, 1                                
  031a  0bc0             or ax, ax                                
  031c  7403             je 0x321                                 
  031e  e98400           jmp 0x3a5                                
  0321  33ff             xor di, di                               
  0323  eb7b             jmp 0x3a0                                
  0325  8bdf             mov bx, di                               
  0327  d1e3             shl bx, 1                                
  0329  c436625e         les si, ptr [0x5e62]                     
  032d  268b04           mov ax, word ptr es:[si]                 
  0330  03874c2b         add ax, word ptr [bx + 0x2b4c]           
  0334  8946fc           mov word ptr [bp - 4], ax                
  0337  8b1e625e         mov bx, word ptr [0x5e62]                
  033b  268b4702         mov ax, word ptr es:[bx + 2]             
  033f  8bdf             mov bx, di                               
  0341  d1e3             shl bx, 1                                
  0343  03875c2b         add ax, word ptr [bx + 0x2b5c]           
  0347  8946fa           mov word ptr [bp - 6], ax                
  034a  50               push ax                                  
  034b  ff76fc           push word ptr [bp - 4]                   
  034e  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0353  83c404           add sp, 4                                
  0356  8946f8           mov word ptr [bp - 8], ax                
  0359  0bc0             or ax, ax                                
  035b  7c42             jl 0x39f                                 
  035d  8b5ef8           mov bx, word ptr [bp - 8]                
  0360  6bdb41           imul bx, bx, 0x41                        
  0363  b8042c           mov ax, 0x2c04                           
  0366  8ec0             mov es, ax                               
  0368  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  036d  98               cwde                                     
  036e  ba042c           mov dx, 0x2c04                           
  0371  8ec2             mov es, dx                               
  0373  263b061001       cmp ax, word ptr es:[0x110]              
  0378  7425             je 0x39f                                 
  037a  b8042c           mov ax, 0x2c04                           
  037d  8ec0             mov es, ax                               
  037f  26800e340110     or byte ptr es:[0x134], 0x10             
  0385  666819000400     push 0x40019                             
  038b  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0390  83c404           add sp, 4                                
  0393  52               push dx                                  
  0394  50               push ax                                  
  0395  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  039a  83c404           add sp, 4                                
  039d  eb06             jmp 0x3a5                                
  039f  47               inc di                                   
  03a0  83ff08           cmp di, 8                                
  03a3  7c80             jl 0x325                                 
  03a5  b8042c           mov ax, 0x2c04                           
  03a8  8ec0             mov es, ax                               
  03aa  26a03401         mov al, byte ptr es:[0x134]              
  03ae  c1e807           shr ax, 7                                
  03b1  250100           and ax, 1                                
  03b4  0bc0             or ax, ax                                
  03b6  7560             jne 0x418                                
  03b8  c41e625e         les bx, ptr [0x5e62]                     
  03bc  268b5f02         mov bx, word ptr es:[bx + 2]             
  03c0  69dbe000         imul bx, bx, 0xe0                        
  03c4  8b36625e         mov si, word ptr [0x5e62]                
  03c8  268b04           mov ax, word ptr es:[si]                 
  03cb  d1e0             shl ax, 1                                
  03cd  03d8             add bx, ax                               
  03cf  b81d1e           mov ax, 0x1e1d                           
  03d2  8ec0             mov es, ax                               
  03d4  268a9f0000       mov bl, byte ptr es:[bx]                 
  03d9  81e3ff00         and bx, 0xff                             
  03dd  b8042c           mov ax, 0x2c04                           
  03e0  8ec0             mov es, ax                               
  03e2  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  03e8  752e             jne 0x418                                
  03ea  c41e625e         les bx, ptr [0x5e62]                     
  03ee  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  03f3  7523             jne 0x418                                
  03f5  b8042c           mov ax, 0x2c04                           
  03f8  8ec0             mov es, ax                               
  03fa  26800e340180     or byte ptr es:[0x134], 0x80             
  0400  666819000500     push 0x50019                             
  0406  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  040b  83c404           add sp, 4                                
  040e  52               push dx                                  
  040f  50               push ax                                  
  0410  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  0415  83c404           add sp, 4                                
  0418  8b46fe           mov ax, word ptr [bp - 2]                
  041b  5f               pop di                                   
  041c  5e               pop si                                   
  041d  c9               leave                                    
  041e  cb               retf                                     

res_0c8c_041f:  ; ENTRY
  041f  55               push bp                                  
  0420  8bec             mov bp, sp                               
  0422  83ec04           sub sp, 4                                
  0425  c41e625e         les bx, ptr [0x5e62]                     
  0429  268b07           mov ax, word ptr es:[bx]                 
  042c  8946fe           mov word ptr [bp - 2], ax                
  042f  268b4702         mov ax, word ptr es:[bx + 2]             
  0433  8946fc           mov word ptr [bp - 4], ax                
  0436  ff7606           push word ptr [bp + 6]                   
  0439  16               push ss                                  
  043a  8d46fc           lea ax, [bp - 4]                         
  043d  50               push ax                                  
  043e  16               push ss                                  
  043f  8d46fe           lea ax, [bp - 2]                         
  0442  50               push ax                                  
  0443  9a4d0b8b0a       lcall 0xa8b, 0xb4d                       -> 0a8b:0b4d
  0448  83c40a           add sp, 0xa                              
  044b  ff76fc           push word ptr [bp - 4]                   
  044e  ff76fe           push word ptr [bp - 2]                   
  0451  0e               push cs                                  
  0452  e8a8fd           call 0x1fd                               
  0455  83c404           add sp, 4                                
  0458  8bd0             mov dx, ax                               
  045a  83fa03           cmp dx, 3                                
  045d  7405             je 0x464                                 
  045f  83fa05           cmp dx, 5                                
  0462  750e             jne 0x472                                
  0464  ff76fc           push word ptr [bp - 4]                   
  0467  ff76fe           push word ptr [bp - 2]                   
  046a  9a25002430       lcall 0x3024, 0x25                       -> ovl36:0000
  046f  83c404           add sp, 4                                
  0472  833eda2b00       cmp word ptr [0x2bda], 0                 
  0477  7439             je 0x4b2                                 
  0479  ba0800           mov dx, 8                                
  047c  eb2d             jmp 0x4ab                                
  047e  8bda             mov bx, dx                               
  0480  c1e302           shl bx, 2                                
  0483  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  0487  0b87405e         or ax, word ptr [bx + 0x5e40]            
  048b  741e             je 0x4ab                                 
  048d  8bda             mov bx, dx                               
  048f  c1e302           shl bx, 2                                
  0492  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0496  26c74712ffff     mov word ptr es:[bx + 0x12], 0xffff      
  049c  8bda             mov bx, dx                               
  049e  c1e302           shl bx, 2                                
  04a1  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  04a5  26c74714ffff     mov word ptr es:[bx + 0x14], 0xffff      
  04ab  8bc2             mov ax, dx                               
  04ad  4a               dec dx                                   
  04ae  0bc0             or ax, ax                                
  04b0  75cc             jne 0x47e                                
  04b2  c41e625e         les bx, ptr [0x5e62]                     
  04b6  26c74712ffff     mov word ptr es:[bx + 0x12], 0xffff      
  04bc  26c74714ffff     mov word ptr es:[bx + 0x14], 0xffff      
  04c2  c9               leave                                    
  04c3  cb               retf                                     

res_0c8c_04c4:  ; ENTRY
  04c4  55               push bp                                  
  04c5  8bec             mov bp, sp                               
  04c7  83ec04           sub sp, 4                                
  04ca  66833e625e00     cmp dword ptr [0x5e62], 0                
  04d0  7441             je 0x513                                 
  04d2  c41e625e         les bx, ptr [0x5e62]                     
  04d6  26837f1200       cmp word ptr es:[bx + 0x12], 0           
  04db  7c36             jl 0x513                                 
  04dd  eb21             jmp 0x500                                
  04df  c45efc           les bx, ptr [bp - 4]                     
  04e2  26814f0c0002     or word ptr es:[bx + 0xc], 0x200         
  04e8  26837f1200       cmp word ptr es:[bx + 0x12], 0           
  04ed  7c24             jl 0x513                                 
  04ef  66ff76fc         push dword ptr [bp - 4]                  
  04f3  9a3e001931       lcall 0x3119, 0x3e                       -> ovl67:06eb
  04f8  83c404           add sp, 4                                
  04fb  9a34000c31       lcall 0x310c, 0x34                       -> ovl66:0356
  0500  c41e625e         les bx, ptr [0x5e62]                     
  0504  26ff7714         push word ptr es:[bx + 0x14]             
  0508  26ff7712         push word ptr es:[bx + 0x12]             
  050c  0e               push cs                                  
  050d  e8edfc           call 0x1fd                               
  0510  83c404           add sp, 4                                
  0513  9a52001931       lcall 0x3119, 0x52                       -> ovl67:05c4
  0518  8956fe           mov word ptr [bp - 2], dx                
  051b  8946fc           mov word ptr [bp - 4], ax                
  051e  0bc2             or ax, dx                                
  0520  75bd             jne 0x4df                                
  0522  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  0527  c9               leave                                    
  0528  cb               retf                                     

res_0c8c_0529:  ; ENTRY
  0529  55               push bp                                  
  052a  8bec             mov bp, sp                               
  052c  81ec4e01         sub sp, 0x14e                            
  0530  56               push si                                  
  0531  57               push di                                  
  0532  c746fe0100       mov word ptr [bp - 2], 1                 
  0537  c746fc0100       mov word ptr [bp - 4], 1                 
  053c  c746fa0000       mov word ptr [bp - 6], 0                 
  0541  c746f80000       mov word ptr [bp - 8], 0                 
  0546  c746f60000       mov word ptr [bp - 0xa], 0               
  054b  c746f40000       mov word ptr [bp - 0xc], 0               
  0550  c746f20000       mov word ptr [bp - 0xe], 0               
  0555  c746f00000       mov word ptr [bp - 0x10], 0              
  055a  c706fe5d0000     mov word ptr [0x5dfe], 0                 
  0560  c706005e6400     mov word ptr [0x5e00], 0x64              
  0566  c41e625e         les bx, ptr [0x5e62]                     
  056a  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  056f  7509             jne 0x57a                                
  0571  8b16645e         mov dx, word ptr [0x5e64]                
  0575  a1625e           mov ax, word ptr [0x5e62]                
  0578  eb04             jmp 0x57e                                
  057a  33d2             xor dx, dx                               
  057c  33c0             xor ax, ax                               
  057e  8916605e         mov word ptr [0x5e60], dx                
  0582  a35e5e           mov word ptr [0x5e5e], ax                
  0585  33f6             xor si, si                               
  0587  e91d01           jmp 0x6a7                                
  058a  8bde             mov bx, si                               
  058c  c1e302           shl bx, 2                                
  058f  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  0593  0b87405e         or ax, word ptr [bx + 0x5e40]            
  0597  7503             jne 0x59c                                
  0599  e90a01           jmp 0x6a6                                
  059c  8bde             mov bx, si                               
  059e  c1e302           shl bx, 2                                
  05a1  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  05a5  268a4704         mov al, byte ptr es:[bx + 4]             
  05a9  98               cwde                                     
  05aa  8bf8             mov di, ax                               
  05ac  8bde             mov bx, si                               
  05ae  c1e302           shl bx, 2                                
  05b1  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  05b5  268a4707         mov al, byte ptr es:[bx + 7]             
  05b9  98               cwde                                     
  05ba  8bd0             mov dx, ax                               
  05bc  8bde             mov bx, si                               
  05be  c1e302           shl bx, 2                                
  05c1  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  05c5  268b470c         mov ax, word ptr es:[bx + 0xc]           
  05c9  250010           and ax, 0x1000                           
  05cc  8946ee           mov word ptr [bp - 0x12], ax             
  05cf  ff06fe5d         inc word ptr [0x5dfe]                    
  05d3  a0005e           mov al, byte ptr [0x5e00]                
  05d6  98               cwde                                     
  05d7  3bc2             cmp ax, dx                               
  05d9  7e04             jle 0x5df                                
  05db  8916005e         mov word ptr [0x5e00], dx                
  05df  83ff1c           cmp di, 0x1c                             
  05e2  751b             jne 0x5ff                                
  05e4  8bde             mov bx, si                               
  05e6  c1e302           shl bx, 2                                
  05e9  66ffb73e5e       push dword ptr [bx + 0x5e3e]             
  05ee  9a2f001d30       lcall 0x301d, 0x2f                       -> ovl35:08b4
  05f3  83c404           add sp, 4                                
  05f6  0bc0             or ax, ax                                
  05f8  7405             je 0x5ff                                 
  05fa  c746f80100       mov word ptr [bp - 8], 1                 
  05ff  8bdf             mov bx, di                               
  0601  6bdb06           imul bx, bx, 6                           
  0604  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  0608  98               cwde                                     
  0609  0bc0             or ax, ax                                
  060b  7406             je 0x613                                 
  060d  837eee00         cmp word ptr [bp - 0x12], 0              
  0611  7405             je 0x618                                 
  0613  c746fe0000       mov word ptr [bp - 2], 0                 
  0618  837eee00         cmp word ptr [bp - 0x12], 0              
  061c  7405             je 0x623                                 
  061e  c746f60100       mov word ptr [bp - 0xa], 1               
  0623  83ff1c           cmp di, 0x1c                             
  0626  7413             je 0x63b                                 
  0628  8bdf             mov bx, di                               
  062a  6bdb06           imul bx, bx, 6                           
  062d  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  0631  98               cwde                                     
  0632  0bc0             or ax, ax                                
  0634  7505             jne 0x63b                                
  0636  c746fc0000       mov word ptr [bp - 4], 0                 
  063b  8bdf             mov bx, di                               
  063d  6bdb06           imul bx, bx, 6                           
  0640  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0645  740b             je 0x652                                 
  0647  837eee00         cmp word ptr [bp - 0x12], 0              
  064b  7505             jne 0x652                                
  064d  c746fa0100       mov word ptr [bp - 6], 1                 
  0652  8bdf             mov bx, di                               
  0654  6bdb06           imul bx, bx, 6                           
  0657  80bfc74500       cmp byte ptr [bx + 0x45c7], 0            
  065c  7405             je 0x663                                 
  065e  c746f40100       mov word ptr [bp - 0xc], 1               
  0663  8bdf             mov bx, di                               
  0665  6bdb06           imul bx, bx, 6                           
  0668  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  066d  7405             je 0x674                                 
  066f  c746f00100       mov word ptr [bp - 0x10], 1              
  0674  8bdf             mov bx, di                               
  0676  6bdb06           imul bx, bx, 6                           
  0679  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  067e  7405             je 0x685                                 
  0680  c746f20100       mov word ptr [bp - 0xe], 1               
  0685  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  068b  7519             jne 0x6a6                                
  068d  83ff1c           cmp di, 0x1c                             
  0690  7514             jne 0x6a6                                
  0692  8bde             mov bx, si                               
  0694  c1e302           shl bx, 2                                
  0697  8b87405e         mov ax, word ptr [bx + 0x5e40]           
  069b  8b973e5e         mov dx, word ptr [bx + 0x5e3e]           
  069f  a3605e           mov word ptr [0x5e60], ax                
  06a2  89165e5e         mov word ptr [0x5e5e], dx                
  06a6  46               inc si                                   
  06a7  83fe08           cmp si, 8                                
  06aa  7d03             jge 0x6af                                
  06ac  e9dbfe           jmp 0x58a                                
  06af  833efe5d01       cmp word ptr [0x5dfe], 1                 
  06b4  7e05             jle 0x6bb                                
  06b6  b80100           mov ax, 1                                
  06b9  eb02             jmp 0x6bd                                
  06bb  33c0             xor ax, ax                               
  06bd  a3da2b           mov word ptr [0x2bda], ax                
  06c0  c706fc5d0100     mov word ptr [0x5dfc], 1                 
  06c6  c706fa5d0000     mov word ptr [0x5dfa], 0                 
  06cc  837ef600         cmp word ptr [bp - 0xa], 0               
  06d0  7407             je 0x6d9                                 
  06d2  830efa5d08       or word ptr [0x5dfa], 8                  
  06d7  eb4a             jmp 0x723                                
  06d9  837ef400         cmp word ptr [bp - 0xc], 0               
  06dd  7408             je 0x6e7                                 
  06df  c706fc5d0000     mov word ptr [0x5dfc], 0                 
  06e5  eb3c             jmp 0x723                                
  06e7  837ef800         cmp word ptr [bp - 8], 0                 
  06eb  7518             jne 0x705                                
  06ed  837efe00         cmp word ptr [bp - 2], 0                 
  06f1  7512             jne 0x705                                
  06f3  837efe00         cmp word ptr [bp - 2], 0                 
  06f7  7514             jne 0x70d                                
  06f9  837efc00         cmp word ptr [bp - 4], 0                 
  06fd  740e             je 0x70d                                 
  06ff  837efa00         cmp word ptr [bp - 6], 0                 
  0703  7408             je 0x70d                                 
  0705  c706fc5d0200     mov word ptr [0x5dfc], 2                 
  070b  eb16             jmp 0x723                                
  070d  837ef000         cmp word ptr [bp - 0x10], 0              
  0711  7405             je 0x718                                 
  0713  830efa5d01       or word ptr [0x5dfa], 1                  
  0718  837ef200         cmp word ptr [bp - 0xe], 0               
  071c  7405             je 0x723                                 
  071e  830efa5d02       or word ptr [0x5dfa], 2                  
  0723  ba0800           mov dx, 8                                
  0726  eb39             jmp 0x761                                
  0728  8bda             mov bx, dx                               
  072a  c1e302           shl bx, 2                                
  072d  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  0731  0b87405e         or ax, word ptr [bx + 0x5e40]            
  0735  742a             je 0x761                                 
  0737  c41e625e         les bx, ptr [0x5e62]                     
  073b  268b4712         mov ax, word ptr es:[bx + 0x12]          
  073f  8bda             mov bx, dx                               
  0741  c1e302           shl bx, 2                                
  0744  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0748  26894712         mov word ptr es:[bx + 0x12], ax          
  074c  c41e625e         les bx, ptr [0x5e62]                     
  0750  268b4714         mov ax, word ptr es:[bx + 0x14]          
  0754  8bda             mov bx, dx                               
  0756  c1e302           shl bx, 2                                
  0759  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  075d  26894714         mov word ptr es:[bx + 0x14], ax          
  0761  8bc2             mov ax, dx                               
  0763  4a               dec dx                                   
  0764  0bc0             or ax, ax                                
  0766  75c0             jne 0x728                                
  0768  b8042c           mov ax, 0x2c04                           
  076b  8ec0             mov es, ax                               
  076d  268b1e1001       mov bx, word ptr es:[0x110]              
  0772  d1e3             shl bx, 1                                
  0774  b8042c           mov ax, 0x2c04                           
  0777  8ec0             mov es, ax                               
  0779  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  077f  756a             jne 0x7eb                                
  0781  c41e625e         les bx, ptr [0x5e62]                     
  0785  26837f1200       cmp word ptr es:[bx + 0x12], 0           
  078a  7c5f             jl 0x7eb                                 
  078c  26837f1400       cmp word ptr es:[bx + 0x14], 0           
  0791  7c58             jl 0x7eb                                 
  0793  16               push ss                                  
  0794  8d8616ff         lea ax, [bp - 0xea]                      
  0798  50               push ax                                  
  0799  16               push ss                                  
  079a  8d46de           lea ax, [bp - 0x22]                      
  079d  50               push ax                                  
  079e  9a68185505       lcall 0x555, 0x1868                      -> 0555:1868
  07a3  83c408           add sp, 8                                
  07a6  16               push ss                                  
  07a7  8d46de           lea ax, [bp - 0x22]                      
  07aa  50               push ax                                  
  07ab  9a0a005505       lcall 0x555, 0xa                         -> 0555:000a
  07b0  83c404           add sp, 4                                
  07b3  16               push ss                                  
  07b4  8d86b2fe         lea ax, [bp - 0x14e]                     
  07b8  50               push ax                                  
  07b9  ff36005e         push word ptr [0x5e00]                   
  07bd  16               push ss                                  
  07be  8d46de           lea ax, [bp - 0x22]                      
  07c1  50               push ax                                  
  07c2  9abe185505       lcall 0x555, 0x18be                      -> 0555:18be
  07c7  83c40a           add sp, 0xa                              
  07ca  8946ee           mov word ptr [bp - 0x12], ax             
  07cd  a3aa2e           mov word ptr [0x2eaa], ax                
  07d0  16               push ss                                  
  07d1  8d8616ff         lea ax, [bp - 0xea]                      
  07d5  50               push ax                                  
  07d6  c41e625e         les bx, ptr [0x5e62]                     
  07da  26ff7702         push word ptr es:[bx + 2]                
  07de  26ff37           push word ptr es:[bx]                    
  07e1  90               nop                                      
  07e2  0e               push cs                                  
  07e3  e87d01           call 0x963                               
  07e6  83c408           add sp, 8                                
  07e9  eb0b             jmp 0x7f6                                
  07eb  33c0             xor ax, ax                               
  07ed  a3aa2e           mov word ptr [0x2eaa], ax                
  07f0  a3a62e           mov word ptr [0x2ea6], ax                
  07f3  a3a82e           mov word ptr [0x2ea8], ax                
  07f6  5f               pop di                                   
  07f7  5e               pop si                                   
  07f8  c9               leave                                    
  07f9  cb               retf                                     

res_0c8c_07fa:  ; ENTRY
  07fa  55               push bp                                  
  07fb  8bec             mov bp, sp                               
  07fd  83ec0c           sub sp, 0xc                              
  0800  56               push si                                  
  0801  57               push di                                  
  0802  c746fe0000       mov word ptr [bp - 2], 0                 
  0807  c746fc0100       mov word ptr [bp - 4], 1                 
  080c  c746fa0100       mov word ptr [bp - 6], 1                 
  0811  c746f80000       mov word ptr [bp - 8], 0                 
  0816  c746f60000       mov word ptr [bp - 0xa], 0               
  081b  33f6             xor si, si                               
  081d  e9c000           jmp 0x8e0                                
  0820  8bc6             mov ax, si                               
  0822  c1e002           shl ax, 2                                
  0825  c45e06           les bx, ptr [bp + 6]                     
  0828  03d8             add bx, ax                               
  082a  268b07           mov ax, word ptr es:[bx]                 
  082d  260b4702         or ax, word ptr es:[bx + 2]              
  0831  7503             jne 0x836                                
  0833  e9a900           jmp 0x8df                                
  0836  8bc6             mov ax, si                               
  0838  d1e0             shl ax, 1                                
  083a  c45e0a           les bx, ptr [bp + 0xa]                   
  083d  03d8             add bx, ax                               
  083f  26833f00         cmp word ptr es:[bx], 0                  
  0843  7503             jne 0x848                                
  0845  e99700           jmp 0x8df                                
  0848  8bc6             mov ax, si                               
  084a  c1e002           shl ax, 2                                
  084d  c45e06           les bx, ptr [bp + 6]                     
  0850  03d8             add bx, ax                               
  0852  26c41f           les bx, ptr es:[bx]                      
  0855  268a4704         mov al, byte ptr es:[bx + 4]             
  0859  98               cwde                                     
  085a  8bf8             mov di, ax                               
  085c  8bc6             mov ax, si                               
  085e  c1e002           shl ax, 2                                
  0861  c45e06           les bx, ptr [bp + 6]                     
  0864  03d8             add bx, ax                               
  0866  26c41f           les bx, ptr es:[bx]                      
  0869  268b470c         mov ax, word ptr es:[bx + 0xc]           
  086d  250010           and ax, 0x1000                           
  0870  8946f4           mov word ptr [bp - 0xc], ax              
  0873  83ff1c           cmp di, 0x1c                             
  0876  751f             jne 0x897                                
  0878  8bc6             mov ax, si                               
  087a  c1e002           shl ax, 2                                
  087d  c45e06           les bx, ptr [bp + 6]                     
  0880  03d8             add bx, ax                               
  0882  6626ff37         push dword ptr es:[bx]                   
  0886  9a2f001d30       lcall 0x301d, 0x2f                       -> ovl35:08b4
  088b  83c404           add sp, 4                                
  088e  0bc0             or ax, ax                                
  0890  7405             je 0x897                                 
  0892  c746f60100       mov word ptr [bp - 0xa], 1               
  0897  8bdf             mov bx, di                               
  0899  6bdb06           imul bx, bx, 6                           
  089c  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  08a0  98               cwde                                     
  08a1  0bc0             or ax, ax                                
  08a3  7406             je 0x8ab                                 
  08a5  837ef400         cmp word ptr [bp - 0xc], 0               
  08a9  7405             je 0x8b0                                 
  08ab  c746fc0000       mov word ptr [bp - 4], 0                 
  08b0  83ff1c           cmp di, 0x1c                             
  08b3  7413             je 0x8c8                                 
  08b5  8bdf             mov bx, di                               
  08b7  6bdb06           imul bx, bx, 6                           
  08ba  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  08be  98               cwde                                     
  08bf  0bc0             or ax, ax                                
  08c1  7505             jne 0x8c8                                
  08c3  c746fa0000       mov word ptr [bp - 6], 0                 
  08c8  8bdf             mov bx, di                               
  08ca  6bdb06           imul bx, bx, 6                           
  08cd  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  08d2  740b             je 0x8df                                 
  08d4  837ef400         cmp word ptr [bp - 0xc], 0               
  08d8  7505             jne 0x8df                                
  08da  c746f80100       mov word ptr [bp - 8], 1                 
  08df  46               inc si                                   
  08e0  3b760e           cmp si, word ptr [bp + 0xe]              
  08e3  7d03             jge 0x8e8                                
  08e5  e938ff           jmp 0x820                                
  08e8  837ef600         cmp word ptr [bp - 0xa], 0               
  08ec  7518             jne 0x906                                
  08ee  837efc00         cmp word ptr [bp - 4], 0                 
  08f2  7512             jne 0x906                                
  08f4  837efc00         cmp word ptr [bp - 4], 0                 
  08f8  7511             jne 0x90b                                
  08fa  837efa00         cmp word ptr [bp - 6], 0                 
  08fe  740b             je 0x90b                                 
  0900  837ef800         cmp word ptr [bp - 8], 0                 
  0904  7405             je 0x90b                                 
  0906  c746fe0100       mov word ptr [bp - 2], 1                 
  090b  8b46fe           mov ax, word ptr [bp - 2]                
  090e  5f               pop di                                   
  090f  5e               pop si                                   
  0910  c9               leave                                    
  0911  cb               retf                                     

res_0c8c_0912:  ; ENTRY
  0912  55               push bp                                  
  0913  8bec             mov bp, sp                               
  0915  c706005e6400     mov word ptr [0x5e00], 0x64              
  091b  33d2             xor dx, dx                               
  091d  eb3d             jmp 0x95c                                
  091f  8bc2             mov ax, dx                               
  0921  d1e0             shl ax, 1                                
  0923  c45e0a           les bx, ptr [bp + 0xa]                   
  0926  03d8             add bx, ax                               
  0928  26833f00         cmp word ptr es:[bx], 0                  
  092c  742d             je 0x95b                                 
  092e  8bc2             mov ax, dx                               
  0930  c1e002           shl ax, 2                                
  0933  c45e06           les bx, ptr [bp + 6]                     
  0936  03d8             add bx, ax                               
  0938  26c41f           les bx, ptr es:[bx]                      
  093b  268a4707         mov al, byte ptr es:[bx + 7]             
  093f  98               cwde                                     
  0940  3b06005e         cmp ax, word ptr [0x5e00]                
  0944  7d15             jge 0x95b                                
  0946  8bc2             mov ax, dx                               
  0948  c1e002           shl ax, 2                                
  094b  c45e06           les bx, ptr [bp + 6]                     
  094e  03d8             add bx, ax                               
  0950  26c41f           les bx, ptr es:[bx]                      
  0953  268a4707         mov al, byte ptr es:[bx + 7]             
  0957  98               cwde                                     
  0958  a3005e           mov word ptr [0x5e00], ax                
  095b  42               inc dx                                   
  095c  3b560e           cmp dx, word ptr [bp + 0xe]              
  095f  7cbe             jl 0x91f                                 
  0961  5d               pop bp                                   
  0962  cb               retf                                     

res_0c8c_0963:  ; ENTRY
  0963  55               push bp                                  
  0964  8bec             mov bp, sp                               
  0966  56               push si                                  
  0967  8b4e06           mov cx, word ptr [bp + 6]                
  096a  8b7608           mov si, word ptr [bp + 8]                
  096d  33d2             xor dx, dx                               
  096f  eb37             jmp 0x9a8                                
  0971  c45e0a           les bx, ptr [bp + 0xa]                   
  0974  03da             add bx, dx                               
  0976  268a07           mov al, byte ptr es:[bx]                 
  0979  b400             mov ah, 0                                
  097b  d1e0             shl ax, 1                                
  097d  8bd8             mov bx, ax                               
  097f  038f4c2b         add cx, word ptr [bx + 0x2b4c]           
  0983  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0986  03da             add bx, dx                               
  0988  268a07           mov al, byte ptr es:[bx]                 
  098b  b400             mov ah, 0                                
  098d  d1e0             shl ax, 1                                
  098f  8bd8             mov bx, ax                               
  0991  03b75c2b         add si, word ptr [bx + 0x2b5c]           
  0995  8bda             mov bx, dx                               
  0997  c1e302           shl bx, 2                                
  099a  898f7564         mov word ptr [bx + 0x6475], cx           
  099e  8bda             mov bx, dx                               
  09a0  c1e302           shl bx, 2                                
  09a3  89b77764         mov word ptr [bx + 0x6477], si           
  09a7  42               inc dx                                   
  09a8  81fac800         cmp dx, 0xc8                              ; "Quest"
  09ac  7d0b             jge 0x9b9                                
  09ae  c45e0a           les bx, ptr [bp + 0xa]                   
  09b1  03da             add bx, dx                               
  09b3  26803fff         cmp byte ptr es:[bx], 0xff               
  09b7  75b8             jne 0x971                                
  09b9  c706a82e0000     mov word ptr [0x2ea8], 0                 
  09bf  8916a62e         mov word ptr [0x2ea6], dx                
  09c3  890e7164         mov word ptr [0x6471], cx                
  09c7  89367364         mov word ptr [0x6473], si                
  09cb  5e               pop si                                   
  09cc  5d               pop bp                                   
  09cd  cb               retf                                     
  09ce  55               push bp                                  
