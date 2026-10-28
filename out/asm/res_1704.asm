; res_1704 file_off 0x19040
  0000  87e2             xchg dx, sp                              
  0002  000c             add byte ptr [si], cl                    
  0004  1824             sbb byte ptr [si], ah                    
  0006  303c             xor byte ptr [si], bh                    
  0008  48               dec ax                                   
  0009  54               push sp                                  
  000a  60               pushaw                                   
  000b  6c               insb byte ptr es:[di], dx                
  000c  7884             js 0xffffff92                            
  000e  90               nop                                      
  000f  9c               pushf                                    
  0010  a8b4             test al, 0xb4                             ; "Quest"

res_1704_0012:  ; ENTRY
  0012  52               push dx                                  
  0013  56               push si                                  
  0014  8b5406           mov dx, word ptr [si + 6]                
  0017  80e67f           and dh, 0x7f                             
  001a  0b14             or dx, word ptr [si]                     
  001c  0b5402           or dx, word ptr [si + 2]                 
  001f  0b5404           or dx, word ptr [si + 4]                 
  0022  7520             jne 0x44                                 
  0024  83fbff           cmp bx, -1                               
  0027  7417             je 0x40                                  
  0029  817f080140       cmp word ptr [bx + 8], 0x4001            
  002e  7c10             jl 0x40                                  
  0030  8b5706           mov dx, word ptr [bx + 6]                
  0033  80e67f           and dh, 0x7f                             
  0036  0b17             or dx, word ptr [bx]                     
  0038  0b5702           or dx, word ptr [bx + 2]                 
  003b  0b5704           or dx, word ptr [bx + 4]                 
  003e  7544             jne 0x84                                 
  0040  f8               clc                                      
  0041  5e               pop si                                   
  0042  5a               pop dx                                   
  0043  c3               ret                                      
  0044  83fbff           cmp bx, -1                               
  0047  743d             je 0x86                                  
  0049  817f080140       cmp word ptr [bx + 8], 0x4001            
  004e  7c36             jl 0x86                                  
  0050  8b5706           mov dx, word ptr [bx + 6]                
  0053  80e67f           and dh, 0x7f                             
  0056  0b17             or dx, word ptr [bx]                     
  0058  0b5702           or dx, word ptr [bx + 2]                 
  005b  0b5704           or dx, word ptr [bx + 4]                 
  005e  7426             je 0x86                                  
  0060  8b5406           mov dx, word ptr [si + 6]                
  0063  3b5706           cmp dx, word ptr [bx + 6]                
  0066  771e             ja 0x86                                  
  0068  721a             jb 0x84                                  
  006a  8b5404           mov dx, word ptr [si + 4]                
  006d  3b5704           cmp dx, word ptr [bx + 4]                
  0070  7714             ja 0x86                                  
  0072  7210             jb 0x84                                  
  0074  8b5402           mov dx, word ptr [si + 2]                
  0077  3b5702           cmp dx, word ptr [bx + 2]                
  007a  770a             ja 0x86                                  
  007c  7206             jb 0x84                                  
  007e  8b14             mov dx, word ptr [si]                    
  0080  3b17             cmp dx, word ptr [bx]                    
  0082  7702             ja 0x86                                  
  0084  8bf3             mov si, bx                               
  0086  57               push di                                  
  0087  b501             mov ch, 1                                
  0089  e88826           call 0x2714                              
  008c  b90600           mov cx, 6                                
  008f  fc               cld                                      
  0090  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0092  f9               stc                                      
  0093  5f               pop di                                   
  0094  ebab             jmp 0x41                                 
  0096  8a440a           mov al, byte ptr [si + 0xa]              
  0099  8846fb           mov byte ptr [bp - 5], al                
  009c  c746fc0140       mov word ptr [bp - 4], 0x4001            
  00a1  90               nop                                      
  00a2  eb3d             jmp 0xe1                                 
  00a4  8b7e04           mov di, word ptr [bp + 4]                
  00a7  90               nop                                      
  00a8  e8a80d           call 0xe53                               
  00ab  e99301           jmp 0x241                                
  00ae  53               push bx                                  
  00af  57               push di                                  
  00b0  8bdf             mov bx, di                               
  00b2  8b7e04           mov di, word ptr [bp + 4]                
  00b5  90               nop                                      
  00b6  e8               db e8                                    resync
res_1704_00b7:  ; case
  00b7  59               pop cx                                   
  00b8  ff5f5b           lcall [bx + 0x5b]                        
  00bb  72ee             jb 0xab                                  
  00bd  81fb0140         cmp bx, 0x4001                           
  00c1  7cd3             jl 0x96                                  
  00c3  8a46fa           mov al, byte ptr [bp - 6]                
  00c6  0ac0             or al, al                                
  00c8  75da             jne 0xa4                                 
  00ca  ebca             jmp 0x96                                 
  00cc  bbffff           mov bx, 0xffff                           
  00cf  8a450a           mov al, byte ptr [di + 0xa]              
  00d2  32c1             xor al, cl                               
  00d4  8bf7             mov si, di                               
  00d6  8b7e04           mov di, word ptr [bp + 4]                
  00d9  90               nop                                      
  00da  e835ff           call 0x12                                
  00dd  72cc             jb 0xab                                  
  00df  ebb8             jmp 0x99                                 
  00e1  8b04             mov ax, word ptr [si]                    
  00e3  8b5c02           mov bx, word ptr [si + 2]                
  00e6  8b4c04           mov cx, word ptr [si + 4]                
  00e9  8b5406           mov dx, word ptr [si + 6]                
  00ec  e93f01           jmp 0x22e                                

res_1704_00ef:  ; ENTRY
  00ef  b101             mov cl, 1                                
  00f1  eb02             jmp 0xf5                                 

res_1704_00f3:  ; ENTRY
  00f3  b100             mov cl, 0                                
  00f5  55               push bp                                  
  00f6  8bec             mov bp, sp                               
  00f8  8d66fa           lea sp, [bp - 6]                         
  00fb  56               push si                                  
  00fc  57               push di                                  
  00fd  8b7608           mov si, word ptr [bp + 8]                
  0100  8b7e06           mov di, word ptr [bp + 6]                
  0103  8ac1             mov al, cl                               
  0105  32450a           xor al, byte ptr [di + 0xa]              
  0108  32440a           xor al, byte ptr [si + 0xa]              
  010b  8846fa           mov byte ptr [bp - 6], al                
  010e  8b4408           mov ax, word ptr [si + 8]                
  0111  8b5d08           mov bx, word ptr [di + 8]                
  0114  3d0140           cmp ax, 0x4001                           
  0117  7d95             jge 0xae                                 
  0119  81fb0140         cmp bx, 0x4001                           
  011d  7dad             jge 0xcc                                 
  011f  3bc3             cmp ax, bx                               
  0121  7d08             jge 0x12b                                
  0123  324d0a           xor cl, byte ptr [di + 0xa]              
  0126  93               xchg bx, ax                              
  0127  87f7             xchg di, si                              
  0129  eb03             jmp 0x12e                                
  012b  8a4c0a           mov cl, byte ptr [si + 0xa]              
  012e  884efb           mov byte ptr [bp - 5], cl                
  0131  8b4c08           mov cx, word ptr [si + 8]                
  0134  894efc           mov word ptr [bp - 4], cx                
  0137  81fb01c0         cmp bx, 0xc001                           
  013b  7ea4             jle 0xe1                                 
  013d  2bc3             sub ax, bx                               
  013f  3d4100           cmp ax, 0x41                             
  0142  7f9d             jg 0xe1                                  
  0144  8b5d02           mov bx, word ptr [di + 2]                
  0147  8b4d04           mov cx, word ptr [di + 4]                
  014a  8b5506           mov dx, word ptr [di + 6]                
  014d  8b3d             mov di, word ptr [di]                    
  014f  97               xchg di, ax                              
  0150  c646fe00         mov byte ptr [bp - 2], 0                 
  0154  83ef08           sub di, 8                                
  0157  7c18             jl 0x171                                 
  0159  8846fe           mov byte ptr [bp - 2], al                
  015c  8ac4             mov al, ah                               
  015e  8ae3             mov ah, bl                               
  0160  8adf             mov bl, bh                               
  0162  8af9             mov bh, cl                               
  0164  8acd             mov cl, ch                               
  0166  8aea             mov ch, dl                               
  0168  8ad6             mov dl, dh                               
  016a  b600             mov dh, 0                                
  016c  83ef08           sub di, 8                                
  016f  7de8             jge 0x159                                
  0171  83e707           and di, 7                                
  0174  740e             je 0x184                                 
  0176  d1ea             shr dx, 1                                
  0178  d1d9             rcr cx, 1                                
  017a  d1db             rcr bx, 1                                
  017c  d1d8             rcr ax, 1                                
  017e  d05efe           rcr byte ptr [bp - 2], 1                 
  0181  4f               dec di                                   
  0182  75f2             jne 0x176                                
  0184  807efa00         cmp byte ptr [bp - 6], 0                 
  0188  751d             jne 0x1a7                                
  018a  0304             add ax, word ptr [si]                    
  018c  135c02           adc bx, word ptr [si + 2]                
  018f  134c04           adc cx, word ptr [si + 4]                
  0192  135406           adc dx, word ptr [si + 6]                
  0195  7377             jae 0x20e                                
  0197  d1da             rcr dx, 1                                
  0199  d1d9             rcr cx, 1                                
  019b  d1db             rcr bx, 1                                
  019d  d1d8             rcr ax, 1                                
  019f  d05efe           rcr byte ptr [bp - 2], 1                 
  01a2  ff46fc           inc word ptr [bp - 4]                    
  01a5  eb67             jmp 0x20e                                
  01a7  8076fb01         xor byte ptr [bp - 5], 1                 
  01ab  2b04             sub ax, word ptr [si]                    
  01ad  1b5c02           sbb bx, word ptr [si + 2]                
  01b0  1b4c04           sbb cx, word ptr [si + 4]                
  01b3  1b54             db 1b54                                  resync
res_1704_01b5:  ; case
  01b5  06               push es                                  
  01b6  7318             jae 0x1d0                                
  01b8  8076fb01         xor byte ptr [bp - 5], 1                 
  01bc  f7d2             not dx                                   
  01be  f7d1             not cx                                   
  01c0  f7d3             not bx                                   
  01c2  f7d0             not ax                                   
  01c4  f65efe           neg byte ptr [bp - 2]                    
  01c7  f5               cmc                                      
  01c8  13c7             adc ax, di                               
  01ca  13df             adc bx, di                               
  01cc  13cf             adc cx, di                               
  01ce  13d7             adc dx, di                               
  01d0  be0800           mov si, 8                                
  01d3  0af6             or dh, dh                                
  01d5  7535             jne 0x20c                                
  01d7  8af2             mov dh, dl                               
  01d9  8ad5             mov dl, ch                               
  01db  8ae9             mov ch, cl                               
  01dd  8acf             mov cl, bh                               
  01df  8afb             mov bh, bl                               
  01e1  8adc             mov bl, ah                               
  01e3  8ae0             mov ah, al                               
  01e5  8a46fe           mov al, byte ptr [bp - 2]                
  01e8  c646fe00         mov byte ptr [bp - 2], 0                 
  01ec  836efc08         sub word ptr [bp - 4], 8                 
  01f0  4e               dec si                                   
  01f1  7de0             jge 0x1d3                                
  01f3  c746fc01c0       mov word ptr [bp - 4], 0xc001            
  01f8  c646fb00         mov byte ptr [bp - 5], 0                 
  01fc  eb30             jmp 0x22e                                
  01fe  ff4efc           dec word ptr [bp - 4]                    
  0201  d066fe           shl byte ptr [bp - 2], 1                 
  0204  d1d0             rcl ax, 1                                
  0206  d1d3             rcl bx, 1                                
  0208  d1d1             rcl cx, 1                                
  020a  13d2             adc dx, dx                               
  020c  79f0             jns 0x1fe                                
  020e  d066fe           shl byte ptr [bp - 2], 1                 
  0211  13c7             adc ax, di                               
  0213  13df             adc bx, di                               
  0215  13cf             adc cx, di                               
  0217  13d7             adc dx, di                               
  0219  7305             jae 0x220                                
  021b  d1da             rcr dx, 1                                
  021d  ff46fc           inc word ptr [bp - 4]                    
  0220  817efc0140       cmp word ptr [bp - 4], 0x4001            
  0225  7d22             jge 0x249                                
  0227  817efc01c0       cmp word ptr [bp - 4], 0xc001            
  022c  7e24             jle 0x252                                
  022e  fc               cld                                      
  022f  8b7e04           mov di, word ptr [bp + 4]                
  0232  ab               stosw word ptr es:[di], ax               
  0233  93               xchg bx, ax                              
  0234  ab               stosw word ptr es:[di], ax               
  0235  91               xchg cx, ax                              
  0236  ab               stosw word ptr es:[di], ax               
  0237  92               xchg dx, ax                              
  0238  ab               stosw word ptr es:[di], ax               
  0239  8b46fc           mov ax, word ptr [bp - 4]                
  023c  ab               stosw word ptr es:[di], ax               
  023d  8a46fb           mov al, byte ptr [bp - 5]                
  0240  aa               stosb byte ptr es:[di], al               
  0241  5f               pop di                                   
  0242  5e               pop si                                   
  0243  8be5             mov sp, bp                               
  0245  5d               pop bp                                   
  0246  c20600           ret 6                                    
  0249  b508             mov ch, 8                                
  024b  c746fc0140       mov word ptr [bp - 4], 0x4001            
  0250  eb07             jmp 0x259                                
  0252  b510             mov ch, 0x10                             
  0254  c746fc01c0       mov word ptr [bp - 4], 0xc001            
  0259  e8b824           call 0x2714                              
  025c  c646fb00         mov byte ptr [bp - 5], 0                 
  0260  2bc0             sub ax, ax                               
  0262  8bd8             mov bx, ax                               
  0264  8bc8             mov cx, ax                               
  0266  99               cdq                                      
  0267  ebc5             jmp 0x22e                                
  0269  b80140           mov ax, 0x4001                           
  026c  8b7e04           mov di, word ptr [bp + 4]                
  026f  8a4efa           mov cl, byte ptr [bp - 6]                
  0272  e8c80b           call 0xe3d                               
  0275  58               pop ax                                   
  0276  e9d400           jmp 0x34d                                
  0279  57               push di                                  
  027a  8bdf             mov bx, di                               
  027c  8b7e04           mov di, word ptr [bp + 4]                
  027f  e890fd           call 0x12                                
  0282  5f               pop di                                   
  0283  72f0             jb 0x275                                 
  0285  817d0801c0       cmp word ptr [di + 8], 0xc001            
  028a  7e18             jle 0x2a4                                
  028c  ebdb             jmp 0x269                                
  028e  56               push si                                  
  028f  bbffff           mov bx, 0xffff                           
  0292  8bf7             mov si, di                               
  0294  8b7e04           mov di, word ptr [bp + 4]                
  0297  e878fd           call 0x12                                
  029a  5e               pop si                                   
  029b  72d8             jb 0x275                                 
  029d  817c0801c0       cmp word ptr [si + 8], 0xc001            
  02a2  7fc5             jg 0x269                                 
  02a4  8b7e04           mov di, word ptr [bp + 4]                
  02a7  e8a90b           call 0xe53                               
  02aa  ebc9             jmp 0x275                                
  02ac  b508             mov ch, 8                                
  02ae  e86324           call 0x2714                              
  02b1  ebb6             jmp 0x269                                
  02b3  b510             mov ch, 0x10                             
  02b5  e85c24           call 0x2714                              
  02b8  b801c0           mov ax, 0xc001                           
  02bb  ebaf             jmp 0x26c                                

res_1704_02bd:  ; ENTRY
  02bd  55               push bp                                  
  02be  8bec             mov bp, sp                               
  02c0  56               push si                                  
  02c1  57               push di                                  
  02c2  fc               cld                                      
  02c3  8b7608           mov si, word ptr [bp + 8]                
  02c6  8b7e06           mov di, word ptr [bp + 6]                
  02c9  8a4c0a           mov cl, byte ptr [si + 0xa]              
  02cc  324d0a           xor cl, byte ptr [di + 0xa]              
  02cf  51               push cx                                  
  02d0  ba0140           mov dx, 0x4001                           
  02d3  8b5d08           mov bx, word ptr [di + 8]                
  02d6  b901c0           mov cx, 0xc001                           
  02d9  8b4408           mov ax, word ptr [si + 8]                
  02dc  3bc2             cmp ax, dx                               
  02de  7d99             jge 0x279                                
  02e0  3bda             cmp bx, dx                               
  02e2  7daa             jge 0x28e                                
  02e4  3bc1             cmp ax, cx                               
  02e6  7ed0             jle 0x2b8                                
  02e8  3bd9             cmp bx, cx                               
  02ea  7ecc             jle 0x2b8                                
  02ec  03c3             add ax, bx                               
  02ee  48               dec ax                                   
  02ef  3d0140           cmp ax, 0x4001                           
  02f2  7db8             jge 0x2ac                                
  02f4  40               inc ax                                   
  02f5  3d01c0           cmp ax, 0xc001                           
  02f8  7eb9             jle 0x2b3                                
  02fa  ff7406           push word ptr [si + 6]                   
  02fd  ff7404           push word ptr [si + 4]                   
  0300  ff7402           push word ptr [si + 2]                   
  0303  ff34             push word ptr [si]                       
  0305  83ec04           sub sp, 4                                
  0308  ff7506           push word ptr [di + 6]                   
  030b  ff7504           push word ptr [di + 4]                   
  030e  ff7502           push word ptr [di + 2]                   
  0311  ff35             push word ptr [di]                       
  0313  97               xchg di, ax                              
  0314  8bec             mov bp, sp                               
  0316  e83a00           call 0x353                               
  0319  83c414           add sp, 0x14                             
  031c  0bd2             or dx, dx                                
  031e  780b             js 0x32b                                 
  0320  4f               dec di                                   
  0321  d1e6             shl si, 1                                
  0323  d1d0             rcl ax, 1                                
  0325  d1d3             rcl bx, 1                                
  0327  d1d1             rcl cx, 1                                
  0329  d1d2             rcl dx, 1                                
  032b  d1e6             shl si, 1                                
  032d  150000           adc ax, 0                                
  0330  730b             jae 0x33d                                
  0332  13d8             adc bx, ax                               
  0334  13c8             adc cx, ax                               
  0336  13d0             adc dx, ax                               
  0338  7303             jae 0x33d                                
  033a  d1da             rcr dx, 1                                
  033c  47               inc di                                   
  033d  8bf7             mov si, di                               
  033f  8b7e1e           mov di, word ptr [bp + 0x1e]             
  0342  ab               stosw word ptr es:[di], ax               
  0343  93               xchg bx, ax                              
  0344  ab               stosw word ptr es:[di], ax               
  0345  91               xchg cx, ax                              
  0346  ab               stosw word ptr es:[di], ax               
  0347  92               xchg dx, ax                              
  0348  ab               stosw word ptr es:[di], ax               
  0349  96               xchg si, ax                              
  034a  ab               stosw word ptr es:[di], ax               
  034b  58               pop ax                                   
  034c  aa               stosb byte ptr es:[di], al               
  034d  5f               pop di                                   
  034e  5e               pop si                                   
  034f  5d               pop bp                                   
  0350  c20600           ret 6                                    

res_1704_0353:  ; ENTRY
  0353  57               push di                                  
  0354  2bff             sub di, di                               
  0356  8bcf             mov cx, di                               
  0358  8bf7             mov si, di                               
  035a  f6460f80         test byte ptr [bp + 0xf], 0x80           
  035e  7406             je 0x366                                 
  0360  8b4e00           mov cx, word ptr [bp]                    
  0363  8b7602           mov si, word ptr [bp + 2]                
  0366  f6460380         test byte ptr [bp + 3], 0x80             
  036a  740f             je 0x37b                                 
  036c  034e0c           add cx, word ptr [bp + 0xc]              
  036f  13760e           adc si, word ptr [bp + 0xe]              
  0372  13ff             adc di, di                               
  0374  f6460f80         test byte ptr [bp + 0xf], 0x80           
  0378  7401             je 0x37b                                 
  037a  4f               dec di                                   
  037b  2bdb             sub bx, bx                               
  037d  8b460c           mov ax, word ptr [bp + 0xc]              
  0380  f76604           mul word ptr [bp + 4]                    
  0383  03c8             add cx, ax                               
  0385  13f2             adc si, dx                               
  0387  83d700           adc di, 0                                
  038a  8b4610           mov ax, word ptr [bp + 0x10]             
  038d  0bc0             or ax, ax                                
  038f  7417             je 0x3a8                                 
  0391  f76600           mul word ptr [bp]                        
  0394  03c8             add cx, ax                               
  0396  13f2             adc si, dx                               
  0398  83d700           adc di, 0                                
  039b  8b4610           mov ax, word ptr [bp + 0x10]             
  039e  f76602           mul word ptr [bp + 2]                    
  03a1  03f0             add si, ax                               
  03a3  13fa             adc di, dx                               
  03a5  83d300           adc bx, 0                                
  03a8  8b460c           mov ax, word ptr [bp + 0xc]              
  03ab  f76606           mul word ptr [bp + 6]                    
  03ae  03f0             add si, ax                               
  03b0  13fa             adc di, dx                               
  03b2  83d300           adc bx, 0                                
  03b5  8b460e           mov ax, word ptr [bp + 0xe]              
  03b8  f76604           mul word ptr [bp + 4]                    
  03bb  03f0             add si, ax                               
  03bd  13fa             adc di, dx                               
  03bf  83d300           adc bx, 0                                
  03c2  8b4612           mov ax, word ptr [bp + 0x12]             
  03c5  0bc0             or ax, ax                                
  03c7  740a             je 0x3d3                                 
  03c9  f76600           mul word ptr [bp]                        
  03cc  03f0             add si, ax                               
  03ce  13fa             adc di, dx                               
  03d0  83d300           adc bx, 0                                
  03d3  2bc9             sub cx, cx                               
  03d5  56               push si                                  
  03d6  8bf1             mov si, cx                               
  03d8  8b460e           mov ax, word ptr [bp + 0xe]              
  03db  f76606           mul word ptr [bp + 6]                    
  03de  03f8             add di, ax                               
  03e0  13da             adc bx, dx                               
  03e2  83d100           adc cx, 0                                
  03e5  8b4610           mov ax, word ptr [bp + 0x10]             
  03e8  0bc0             or ax, ax                                
  03ea  7417             je 0x403                                 
  03ec  f76604           mul word ptr [bp + 4]                    
  03ef  03f8             add di, ax                               
  03f1  13da             adc bx, dx                               
  03f3  83d100           adc cx, 0                                
  03f6  8b4610           mov ax, word ptr [bp + 0x10]             
  03f9  f76606           mul word ptr [bp + 6]                    
  03fc  03d8             add bx, ax                               
  03fe  13ca             adc cx, dx                               
  0400  83d600           adc si, 0                                
  0403  8b4612           mov ax, word ptr [bp + 0x12]             
  0406  0bc0             or ax, ax                                
  0408  7424             je 0x42e                                 
  040a  f76602           mul word ptr [bp + 2]                    
  040d  03f8             add di, ax                               
  040f  13da             adc bx, dx                               
  0411  83d100           adc cx, 0                                
  0414  83d600           adc si, 0                                
  0417  8b4612           mov ax, word ptr [bp + 0x12]             
  041a  f76604           mul word ptr [bp + 4]                    
  041d  03d8             add bx, ax                               
  041f  13ca             adc cx, dx                               
  0421  83d600           adc si, 0                                
  0424  8b4612           mov ax, word ptr [bp + 0x12]             
  0427  f76606           mul word ptr [bp + 6]                    
  042a  03c8             add cx, ax                               
  042c  13f2             adc si, dx                               
  042e  8bd6             mov dx, si                               
  0430  97               xchg di, ax                              
  0431  5e               pop si                                   
  0432  5f               pop di                                   
  0433  c3               ret                                      
  0434  8bf7             mov si, di                               
  0436  8b7e04           mov di, word ptr [bp + 4]                
  0439  90               nop                                      
  043a  e8d5fb           call 0x12                                
  043d  722f             jb 0x46e                                 
  043f  817f080140       cmp word ptr [bx + 8], 0x4001            
  0444  7c30             jl 0x476                                 
  0446  e80a0a           call 0xe53                               
  0449  eb23             jmp 0x46e                                
  044b  8bf3             mov si, bx                               
  044d  bbffff           mov bx, 0xffff                           
  0450  8b7e04           mov di, word ptr [bp + 4]                
  0453  90               nop                                      
  0454  e8bbfb           call 0x12                                
  0457  7215             jb 0x46e                                 
  0459  eb05             jmp 0x460                                
  045b  b504             mov ch, 4                                
  045d  e8b422           call 0x2714                              
  0460  b80140           mov ax, 0x4001                           
  0463  8a4ef9           mov cl, byte ptr [bp - 7]                
  0466  90               nop                                      
  0467  8b7e04           mov di, word ptr [bp + 4]                
  046a  90               nop                                      
  046b  e8cf09           call 0xe3d                               
  046e  e96103           jmp 0x7d2                                
  0471  b510             mov ch, 0x10                             
  0473  e89e22           call 0x2714                              
  0476  b801c0           mov ax, 0xc001                           
  0479  ebe8             jmp 0x463                                
  047b  b508             mov ch, 8                                
  047d  ebde             jmp 0x45d                                
  047f  8b46ee           mov ax, word ptr [bp - 0x12]             
  0482  0b46ec           or ax, word ptr [bp - 0x14]              
  0485  755f             jne 0x4e6                                
  0487  e95403           jmp 0x7de                                

res_1704_048a:  ; ENTRY
  048a  55               push bp                                  
  048b  8bec             mov bp, sp                               
  048d  56               push si                                  
  048e  57               push di                                  
  048f  8d66f4           lea sp, [bp - 0xc]                       
  0492  8b7e06           mov di, word ptr [bp + 6]                
  0495  8b5e08           mov bx, word ptr [bp + 8]                
  0498  fc               cld                                      
  0499  8a470a           mov al, byte ptr [bx + 0xa]              
  049c  32450a           xor al, byte ptr [di + 0xa]              
  049f  8846f9           mov byte ptr [bp - 7], al                
  04a2  8b7508           mov si, word ptr [di + 8]                
  04a5  8b4708           mov ax, word ptr [bx + 8]                
  04a8  81fe0140         cmp si, 0x4001                           
  04ac  7d86             jge 0x434                                
  04ae  3d0140           cmp ax, 0x4001                           
  04b1  7d98             jge 0x44b                                
  04b3  81fe01c0         cmp si, 0xc001                           
  04b7  7ea2             jle 0x45b                                
  04b9  3d01c0           cmp ax, 0xc001                           
  04bc  7eb8             jle 0x476                                
  04be  2bc6             sub ax, si                               
  04c0  3d0140           cmp ax, 0x4001                           
  04c3  7db6             jge 0x47b                                
  04c5  3d01c0           cmp ax, 0xc001                           
  04c8  7ea7             jle 0x471                                
  04ca  8b5506           mov dx, word ptr [di + 6]                
  04cd  52               push dx                                  
  04ce  8b4d04           mov cx, word ptr [di + 4]                
  04d1  51               push cx                                  
  04d2  ff7502           push word ptr [di + 2]                   
  04d5  ff35             push word ptr [di]                       
  04d7  8946fa           mov word ptr [bp - 6], ax                
  04da  c646f800         mov byte ptr [bp - 8], 0                 
  04de  8b7f06           mov di, word ptr [bx + 6]                
  04e1  8b7704           mov si, word ptr [bx + 4]                
  04e4  e399             jcxz 0x47f                               
  04e6  91               xchg cx, ax                              
  04e7  8b4f02           mov cx, word ptr [bx + 2]                
  04ea  8b1f             mov bx, word ptr [bx]                    
  04ec  3bfa             cmp di, dx                               
  04ee  727a             jb 0x56a                                 
  04f0  c646f801         mov byte ptr [bp - 8], 1                 
  04f4  2b5eec           sub bx, word ptr [bp - 0x14]             
  04f7  1b4eee           sbb cx, word ptr [bp - 0x12]             
  04fa  1bf0             sbb si, ax                               
  04fc  1bfa             sbb di, dx                               
  04fe  736a             jae 0x56a                                
  0500  2bc0             sub ax, ax                               
  0502  99               cdq                                      
  0503  2bc6             sub ax, si                               
  0505  1bd7             sbb dx, di                               
  0507  f776f2           div word ptr [bp - 0xe]                  
  050a  8946f6           mov word ptr [bp - 0xa], ax              
  050d  f766f2           mul word ptr [bp - 0xe]                  
  0510  03f0             add si, ax                               
  0512  13fa             adc di, dx                               
  0514  8b46f0           mov ax, word ptr [bp - 0x10]             
  0517  f766f6           mul word ptr [bp - 0xa]                  
  051a  03c8             add cx, ax                               
  051c  13f2             adc si, dx                               
  051e  83d700           adc di, 0                                
  0521  8b46ee           mov ax, word ptr [bp - 0x12]             
  0524  f766f6           mul word ptr [bp - 0xa]                  
  0527  03d8             add bx, ax                               
  0529  13ca             adc cx, dx                               
  052b  83d600           adc si, 0                                
  052e  83d700           adc di, 0                                
  0531  8b46ec           mov ax, word ptr [bp - 0x14]             
  0534  f766f6           mul word ptr [bp - 0xa]                  
  0537  f75ef6           neg word ptr [bp - 0xa]                  
  053a  805ef800         sbb byte ptr [bp - 8], 0                 
  053e  03da             add bx, dx                               
  0540  83d100           adc cx, 0                                
  0543  83d600           adc si, 0                                
  0546  83d700           adc di, 0                                
  0549  97               xchg di, ax                              
  054a  7c19             jl 0x565                                 
  054c  3b76f2           cmp si, word ptr [bp - 0xe]              
  054f  7216             jb 0x567                                 
  0551  8346f601         add word ptr [bp - 0xa], 1               
  0555  8056f800         adc byte ptr [bp - 8], 0                 
  0559  2b7eec           sub di, word ptr [bp - 0x14]             
  055c  1b5eee           sbb bx, word ptr [bp - 0x12]             
  055f  1b4ef0           sbb cx, word ptr [bp - 0x10]             
  0562  1b76f2           sbb si, word ptr [bp - 0xe]              
  0565  7c66             jl 0x5cd                                 
  0567  e9cc00           jmp 0x636                                
  056a  8bc6             mov ax, si                               
  056c  8bd7             mov dx, di                               
  056e  f776f2           div word ptr [bp - 0xe]                  
  0571  8946f6           mov word ptr [bp - 0xa], ax              
  0574  f766f2           mul word ptr [bp - 0xe]                  
  0577  2bf0             sub si, ax                               
  0579  1bfa             sbb di, dx                               
  057b  8b46f0           mov ax, word ptr [bp - 0x10]             
  057e  f766f6           mul word ptr [bp - 0xa]                  
  0581  2bc8             sub cx, ax                               
  0583  1bf2             sbb si, dx                               
  0585  83df00           sbb di, 0                                
  0588  8b46ee           mov ax, word ptr [bp - 0x12]             
  058b  f766f6           mul word ptr [bp - 0xa]                  
  058e  2bd8             sub bx, ax                               
  0590  1bca             sbb cx, dx                               
  0592  83de00           sbb si, 0                                
  0595  83df00           sbb di, 0                                
  0598  8b46ec           mov ax, word ptr [bp - 0x14]             
  059b  f766f6           mul word ptr [bp - 0xa]                  
  059e  f7d8             neg ax                                   
  05a0  1bda             sbb bx, dx                               
  05a2  83d900           sbb cx, 0                                
  05a5  83de00           sbb si, 0                                
  05a8  83df00           sbb di, 0                                
  05ab  97               xchg di, ax                              
  05ac  7db9             jge 0x567                                
  05ae  8bd6             mov dx, si                               
  05b0  f7da             neg dx                                   
  05b2  3b56f2           cmp dx, word ptr [bp - 0xe]              
  05b5  7216             jb 0x5cd                                 
  05b7  836ef601         sub word ptr [bp - 0xa], 1               
  05bb  805ef800         sbb byte ptr [bp - 8], 0                 
  05bf  037eec           add di, word ptr [bp - 0x14]             
  05c2  135eee           adc bx, word ptr [bp - 0x12]             
  05c5  134ef0           adc cx, word ptr [bp - 0x10]             
  05c8  1376f2           adc si, word ptr [bp - 0xe]              
  05cb  7d69             jge 0x636                                
  05cd  2bc0             sub ax, ax                               
  05cf  99               cdq                                      
  05d0  2bc1             sub ax, cx                               
  05d2  1bd6             sbb dx, si                               
  05d4  f776f2           div word ptr [bp - 0xe]                  
  05d7  8946f4           mov word ptr [bp - 0xc], ax              
  05da  f766f2           mul word ptr [bp - 0xe]                  
  05dd  03c8             add cx, ax                               
  05df  13f2             adc si, dx                               
  05e1  8b46f0           mov ax, word ptr [bp - 0x10]             
  05e4  f766f4           mul word ptr [bp - 0xc]                  
  05e7  03d8             add bx, ax                               
  05e9  13ca             adc cx, dx                               
  05eb  83d600           adc si, 0                                
  05ee  8b46ee           mov ax, word ptr [bp - 0x12]             
  05f1  f766f4           mul word ptr [bp - 0xc]                  
  05f4  03f8             add di, ax                               
  05f6  13da             adc bx, dx                               
  05f8  83d100           adc cx, 0                                
  05fb  83d600           adc si, 0                                
  05fe  8b46ec           mov ax, word ptr [bp - 0x14]             
  0601  f766f4           mul word ptr [bp - 0xc]                  
  0604  2bc0             sub ax, ax                               
  0606  f75ef4           neg word ptr [bp - 0xc]                  
  0609  1946f6           sbb word ptr [bp - 0xa], ax              
  060c  1846f8           sbb byte ptr [bp - 8], al                
  060f  03fa             add di, dx                               
  0611  13d8             adc bx, ax                               
  0613  13c8             adc cx, ax                               
  0615  13f0             adc si, ax                               
  0617  7c7b             jl 0x694                                 
  0619  3b4ef2           cmp cx, word ptr [bp - 0xe]              
  061c  7215             jb 0x633                                 
  061e  8346f401         add word ptr [bp - 0xc], 1               
  0622  1146f6           adc word ptr [bp - 0xa], ax              
  0625  1046f8           adc byte ptr [bp - 8], al                
  0628  2b7eee           sub di, word ptr [bp - 0x12]             
  062b  1b5ef0           sbb bx, word ptr [bp - 0x10]             
  062e  1b4ef2           sbb cx, word ptr [bp - 0xe]              
  0631  7c61             jl 0x694                                 
  0633  e9b300           jmp 0x6e9                                
  0636  8bc1             mov ax, cx                               
  0638  8bd6             mov dx, si                               
  063a  f776f2           div word ptr [bp - 0xe]                  
  063d  8946f4           mov word ptr [bp - 0xc], ax              
  0640  f766f2           mul word ptr [bp - 0xe]                  
  0643  2bc8             sub cx, ax                               
  0645  1bf2             sbb si, dx                               
  0647  8b46f0           mov ax, word ptr [bp - 0x10]             
  064a  f766f4           mul word ptr [bp - 0xc]                  
  064d  2bd8             sub bx, ax                               
  064f  1bca             sbb cx, dx                               
  0651  83de00           sbb si, 0                                
  0654  8b46ee           mov ax, word ptr [bp - 0x12]             
  0657  f766f4           mul word ptr [bp - 0xc]                  
  065a  2bf8             sub di, ax                               
  065c  1bda             sbb bx, dx                               
  065e  83d900           sbb cx, 0                                
  0661  83de00           sbb si, 0                                
  0664  8b46ec           mov ax, word ptr [bp - 0x14]             
  0667  f766f4           mul word ptr [bp - 0xc]                  
  066a  2bc0             sub ax, ax                               
  066c  2bfa             sub di, dx                               
  066e  1bd8             sbb bx, ax                               
  0670  1bc8             sbb cx, ax                               
  0672  1bf0             sbb si, ax                               
  0674  7d73             jge 0x6e9                                
  0676  8bd1             mov dx, cx                               
  0678  f7da             neg dx                                   
  067a  3b56f2           cmp dx, word ptr [bp - 0xe]              
  067d  7215             jb 0x694                                 
  067f  836ef401         sub word ptr [bp - 0xc], 1               
  0683  1946f6           sbb word ptr [bp - 0xa], ax              
  0686  1846f8           sbb byte ptr [bp - 8], al                
  0689  037eee           add di, word ptr [bp - 0x12]             
  068c  135ef0           adc bx, word ptr [bp - 0x10]             
  068f  134ef2           adc cx, word ptr [bp - 0xe]              
  0692  7d55             jge 0x6e9                                
  0694  2bc0             sub ax, ax                               
  0696  99               cdq                                      
  0697  2bc3             sub ax, bx                               
  0699  1bd1             sbb dx, cx                               
  069b  f776f2           div word ptr [bp - 0xe]                  
  069e  8bf0             mov si, ax                               
  06a0  f766f2           mul word ptr [bp - 0xe]                  
  06a3  03d8             add bx, ax                               
  06a5  13ca             adc cx, dx                               
  06a7  8b46f0           mov ax, word ptr [bp - 0x10]             
  06aa  f7e6             mul si                                   
  06ac  03f8             add di, ax                               
  06ae  13da             adc bx, dx                               
  06b0  83d100           adc cx, 0                                
  06b3  8b46ee           mov ax, word ptr [bp - 0x12]             
  06b6  f7e6             mul si                                   
  06b8  2bc0             sub ax, ax                               
  06ba  f7de             neg si                                   
  06bc  1946f4           sbb word ptr [bp - 0xc], ax              
  06bf  1946f6           sbb word ptr [bp - 0xa], ax              
  06c2  1846f8           sbb byte ptr [bp - 8], al                
  06c5  03fa             add di, dx                               
  06c7  13d8             adc bx, ax                               
  06c9  13c8             adc cx, ax                               
  06cb  7c64             jl 0x731                                 
  06cd  3b5ef2           cmp bx, word ptr [bp - 0xe]              
  06d0  7214             jb 0x6e6                                 
  06d2  83c601           add si, 1                                
  06d5  1146f4           adc word ptr [bp - 0xc], ax              
  06d8  1146f6           adc word ptr [bp - 0xa], ax              
  06db  1046f8           adc byte ptr [bp - 8], al                
  06de  2b7ef0           sub di, word ptr [bp - 0x10]             
  06e1  1b5ef2           sbb bx, word ptr [bp - 0xe]              
  06e4  7c4b             jl 0x731                                 
  06e6  e98a00           jmp 0x773                                
  06e9  8bc3             mov ax, bx                               
  06eb  8bd1             mov dx, cx                               
  06ed  f776f2           div word ptr [bp - 0xe]                  
  06f0  8bf0             mov si, ax                               
  06f2  f766f2           mul word ptr [bp - 0xe]                  
  06f5  2bd8             sub bx, ax                               
  06f7  1bca             sbb cx, dx                               
  06f9  8b46f0           mov ax, word ptr [bp - 0x10]             
  06fc  f7e6             mul si                                   
  06fe  2bf8             sub di, ax                               
  0700  1bda             sbb bx, dx                               
  0702  83d900           sbb cx, 0                                
  0705  8b46ee           mov ax, word ptr [bp - 0x12]             
  0708  f7e6             mul si                                   
  070a  2bc0             sub ax, ax                               
  070c  2bfa             sub di, dx                               
  070e  1bd8             sbb bx, ax                               
  0710  1bc8             sbb cx, ax                               
  0712  7d5f             jge 0x773                                
  0714  8bd3             mov dx, bx                               
  0716  f7da             neg dx                                   
  0718  3b56f2           cmp dx, word ptr [bp - 0xe]              
  071b  7214             jb 0x731                                 
  071d  83ee01           sub si, 1                                
  0720  1946f4           sbb word ptr [bp - 0xc], ax              
  0723  1946f6           sbb word ptr [bp - 0xa], ax              
  0726  1846f8           sbb byte ptr [bp - 8], al                
  0729  037ef0           add di, word ptr [bp - 0x10]             
  072c  135ef2           adc bx, word ptr [bp - 0xe]              
  072f  7d42             jge 0x773                                
  0731  8b46f0           mov ax, word ptr [bp - 0x10]             
  0734  d1e8             shr ax, 1                                
  0736  f7d8             neg ax                                   
  0738  8b4ef2           mov cx, word ptr [bp - 0xe]              
  073b  03c1             add ax, cx                               
  073d  2bd2             sub dx, dx                               
  073f  2bc7             sub ax, di                               
  0741  1bd3             sbb dx, bx                               
  0743  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0746  8b7ef6           mov di, word ptr [bp - 0xa]              
  0749  3bd1             cmp dx, cx                               
  074b  731b             jae 0x768                                
  074d  f7f1             div cx                                   
  074f  2bd1             sub dx, cx                               
  0751  f7da             neg dx                                   
  0753  f7d8             neg ax                                   
  0755  8a56f8           mov dl, byte ptr [bp - 8]                
  0758  83de00           sbb si, 0                                
  075b  7334             jae 0x791                                
  075d  83db00           sbb bx, 0                                
  0760  83df00           sbb di, 0                                
  0763  80da00           sbb dl, 0                                
  0766  eb29             jmp 0x791                                
  0768  2bc0             sub ax, ax                               
  076a  99               cdq                                      
  076b  f9               stc                                      
  076c  ebe7             jmp 0x755                                
  076e  2bc0             sub ax, ax                               
  0770  99               cdq                                      
  0771  eb1b             jmp 0x78e                                
  0773  8b46f0           mov ax, word ptr [bp - 0x10]             
  0776  d1e8             shr ax, 1                                
  0778  f7d8             neg ax                                   
  077a  99               cdq                                      
  077b  03c7             add ax, di                               
  077d  13d3             adc dx, bx                               
  077f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0782  8b7ef6           mov di, word ptr [bp - 0xa]              
  0785  8b4ef2           mov cx, word ptr [bp - 0xe]              
  0788  3bd1             cmp dx, cx                               
  078a  73e2             jae 0x76e                                
  078c  f7f1             div cx                                   
  078e  8a56f8           mov dl, byte ptr [bp - 8]                
  0791  d0ea             shr dl, 1                                
  0793  730d             jae 0x7a2                                
  0795  d1df             rcr di, 1                                
  0797  d1db             rcr bx, 1                                
  0799  d1de             rcr si, 1                                
  079b  d1d8             rcr ax, 1                                
  079d  d0de             rcr dh, 1                                
  079f  ff46fa           inc word ptr [bp - 6]                    
  07a2  d1e9             shr cx, 1                                
  07a4  2aee             sub ch, dh                               
  07a6  8b4efa           mov cx, word ptr [bp - 6]                
  07a9  150000           adc ax, 0                                
  07ac  730b             jae 0x7b9                                
  07ae  13f0             adc si, ax                               
  07b0  13d8             adc bx, ax                               
  07b2  13f8             adc di, ax                               
  07b4  7303             jae 0x7b9                                
  07b6  d1df             rcr di, 1                                
  07b8  41               inc cx                                   
  07b9  81f90140         cmp cx, 0x4001                           
  07bd  7d1c             jge 0x7db                                
  07bf  8bd7             mov dx, di                               
  07c1  8b7e04           mov di, word ptr [bp + 4]                
  07c4  fc               cld                                      
  07c5  ab               stosw word ptr es:[di], ax               
  07c6  96               xchg si, ax                              
  07c7  ab               stosw word ptr es:[di], ax               
  07c8  93               xchg bx, ax                              
  07c9  ab               stosw word ptr es:[di], ax               
  07ca  92               xchg dx, ax                              
  07cb  ab               stosw word ptr es:[di], ax               
  07cc  91               xchg cx, ax                              
  07cd  ab               stosw word ptr es:[di], ax               
  07ce  8a46f9           mov al, byte ptr [bp - 7]                
  07d1  aa               stosb byte ptr es:[di], al               
  07d2  8d66fc           lea sp, [bp - 4]                         
  07d5  5f               pop di                                   
  07d6  5e               pop si                                   
  07d7  5d               pop bp                                   
  07d8  c20600           ret 6                                    
  07db  e982fc           jmp 0x460                                
  07de  8bca             mov cx, dx                               
  07e0  8bd7             mov dx, di                               
  07e2  96               xchg si, ax                              
  07e3  3bd1             cmp dx, cx                               
  07e5  7206             jb 0x7ed                                 
  07e7  2bd1             sub dx, cx                               
  07e9  c646f801         mov byte ptr [bp - 8], 1                 
  07ed  f7f1             div cx                                   
  07ef  97               xchg di, ax                              
  07f0  8b4702           mov ax, word ptr [bx + 2]                
  07f3  f7f1             div cx                                   
  07f5  8b1f             mov bx, word ptr [bx]                    
  07f7  93               xchg bx, ax                              
  07f8  f7f1             div cx                                   
  07fa  96               xchg si, ax                              
  07fb  2bc0             sub ax, ax                               
  07fd  f7f1             div cx                                   
  07ff  eb8d             jmp 0x78e                                
  0801  8b360c00         mov si, word ptr [0xc]                   

res_1704_0805:  ; ENTRY
  0805  55               push bp                                  
  0806  8bec             mov bp, sp                               
  0808  56               push si                                  
  0809  57               push di                                  
  080a  8b4408           mov ax, word ptr [si + 8]                
  080d  3d01c0           cmp ax, 0xc001                           
  0810  7e29             jle 0x83b                                
  0812  3d0140           cmp ax, 0x4001                           
  0815  7d28             jge 0x83f                                
  0817  807c0a00         cmp byte ptr [si + 0xa], 0               
  081b  752c             jne 0x849                                
  081d  e84b06           call 0xe6b                               
  0820  e83700           call 0x85a                               
  0823  8b3e0c00         mov di, word ptr [0xc]                   
  0827  56               push si                                  
  0828  57               push di                                  
  0829  56               push si                                  
  082a  e85dfc           call 0x48a                               
  082d  57               push di                                  
  082e  56               push si                                  
  082f  56               push si                                  
  0830  e8c0f8           call 0xf3                                
  0833  ff4c08           dec word ptr [si + 8]                    
  0836  83060c000c       add word ptr [0xc], 0xc                  
  083b  5f               pop di                                   
  083c  5e               pop si                                   
  083d  5d               pop bp                                   
  083e  c3               ret                                      
  083f  bbffff           mov bx, 0xffff                           
  0842  8bfe             mov di, si                               
  0844  e8cbf7           call 0x12                                
  0847  ebf2             jmp 0x83b                                
  0849  b501             mov ch, 1                                
  084b  e8c61e           call 0x2714                              
  084e  8bfe             mov di, si                               
  0850  e8d405           call 0xe27                               
  0853  c745080140       mov word ptr [di + 8], 0x4001            
  0858  ebe1             jmp 0x83b                                

res_1704_085a:  ; ENTRY
  085a  56               push si                                  
  085b  57               push di                                  
  085c  8b3e0c00         mov di, word ptr [0xc]                   
  0860  8b5d08           mov bx, word ptr [di + 8]                
  0863  8b5506           mov dx, word ptr [di + 6]                
  0866  8b4504           mov ax, word ptr [di + 4]                
  0869  8b4d02           mov cx, word ptr [di + 2]                
  086c  d1fb             sar bx, 1                                
  086e  7307             jae 0x877                                
  0870  43               inc bx                                   
  0871  d1ea             shr dx, 1                                
  0873  d1d8             rcr ax, 1                                
  0875  d1d9             rcr cx, 1                                
  0877  83fafe           cmp dx, -2                               
  087a  731d             jae 0x899                                
  087c  53               push bx                                  
  087d  51               push cx                                  
  087e  8bca             mov cx, dx                               
  0880  8bd8             mov bx, ax                               
  0882  8bf2             mov si, dx                               
  0884  f9               stc                                      
  0885  d1de             rcr si, 1                                
  0887  f7f6             div si                                   
  0889  4e               dec si                                   
  088a  3bf0             cmp si, ax                               
  088c  7612             jbe 0x8a0                                
  088e  46               inc si                                   
  088f  03f0             add si, ax                               
  0891  d1de             rcr si, 1                                
  0893  8bd1             mov dx, cx                               
  0895  8bc3             mov ax, bx                               
  0897  ebee             jmp 0x887                                
  0899  f9               stc                                      
  089a  d1da             rcr dx, 1                                
  089c  d1d8             rcr ax, 1                                
  089e  eb17             jmp 0x8b7                                
  08a0  46               inc si                                   
  08a1  3bf0             cmp si, ax                               
  08a3  7301             jae 0x8a6                                
  08a5  96               xchg si, ax                              
  08a6  59               pop cx                                   
  08a7  5b               pop bx                                   
  08a8  91               xchg cx, ax                              
  08a9  f7f6             div si                                   
  08ab  2bd2             sub dx, dx                               
  08ad  03f1             add si, cx                               
  08af  d1de             rcr si, 1                                
  08b1  d1d8             rcr ax, 1                                
  08b3  13c2             adc ax, dx                               
  08b5  13d6             adc dx, si                               
  08b7  fc               cld                                      
  08b8  2bc9             sub cx, cx                               
  08ba  91               xchg cx, ax                              
  08bb  ab               stosw word ptr es:[di], ax               
  08bc  ab               stosw word ptr es:[di], ax               
  08bd  91               xchg cx, ax                              
  08be  ab               stosw word ptr es:[di], ax               
  08bf  92               xchg dx, ax                              
  08c0  ab               stosw word ptr es:[di], ax               
  08c1  93               xchg bx, ax                              
  08c2  ab               stosw word ptr es:[di], ax               
  08c3  b000             mov al, 0                                
  08c5  aa               stosb byte ptr es:[di], al               
  08c6  5f               pop di                                   
  08c7  5e               pop si                                   
  08c8  c3               ret                                      
  08c9  0002             add byte ptr [bp + si], al               
  08cb  40               inc ax                                   
  08cc  42               inc dx                                   
  08cd  0103             add word ptr [bp + di], ax               
  08cf  41               inc cx                                   
  08d0  43               inc bx                                   

res_1704_08d1:  ; ENTRY
  08d1  55               push bp                                  
  08d2  8bec             mov bp, sp                               
  08d4  ff750a           push word ptr [di + 0xa]                 
  08d7  8d66fa           lea sp, [bp - 6]                         
  08da  56               push si                                  
  08db  57               push di                                  
  08dc  8b05             mov ax, word ptr [di]                    
  08de  8b5d02           mov bx, word ptr [di + 2]                
  08e1  8b4d04           mov cx, word ptr [di + 4]                
  08e4  8b5506           mov dx, word ptr [di + 6]                
  08e7  c746fc0000       mov word ptr [bp - 4], 0                 
  08ec  8b7d08           mov di, word ptr [di + 8]                
  08ef  2b7c08           sub di, word ptr [si + 8]                
  08f2  7d17             jge 0x90b                                
  08f4  eb51             jmp 0x947                                
  08f6  47               inc di                                   
  08f7  eb3d             jmp 0x936                                
  08f9  4f               dec di                                   
  08fa  7cfa             jl 0x8f6                                 
  08fc  d166fc           shl word ptr [bp - 4], 1                 
  08ff  d1e0             shl ax, 1                                
  0901  d1d3             rcl bx, 1                                
  0903  d1d1             rcl cx, 1                                
  0905  13d2             adc dx, dx                               
  0907  721b             jb 0x924                                 
  0909  79ee             jns 0x8f9                                
  090b  3b5406           cmp dx, word ptr [si + 6]                
  090e  7714             ja 0x924                                 
  0910  72e7             jb 0x8f9                                 
  0912  3b4c04           cmp cx, word ptr [si + 4]                
  0915  770d             ja 0x924                                 
  0917  72e0             jb 0x8f9                                 
  0919  3b5c02           cmp bx, word ptr [si + 2]                
  091c  7706             ja 0x924                                 
  091e  72d9             jb 0x8f9                                 
  0920  3b04             cmp ax, word ptr [si]                    
  0922  72d5             jb 0x8f9                                 
  0924  ff46fc           inc word ptr [bp - 4]                    
  0927  2b04             sub ax, word ptr [si]                    
  0929  1b5c02           sbb bx, word ptr [si + 2]                
  092c  1b4c04           sbb cx, word ptr [si + 4]                
  092f  1b5406           sbb dx, word ptr [si + 6]                
  0932  0bff             or di, di                                
  0934  7fc3             jg 0x8f9                                 
  0936  0bd2             or dx, dx                                
  0938  780d             js 0x947                                 
  093a  7443             je 0x97f                                 
  093c  4f               dec di                                   
  093d  d1e0             shl ax, 1                                
  093f  d1d3             rcl bx, 1                                
  0941  d1d1             rcl cx, 1                                
  0943  13d2             adc dx, dx                               
  0945  79f5             jns 0x93c                                
  0947  037c08           add di, word ptr [si + 8]                
  094a  57               push di                                  
  094b  8b7ef6           mov di, word ptr [bp - 0xa]              
  094e  ab               stosw word ptr es:[di], ax               
  094f  93               xchg bx, ax                              
  0950  ab               stosw word ptr es:[di], ax               
  0951  91               xchg cx, ax                              
  0952  ab               stosw word ptr es:[di], ax               
  0953  92               xchg dx, ax                              
  0954  ab               stosw word ptr es:[di], ax               
  0955  58               pop ax                                   
  0956  ab               stosw word ptr es:[di], ax               
  0957  8a46fe           mov al, byte ptr [bp - 2]                
  095a  aa               stosb byte ptr es:[di], al               
  095b  80260100b8       and byte ptr [1], 0xb8                   
  0960  bf0700           mov di, 7                                
  0963  8b46fc           mov ax, word ptr [bp - 4]                
  0966  807efe01         cmp byte ptr [bp - 2], 1                 
  096a  7502             jne 0x96e                                
  096c  f7d8             neg ax                                   
  096e  23f8             and di, ax                               
  0970  2e8a95c908       mov dl, byte ptr cs:[di + 0x8c9]         
  0975  08160100         or byte ptr [1], dl                      
  0979  5f               pop di                                   
  097a  5e               pop si                                   
  097b  8be5             mov sp, bp                               
  097d  5d               pop bp                                   
  097e  c3               ret                                      
  097f  87d1             xchg cx, dx                              
  0981  87cb             xchg bx, cx                              
  0983  93               xchg bx, ax                              
  0984  83ef10           sub di, 0x10                             
  0987  0bd2             or dx, dx                                
  0989  75ab             jne 0x936                                
  098b  87d1             xchg cx, dx                              
  098d  87cb             xchg bx, cx                              
  098f  83ef10           sub di, 0x10                             
  0992  0bd2             or dx, dx                                
  0994  75a0             jne 0x936                                
  0996  87d1             xchg cx, dx                              
  0998  83ef10           sub di, 0x10                             
  099b  0bd2             or dx, dx                                
  099d  7597             jne 0x936                                
  099f  bf01c0           mov di, 0xc001                           
  09a2  2bd2             sub dx, dx                               
  09a4  2bc9             sub cx, cx                               
  09a6  2bdb             sub bx, bx                               
  09a8  2bc0             sub ax, ax                               
  09aa  eb9e             jmp 0x94a                                
  09ac  8b5406           mov dx, word ptr [si + 6]                
  09af  80e67f           and dh, 0x7f                             
  09b2  0b14             or dx, word ptr [si]                     
  09b4  0b5402           or dx, word ptr [si + 2]                 
  09b7  0b5404           or dx, word ptr [si + 4]                 
  09ba  7433             je 0x9ef                                 
  09bc  b501             mov ch, 1                                
  09be  e8531d           call 0x2714                              
  09c1  b80045           mov ax, 0x4500                           
  09c4  e99000           jmp 0xa57                                
  09c7  8b5506           mov dx, word ptr [di + 6]                
  09ca  80e67f           and dh, 0x7f                             
  09cd  0b15             or dx, word ptr [di]                     
  09cf  0b5502           or dx, word ptr [di + 2]                 
  09d2  0b5504           or dx, word ptr [di + 4]                 
  09d5  75e5             jne 0x9bc                                
  09d7  eb1c             jmp 0x9f5                                

res_1704_09d9:  ; ENTRY
  09d9  55               push bp                                  
  09da  8bec             mov bp, sp                               
  09dc  56               push si                                  
  09dd  57               push di                                  
  09de  8b7606           mov si, word ptr [bp + 6]                
  09e1  8b7e04           mov di, word ptr [bp + 4]                
  09e4  8b4408           mov ax, word ptr [si + 8]                
  09e7  8b5d08           mov bx, word ptr [di + 8]                
  09ea  3d0140           cmp ax, 0x4001                           
  09ed  7dbd             jge 0x9ac                                
  09ef  81fb0140         cmp bx, 0x4001                           
  09f3  7dd2             jge 0x9c7                                
  09f5  8bd0             mov dx, ax                               
  09f7  3bc3             cmp ax, bx                               
  09f9  7f02             jg 0x9fd                                 
  09fb  8bd3             mov dx, bx                               
  09fd  81fa01c0         cmp dx, 0xc001                           
  0a01  7e3b             jle 0xa3e                                
  0a03  8a4c0a           mov cl, byte ptr [si + 0xa]              
  0a06  3a4d0a           cmp cl, byte ptr [di + 0xa]              
  0a09  7c49             jl 0xa54                                 
  0a0b  7f3d             jg 0xa4a                                 
  0a0d  3bc3             cmp ax, bx                               
  0a0f  7c34             jl 0xa45                                 
  0a11  7f3c             jg 0xa4f                                 
  0a13  8b4406           mov ax, word ptr [si + 6]                
  0a16  3b4506           cmp ax, word ptr [di + 6]                
  0a19  7528             jne 0xa43                                
  0a1b  b503             mov ch, 3                                
  0a1d  222e0300         and ch, byte ptr [3]                     
  0a21  743e             je 0xa61                                 
  0a23  8b4404           mov ax, word ptr [si + 4]                
  0a26  3b4504           cmp ax, word ptr [di + 4]                
  0a29  7518             jne 0xa43                                
  0a2b  8b4402           mov ax, word ptr [si + 2]                
  0a2e  3b4502           cmp ax, word ptr [di + 2]                
  0a31  7510             jne 0xa43                                
  0a33  80fd02           cmp ch, 2                                
  0a36  744b             je 0xa83                                 
  0a38  8b04             mov ax, word ptr [si]                    
  0a3a  3b05             cmp ax, word ptr [di]                    
  0a3c  7505             jne 0xa43                                
  0a3e  b80040           mov ax, 0x4000                           
  0a41  eb14             jmp 0xa57                                
  0a43  770a             ja 0xa4f                                 
  0a45  80f900           cmp cl, 0                                
  0a48  750a             jne 0xa54                                
  0a4a  b80001           mov ax, 0x100                            
  0a4d  eb08             jmp 0xa57                                
  0a4f  80f900           cmp cl, 0                                
  0a52  75f6             jne 0xa4a                                
  0a54  b80000           mov ax, 0                                
  0a57  88260100         mov byte ptr [1], ah                     
  0a5b  5f               pop di                                   
  0a5c  5e               pop si                                   
  0a5d  5d               pop bp                                   
  0a5e  c20400           ret 4                                    
  0a61  8b1c             mov bx, word ptr [si]                    
  0a63  2b1d             sub bx, word ptr [di]                    
  0a65  8b5c02           mov bx, word ptr [si + 2]                
  0a68  1b5d02           sbb bx, word ptr [di + 2]                
  0a6b  8b5c04           mov bx, word ptr [si + 4]                
  0a6e  1b5d04           sbb bx, word ptr [di + 4]                
  0a71  7709             ja 0xa7c                                 
  0a73  f7db             neg bx                                   
  0a75  83e380           and bx, 0xff80                           
  0a78  74c4             je 0xa3e                                 
  0a7a  ebc9             jmp 0xa45                                
  0a7c  83e380           and bx, 0xff80                           
  0a7f  74bd             je 0xa3e                                 
  0a81  ebcc             jmp 0xa4f                                
  0a83  8b1c             mov bx, word ptr [si]                    
  0a85  2b1d             sub bx, word ptr [di]                    
  0a87  7709             ja 0xa92                                 
  0a89  f7db             neg bx                                   
  0a8b  80e7fc           and bh, 0xfc                             
  0a8e  74ae             je 0xa3e                                 
  0a90  ebb3             jmp 0xa45                                
  0a92  80e7fc           and bh, 0xfc                             
  0a95  74a7             je 0xa3e                                 
  0a97  ebb6             jmp 0xa4f                                
res_1704_0a99:  ; case
  0a99  b80040           mov ax, 0x4000                           
  0a9c  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0aa1  7e13             jle 0xab6                                
  0aa3  817c080140       cmp word ptr [si + 8], 0x4001            
  0aa8  7d11             jge 0xabb                                
  0aaa  b80001           mov ax, 0x100                            
  0aad  807c0a01         cmp byte ptr [si + 0xa], 1               
  0ab1  7403             je 0xab6                                 
  0ab3  b80000           mov ax, 0                                
  0ab6  88260100         mov byte ptr [1], ah                     
  0aba  c3               ret                                      
  0abb  8b5406           mov dx, word ptr [si + 6]                
  0abe  80e67f           and dh, 0x7f                             
  0ac1  0b14             or dx, word ptr [si]                     
  0ac3  0b5402           or dx, word ptr [si + 2]                 
  0ac6  0b5404           or dx, word ptr [si + 4]                 
  0ac9  74df             je 0xaaa                                 
  0acb  b501             mov ch, 1                                
  0acd  e8441c           call 0x2714                              
  0ad0  b80045           mov ax, 0x4500                           
  0ad3  ebe1             jmp 0xab6                                
res_1704_0ad5:  ; case
  0ad5  b80040           mov ax, 0x4000                           
  0ad8  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0add  7e13             jle 0xaf2                                
  0adf  817c080140       cmp word ptr [si + 8], 0x4001            
  0ae4  7d11             jge 0xaf7                                
  0ae6  b80004           mov ax, 0x400                            
  0ae9  807c0a01         cmp byte ptr [si + 0xa], 1               
  0aed  7503             jne 0xaf2                                
  0aef  0d0002           or ax, 0x200                             
  0af2  88260100         mov byte ptr [1], ah                     
  0af6  c3               ret                                      
  0af7  b80005           mov ax, 0x500                            
  0afa  8b5406           mov dx, word ptr [si + 6]                
  0afd  80e67f           and dh, 0x7f                             
  0b00  0b14             or dx, word ptr [si]                     
  0b02  0b5402           or dx, word ptr [si + 2]                 
  0b05  0b5404           or dx, word ptr [si + 4]                 
  0b08  74df             je 0xae9                                 
  0b0a  b80001           mov ax, 0x100                            
  0b0d  ebda             jmp 0xae9                                
res_1704_0b0f:  ; case
  0b0f  8b4404           mov ax, word ptr [si + 4]                
  0b12  8b5406           mov dx, word ptr [si + 6]                
  0b15  8b5c08           mov bx, word ptr [si + 8]                
  0b18  8a4c0a           mov cl, byte ptr [si + 0xa]              
  0b1b  833c00           cmp word ptr [si], 0                     
  0b1e  750f             jne 0xb2f                                
  0b20  837c0200         cmp word ptr [si + 2], 0                 
  0b24  7509             jne 0xb2f                                
  0b26  a87f             test al, 0x7f                            
  0b28  7505             jne 0xb2f                                
  0b2a  f6c401           test ah, 1                               
  0b2d  740f             je 0xb3e                                 
  0b2f  02c0             add al, al                               
  0b31  80d400           adc ah, 0                                
  0b34  83d200           adc dx, 0                                
  0b37  7305             jae 0xb3e                                
  0b39  d1da             rcr dx, 1                                
  0b3b  d1d8             rcr ax, 1                                
  0b3d  43               inc bx                                   
  0b3e  83c37e           add bx, 0x7e                             
  0b41  7e32             jle 0xb75                                
  0b43  81fbff00         cmp bx, 0xff                             
  0b47  7d17             jge 0xb60                                
  0b49  d1e2             shl dx, 1                                
  0b4b  d0e9             shr cl, 1                                
  0b4d  d0db             rcr bl, 1                                
  0b4f  d1da             rcr dx, 1                                
  0b51  8ac4             mov al, ah                               
  0b53  8ae2             mov ah, dl                               
  0b55  8ad6             mov dl, dh                               
  0b57  8af3             mov dh, bl                               
  0b59  ab               stosw word ptr es:[di], ax               
  0b5a  92               xchg dx, ax                              
  0b5b  ab               stosw word ptr es:[di], ax               
  0b5c  83ef04           sub di, 4                                
  0b5f  c3               ret                                      
  0b60  817c080140       cmp word ptr [si + 8], 0x4001            
  0b65  7d09             jge 0xb70                                
  0b67  b508             mov ch, 8                                
  0b69  e8a81b           call 0x2714                              
  0b6c  2bd2             sub dx, dx                               
  0b6e  2bc0             sub ax, ax                               
  0b70  bbff00           mov bx, 0xff                             
  0b73  ebd4             jmp 0xb49                                
  0b75  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0b7a  7e05             jle 0xb81                                
  0b7c  b510             mov ch, 0x10                             
  0b7e  e8931b           call 0x2714                              
  0b81  2bdb             sub bx, bx                               
  0b83  8bd3             mov dx, bx                               
  0b85  8bc3             mov ax, bx                               
  0b87  ebc0             jmp 0xb49                                
res_1704_0b89:  ; case
  0b89  268b04           mov ax, word ptr es:[si]                 
  0b8c  268b5402         mov dx, word ptr es:[si + 2]             
  0b90  56               push si                                  
  0b91  2bf6             sub si, si                               
  0b93  d1e2             shl dx, 1                                
  0b95  d1d6             rcl si, 1                                
  0b97  2bdb             sub bx, bx                               
  0b99  02de             add bl, dh                               
  0b9b  742e             je 0xbcb                                 
  0b9d  80feff           cmp dh, 0xff                             
  0ba0  7424             je 0xbc6                                 
  0ba2  83eb7e           sub bx, 0x7e                             
  0ba5  f9               stc                                      
  0ba6  d0da             rcr dl, 1                                
  0ba8  8af2             mov dh, dl                               
  0baa  8ad4             mov dl, ah                               
  0bac  8ae8             mov ch, al                               
  0bae  b100             mov cl, 0                                
  0bb0  2bc0             sub ax, ax                               
  0bb2  8905             mov word ptr [di], ax                    
  0bb4  894502           mov word ptr [di + 2], ax                
  0bb7  894d04           mov word ptr [di + 4], cx                
  0bba  895506           mov word ptr [di + 6], dx                
  0bbd  895d08           mov word ptr [di + 8], bx                
  0bc0  96               xchg si, ax                              
  0bc1  88450a           mov byte ptr [di + 0xa], al              
  0bc4  5e               pop si                                   
  0bc5  c3               ret                                      
  0bc6  bb0140           mov bx, 0x4001                           
  0bc9  ebda             jmp 0xba5                                
  0bcb  8bca             mov cx, dx                               
  0bcd  0bc8             or cx, ax                                
  0bcf  740e             je 0xbdf                                 
  0bd1  83eb7e           sub bx, 0x7e                             
  0bd4  d0ea             shr dl, 1                                
  0bd6  03c0             add ax, ax                               
  0bd8  12d2             adc dl, dl                               
  0bda  78cc             js 0xba8                                 
  0bdc  4b               dec bx                                   
  0bdd  ebf7             jmp 0xbd6                                
  0bdf  bb01c0           mov bx, 0xc001                           
  0be2  ebc4             jmp 0xba8                                
  0be4  8ec1             mov es, cx                               
res_1704_0be6:  ; case
  0be6  57               push di                                  
  0be7  8b4401           mov ax, word ptr [si + 1]                
  0bea  8b7c03           mov di, word ptr [si + 3]                
  0bed  8b4c05           mov cx, word ptr [si + 5]                
  0bf0  8a5407           mov dl, byte ptr [si + 7]                
  0bf3  8b5c08           mov bx, word ptr [si + 8]                
  0bf6  b603             mov dh, 3                                
  0bf8  22f0             and dh, al                               
  0bfa  0a34             or dh, byte ptr [si]                     
  0bfc  7504             jne 0xc02                                
  0bfe  a808             test al, 8                               
  0c00  7411             je 0xc13                                 
  0c02  050400           add ax, 4                                
  0c05  83d700           adc di, 0                                
  0c08  83d100           adc cx, 0                                
  0c0b  80d200           adc dl, 0                                
  0c0e  7303             jae 0xc13                                
  0c10  d0da             rcr dl, 1                                
  0c12  43               inc bx                                   
  0c13  81c3fe03         add bx, 0x3fe                            
  0c17  7e42             jle 0xc5b                                
  0c19  81fbff07         cmp bx, 0x7ff                            
  0c1d  7d49             jge 0xc68                                
  0c1f  24f8             and al, 0xf8                             
  0c21  d0e2             shl dl, 1                                
  0c23  d1eb             shr bx, 1                                
  0c25  d0da             rcr dl, 1                                
  0c27  0ac7             or al, bh                                
  0c29  8af3             mov dh, bl                               
  0c2b  8bdf             mov bx, di                               
  0c2d  d1ef             shr di, 1                                
  0c2f  d1d8             rcr ax, 1                                
  0c31  d1da             rcr dx, 1                                
  0c33  d1d9             rcr cx, 1                                
  0c35  d1db             rcr bx, 1                                
  0c37  d1ef             shr di, 1                                
  0c39  d1d8             rcr ax, 1                                
  0c3b  d1da             rcr dx, 1                                
  0c3d  d1d9             rcr cx, 1                                
  0c3f  d1db             rcr bx, 1                                
  0c41  0a440a           or al, byte ptr [si + 0xa]               
  0c44  d1ef             shr di, 1                                
  0c46  d1d8             rcr ax, 1                                
  0c48  d1da             rcr dx, 1                                
  0c4a  d1d9             rcr cx, 1                                
  0c4c  d1db             rcr bx, 1                                
  0c4e  5f               pop di                                   
  0c4f  fc               cld                                      
  0c50  ab               stosw word ptr es:[di], ax               
  0c51  93               xchg bx, ax                              
  0c52  ab               stosw word ptr es:[di], ax               
  0c53  91               xchg cx, ax                              
  0c54  ab               stosw word ptr es:[di], ax               
  0c55  92               xchg dx, ax                              
  0c56  ab               stosw word ptr es:[di], ax               
  0c57  83ef08           sub di, 8                                
  0c5a  c3               ret                                      
  0c5b  2bd2             sub dx, dx                               
  0c5d  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0c62  7e13             jle 0xc77                                
  0c64  b510             mov ch, 0x10                             
  0c66  eb0c             jmp 0xc74                                
  0c68  817c080140       cmp word ptr [si + 8], 0x4001            
  0c6d  7d15             jge 0xc84                                
  0c6f  bae0ff           mov dx, 0xffe0                           
  0c72  b508             mov ch, 8                                
  0c74  e89d1a           call 0x2714                              
  0c77  0a540a           or dl, byte ptr [si + 0xa]               
  0c7a  d1ca             ror dx, 1                                
  0c7c  2bc9             sub cx, cx                               
  0c7e  8bd9             mov bx, cx                               
  0c80  8bc1             mov ax, cx                               
  0c82  ebca             jmp 0xc4e                                
  0c84  bbff07           mov bx, 0x7ff                            
  0c87  eb96             jmp 0xc1f                                
  0c89  8bf3             mov si, bx                               
  0c8b  8ec0             mov es, ax                               
res_1704_0c8d:  ; case
  0c8d  268b5406         mov dx, word ptr es:[si + 6]             
  0c91  b90500           mov cx, 5                                
  0c94  d1e2             shl dx, 1                                
  0c96  d0d5             rcl ch, 1                                
  0c98  886d0a           mov byte ptr [di + 0xa], ch              
  0c9b  d3ea             shr dx, cl                               
  0c9d  7463             je 0xd02                                 
  0c9f  81faff07         cmp dx, 0x7ff                            
  0ca3  7443             je 0xce8                                 
  0ca5  b310             mov bl, 0x10                             
  0ca7  81eafe03         sub dx, 0x3fe                            
  0cab  895508           mov word ptr [di + 8], dx                
  0cae  268b5405         mov dx, word ptr es:[si + 5]             
  0cb2  80e60f           and dh, 0xf                              
  0cb5  0af3             or dh, bl                                
  0cb7  268b4c03         mov cx, word ptr es:[si + 3]             
  0cbb  268b5c01         mov bx, word ptr es:[si + 1]             
  0cbf  268a24           mov ah, byte ptr es:[si]                 
  0cc2  b000             mov al, 0                                
  0cc4  d1e0             shl ax, 1                                
  0cc6  d1d3             rcl bx, 1                                
  0cc8  d1d1             rcl cx, 1                                
  0cca  d1d2             rcl dx, 1                                
  0ccc  d1e0             shl ax, 1                                
  0cce  d1d3             rcl bx, 1                                
  0cd0  d1d1             rcl cx, 1                                
  0cd2  d1d2             rcl dx, 1                                
  0cd4  d1e0             shl ax, 1                                
  0cd6  d1d3             rcl bx, 1                                
  0cd8  d1d1             rcl cx, 1                                
  0cda  d1d2             rcl dx, 1                                
  0cdc  8905             mov word ptr [di], ax                    
  0cde  895d02           mov word ptr [di + 2], bx                
  0ce1  894d04           mov word ptr [di + 4], cx                
  0ce4  895506           mov word ptr [di + 6], dx                
  0ce7  c3               ret                                      
  0ce8  bb0f00           mov bx, 0xf                              
  0ceb  26225c06         and bl, byte ptr es:[si + 6]             
  0cef  260b5c04         or bx, word ptr es:[si + 4]              
  0cf3  260b5c02         or bx, word ptr es:[si + 2]              
  0cf7  260b1c           or bx, word ptr es:[si]                  
  0cfa  ba0140           mov dx, 0x4001                           
  0cfd  80cb10           or bl, 0x10                              
  0d00  eba9             jmp 0xcab                                
  0d02  bb0f00           mov bx, 0xf                              
  0d05  26225c06         and bl, byte ptr es:[si + 6]             
  0d09  260b5c04         or bx, word ptr es:[si + 4]              
  0d0d  260b5c02         or bx, word ptr es:[si + 2]              
  0d11  260b1c           or bx, word ptr es:[si]                  
  0d14  7505             jne 0xd1b                                
  0d16  ba01c0           mov dx, 0xc001                           
  0d19  eb90             jmp 0xcab                                
  0d1b  268b5405         mov dx, word ptr es:[si + 5]             
  0d1f  80e60f           and dh, 0xf                              
  0d22  268b4c03         mov cx, word ptr es:[si + 3]             
  0d26  268b5c01         mov bx, word ptr es:[si + 1]             
  0d2a  268a24           mov ah, byte ptr es:[si]                 
  0d2d  b004             mov al, 4                                
  0d2f  fec8             dec al                                   
  0d31  d0e4             shl ah, 1                                
  0d33  d1d3             rcl bx, 1                                
  0d35  d1d1             rcl cx, 1                                
  0d37  13d2             adc dx, dx                               
  0d39  79f4             jns 0xd2f                                
  0d3b  50               push ax                                  
  0d3c  b400             mov ah, 0                                
  0d3e  2dfe04           sub ax, 0x4fe                            
  0d41  894508           mov word ptr [di + 8], ax                
  0d44  58               pop ax                                   
  0d45  b000             mov al, 0                                
  0d47  eb93             jmp 0xcdc                                
  0d49  8ec1             mov es, cx                               

res_1704_0d4b:  ; ENTRY
  0d4b  fc               cld                                      
  0d4c  a5               movsw word ptr es:[di], word ptr [si]    
  0d4d  a5               movsw word ptr es:[di], word ptr [si]    
  0d4e  a5               movsw word ptr es:[di], word ptr [si]    
  0d4f  a5               movsw word ptr es:[di], word ptr [si]    
  0d50  ad               lodsw ax, word ptr [si]                  
  0d51  8a0c             mov cl, byte ptr [si]                    
  0d53  3d0140           cmp ax, 0x4001                           
  0d56  7d13             jge 0xd6b                                
  0d58  05fe3f           add ax, 0x3ffe                           
  0d5b  7c13             jl 0xd70                                 
  0d5d  d1e0             shl ax, 1                                
  0d5f  d0e9             shr cl, 1                                
  0d61  d1d8             rcr ax, 1                                
  0d63  ab               stosw word ptr es:[di], ax               
  0d64  83ef0a           sub di, 0xa                              
  0d67  83ee0a           sub si, 0xa                              
  0d6a  c3               ret                                      
  0d6b  b8ff7f           mov ax, 0x7fff                           
  0d6e  ebed             jmp 0xd5d                                
  0d70  2bc0             sub ax, ax                               
  0d72  ebe9             jmp 0xd5d                                
  0d74  8bf3             mov si, bx                               
  0d76  8ec0             mov es, ax                               

res_1704_0d78:  ; ENTRY
  0d78  56               push si                                  
  0d79  8cd9             mov cx, ds                               
  0d7b  8cc2             mov dx, es                               
  0d7d  8ec1             mov es, cx                               
  0d7f  8eda             mov ds, dx                               
  0d81  fd               std                                      
  0d82  8d7408           lea si, [si + 8]                         
  0d85  8d7d0a           lea di, [di + 0xa]                       
  0d88  ad               lodsw ax, word ptr [si]                  
  0d89  93               xchg bx, ax                              
  0d8a  2bc0             sub ax, ax                               
  0d8c  d1e3             shl bx, 1                                
  0d8e  d1d0             rcl ax, 1                                
  0d90  aa               stosb byte ptr es:[di], al               
  0d91  4f               dec di                                   
  0d92  d1eb             shr bx, 1                                
  0d94  7413             je 0xda9                                 
  0d96  81ebfe3f         sub bx, 0x3ffe                           
  0d9a  93               xchg bx, ax                              
  0d9b  ab               stosw word ptr es:[di], ax               
  0d9c  a5               movsw word ptr es:[di], word ptr [si]    
  0d9d  a5               movsw word ptr es:[di], word ptr [si]    
  0d9e  a5               movsw word ptr es:[di], word ptr [si]    
  0d9f  a5               movsw word ptr es:[di], word ptr [si]    
  0da0  fc               cld                                      
  0da1  8ec2             mov es, dx                               
  0da3  8ed9             mov ds, cx                               
  0da5  47               inc di                                   
  0da6  47               inc di                                   
  0da7  5e               pop si                                   
  0da8  c3               ret                                      
  0da9  b801c0           mov ax, 0xc001                           
  0dac  ab               stosw word ptr es:[di], ax               
  0dad  2bc0             sub ax, ax                               
  0daf  ab               stosw word ptr es:[di], ax               
  0db0  ab               stosw word ptr es:[di], ax               
  0db1  ab               stosw word ptr es:[di], ax               
  0db2  ab               stosw word ptr es:[di], ax               
  0db3  ebeb             jmp 0xda0                                
  0db5  0000             add byte ptr [bx + si], al               
  0db7  0000             add byte ptr [bx + si], al               
  0db9  0000             add byte ptr [bx + si], al               
  0dbb  00800100         add byte ptr [bx + si + 1], al           
  0dbf  0000             add byte ptr [bx + si], al               
res_1704_0dc1:  ; case
  0dc1  b8b50d           mov ax, 0xdb5                            
  0dc4  eb64             jmp 0xe2a                                
  0dc6  fe8a1bcd         dec byte ptr [bp + si - 0x32e5]          
  0dca  4b               dec bx                                   
  0dcb  789a             js 0xd67                                 
  0dcd  d402             aam 2                                    
  0dcf  0000             add byte ptr [bx + si], al               
  0dd1  00               db 00                                    resync
res_1704_0dd2:  ; case
  0dd2  b8c60d           mov ax, 0xdc6                            
  0dd5  eb53             jmp 0xe2a                                
  0dd7  bbf017           mov bx, 0x17f0                           
  0dda  5c               pop sp                                   
  0ddb  293b             sub word ptr [bp + di], di               
  0ddd  aa               stosb byte ptr es:[di], al               
  0dde  b80100           mov ax, 1                                
  0de1  0000             add byte ptr [bx + si], al               
res_1704_0de3:  ; case
  0de3  b8d70d           mov ax, 0xdd7                            
  0de6  eb42             jmp 0xe2a                                
  0de8  35c268           xor ax, 0x68c2                           
  0deb  21a2da0f         and word ptr [bp + si + 0xfda], sp       
  0def  c9               leave                                    
  0df0  0200             add al, byte ptr [bx + si]               
  0df2  0000             add byte ptr [bx + si], al               
res_1704_0df4:  ; case
  0df4  b8e80d           mov ax, 0xde8                            
  0df7  eb31             jmp 0xe2a                                
  0df9  99               cdq                                      
  0dfa  f7cffb84         test di, 0x84fb                          
  0dfe  9a209affff       lcall 0xffff, 0x9a20                     -> ffff:9a20
  0e03  0000             add byte ptr [bx + si], al               
res_1704_0e05:  ; case
  0e05  b8f90d           mov ax, 0xdf9                            
  0e08  eb20             jmp 0xe2a                                
  0e0a  ac               lodsb al, byte ptr [si]                  
  0e0b  79cf             jns 0xddc                                
  0e0d  d1f7             sal di, 1                                
  0e0f  17               pop ss                                   
  0e10  72b1             jb 0xdc3                                 
  0e12  0000             add byte ptr [bx + si], al               
  0e14  0000             add byte ptr [bx + si], al               
res_1704_0e16:  ; case
  0e16  b80a0e           mov ax, 0xe0a                            
  0e19  eb0f             jmp 0xe2a                                
  0e1b  0000             add byte ptr [bx + si], al               
  0e1d  0000             add byte ptr [bx + si], al               
  0e1f  0000             add byte ptr [bx + si], al               
  0e21  0000             add byte ptr [bx + si], al               
  0e23  01c0             add ax, ax                               
  0e25  0000             add byte ptr [bx + si], al               
res_1704_0e27:  ; case
  0e27  b81b0e           mov ax, 0xe1b                            
  0e2a  1e               push ds                                  
  0e2b  8cc9             mov cx, cs                               
  0e2d  8ed9             mov ds, cx                               
  0e2f  96               xchg si, ax                              
  0e30  fc               cld                                      
  0e31  b90500           mov cx, 5                                
  0e34  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0e36  a4               movsb byte ptr es:[di], byte ptr [si]    
  0e37  83ef0b           sub di, 0xb                              
  0e3a  96               xchg si, ax                              
  0e3b  1f               pop ds                                   
  0e3c  c3               ret                                      

res_1704_0e3d:  ; ENTRY
  0e3d  fc               cld                                      
  0e3e  57               push di                                  
  0e3f  50               push ax                                  
  0e40  3d01c0           cmp ax, 0xc001                           
  0e43  b80000           mov ax, 0                                
  0e46  ab               stosw word ptr es:[di], ax               
  0e47  ab               stosw word ptr es:[di], ax               
  0e48  ab               stosw word ptr es:[di], ax               
  0e49  d1d8             rcr ax, 1                                
  0e4b  ab               stosw word ptr es:[di], ax               
  0e4c  58               pop ax                                   
  0e4d  ab               stosw word ptr es:[di], ax               
  0e4e  8ac1             mov al, cl                               
  0e50  aa               stosb byte ptr es:[di], al               
  0e51  5f               pop di                                   
  0e52  c3               ret                                      

res_1704_0e53:  ; ENTRY
  0e53  b501             mov ch, 1                                
  0e55  e8bc18           call 0x2714                              
  0e58  57               push di                                  
  0e59  2bc0             sub ax, ax                               
  0e5b  fc               cld                                      
  0e5c  ab               stosw word ptr es:[di], ax               
  0e5d  ab               stosw word ptr es:[di], ax               
  0e5e  ab               stosw word ptr es:[di], ax               
  0e5f  b4c0             mov ah, 0xc0                             
  0e61  ab               stosw word ptr es:[di], ax               
  0e62  b80140           mov ax, 0x4001                           
  0e65  ab               stosw word ptr es:[di], ax               
  0e66  b001             mov al, 1                                
  0e68  aa               stosb byte ptr es:[di], al               
  0e69  5f               pop di                                   
  0e6a  c3               ret                                      

res_1704_0e6b:  ; ENTRY
  0e6b  57               push di                                  
  0e6c  06               push es                                  
  0e6d  8cd7             mov di, ss                               
  0e6f  8ec7             mov es, di                               
  0e71  832e0c000c       sub word ptr [0xc], 0xc                  
  0e76  8b3e0c00         mov di, word ptr [0xc]                   
  0e7a  fc               cld                                      
  0e7b  b90500           mov cx, 5                                
  0e7e  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0e80  a4               movsb byte ptr es:[di], byte ptr [si]    
  0e81  07               pop es                                   
  0e82  5f               pop di                                   
  0e83  83ee0b           sub si, 0xb                              
  0e86  c3               ret                                      

res_1704_0e87:  ; ENTRY
  0e87  56               push si                                  
  0e88  57               push di                                  
  0e89  832e0c000c       sub word ptr [0xc], 0xc                  
  0e8e  8b3e0c00         mov di, word ptr [0xc]                   
  0e92  1e               push ds                                  
  0e93  06               push es                                  
  0e94  1e               push ds                                  
  0e95  07               pop es                                   
  0e96  0e               push cs                                  
  0e97  1f               pop ds                                   
  0e98  fc               cld                                      
  0e99  b90500           mov cx, 5                                
  0e9c  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0e9e  a4               movsb byte ptr es:[di], byte ptr [si]    
  0e9f  07               pop es                                   
  0ea0  1f               pop ds                                   
  0ea1  5f               pop di                                   
  0ea2  5e               pop si                                   
  0ea3  c3               ret                                      

res_1704_0ea4:  ; ENTRY
  0ea4  56               push si                                  
  0ea5  8b360c00         mov si, word ptr [0xc]                   
  0ea9  fc               cld                                      
  0eaa  b90500           mov cx, 5                                
  0ead  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0eaf  a4               movsb byte ptr es:[di], byte ptr [si]    
  0eb0  46               inc si                                   
  0eb1  89360c00         mov word ptr [0xc], si                   
  0eb5  83ef0b           sub di, 0xb                              
  0eb8  5e               pop si                                   
  0eb9  c3               ret                                      

res_1704_0eba:  ; ENTRY
  0eba  56               push si                                  
  0ebb  57               push di                                  
  0ebc  06               push es                                  
  0ebd  8b360c00         mov si, word ptr [0xc]                   
  0ec1  8d7cf4           lea di, [si - 0xc]                       
  0ec4  893e0c00         mov word ptr [0xc], di                   
  0ec8  fc               cld                                      
  0ec9  8cd1             mov cx, ss                               
  0ecb  8ec1             mov es, cx                               
  0ecd  b90500           mov cx, 5                                
  0ed0  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0ed2  a4               movsb byte ptr es:[di], byte ptr [si]    
  0ed3  07               pop es                                   
  0ed4  5f               pop di                                   
  0ed5  5e               pop si                                   
  0ed6  c3               ret                                      

res_1704_0ed7:  ; ENTRY
  0ed7  56               push si                                  
  0ed8  57               push di                                  
  0ed9  8b360c00         mov si, word ptr [0xc]                   
  0edd  8bfe             mov di, si                               
  0edf  fc               cld                                      
  0ee0  06               push es                                  
  0ee1  8cd1             mov cx, ss                               
  0ee3  8ec1             mov es, cx                               
  0ee5  b90500           mov cx, 5                                
  0ee8  ad               lodsw ax, word ptr [si]                  
  0ee9  87450c           xchg word ptr [di + 0xc], ax             
  0eec  ab               stosw word ptr es:[di], ax               
  0eed  e2f9             loop 0xee8                               
  0eef  ac               lodsb al, byte ptr [si]                  
  0ef0  86450c           xchg byte ptr [di + 0xc], al             
  0ef3  aa               stosb byte ptr es:[di], al               
  0ef4  07               pop es                                   
  0ef5  5f               pop di                                   
  0ef6  5e               pop si                                   
  0ef7  c3               ret                                      
res_1704_0ef8:  ; case
  0ef8  268b04           mov ax, word ptr es:[si]                 
  0efb  2bc9             sub cx, cx                               
  0efd  99               cdq                                      
  0efe  33c2             xor ax, dx                               
  0f00  2bc2             sub ax, dx                               
  0f02  7432             je 0xf36                                 
  0f04  80e201           and dl, 1                                
  0f07  8bd9             mov bx, cx                               
  0f09  91               xchg cx, ax                              
  0f0a  d1e0             shl ax, 1                                
  0f0c  d1d8             rcr ax, 1                                
  0f0e  43               inc bx                                   
  0f0f  d1e9             shr cx, 1                                
  0f11  d1d8             rcr ax, 1                                
  0f13  e307             jcxz 0xf1c                               
  0f15  43               inc bx                                   
  0f16  d1e9             shr cx, 1                                
  0f18  75f2             jne 0xf0c                                
  0f1a  d1d8             rcr ax, 1                                
  0f1c  88550a           mov byte ptr [di + 0xa], dl              
  0f1f  895d08           mov word ptr [di + 8], bx                
  0f22  894506           mov word ptr [di + 6], ax                
  0f25  894d04           mov word ptr [di + 4], cx                
  0f28  894d02           mov word ptr [di + 2], cx                
  0f2b  890d             mov word ptr [di], cx                    
  0f2d  c3               ret                                      
  0f2e  2bc9             sub cx, cx                               
  0f30  8bd1             mov dx, cx                               
  0f32  0bc0             or ax, ax                                
  0f34  75d1             jne 0xf07                                
  0f36  bb01c0           mov bx, 0xc001                           
  0f39  ebe1             jmp 0xf1c                                
res_1704_0f3b:  ; case
  0f3b  8b4c08           mov cx, word ptr [si + 8]                
  0f3e  83f910           cmp cx, 0x10                             
  0f41  7f70             jg 0xfb3                                 
  0f43  81f901c0         cmp cx, 0xc001                           
  0f47  7e74             jle 0xfbd                                
  0f49  8b5c06           mov bx, word ptr [si + 6]                
  0f4c  2bc0             sub ax, ax                               
  0f4e  0bc9             or cx, cx                                
  0f50  7d04             jge 0xf56                                
  0f52  d1eb             shr bx, 1                                
  0f54  d1da             rcr dx, 1                                
  0f56  8b5404           mov dx, word ptr [si + 4]                
  0f59  0bc9             or cx, cx                                
  0f5b  7e08             jle 0xf65                                
  0f5d  d1e2             shl dx, 1                                
  0f5f  d1d3             rcl bx, 1                                
  0f61  d1d0             rcl ax, 1                                
  0f63  e2f8             loop 0xf5d                               
  0f65  0b14             or dx, word ptr [si]                     
  0f67  0b5402           or dx, word ptr [si + 2]                 
  0f6a  0ade             or bl, dh                                
  0f6c  0ada             or bl, dl                                
  0f6e  b10c             mov cl, 0xc                              
  0f70  220e0300         and cl, byte ptr [3]                     
  0f74  80f90c           cmp cl, 0xc                              
  0f77  742a             je 0xfa3                                 
  0f79  80f900           cmp cl, 0                                
  0f7c  7416             je 0xf94                                 
  0f7e  024c0a           add cl, byte ptr [si + 0xa]              
  0f81  80f904           cmp cl, 4                                
  0f84  741d             je 0xfa3                                 
  0f86  80f909           cmp cl, 9                                
  0f89  7418             je 0xfa3                                 
  0f8b  f7db             neg bx                                   
  0f8d  150000           adc ax, 0                                
  0f90  7221             jb 0xfb3                                 
  0f92  eb0f             jmp 0xfa3                                
  0f94  b201             mov dl, 1                                
  0f96  22d0             and dl, al                               
  0f98  0ada             or bl, dl                                
  0f9a  81c3ff7f         add bx, 0x7fff                           
  0f9e  150000           adc ax, 0                                
  0fa1  7210             jb 0xfb3                                 
  0fa3  807c0a01         cmp byte ptr [si + 0xa], 1               
  0fa7  7418             je 0xfc1                                 
  0fa9  9e               sahf                                     
  0faa  791b             jns 0xfc7                                
  0fac  803e3b0001       cmp byte ptr [0x3b], 1                   
  0fb1  7414             je 0xfc7                                 
  0fb3  b508             mov ch, 8                                
  0fb5  e85c17           call 0x2714                              
  0fb8  b80080           mov ax, 0x8000                           
  0fbb  eb0a             jmp 0xfc7                                
  0fbd  2bc0             sub ax, ax                               
  0fbf  eb06             jmp 0xfc7                                
  0fc1  f7d8             neg ax                                   
  0fc3  7402             je 0xfc7                                 
  0fc5  79ec             jns 0xfb3                                
  0fc7  c6063b0000       mov byte ptr [0x3b], 0                   
  0fcc  268905           mov word ptr es:[di], ax                 
  0fcf  c3               ret                                      
  0fd0  c6063b0001       mov byte ptr [0x3b], 1                   
  0fd5  8b4c08           mov cx, word ptr [si + 8]                
  0fd8  83f910           cmp cx, 0x10                             
  0fdb  e963ff           jmp 0xf41                                

res_1704_0fde:  ; ENTRY
  0fde  56               push si                                  
  0fdf  57               push di                                  
  0fe0  fc               cld                                      
  0fe1  b90500           mov cx, 5                                
  0fe4  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0fe6  a4               movsb byte ptr es:[di], byte ptr [si]    
  0fe7  5f               pop di                                   
  0fe8  5e               pop si                                   
  0fe9  87f7             xchg di, si                              
  0feb  8d7408           lea si, [si + 8]                         
  0fee  813c01c0         cmp word ptr [si], 0xc001                
  0ff2  7e0f             jle 0x1003                               
  0ff4  813c0140         cmp word ptr [si], 0x4001                
  0ff8  7d0a             jge 0x1004                               
  0ffa  ff0c             dec word ptr [si]                        
  0ffc  e8f9fe           call 0xef8                               
  0fff  c7040100         mov word ptr [si], 1                     
  1003  c3               ret                                      
  1004  c70401c0         mov word ptr [si], 0xc001                
  1008  c745080d00       mov word ptr [di + 8], 0xd               
  100d  c6450780         mov byte ptr [di + 7], 0x80              
  1011  ebf0             jmp 0x1003                               

res_1704_1013:  ; ENTRY
  1013  55               push bp                                  
  1014  8bec             mov bp, sp                               
  1016  56               push si                                  
  1017  57               push di                                  
  1018  8b4c08           mov cx, word ptr [si + 8]                
  101b  83f90f           cmp cx, 0xf                              
  101e  7f08             jg 0x1028                                
  1020  0bc9             or cx, cx                                
  1022  7f0e             jg 0x1032                                
  1024  2bc0             sub ax, ax                               
  1026  eb1c             jmp 0x1044                               
  1028  b508             mov ch, 8                                
  102a  e8e716           call 0x2714                              
  102d  b8ff7f           mov ax, 0x7fff                           
  1030  eb0a             jmp 0x103c                               
  1032  8b4406           mov ax, word ptr [si + 6]                
  1035  f6d9             neg cl                                   
  1037  80c110           add cl, 0x10                             
  103a  d3e8             shr ax, cl                               
  103c  807c0a01         cmp byte ptr [si + 0xa], 1               
  1040  7502             jne 0x1044                               
  1042  f7d8             neg ax                                   
  1044  8b4d08           mov cx, word ptr [di + 8]                
  1047  81f901c0         cmp cx, 0xc001                           
  104b  7e15             jle 0x1062                               
  104d  81f90140         cmp cx, 0x4001                           
  1051  7d0f             jge 0x1062                               
  1053  03c1             add ax, cx                               
  1055  3d01c0           cmp ax, 0xc001                           
  1058  7e16             jle 0x1070                               
  105a  3d0140           cmp ax, 0x4001                           
  105d  7d07             jge 0x1066                               
  105f  894508           mov word ptr [di + 8], ax                
  1062  5f               pop di                                   
  1063  5e               pop si                                   
  1064  5d               pop bp                                   
  1065  c3               ret                                      
  1066  b508             mov ch, 8                                
  1068  e8a916           call 0x2714                              
  106b  b80140           mov ax, 0x4001                           
  106e  eb08             jmp 0x1078                               
  1070  b510             mov ch, 0x10                             
  1072  e89f16           call 0x2714                              
  1075  b801c0           mov ax, 0xc001                           
  1078  e8c2fd           call 0xe3d                               
  107b  ebe5             jmp 0x1062                               
  107d  8bca             mov cx, dx                               
  107f  93               xchg bx, ax                              
  1080  eb0f             jmp 0x1091                               
  1082  8bca             mov cx, dx                               
  1084  93               xchg bx, ax                              
  1085  ba0000           mov dx, 0                                
  1088  eb19             jmp 0x10a3                               
res_1704_108a:  ; case
  108a  268b1c           mov bx, word ptr es:[si]                 
  108d  268b4c02         mov cx, word ptr es:[si + 2]             
  1091  2bc0             sub ax, ax                               
  1093  ba0000           mov dx, 0                                
  1096  0bc9             or cx, cx                                
  1098  7909             jns 0x10a3                               
  109a  f7d1             not cx                                   
  109c  f7db             neg bx                                   
  109e  83d9ff           sbb cx, -1                               
  10a1  b201             mov dl, 1                                
  10a3  88550a           mov byte ptr [di + 0xa], dl              
  10a6  b210             mov dl, 0x10                             
  10a8  0bc9             or cx, cx                                
  10aa  750c             jne 0x10b8                               
  10ac  87d9             xchg cx, bx                              
  10ae  b200             mov dl, 0                                
  10b0  e31e             jcxz 0x10d0                              
  10b2  eb04             jmp 0x10b8                               
  10b4  d1db             rcr bx, 1                                
  10b6  d1d8             rcr ax, 1                                
  10b8  42               inc dx                                   
  10b9  d1e9             shr cx, 1                                
  10bb  75f7             jne 0x10b4                               
  10bd  d1db             rcr bx, 1                                
  10bf  d1d8             rcr ax, 1                                
  10c1  895508           mov word ptr [di + 8], dx                
  10c4  895d06           mov word ptr [di + 6], bx                
  10c7  894504           mov word ptr [di + 4], ax                
  10ca  894d02           mov word ptr [di + 2], cx                
  10cd  890d             mov word ptr [di], cx                    
  10cf  c3               ret                                      
  10d0  ba01c0           mov dx, 0xc001                           
  10d3  ebec             jmp 0x10c1                               
  10d5  c6063b0001       mov byte ptr [0x3b], 1                   
  10da  8b4c08           mov cx, word ptr [si + 8]                
  10dd  83f920           cmp cx, 0x20                             
  10e0  eb06             jmp 0x10e8                               
res_1704_10e2:  ; case
  10e2  8b4c08           mov cx, word ptr [si + 8]                
  10e5  83f920           cmp cx, 0x20                             
  10e8  7f33             jg 0x111d                                
  10ea  0bc9             or cx, cx                                
  10ec  7d3c             jge 0x112a                               
  10ee  81f901c0         cmp cx, 0xc001                           
  10f2  7e13             jle 0x1107                               
  10f4  b30c             mov bl, 0xc                              
  10f6  221e0300         and bl, byte ptr [3]                     
  10fa  025c0a           add bl, byte ptr [si + 0xa]              
  10fd  80fb05           cmp bl, 5                                
  1100  740b             je 0x110d                                
  1102  80fb08           cmp bl, 8                                
  1105  7406             je 0x110d                                
  1107  2bd2             sub dx, dx                               
  1109  8bc2             mov ax, dx                               
  110b  eb1a             jmp 0x1127                               
  110d  2bd2             sub dx, dx                               
  110f  b80100           mov ax, 1                                
  1112  80fb05           cmp bl, 5                                
  1115  7510             jne 0x1127                               
  1117  f7d8             neg ax                                   
  1119  f7d2             not dx                                   
  111b  eb0a             jmp 0x1127                               
  111d  b508             mov ch, 8                                
  111f  e8f215           call 0x2714                              
  1122  ba0080           mov dx, 0x8000                           
  1125  2bc0             sub ax, ax                               
  1127  e99700           jmp 0x11c1                               
  112a  8b5c02           mov bx, word ptr [si + 2]                
  112d  0a1c             or bl, byte ptr [si]                     
  112f  0a5c01           or bl, byte ptr [si + 1]                 
  1132  8b4404           mov ax, word ptr [si + 4]                
  1135  8b5406           mov dx, word ptr [si + 6]                
  1138  80e910           sub cl, 0x10                             
  113b  7710             ja 0x114d                                
  113d  0ac3             or al, bl                                
  113f  0ac7             or al, bh                                
  1141  93               xchg bx, ax                              
  1142  92               xchg dx, ax                              
  1143  2bd2             sub dx, dx                               
  1145  80c110           add cl, 0x10                             
  1148  7ef3             jle 0x113d                               
  114a  80e10f           and cl, 0xf                              
  114d  e31d             jcxz 0x116c                              
  114f  56               push si                                  
  1150  beffff           mov si, 0xffff                           
  1153  d3c2             rol dx, cl                               
  1155  d3c0             rol ax, cl                               
  1157  d3e6             shl si, cl                               
  1159  8bce             mov cx, si                               
  115b  23c8             and cx, ax                               
  115d  33c1             xor ax, cx                               
  115f  23f2             and si, dx                               
  1161  33d6             xor dx, si                               
  1163  0bc6             or ax, si                                
  1165  0adf             or bl, bh                                
  1167  0ad9             or bl, cl                                
  1169  8afd             mov bh, ch                               
  116b  5e               pop si                                   
  116c  b10c             mov cl, 0xc                              
  116e  220e0300         and cl, byte ptr [3]                     
  1172  80f90c           cmp cl, 0xc                              
  1175  743d             je 0x11b4                                
  1177  80f900           cmp cl, 0                                
  117a  7413             je 0x118f                                
  117c  024c0a           add cl, byte ptr [si + 0xa]              
  117f  80f904           cmp cl, 4                                
  1182  7430             je 0x11b4                                
  1184  80f909           cmp cl, 9                                
  1187  742b             je 0x11b4                                
  1189  f7db             neg bx                                   
  118b  720c             jb 0x1199                                
  118d  eb25             jmp 0x11b4                               
  118f  b101             mov cl, 1                                
  1191  22c8             and cl, al                               
  1193  0ad9             or bl, cl                                
  1195  81c3ff7f         add bx, 0x7fff                           
  1199  150000           adc ax, 0                                
  119c  83d200           adc dx, 0                                
  119f  7913             jns 0x11b4                               
  11a1  807c0a01         cmp byte ptr [si + 0xa], 1               
  11a5  750a             jne 0x11b1                               
  11a7  81fa0080         cmp dx, 0x8000                           
  11ab  7504             jne 0x11b1                               
  11ad  0bc0             or ax, ax                                
  11af  7403             je 0x11b4                                
  11b1  e969ff           jmp 0x111d                               
  11b4  807c0a01         cmp byte ptr [si + 0xa], 1               
  11b8  7507             jne 0x11c1                               
  11ba  f7d2             not dx                                   
  11bc  f7d8             neg ax                                   
  11be  83daff           sbb dx, -1                               
  11c1  c6063b0000       mov byte ptr [0x3b], 0                   
  11c6  268905           mov word ptr es:[di], ax                 
  11c9  26895502         mov word ptr es:[di + 2], dx             
  11cd  c3               ret                                      

res_1704_11ce:  ; ENTRY
  11ce  55               push bp                                  
  11cf  56               push si                                  
  11d0  268b04           mov ax, word ptr es:[si]                 
  11d3  268b5c02         mov bx, word ptr es:[si + 2]             
  11d7  268b4c04         mov cx, word ptr es:[si + 4]             
  11db  268b5406         mov dx, word ptr es:[si + 6]             
  11df  bd0000           mov bp, 0                                
  11e2  0bd2             or dx, dx                                
  11e4  7c13             jl 0x11f9                                
  11e6  7f26             jg 0x120e                                
  11e8  0bc9             or cx, cx                                
  11ea  7522             jne 0x120e                               
  11ec  0bdb             or bx, bx                                
  11ee  751e             jne 0x120e                               
  11f0  0bc0             or ax, ax                                
  11f2  751a             jne 0x120e                               
  11f4  be01c0           mov si, 0xc001                           
  11f7  eb33             jmp 0x122c                               
  11f9  f7d2             not dx                                   
  11fb  f7d1             not cx                                   
  11fd  f7d3             not bx                                   
  11ff  f7d8             neg ax                                   
  1201  f5               cmc                                      
  1202  83d300           adc bx, 0                                
  1205  83d100           adc cx, 0                                
  1208  83d200           adc dx, 0                                
  120b  bd0100           mov bp, 1                                
  120e  be4000           mov si, 0x40                             
  1211  0bd2             or dx, dx                                
  1213  750a             jne 0x121f                               
  1215  87d1             xchg cx, dx                              
  1217  87cb             xchg bx, cx                              
  1219  93               xchg bx, ax                              
  121a  83ee10           sub si, 0x10                             
  121d  ebf2             jmp 0x1211                               
  121f  780b             js 0x122c                                
  1221  4e               dec si                                   
  1222  03c0             add ax, ax                               
  1224  13db             adc bx, bx                               
  1226  13c9             adc cx, cx                               
  1228  13d2             adc dx, dx                               
  122a  79f5             jns 0x1221                               
  122c  897508           mov word ptr [di + 8], si                
  122f  895506           mov word ptr [di + 6], dx                
  1232  894d04           mov word ptr [di + 4], cx                
  1235  895d02           mov word ptr [di + 2], bx                
  1238  8905             mov word ptr [di], ax                    
  123a  95               xchg bp, ax                              
  123b  88450a           mov byte ptr [di + 0xa], al              
  123e  5e               pop si                                   
  123f  5d               pop bp                                   
  1240  c3               ret                                      

res_1704_1241:  ; ENTRY
  1241  55               push bp                                  
  1242  57               push di                                  
  1243  8b4c08           mov cx, word ptr [si + 8]                
  1246  83f93f           cmp cx, 0x3f                             
  1249  7f39             jg 0x1284                                
  124b  0bc9             or cx, cx                                
  124d  7d46             jge 0x1295                               
  124f  81f901c0         cmp cx, 0xc001                           
  1253  7e13             jle 0x1268                               
  1255  b30c             mov bl, 0xc                              
  1257  221e0300         and bl, byte ptr [3]                     
  125b  025c0a           add bl, byte ptr [si + 0xa]              
  125e  80fb05           cmp bl, 5                                
  1261  7409             je 0x126c                                
  1263  80fb08           cmp bl, 8                                
  1266  7404             je 0x126c                                
  1268  2bed             sub bp, bp                               
  126a  eb20             jmp 0x128c                               
  126c  2bed             sub bp, bp                               
  126e  8bd5             mov dx, bp                               
  1270  b80100           mov ax, 1                                
  1273  80fb05           cmp bl, 5                                
  1276  8bdd             mov bx, bp                               
  1278  7518             jne 0x1292                               
  127a  f7d8             neg ax                                   
  127c  f7d3             not bx                                   
  127e  f7d2             not dx                                   
  1280  f7d5             not bp                                   
  1282  eb0e             jmp 0x1292                               
  1284  b508             mov ch, 8                                
  1286  e88b14           call 0x2714                              
  1289  bd0080           mov bp, 0x8000                           
  128c  2bd2             sub dx, dx                               
  128e  8bda             mov bx, dx                               
  1290  8bc3             mov ax, bx                               
  1292  e99100           jmp 0x1326                               
  1295  8b6c06           mov bp, word ptr [si + 6]                
  1298  8b5404           mov dx, word ptr [si + 4]                
  129b  8b5c02           mov bx, word ptr [si + 2]                
  129e  8b3c             mov di, word ptr [si]                    
  12a0  2bc0             sub ax, ax                               
  12a2  80e930           sub cl, 0x30                             
  12a5  7716             ja 0x12bd                                
  12a7  0ac4             or al, ah                                
  12a9  b400             mov ah, 0                                
  12ab  0bc7             or ax, di                                
  12ad  8bfb             mov di, bx                               
  12af  8bda             mov bx, dx                               
  12b1  8bd5             mov dx, bp                               
  12b3  2bed             sub bp, bp                               
  12b5  80c110           add cl, 0x10                             
  12b8  7eed             jle 0x12a7                               
  12ba  80e10f           and cl, 0xf                              
  12bd  f6d9             neg cl                                   
  12bf  7411             je 0x12d2                                
  12c1  80c110           add cl, 0x10                             
  12c4  0ac4             or al, ah                                
  12c6  d1ed             shr bp, 1                                
  12c8  d1da             rcr dx, 1                                
  12ca  d1db             rcr bx, 1                                
  12cc  d1df             rcr di, 1                                
  12ce  d0dc             rcr ah, 1                                
  12d0  e2f2             loop 0x12c4                              
  12d2  b10c             mov cl, 0xc                              
  12d4  220e0300         and cl, byte ptr [3]                     
  12d8  80f90c           cmp cl, 0xc                              
  12db  7430             je 0x130d                                
  12dd  80f900           cmp cl, 0                                
  12e0  7415             je 0x12f7                                
  12e2  024c0a           add cl, byte ptr [si + 0xa]              
  12e5  80f904           cmp cl, 4                                
  12e8  7423             je 0x130d                                
  12ea  80f909           cmp cl, 9                                
  12ed  741e             je 0x130d                                
  12ef  f7d8             neg ax                                   
  12f1  720d             jb 0x1300                                
  12f3  eb18             jmp 0x130d                               
  12f5  eb8d             jmp 0x1284                               
  12f7  b101             mov cl, 1                                
  12f9  23cf             and cx, di                               
  12fb  0ac1             or al, cl                                
  12fd  05ff7f           add ax, 0x7fff                           
  1300  b90000           mov cx, 0                                
  1303  13f9             adc di, cx                               
  1305  13d9             adc bx, cx                               
  1307  13d1             adc dx, cx                               
  1309  13e9             adc bp, cx                               
  130b  78e8             js 0x12f5                                
  130d  97               xchg di, ax                              
  130e  807c0a01         cmp byte ptr [si + 0xa], 1               
  1312  7512             jne 0x1326                               
  1314  f7d5             not bp                                   
  1316  f7d2             not dx                                   
  1318  f7d3             not bx                                   
  131a  f7d8             neg ax                                   
  131c  f5               cmc                                      
  131d  83d300           adc bx, 0                                
  1320  83d200           adc dx, 0                                
  1323  83d500           adc bp, 0                                
  1326  5f               pop di                                   
  1327  ab               stosw word ptr es:[di], ax               
  1328  93               xchg bx, ax                              
  1329  ab               stosw word ptr es:[di], ax               
  132a  92               xchg dx, ax                              
  132b  ab               stosw word ptr es:[di], ax               
  132c  95               xchg bp, ax                              
  132d  ab               stosw word ptr es:[di], ax               
  132e  83ef08           sub di, 8                                
  1331  5d               pop bp                                   
  1332  c3               ret                                      
  1333  8b360c00         mov si, word ptr [0xc]                   

res_1704_1337:  ; ENTRY
  1337  55               push bp                                  
  1338  56               push si                                  
  1339  57               push di                                  
  133a  87ee             xchg si, bp                              
  133c  8b4e08           mov cx, word ptr [bp + 8]                
  133f  83f940           cmp cx, 0x40                             
  1342  7d31             jge 0x1375                               
  1344  0bc9             or cx, cx                                
  1346  7d4a             jge 0x1392                               
  1348  81f901c0         cmp cx, 0xc001                           
  134c  7e18             jle 0x1366                               
  134e  b520             mov ch, 0x20                             
  1350  e8c113           call 0x2714                              
  1353  b10c             mov cl, 0xc                              
  1355  220e0300         and cl, byte ptr [3]                     
  1359  024e0a           add cl, byte ptr [bp + 0xa]              
  135c  80f905           cmp cl, 5                                
  135f  740c             je 0x136d                                
  1361  80f908           cmp cl, 8                                
  1364  7407             je 0x136d                                
  1366  2bdb             sub bx, bx                               
  1368  be01c0           mov si, 0xc001                           
  136b  eb11             jmp 0x137e                               
  136d  be0100           mov si, 1                                
  1370  bb0080           mov bx, 0x8000                           
  1373  eb09             jmp 0x137e                               
  1375  7418             je 0x138f                                
  1377  b520             mov ch, 0x20                             
  1379  e89813           call 0x2714                              
  137c  eb11             jmp 0x138f                               
  137e  2bc0             sub ax, ax                               
  1380  894600           mov word ptr [bp], ax                    
  1383  894602           mov word ptr [bp + 2], ax                
  1386  894604           mov word ptr [bp + 4], ax                
  1389  895e06           mov word ptr [bp + 6], bx                
  138c  897608           mov word ptr [bp + 8], si                
  138f  e9b000           jmp 0x1442                               
  1392  be3800           mov si, 0x38                             
  1395  23f1             and si, cx                               
  1397  33ce             xor cx, si                               
  1399  d1ee             shr si, 1                                
  139b  d1ee             shr si, 1                                
  139d  d1ee             shr si, 1                                
  139f  f7de             neg si                                   
  13a1  83c607           add si, 7                                
  13a4  83fe07           cmp si, 7                                
  13a7  7506             jne 0x13af                               
  13a9  b400             mov ah, 0                                
  13ab  8a02             mov al, byte ptr [bp + si]               
  13ad  eb02             jmp 0x13b1                               
  13af  8b02             mov ax, word ptr [bp + si]               
  13b1  2bdb             sub bx, bx                               
  13b3  8bfe             mov di, si                               
  13b5  4f               dec di                                   
  13b6  7c06             jl 0x13be                                
  13b8  0a1b             or bl, byte ptr [bp + di]                
  13ba  883b             mov byte ptr [bp + di], bh               
  13bc  ebf7             jmp 0x13b5                               
  13be  baff00           mov dx, 0xff                             
  13c1  80e107           and cl, 7                                
  13c4  d3ea             shr dx, cl                               
  13c6  8bfa             mov di, dx                               
  13c8  47               inc di                                   
  13c9  23d0             and dx, ax                               
  13cb  7504             jne 0x13d1                               
  13cd  0adb             or bl, bl                                
  13cf  7471             je 0x1442                                
  13d1  b520             mov ch, 0x20                             
  13d3  e83e13           call 0x2714                              
  13d6  33c2             xor ax, dx                               
  13d8  b10c             mov cl, 0xc                              
  13da  220e0300         and cl, byte ptr [3]                     
  13de  80f90c           cmp cl, 0xc                              
  13e1  7418             je 0x13fb                                
  13e3  80f900           cmp cl, 0                                
  13e6  741e             je 0x1406                                
res_1704_13e8:  ; case
  13e8  024e0a           add cl, byte ptr [bp + 0xa]              
  13eb  80f904           cmp cl, 4                                
  13ee  740b             je 0x13fb                                
  13f0  80f909           cmp cl, 9                                
  13f3  7406             je 0x13fb                                
  13f5  0ada             or bl, dl                                
  13f7  7523             jne 0x141c                               
  13f9  eb47             jmp 0x1442                               
  13fb  8802             mov byte ptr [bp + si], al               
  13fd  807e0700         cmp byte ptr [bp + 7], 0                 
  1401  753f             jne 0x1442                               
  1403  e960ff           jmp 0x1366                               
  1406  0adb             or bl, bl                                
  1408  750c             jne 0x1416                               
  140a  85c7             test di, ax                              
  140c  7508             jne 0x1416                               
  140e  03d2             add dx, dx                               
  1410  3bd7             cmp dx, di                               
  1412  76e7             jbe 0x13fb                               
  1414  eb06             jmp 0x141c                               
  1416  03d2             add dx, dx                               
  1418  3bd7             cmp dx, di                               
  141a  72df             jb 0x13fb                                
  141c  83ee07           sub si, 7                                
  141f  7c09             jl 0x142a                                
  1421  03c7             add ax, di                               
  1423  884207           mov byte ptr [bp + si + 7], al           
  1426  f6dc             neg ah                                   
  1428  eb0f             jmp 0x1439                               
  142a  03c7             add ax, di                               
  142c  894207           mov word ptr [bp + si + 7], ax           
  142f  46               inc si                                   
  1430  46               inc si                                   
  1431  7f06             jg 0x1439                                
  1433  80520700         adc byte ptr [bp + si + 7], 0            
  1437  72f7             jb 0x1430                                
  1439  7307             jae 0x1442                               
  143b  f9               stc                                      
  143c  d15e06           rcr word ptr [bp + 6], 1                 
  143f  ff4608           inc word ptr [bp + 8]                    
  1442  5f               pop di                                   
  1443  5e               pop si                                   
  1444  5d               pop bp                                   
  1445  c3               ret                                      

res_1704_1446:  ; ENTRY
  1446  55               push bp                                  
  1447  56               push si                                  
  1448  57               push di                                  
  1449  8b2e0c00         mov bp, word ptr [0xc]                   
  144d  8b4600           mov ax, word ptr [bp]                    
  1450  8b5e02           mov bx, word ptr [bp + 2]                
  1453  8b4e04           mov cx, word ptr [bp + 4]                
  1456  8b5606           mov dx, word ptr [bp + 6]                
  1459  2bff             sub di, di                               
  145b  8b7608           mov si, word ptr [bp + 8]                
  145e  81fe01c0         cmp si, 0xc001                           
  1462  7421             je 0x1485                                
  1464  83fef0           cmp si, -0x10                            
  1467  7f0d             jg 0x1476                                
  1469  8bf8             mov di, ax                               
  146b  8bc3             mov ax, bx                               
  146d  8bd9             mov bx, cx                               
  146f  8bca             mov cx, dx                               
  1471  2bd2             sub dx, dx                               
  1473  83c610           add si, 0x10                             
  1476  46               inc si                                   
  1477  7f0c             jg 0x1485                                
  1479  d1ea             shr dx, 1                                
  147b  d1d9             rcr cx, 1                                
  147d  d1db             rcr bx, 1                                
  147f  d1d8             rcr ax, 1                                
  1481  d1df             rcr di, 1                                
  1483  ebf1             jmp 0x1476                               
  1485  d1e7             shl di, 1                                
  1487  bf0000           mov di, 0                                
  148a  13c7             adc ax, di                               
  148c  13df             adc bx, di                               
  148e  13cf             adc cx, di                               
  1490  13d7             adc dx, di                               
  1492  894600           mov word ptr [bp], ax                    
  1495  895e02           mov word ptr [bp + 2], bx                
  1498  894e04           mov word ptr [bp + 4], cx                
  149b  895606           mov word ptr [bp + 6], dx                
  149e  8bdf             mov bx, di                               
  14a0  8bcf             mov cx, di                               
  14a2  8bf7             mov si, di                               
  14a4  f6460380         test byte ptr [bp + 3], 0x80             
  14a8  740a             je 0x14b4                                
  14aa  8b5e00           mov bx, word ptr [bp]                    
  14ad  8b4e02           mov cx, word ptr [bp + 2]                
  14b0  d1e3             shl bx, 1                                
  14b2  d1d1             rcl cx, 1                                
  14b4  8b4600           mov ax, word ptr [bp]                    
  14b7  f76604           mul word ptr [bp + 4]                    
  14ba  03d8             add bx, ax                               
  14bc  13ca             adc cx, dx                               
  14be  13f7             adc si, di                               
  14c0  03d8             add bx, ax                               
  14c2  13ca             adc cx, dx                               
  14c4  13f7             adc si, di                               
  14c6  8bd9             mov bx, cx                               
  14c8  8bce             mov cx, si                               
  14ca  2bf6             sub si, si                               
  14cc  8b4602           mov ax, word ptr [bp + 2]                
  14cf  f76604           mul word ptr [bp + 4]                    
  14d2  03d8             add bx, ax                               
  14d4  13ca             adc cx, dx                               
  14d6  13f7             adc si, di                               
  14d8  03d8             add bx, ax                               
  14da  13ca             adc cx, dx                               
  14dc  13f7             adc si, di                               
  14de  8b4600           mov ax, word ptr [bp]                    
  14e1  f76606           mul word ptr [bp + 6]                    
  14e4  03d8             add bx, ax                               
  14e6  13ca             adc cx, dx                               
  14e8  13f7             adc si, di                               
  14ea  03d8             add bx, ax                               
  14ec  13ca             adc cx, dx                               
  14ee  13f7             adc si, di                               
  14f0  d1e3             shl bx, 1                                
  14f2  13cf             adc cx, di                               
  14f4  13f7             adc si, di                               
  14f6  8bd9             mov bx, cx                               
  14f8  8bce             mov cx, si                               
  14fa  2bf6             sub si, si                               
  14fc  8b4604           mov ax, word ptr [bp + 4]                
  14ff  f7e0             mul ax                                   
  1501  03d8             add bx, ax                               
  1503  13ca             adc cx, dx                               
  1505  13f7             adc si, di                               
  1507  8b4606           mov ax, word ptr [bp + 6]                
  150a  f76602           mul word ptr [bp + 2]                    
  150d  03d8             add bx, ax                               
  150f  13ca             adc cx, dx                               
  1511  13f7             adc si, di                               
  1513  03d8             add bx, ax                               
  1515  13ca             adc cx, dx                               
  1517  13f7             adc si, di                               
  1519  8b4606           mov ax, word ptr [bp + 6]                
  151c  f76604           mul word ptr [bp + 4]                    
  151f  03c8             add cx, ax                               
  1521  13f2             adc si, dx                               
  1523  13ff             adc di, di                               
  1525  03c8             add cx, ax                               
  1527  13f2             adc si, dx                               
  1529  83d700           adc di, 0                                
  152c  8b4606           mov ax, word ptr [bp + 6]                
  152f  f7e0             mul ax                                   
  1531  03f0             add si, ax                               
  1533  13fa             adc di, dx                               
  1535  895e00           mov word ptr [bp], bx                    
  1538  894e02           mov word ptr [bp + 2], cx                
  153b  897604           mov word ptr [bp + 4], si                
  153e  897e06           mov word ptr [bp + 6], di                
  1541  c6460a00         mov byte ptr [bp + 0xa], 0               
  1545  c746080000       mov word ptr [bp + 8], 0                 
  154a  5f               pop di                                   
  154b  5e               pop si                                   
  154c  5d               pop bp                                   
  154d  c3               ret                                      

res_1704_154e:  ; ENTRY
  154e  55               push bp                                  
  154f  8bec             mov bp, sp                               
  1551  56               push si                                  
  1552  57               push di                                  
  1553  1e               push ds                                  
  1554  06               push es                                  
  1555  b00c             mov al, 0xc                              
  1557  f66606           mul byte ptr [bp + 6]                    
  155a  2d0c00           sub ax, 0xc                              
  155d  96               xchg si, ax                              
  155e  037604           add si, word ptr [bp + 4]                
  1561  e823f9           call 0xe87                               
  1564  8bfe             mov di, si                               
  1566  fe4e06           dec byte ptr [bp + 6]                    
  1569  7e78             jle 0x15e3                               
  156b  55               push bp                                  
  156c  8b2e0c00         mov bp, word ptr [0xc]                   
  1570  8a4616           mov al, byte ptr [bp + 0x16]             
  1573  30460a           xor byte ptr [bp + 0xa], al              
  1576  e8daed           call 0x353                               
  1579  894600           mov word ptr [bp], ax                    
  157c  895e02           mov word ptr [bp + 2], bx                
  157f  894e04           mov word ptr [bp + 4], cx                
  1582  895606           mov word ptr [bp + 6], dx                
  1585  83ef0c           sub di, 0xc                              
  1588  2e8b1d           mov bx, word ptr cs:[di]                 
  158b  2e8b4d02         mov cx, word ptr cs:[di + 2]             
  158f  2e8b5504         mov dx, word ptr cs:[di + 4]             
  1593  2e8b7506         mov si, word ptr cs:[di + 6]             
  1597  2e8a450a         mov al, byte ptr cs:[di + 0xa]           
  159b  3a460a           cmp al, byte ptr [bp + 0xa]              
  159e  7434             je 0x15d4                                
  15a0  2b5e00           sub bx, word ptr [bp]                    
  15a3  1b4e02           sbb cx, word ptr [bp + 2]                
  15a6  1b5604           sbb dx, word ptr [bp + 4]                
  15a9  1b7606           sbb si, word ptr [bp + 6]                
  15ac  7314             jae 0x15c2                               
  15ae  f7d6             not si                                   
  15b0  f7d2             not dx                                   
  15b2  f7d1             not cx                                   
  15b4  f7db             neg bx                                   
  15b6  f5               cmc                                      
  15b7  83d100           adc cx, 0                                
  15ba  83d200           adc dx, 0                                
  15bd  83d600           adc si, 0                                
  15c0  3401             xor al, 1                                
  15c2  895e00           mov word ptr [bp], bx                    
  15c5  894e02           mov word ptr [bp + 2], cx                
  15c8  895604           mov word ptr [bp + 4], dx                
  15cb  897606           mov word ptr [bp + 6], si                
  15ce  88460a           mov byte ptr [bp + 0xa], al              
  15d1  5d               pop bp                                   
  15d2  eb92             jmp 0x1566                               
  15d4  015e00           add word ptr [bp], bx                    
  15d7  114e02           adc word ptr [bp + 2], cx                
  15da  115604           adc word ptr [bp + 4], dx                
  15dd  117606           adc word ptr [bp + 6], si                
  15e0  5d               pop bp                                   
  15e1  eb83             jmp 0x1566                               
  15e3  8b360c00         mov si, word ptr [0xc]                   
  15e7  fc               cld                                      
  15e8  ad               lodsw ax, word ptr [si]                  
  15e9  93               xchg bx, ax                              
  15ea  ad               lodsw ax, word ptr [si]                  
  15eb  91               xchg cx, ax                              
  15ec  ad               lodsw ax, word ptr [si]                  
  15ed  92               xchg dx, ax                              
  15ee  ad               lodsw ax, word ptr [si]                  
  15ef  97               xchg di, ax                              
  15f0  ad               lodsw ax, word ptr [si]                  
  15f1  ac               lodsb al, byte ptr [si]                  
  15f2  46               inc si                                   
  15f3  89360c00         mov word ptr [0xc], si                   
  15f7  87f7             xchg di, si                              
  15f9  2bff             sub di, di                               
  15fb  3c01             cmp al, 1                                
  15fd  7511             jne 0x1610                               
  15ff  f7d6             not si                                   
  1601  f7d2             not dx                                   
  1603  f7d1             not cx                                   
  1605  f7db             neg bx                                   
  1607  f5               cmc                                      
  1608  13cf             adc cx, di                               
  160a  13d7             adc dx, di                               
  160c  13f7             adc si, di                               
  160e  eb12             jmp 0x1622                               
  1610  f9               stc                                      
  1611  d1de             rcr si, 1                                
  1613  d1da             rcr dx, 1                                
  1615  d1d9             rcr cx, 1                                
  1617  d1db             rcr bx, 1                                
  1619  13df             adc bx, di                               
  161b  13cf             adc cx, di                               
  161d  13d7             adc dx, di                               
  161f  13f7             adc si, di                               
  1621  47               inc di                                   
  1622  a10c00           mov ax, word ptr [0xc]                   
  1625  97               xchg di, ax                              
  1626  93               xchg bx, ax                              
  1627  ab               stosw word ptr es:[di], ax               
  1628  91               xchg cx, ax                              
  1629  ab               stosw word ptr es:[di], ax               
  162a  92               xchg dx, ax                              
  162b  ab               stosw word ptr es:[di], ax               
  162c  96               xchg si, ax                              
  162d  ab               stosw word ptr es:[di], ax               
  162e  93               xchg bx, ax                              
  162f  ab               stosw word ptr es:[di], ax               
  1630  b000             mov al, 0                                
  1632  aa               stosb byte ptr es:[di], al               
  1633  07               pop es                                   
  1634  1f               pop ds                                   
  1635  5f               pop di                                   
  1636  5e               pop si                                   
  1637  5d               pop bp                                   
  1638  c20400           ret 4                                    
  163b  0800             or byte ptr [bx + si], al                
  163d  0000             add byte ptr [bx + si], al               
  163f  0000             add byte ptr [bx + si], al               
  1641  0000             add byte ptr [bx + si], al               
  1643  0000             add byte ptr [bx + si], al               
  1645  0000             add byte ptr [bx + si], al               
  1647  0000             add byte ptr [bx + si], al               
  1649  b6aa             mov dh, 0xaa                             
  164b  aa               stosb byte ptr es:[di], al               
  164c  aa               stosb byte ptr es:[di], al               
  164d  aa               stosb byte ptr es:[di], al               
  164e  aa               stosb byte ptr es:[di], al               
  164f  aa               stosb byte ptr es:[di], al               
  1650  2a00             sub al, byte ptr [bx + si]               
  1652  0001             add byte ptr [bx + di], al               
  1654  0003             add byte ptr [bp + di], al               
  1656  2422             and al, 0x22                             
  1658  2222             and ah, byte ptr [bp + si]               
  165a  2222             and ah, byte ptr [bp + si]               
  165c  0200             add al, byte ptr [bx + si]               
  165e  0000             add byte ptr [bx + si], al               
  1660  00b3e400         add byte ptr [bp + di + 0xe4], dh        
  1664  0dd000           or ax, 0xd0                              
  1667  0d0000           or ax, 0                                 
  166a  0001             add byte ptr [bx + di], al               
  166c  006e08           add byte ptr [bp + 8], ch                
  166f  4b               dec bx                                   
  1670  c7               db c7                                    
  1671  3b2e0000         cmp bp, word ptr [0]                     
  1675  0000             add byte ptr [bx + si], al               
  1677  0000             add byte ptr [bx + si], al               
  1679  c6401699         mov byte ptr [bx + si + 0x16], 0x99      
  167d  6b0000           imul ax, word ptr [bx + si], 0           
  1680  0000             add byte ptr [bx + si], al               
  1682  0001             add byte ptr [bx + di], al               
  1684  000c             add byte ptr [si], cl                    
  1686  45               inc bp                                   
  1687  92               xchg dx, ax                              
  1688  b000             mov al, 0                                
  168a  0000             add byte ptr [bx + si], al               
  168c  0000             add byte ptr [bx + si], al               
  168e  0000             add byte ptr [bx + si], al               
  1690  00d5             add ch, dl                               
  1692  45               inc bp                                   
  1693  d6               salc                                     
  1694  0000             add byte ptr [bx + si], al               
  1696  0000             add byte ptr [bx + si], al               
  1698  0000             add byte ptr [bx + si], al               
  169a  0001             add byte ptr [bx + di], al               
  169c  0008             add byte ptr [bx + si], cl               
  169e  0000             add byte ptr [bx + si], al               
  16a0  0000             add byte ptr [bx + si], al               
  16a2  0000             add byte ptr [bx + si], al               
  16a4  0000             add byte ptr [bx + si], al               
  16a6  0000             add byte ptr [bx + si], al               
  16a8  0000             add byte ptr [bx + si], al               
  16aa  0088ffff         add byte ptr [bx + si - 1], cl           
  16ae  ff               db ff                                    
  16af  ff               db ff                                    
  16b0  ff               db ff                                    
  16b1  ff               db ff                                    
  16b2  7f00             jg 0x16b4                                
  16b4  0001             add byte ptr [bx + di], al               
  16b6  00a69aaa         add byte ptr [bp - 0x5566], ah           
  16ba  aa               stosb byte ptr es:[di], al               
  16bb  aa               stosb byte ptr es:[di], al               
  16bc  aa               stosb byte ptr es:[di], al               
  16bd  aa               stosb byte ptr es:[di], al               
  16be  0a00             or al, byte ptr [bx + si]                
  16c0  0000             add byte ptr [bx + si], al               
  16c2  007fe6           add byte ptr [bx - 0x1a], bh             
  16c5  045b             add al, 0x5b                             
  16c7  b005             mov al, 5                                
  16c9  5b               pop bx                                   
  16ca  0000             add byte ptr [bx + si], al               
  16cc  0001             add byte ptr [bx + di], al               
  16ce  00ef             add bh, ch                               
  16d0  269b             wait                                     
  16d2  011a             add word ptr [bp + si], bx               
  16d4  a00100           mov al, byte ptr [1]                     
  16d7  0000             add byte ptr [bx + si], al               
  16d9  0000             add byte ptr [bx + si], al               
  16db  1dcedc           sbb ax, 0xdcce                           
  16de  93               xchg bx, ax                              
  16df  9f               lahf                                     
  16e0  0400             add al, 0                                
  16e2  0000             add byte ptr [bx + si], al               
  16e4  0001             add byte ptr [bx + di], al               
  16e6  000f             add byte ptr [bx], cl                    
  16e8  b14b             mov cl, 0x4b                             
  16ea  f7080000         test word ptr [bx + si], 0               
  16ee  0000             add byte ptr [bx + si], al               
  16f0  0000             add byte ptr [bx + si], al               
  16f2  0003             add byte ptr [bp + di], al               
  16f4  d87b0c           fdivr dword ptr [bp + di + 0xc]          
  16f7  0000             add byte ptr [bx + si], al               
  16f9  0000             add byte ptr [bx + si], al               
  16fb  0000             add byte ptr [bx + si], al               
  16fd  0100             add word ptr [bx + si], ax               

res_1704_16ff:  ; ENTRY
  16ff  e869f7           call 0xe6b                               
  1702  e841fd           call 0x1446                              

res_1704_1705:  ; ENTRY
  1705  2eff363b16       push word ptr cs:[0x163b]                
  170a  b83d16           mov ax, 0x163d                           
  170d  50               push ax                                  
  170e  e83dfe           call 0x154e                              
  1711  ff360c00         push word ptr [0xc]                      
  1715  56               push si                                  
  1716  56               push si                                  
  1717  e8a3eb           call 0x2bd                               
  171a  83060c000c       add word ptr [0xc], 0xc                  
  171f  c3               ret                                      

res_1704_1720:  ; ENTRY
  1720  e823fd           call 0x1446                              

res_1704_1723:  ; ENTRY
  1723  2eff369d16       push word ptr cs:[0x169d]                
  1728  b89f16           mov ax, 0x169f                           
  172b  50               push ax                                  
  172c  e81ffe           call 0x154e                              
  172f  c3               ret                                      
res_1704_1730:  ; case
  1730  e838f7           call 0xe6b                               
  1733  e810fd           call 0x1446                              
  1736  e881f7           call 0xeba                               
  1739  e8c9ff           call 0x1705                              
  173c  e8e4ff           call 0x1723                              
  173f  c3               ret                                      
  1740  35c268           xor ax, 0x68c2                           
  1743  21a2da0f         and word ptr [bp + si + 0xfda], sp       
  1747  c9               leave                                    
  1748  0100             add word ptr [bx + si], ax               
  174a  0000             add byte ptr [bx + si], al               
  174c  0800             or byte ptr [bx + si], al                
  174e  0000             add byte ptr [bx + si], al               
  1750  0000             add byte ptr [bx + si], al               
  1752  0000             add byte ptr [bx + si], al               
  1754  0000             add byte ptr [bx + si], al               
  1756  0000             add byte ptr [bx + si], al               
  1758  0000             add byte ptr [bx + si], al               
  175a  57               push di                                  
  175b  55               push bp                                  
  175c  55               push bp                                  
  175d  55               push bp                                  
  175e  55               push bp                                  
  175f  55               push bp                                  
  1760  55               push bp                                  
  1761  0100             add word ptr [bx + si], ax               
  1763  0001             add byte ptr [bx + di], al               
  1765  00be3233         add byte ptr [bp + 0x3332], bh           
  1769  3333             xor si, word ptr [bp + di]               
  176b  3303             xor ax, word ptr [bp + di]               
  176d  0000             add byte ptr [bx + si], al               
  176f  0000             add byte ptr [bx + si], al               
  1771  007d1e           add byte ptr [di + 0x1e], bh             
  1774  49               dec cx                                   
  1775  92               xchg dx, ax                              
  1776  2409             and al, 9                                
  1778  0000             add byte ptr [bx + si], al               
  177a  0000             add byte ptr [bx + si], al               
  177c  0100             add word ptr [bx + si], ax               
  177e  bcfec6           mov sp, 0xc6fe                           
  1781  711c             jno 0x179f                               
  1783  0000             add byte ptr [bx + si], al               
  1785  0000             add byte ptr [bx + si], al               
  1787  0000             add byte ptr [bx + si], al               
  1789  005cff           add byte ptr [si - 1], bl                
  178c  16               push ss                                  
  178d  5d               pop bp                                   
  178e  0000             add byte ptr [bx + si], al               
  1790  0000             add byte ptr [bx + si], al               
  1792  0000             add byte ptr [bx + si], al               
  1794  0100             add word ptr [bx + si], ax               
  1796  d8bb3a01         fdivr dword ptr [bp + di + 0x13a]        
  179a  0000             add byte ptr [bx + si], al               
  179c  0000             add byte ptr [bx + si], al               
  179e  0000             add byte ptr [bx + si], al               
  17a0  0000             add byte ptr [bx + si], al               
  17a2  0a0c             or cl, byte ptr [si]                     
  17a4  0400             add al, 0                                
  17a6  0000             add byte ptr [bx + si], al               
  17a8  0000             add byte ptr [bx + si], al               
  17aa  0000             add byte ptr [bx + si], al               
  17ac  0100             add word ptr [bx + si], ax               
  17ae  0000             add byte ptr [bx + si], al               
  17b0  0000             add byte ptr [bx + si], al               
  17b2  0000             add byte ptr [bx + si], al               
  17b4  00e7             add bh, ah                               
  17b6  fd               std                                      
  17b7  ff00             inc word ptr [bx + si]                   
  17b9  00bda4d6         add byte ptr [di - 0x295c], bh           
  17bd  7bee             jnp 0x17ad                               
  17bf  645c             pop sp                                   
  17c1  b3ff             mov bl, 0xff                             
  17c3  ff00             inc word ptr [bx + si]                   
  17c5  00b58547         add byte ptr [di + 0x4785], dh           
  17c9  fc               cld                                      
  17ca  7430             je 0x17fc                                
  17cc  11a10000         adc word ptr [bx + di], sp               
  17d0  0000             add byte ptr [bx + si], al               
  17d2  0000             add byte ptr [bx + si], al               
  17d4  0000             add byte ptr [bx + si], al               
  17d6  0000             add byte ptr [bx + si], al               
  17d8  00800100         add byte ptr [bx + si + 1], al           
  17dc  0000             add byte ptr [bx + si], al               
  17de  9c               pushf                                    
  17df  fa               cli                                      
  17e0  64b0b2           mov al, 0xb2                             
  17e3  1d07e6           sbb ax, 0xe607                           
  17e6  fe               db fe                                    
  17e7  ff00             inc word ptr [bx + si]                   
  17e9  009cfa64         add byte ptr [si + 0x64fa], bl           
  17ed  b0b2             mov al, 0xb2                             
  17ef  1d07e6           sbb ax, 0xe607                           
  17f2  ff               db ff                                    
  17f3  ff00             inc word ptr [bx + si]                   
  17f5  00f5             add ch, dh                               
  17f7  bb4b04           mov bx, 0x44b                            
  17fa  46               inc si                                   
  17fb  56               push si                                  
  17fc  85ac0000         test word ptr [si], bp                   
  1800  0000             add byte ptr [bx + si], al               
  1802  e66e             out 0x6e, al                             
  1804  d91f             fstp dword ptr [bx]                      
  1806  bd09fa           mov bp, 0xfa09                           
  1809  e9feff           jmp 0x180a                               
  180c  0000             add byte ptr [bx + si], al               
  180e  8d7b35           lea di, [bp + di + 0x35]                 
  1811  bd5b84           mov bp, 0x845b                           
  1814  dd               db dd                                    
  1815  f6ff             idiv bh                                  
  1817  ff00             inc word ptr [bx + si]                   
  1819  007fd5           add byte ptr [bx - 0x2b], bh             
  181c  3502db           xor ax, 0xdb02                           
  181f  8073cc00         xor byte ptr [bp + di - 0x34], 0         
  1823  0000             add byte ptr [bx + si], al               
  1825  00               db 00                                    resync

res_1704_1826:  ; ENTRY
  1826  55               push bp                                  
  1827  8bec             mov bp, sp                               
  1829  8d66fe           lea sp, [bp - 2]                         
  182c  56               push si                                  
  182d  57               push di                                  
  182e  56               push si                                  
  182f  57               push di                                  
  1830  56               push si                                  
  1831  e856ec           call 0x48a                               
  1834  c746fe0000       mov word ptr [bp - 2], 0                 
  1839  bfae17           mov di, 0x17ae                           
  183c  837efe03         cmp word ptr [bp - 2], 3                 
  1840  7321             jae 0x1863                               
  1842  87f7             xchg di, si                              
  1844  e840f6           call 0xe87                               
  1847  87fe             xchg si, di                              
  1849  56               push si                                  
  184a  ff360c00         push word ptr [0xc]                      
  184e  e888f1           call 0x9d9                               
  1851  83060c000c       add word ptr [0xc], 0xc                  
  1856  3d0000           cmp ax, 0                                
  1859  7508             jne 0x1863                               
  185b  ff46fe           inc word ptr [bp - 2]                    
  185e  83c70c           add di, 0xc                              
  1861  ebd9             jmp 0x183c                               
  1863  837efe00         cmp word ptr [bp - 2], 0                 
  1867  7505             jne 0x186e                               
  1869  e86d00           call 0x18d9                              
  186c  eb65             jmp 0x18d3                               
  186e  8b5efe           mov bx, word ptr [bp - 2]                
  1871  4b               dec bx                                   
  1872  2e8a9f0200       mov bl, byte ptr cs:[bx + 2]             
  1877  895efe           mov word ptr [bp - 2], bx                
  187a  81c30218         add bx, 0x1802                           
  187e  8bfb             mov di, bx                               
  1880  87f7             xchg di, si                              
  1882  e802f6           call 0xe87                               
  1885  87fe             xchg si, di                              
  1887  56               push si                                  
  1888  8b3e0c00         mov di, word ptr [0xc]                   
  188c  57               push di                                  
  188d  8d45f4           lea ax, [di - 0xc]                       
  1890  a30c00           mov word ptr [0xc], ax                   
  1893  50               push ax                                  
  1894  e858e8           call 0xef                                
  1897  56               push si                                  
  1898  57               push di                                  
  1899  56               push si                                  
  189a  e820ea           call 0x2bd                               
  189d  e821f5           call 0xdc1                               
  18a0  57               push di                                  
  18a1  56               push si                                  
  18a2  56               push si                                  
  18a3  e84de8           call 0xf3                                
  18a6  ff360c00         push word ptr [0xc]                      
  18aa  56               push si                                  
  18ab  56               push si                                  
  18ac  e8dbeb           call 0x48a                               
  18af  83060c0018       add word ptr [0xc], 0x18                 
  18b4  e82200           call 0x18d9                              
  18b7  8b7efe           mov di, word ptr [bp - 2]                
  18ba  81c7de17         add di, 0x17de                           
  18be  87f7             xchg di, si                              
  18c0  e8c4f5           call 0xe87                               
  18c3  87fe             xchg si, di                              
  18c5  ff360c00         push word ptr [0xc]                      
  18c9  56               push si                                  
  18ca  56               push si                                  
  18cb  e825e8           call 0xf3                                
  18ce  83060c000c       add word ptr [0xc], 0xc                  
  18d3  5f               pop di                                   
  18d4  5e               pop si                                   
  18d5  8be5             mov sp, bp                               
  18d7  5d               pop bp                                   
  18d8  c3               ret                                      

res_1704_18d9:  ; ENTRY
  18d9  56               push si                                  
  18da  57               push di                                  
  18db  e88df5           call 0xe6b                               
  18de  837c08e0         cmp word ptr [si + 8], -0x20             
  18e2  7f07             jg 0x18eb                                
  18e4  8bfe             mov di, si                               
  18e6  e8bbf5           call 0xea4                               
  18e9  eb22             jmp 0x190d                               
  18eb  8b3e0c00         mov di, word ptr [0xc]                   
  18ef  83450803         add word ptr [di + 8], 3                 
  18f3  e850fb           call 0x1446                              
  18f6  2eff364c17       push word ptr cs:[0x174c]                
  18fb  b84e17           mov ax, 0x174e                           
  18fe  50               push ax                                  
  18ff  e84cfc           call 0x154e                              
  1902  57               push di                                  
  1903  56               push si                                  
  1904  56               push si                                  
  1905  e8b5e9           call 0x2bd                               
  1908  83060c000c       add word ptr [0xc], 0xc                  
  190d  5f               pop di                                   
  190e  5e               pop si                                   
  190f  c3               ret                                      
  1910  0d0000           or ax, 0                                 
  1913  0000             add byte ptr [bx + si], al               
  1915  0000             add byte ptr [bx + si], al               
  1917  0000             add byte ptr [bx + si], al               
  1919  0000             add byte ptr [bx + si], al               
  191b  0000             add byte ptr [bx + si], al               
  191d  0003             add byte ptr [bp + di], al               
  191f  0000             add byte ptr [bx + si], al               
  1921  0000             add byte ptr [bx + si], al               
  1923  0000             add byte ptr [bx + si], al               
  1925  40               inc ax                                   
  1926  0000             add byte ptr [bx + si], al               
  1928  0000             add byte ptr [bx + si], al               
  192a  a9aaaa           test ax, 0xaaaa                          
  192d  aa               stosb byte ptr es:[di], al               
  192e  aa               stosb byte ptr es:[di], al               
  192f  aa               stosb byte ptr es:[di], al               
  1930  aa               stosb byte ptr es:[di], al               
  1931  0a00             or al, byte ptr [bx + si]                
  1933  0000             add byte ptr [bx + si], al               
  1935  007855           add byte ptr [bx + si + 0x55], bh        
  1938  55               push bp                                  
  1939  55               push bp                                  
  193a  55               push bp                                  
  193b  55               push bp                                  
  193c  55               push bp                                  
  193d  0100             add word ptr [bx + si], ax               
  193f  0000             add byte ptr [bx + si], al               
  1941  00262322         add byte ptr [0x2223], ah                
  1945  2222             and ah, byte ptr [bp + si]               
  1947  2222             and ah, byte ptr [bp + si]               
  1949  0000             add byte ptr [bx + si], al               
  194b  0000             add byte ptr [bx + si], al               
  194d  001c             add byte ptr [si], bl                    
  194f  2bd8             sub bx, ax                               
  1951  822dd8           sub byte ptr [di], 0xd8                  
  1954  0200             add al, byte ptr [bx + si]               
  1956  0000             add byte ptr [bx + si], al               
  1958  0000             add byte ptr [bx + si], al               
  195a  fc               cld                                      
  195b  f9               stc                                      
  195c  334003           xor ax, word ptr [bx + si + 3]           
  195f  3400             xor al, 0                                
  1961  0000             add byte ptr [bx + si], al               
  1963  0000             add byte ptr [bx + si], al               
  1965  0014             add byte ptr [si], dl                    
  1967  52               push dx                                  
  1968  0334             add si, word ptr [si]                    
  196a  40               inc ax                                   
  196b  0300             add ax, word ptr [bx + si]               
  196d  0000             add byte ptr [bx + si], al               
  196f  0000             add byte ptr [bx + si], al               
  1971  001e6cc7         add byte ptr [0xc76c], bl                
  1975  3b2e0000         cmp bp, word ptr [0]                     
  1979  0000             add byte ptr [bx + si], al               
  197b  0000             add byte ptr [bx + si], al               
  197d  004cb0           add byte ptr [si - 0x50], cl             
  1980  c9               leave                                    
  1981  4f               dec di                                   
  1982  0200             add al, byte ptr [bx + si]               
  1984  0000             add byte ptr [bx + si], al               
  1986  0000             add byte ptr [bx + si], al               
  1988  0000             add byte ptr [bx + si], al               
  198a  91               xchg cx, ax                              
  198b  0e               push cs                                  
  198c  e61a             out 0x1a, al                             
  198e  0000             add byte ptr [bx + si], al               
  1990  0000             add byte ptr [bx + si], al               
  1992  0000             add byte ptr [bx + si], al               
  1994  0000             add byte ptr [bx + si], al               
  1996  51               push cx                                  
  1997  761f             jbe 0x19b8                               
  1999  0100             add word ptr [bx + si], ax               
  199b  0000             add byte ptr [bx + si], al               
  199d  0000             add byte ptr [bx + si], al               
  199f  0000             add byte ptr [bx + si], al               
  19a1  00c5             add ch, al                               
  19a3  2c0b             sub al, 0xb                              
  19a5  0000             add byte ptr [bx + si], al               
  19a7  0000             add byte ptr [bx + si], al               
  19a9  0000             add byte ptr [bx + si], al               
  19ab  0000             add byte ptr [bx + si], al               
  19ad  00               db 00                                    resync

res_1704_19ae:  ; ENTRY
  19ae  55               push bp                                  
  19af  56               push si                                  
  19b0  57               push di                                  
  19b1  8b2e0c00         mov bp, word ptr [0xc]                   
  19b5  8d7ef4           lea di, [bp - 0xc]                       
  19b8  893e0c00         mov word ptr [0xc], di                   
  19bc  e857f4           call 0xe16                               
  19bf  57               push di                                  
  19c0  56               push si                                  
  19c1  56               push si                                  
  19c2  e8f8e8           call 0x2bd                               
  19c5  892e0c00         mov word ptr [0xc], bp                   
  19c9  8b7c08           mov di, word ptr [si + 8]                
  19cc  83ffc0           cmp di, -0x40                            
  19cf  7e57             jle 0x1a28                               
  19d1  8b04             mov ax, word ptr [si]                    
  19d3  8b5c02           mov bx, word ptr [si + 2]                
  19d6  8b4c04           mov cx, word ptr [si + 4]                
  19d9  8b5406           mov dx, word ptr [si + 6]                
  19dc  47               inc di                                   
  19dd  7d17             jge 0x19f6                               
  19df  d1ea             shr dx, 1                                
  19e1  d1d9             rcr cx, 1                                
  19e3  d1db             rcr bx, 1                                
  19e5  d1d8             rcr ax, 1                                
  19e7  47               inc di                                   
  19e8  7cf5             jl 0x19df                                
  19ea  150000           adc ax, 0                                
  19ed  83d300           adc bx, 0                                
  19f0  83d100           adc cx, 0                                
  19f3  83d200           adc dx, 0                                
  19f6  832e0c000c       sub word ptr [0xc], 0xc                  
  19fb  fc               cld                                      
  19fc  8b3e0c00         mov di, word ptr [0xc]                   
  1a00  ab               stosw word ptr es:[di], ax               
  1a01  93               xchg bx, ax                              
  1a02  ab               stosw word ptr es:[di], ax               
  1a03  91               xchg cx, ax                              
  1a04  ab               stosw word ptr es:[di], ax               
  1a05  92               xchg dx, ax                              
  1a06  ab               stosw word ptr es:[di], ax               
  1a07  2bc0             sub ax, ax                               
  1a09  ab               stosw word ptr es:[di], ax               
  1a0a  aa               stosb byte ptr es:[di], al               
  1a0b  83ef0b           sub di, 0xb                              
  1a0e  2eff361019       push word ptr cs:[0x1910]                
  1a13  b81219           mov ax, 0x1912                           
  1a16  50               push ax                                  
  1a17  e834fb           call 0x154e                              
  1a1a  a10c00           mov ax, word ptr [0xc]                   
  1a1d  50               push ax                                  
  1a1e  56               push si                                  
  1a1f  56               push si                                  
  1a20  e89ae8           call 0x2bd                               
  1a23  83060c000c       add word ptr [0xc], 0xc                  
  1a28  5f               pop di                                   
  1a29  5e               pop si                                   
  1a2a  5d               pop bp                                   
  1a2b  c3               ret                                      
  1a2c  bbf017           mov bx, 0x17f0                           
  1a2f  5c               pop sp                                   
  1a30  293b             sub word ptr [bp + di], di               
  1a32  aa               stosb byte ptr es:[di], al               
  1a33  b80100           mov ax, 1                                
  1a36  0000             add byte ptr [bx + si], al               
  1a38  0900             or word ptr [bx + si], ax                
  1a3a  0000             add byte ptr [bx + si], al               
  1a3c  0000             add byte ptr [bx + si], al               
  1a3e  0000             add byte ptr [bx + si], al               
  1a40  0000             add byte ptr [bx + si], al               
  1a42  0000             add byte ptr [bx + si], al               
  1a44  0000             add byte ptr [bx + si], al               
  1a46  685555           push 0x5555                              
  1a49  55               push bp                                  
  1a4a  55               push bp                                  
  1a4b  55               push bp                                  
  1a4c  55               push bp                                  
  1a4d  050000           add ax, 0                                
  1a50  0000             add byte ptr [bx + si], al               
  1a52  ba3433           mov dx, 0x3334                           
  1a55  3333             xor si, word ptr [bp + di]               
  1a57  3333             xor si, word ptr [bp + di]               
  1a59  0000             add byte ptr [bx + si], al               
  1a5b  0000             add byte ptr [bx + si], al               
  1a5d  00a7c348         add byte ptr [bx + 0x48c3], ah           
  1a61  92               xchg dx, ax                              
  1a62  2449             and al, 0x49                             
  1a64  0200             add al, byte ptr [bx + si]               
  1a66  0000             add byte ptr [bx + si], al               
  1a68  0000             add byte ptr [bx + si], al               
  1a6a  4d               dec bp                                   
  1a6b  5d               pop bp                                   
  1a6c  22c7             and al, bh                               
  1a6e  711c             jno 0x1a8c                               
  1a70  0000             add byte ptr [bx + si], al               
  1a72  0000             add byte ptr [bx + si], al               
  1a74  0000             add byte ptr [bx + si], al               
  1a76  2456             and al, 0x56                             
  1a78  eb5c             jmp 0x1ad6                               
  1a7a  7401             je 0x1a7d                                
  1a7c  0000             add byte ptr [bx + si], al               
  1a7e  0000             add byte ptr [bx + si], al               
  1a80  0000             add byte ptr [bx + si], al               
  1a82  39adecb1         cmp word ptr [di - 0x4e14], bp           
  1a86  1300             adc ax, word ptr [bx + si]               
  1a88  0000             add byte ptr [bx + si], al               
  1a8a  0000             add byte ptr [bx + si], al               
  1a8c  0000             add byte ptr [bx + si], al               
  1a8e  fd               std                                      
  1a8f  d6               salc                                     
  1a90  800f01           or byte ptr [bx], 1                      
  1a93  0000             add byte ptr [bx + si], al               
  1a95  0000             add byte ptr [bx + si], al               
  1a97  0000             add byte ptr [bx + si], al               
  1a99  00b57ae4         add byte ptr [di - 0x1b86], dh           
  1a9d  1000             adc byte ptr [bx + si], al               
  1a9f  0000             add byte ptr [bx + si], al               
  1aa1  0000             add byte ptr [bx + si], al               
  1aa3  0000             add byte ptr [bx + si], al               
  1aa5  00               db 00                                    resync

res_1704_1aa6:  ; ENTRY
  1aa6  55               push bp                                  
  1aa7  8bec             mov bp, sp                               
  1aa9  ff7508           push word ptr [di + 8]                   
  1aac  56               push si                                  
  1aad  57               push di                                  
  1aae  8b05             mov ax, word ptr [di]                    
  1ab0  8b5d02           mov bx, word ptr [di + 2]                
  1ab3  8b4d04           mov cx, word ptr [di + 4]                
  1ab6  8b5506           mov dx, word ptr [di + 6]                
  1ab9  81fa05b5         cmp dx, 0xb505                           
  1abd  7710             ja 0x1acf                                
  1abf  d1e0             shl ax, 1                                
  1ac1  d1d3             rcl bx, 1                                
  1ac3  d1d1             rcl cx, 1                                
  1ac5  d1d2             rcl dx, 1                                
  1ac7  be0000           mov si, 0                                
  1aca  ff4efe           dec word ptr [bp - 2]                    
  1acd  eb15             jmp 0x1ae4                               
  1acf  f7d2             not dx                                   
  1ad1  f7d1             not cx                                   
  1ad3  f7d3             not bx                                   
  1ad5  f7d8             neg ax                                   
  1ad7  f5               cmc                                      
  1ad8  83d300           adc bx, 0                                
  1adb  83d100           adc cx, 0                                
  1ade  83d200           adc dx, 0                                
  1ae1  be0100           mov si, 1                                
  1ae4  2bff             sub di, di                               
  1ae6  0bd2             or dx, dx                                
  1ae8  7519             jne 0x1b03                               
  1aea  93               xchg bx, ax                              
  1aeb  91               xchg cx, ax                              
  1aec  92               xchg dx, ax                              
  1aed  83ef10           sub di, 0x10                             
  1af0  83ffc0           cmp di, -0x40                            
  1af3  7ff1             jg 0x1ae6                                
  1af5  832e0c000c       sub word ptr [0xc], 0xc                  
  1afa  8b3e0c00         mov di, word ptr [0xc]                   
  1afe  e826f3           call 0xe27                               
  1b01  eb2d             jmp 0x1b30                               
  1b03  780b             js 0x1b10                                
  1b05  4f               dec di                                   
  1b06  d1e0             shl ax, 1                                
  1b08  d1d3             rcl bx, 1                                
  1b0a  d1d1             rcl cx, 1                                
  1b0c  13d2             adc dx, dx                               
  1b0e  79f5             jns 0x1b05                               
  1b10  56               push si                                  
  1b11  57               push di                                  
  1b12  52               push dx                                  
  1b13  51               push cx                                  
  1b14  53               push bx                                  
  1b15  50               push ax                                  
  1b16  8bf4             mov si, sp                               
  1b18  e87b00           call 0x1b96                              
  1b1b  be2c1a           mov si, 0x1a2c                           
  1b1e  e866f3           call 0xe87                               
  1b21  8b360c00         mov si, word ptr [0xc]                   
  1b25  8bc4             mov ax, sp                               
  1b27  56               push si                                  
  1b28  50               push ax                                  
  1b29  56               push si                                  
  1b2a  e890e7           call 0x2bd                               
  1b2d  83c40c           add sp, 0xc                              
  1b30  8d76fe           lea si, [bp - 2]                         
  1b33  832e0c000c       sub word ptr [0xc], 0xc                  
  1b38  8b3e0c00         mov di, word ptr [0xc]                   
  1b3c  e8b9f3           call 0xef8                               
  1b3f  8d750c           lea si, [di + 0xc]                       
  1b42  56               push si                                  
  1b43  57               push di                                  
  1b44  57               push di                                  
  1b45  e8abe5           call 0xf3                                
  1b48  57               push di                                  
  1b49  ff76fc           push word ptr [bp - 4]                   
  1b4c  ff76fc           push word ptr [bp - 4]                   
  1b4f  e86be7           call 0x2bd                               
  1b52  83060c0018       add word ptr [0xc], 0x18                 
  1b57  5f               pop di                                   
  1b58  5e               pop si                                   
  1b59  8be5             mov sp, bp                               
  1b5b  5d               pop bp                                   
  1b5c  c3               ret                                      

res_1704_1b5d:  ; ENTRY
  1b5d  55               push bp                                  
  1b5e  8bec             mov bp, sp                               
  1b60  56               push si                                  
  1b61  57               push di                                  
  1b62  8bf7             mov si, di                               
  1b64  e804f3           call 0xe6b                               
  1b67  8b360c00         mov si, word ptr [0xc]                   
  1b6b  e82800           call 0x1b96                              
  1b6e  be2c1a           mov si, 0x1a2c                           
  1b71  e813f3           call 0xe87                               
  1b74  8b360c00         mov si, word ptr [0xc]                   
  1b78  56               push si                                  
  1b79  8d740c           lea si, [si + 0xc]                       
  1b7c  56               push si                                  
  1b7d  56               push si                                  
  1b7e  e83ce7           call 0x2bd                               
  1b81  56               push si                                  
  1b82  ff76fe           push word ptr [bp - 2]                   
  1b85  ff76fe           push word ptr [bp - 2]                   
  1b88  e832e7           call 0x2bd                               
  1b8b  83060c0018       add word ptr [0xc], 0x18                 
  1b90  5f               pop di                                   
  1b91  5e               pop si                                   
  1b92  8be5             mov sp, bp                               
  1b94  5d               pop bp                                   
  1b95  c3               ret                                      

res_1704_1b96:  ; ENTRY
  1b96  55               push bp                                  
  1b97  8bec             mov bp, sp                               
  1b99  56               push si                                  
  1b9a  57               push di                                  
  1b9b  837c08c0         cmp word ptr [si + 8], -0x40             
  1b9f  7e46             jle 0x1be7                               
  1ba1  832e0c000c       sub word ptr [0xc], 0xc                  
  1ba6  8b3e0c00         mov di, word ptr [0xc]                   
  1baa  e814f2           call 0xdc1                               
  1bad  ff4508           inc word ptr [di + 8]                    
  1bb0  56               push si                                  
  1bb1  57               push di                                  
  1bb2  57               push di                                  
  1bb3  e83de5           call 0xf3                                
  1bb6  56               push si                                  
  1bb7  57               push di                                  
  1bb8  57               push di                                  
  1bb9  e8cee8           call 0x48a                               
  1bbc  e8fbf2           call 0xeba                               
  1bbf  8b1e0c00         mov bx, word ptr [0xc]                   
  1bc3  83470802         add word ptr [bx + 8], 2                 
  1bc7  e87cf8           call 0x1446                              
  1bca  2eff36381a       push word ptr cs:[0x1a38]                
  1bcf  b83a1a           mov ax, 0x1a3a                           
  1bd2  50               push ax                                  
  1bd3  e878f9           call 0x154e                              
  1bd6  ff360c00         push word ptr [0xc]                      
  1bda  57               push di                                  
  1bdb  56               push si                                  
  1bdc  e8dee6           call 0x2bd                               
  1bdf  ff4408           inc word ptr [si + 8]                    
  1be2  83060c0018       add word ptr [0xc], 0x18                 
  1be7  5f               pop di                                   
  1be8  5e               pop si                                   
  1be9  8be5             mov sp, bp                               
  1beb  5d               pop bp                                   
  1bec  c3               ret                                      
  1bed  b100             mov cl, 0                                
  1bef  eb06             jmp 0x1bf7                               
  1bf1  b102             mov cl, 2                                
  1bf3  eb02             jmp 0x1bf7                               
  1bf5  b104             mov cl, 4                                
  1bf7  8ec7             mov es, di                               
  1bf9  8bec             mov bp, sp                               
  1bfb  8b3e0c00         mov di, word ptr [0xc]                   
  1bff  8a6d0a           mov ch, byte ptr [di + 0xa]              
  1c02  51               push cx                                  
  1c03  50               push ax                                  
  1c04  837d08e0         cmp word ptr [di + 8], -0x20             
  1c08  7f0b             jg 0x1c15                                
  1c0a  80f902           cmp cl, 2                                
  1c0d  7503             jne 0x1c12                               
  1c0f  e8aff1           call 0xdc1                               
  1c12  e9ba00           jmp 0x1ccf                               
  1c15  837d0840         cmp word ptr [di + 8], 0x40              
  1c19  7e0b             jle 0x1c26                               
  1c1b  e835f2           call 0xe53                               
  1c1e  c745062100       mov word ptr [di + 6], 0x21              
  1c23  e9a900           jmp 0x1ccf                               
  1c26  c6450a00         mov byte ptr [di + 0xa], 0               
  1c2a  8d75f4           lea si, [di - 0xc]                       
  1c2d  89360c00         mov word ptr [0xc], si                   
  1c31  87fe             xchg si, di                              
  1c33  e8bef1           call 0xdf4                               
  1c36  87fe             xchg si, di                              
  1c38  836c0802         sub word ptr [si + 8], 2                 
  1c3c  e892ec           call 0x8d1                               
  1c3f  2407             and al, 7                                
  1c41  8846fc           mov byte ptr [bp - 4], al                
  1c44  8a5efe           mov bl, byte ptr [bp - 2]                
  1c47  80fb04           cmp bl, 4                                
  1c4a  743b             je 0x1c87                                
  1c4c  025efc           add bl, byte ptr [bp - 4]                
  1c4f  80e307           and bl, 7                                
  1c52  885efc           mov byte ptr [bp - 4], bl                
  1c55  d1eb             shr bx, 1                                
  1c57  7311             jae 0x1c6a                               
  1c59  87fe             xchg si, di                              
  1c5b  e896f1           call 0xdf4                               
  1c5e  87fe             xchg si, di                              
  1c60  836c0802         sub word ptr [si + 8], 2                 
  1c64  56               push si                                  
  1c65  57               push di                                  
  1c66  57               push di                                  
  1c67  e885e4           call 0xef                                
  1c6a  893e0c00         mov word ptr [0xc], di                   
  1c6e  8bf7             mov si, di                               
  1c70  f646fc03         test byte ptr [bp - 4], 3                
  1c74  7a05             jp 0x1c7b                                
  1c76  e8a7fa           call 0x1720                              
  1c79  eb03             jmp 0x1c7e                               
  1c7b  e881fa           call 0x16ff                              
  1c7e  8a5efc           mov bl, byte ptr [bp - 4]                
  1c81  d0eb             shr bl, 1                                
  1c83  d0eb             shr bl, 1                                
  1c85  eb3c             jmp 0x1cc3                               
  1c87  f646fc01         test byte ptr [bp - 4], 1                
  1c8b  7411             je 0x1c9e                                
  1c8d  87f7             xchg di, si                              
  1c8f  e862f1           call 0xdf4                               
  1c92  87f7             xchg di, si                              
  1c94  836c0802         sub word ptr [si + 8], 2                 
  1c98  56               push si                                  
  1c99  57               push di                                  
  1c9a  57               push di                                  
  1c9b  e851e4           call 0xef                                
  1c9e  893e0c00         mov word ptr [0xc], di                   
  1ca2  8bf7             mov si, di                               
  1ca4  e889fa           call 0x1730                              
  1ca7  8d7cf4           lea di, [si - 0xc]                       
  1caa  8bc6             mov ax, si                               
  1cac  f646fc03         test byte ptr [bp - 4], 3                
  1cb0  7a02             jp 0x1cb4                                
  1cb2  87f7             xchg di, si                              
  1cb4  97               xchg di, ax                              
  1cb5  56               push si                                  
  1cb6  50               push ax                                  
  1cb7  57               push di                                  
  1cb8  e8cfe7           call 0x48a                               
  1cbb  8a5efc           mov bl, byte ptr [bp - 4]                
  1cbe  d0eb             shr bl, 1                                
  1cc0  80e301           and bl, 1                                
  1cc3  807efe02         cmp byte ptr [bp - 2], 2                 
  1cc7  7403             je 0x1ccc                                
  1cc9  325eff           xor bl, byte ptr [bp - 1]                
  1ccc  885d0a           mov byte ptr [di + 0xa], bl              
  1ccf  893e0c00         mov word ptr [0xc], di                   
  1cd3  8be5             mov sp, bp                               
  1cd5  c3               ret                                      
  1cd6  8ec7             mov es, di                               
  1cd8  8b360c00         mov si, word ptr [0xc]                   
  1cdc  8d7cf4           lea di, [si - 0xc]                       
  1cdf  893e0c00         mov word ptr [0xc], di                   
  1ce3  e8dbf0           call 0xdc1                               
  1ce6  8b4408           mov ax, word ptr [si + 8]                
  1ce9  3d0140           cmp ax, 0x4001                           
  1cec  7d38             jge 0x1d26                               
  1cee  3d01c0           cmp ax, 0xc001                           
  1cf1  7e2e             jle 0x1d21                               
  1cf3  b100             mov cl, 0                                
  1cf5  8bde             mov bx, si                               
  1cf7  48               dec ax                                   
  1cf8  7c07             jl 0x1d01                                
  1cfa  e8daf1           call 0xed7                               
  1cfd  8bdf             mov bx, di                               
  1cff  b101             mov cl, 1                                
  1d01  b500             mov ch, 0                                
  1d03  866f0a           xchg byte ptr [bx + 0xa], ch             
  1d06  51               push cx                                  
  1d07  e81cfb           call 0x1826                              
  1d0a  59               pop cx                                   
  1d0b  80f901           cmp cl, 1                                
  1d0e  750e             jne 0x1d1e                               
  1d10  51               push cx                                  
  1d11  e8e0f0           call 0xdf4                               
  1d14  ff4d08           dec word ptr [di + 8]                    
  1d17  57               push di                                  
  1d18  56               push si                                  
  1d19  56               push si                                  
  1d1a  e8d2e3           call 0xef                                
  1d1d  59               pop cx                                   
  1d1e  886c0a           mov byte ptr [si + 0xa], ch              
  1d21  89360c00         mov word ptr [0xc], si                   
  1d25  c3               ret                                      
  1d26  8bfe             mov di, si                               
  1d28  ff740a           push word ptr [si + 0xa]                 
  1d2b  e8c6f0           call 0xdf4                               
  1d2e  58               pop ax                                   
  1d2f  88440a           mov byte ptr [si + 0xa], al              
  1d32  ff4c08           dec word ptr [si + 8]                    
  1d35  ebea             jmp 0x1d21                               
  1d37  8ec7             mov es, di                               
  1d39  8b360c00         mov si, word ptr [0xc]                   
  1d3d  8d7cf4           lea di, [si - 0xc]                       
  1d40  893e0c00         mov word ptr [0xc], di                   
  1d44  e8cff0           call 0xe16                               
  1d47  eb22             jmp 0x1d6b                               
  1d49  8ec7             mov es, di                               
  1d4b  8b360c00         mov si, word ptr [0xc]                   
  1d4f  8d7cf4           lea di, [si - 0xc]                       
  1d52  893e0c00         mov word ptr [0xc], di                   
  1d56  e868f0           call 0xdc1                               
  1d59  eb10             jmp 0x1d6b                               
  1d5b  8ec7             mov es, di                               
  1d5d  8b360c00         mov si, word ptr [0xc]                   
  1d61  8d7cf4           lea di, [si - 0xc]                       
  1d64  893e0c00         mov word ptr [0xc], di                   
  1d68  e89af0           call 0xe05                               
  1d6b  e869f1           call 0xed7                               
  1d6e  807d0a00         cmp byte ptr [di + 0xa], 0               
  1d72  7519             jne 0x1d8d                               
  1d74  8b4508           mov ax, word ptr [di + 8]                
  1d77  3d01c0           cmp ax, 0xc001                           
  1d7a  7e0d             jle 0x1d89                               
  1d7c  3d0140           cmp ax, 0x4001                           
  1d7f  7d0c             jge 0x1d8d                               
  1d81  e822fd           call 0x1aa6                              
  1d84  89360c00         mov word ptr [0xc], si                   
  1d88  c3               ret                                      
  1d89  b504             mov ch, 4                                
  1d8b  eb02             jmp 0x1d8f                               
  1d8d  b501             mov ch, 1                                
  1d8f  e88209           call 0x2714                              
  1d92  b80140           mov ax, 0x4001                           
  1d95  8bfe             mov di, si                               
  1d97  b100             mov cl, 0                                
  1d99  e8a1f0           call 0xe3d                               
  1d9c  80fd01           cmp ch, 1                                
  1d9f  75e3             jne 0x1d84                               
  1da1  c7450600c0       mov word ptr [di + 6], 0xc000            
  1da6  ebdc             jmp 0x1d84                               
  1da8  b8e30d           mov ax, 0xde3                            
  1dab  eb0e             jmp 0x1dbb                               
  1dad  8ec7             mov es, di                               
  1daf  8b360c00         mov si, word ptr [0xc]                   
  1db3  8d7cf4           lea di, [si - 0xc]                       
  1db6  eb1c             jmp 0x1dd4                               
  1db8  b8d20d           mov ax, 0xdd2                            
  1dbb  8ec7             mov es, di                               
  1dbd  8b360c00         mov si, word ptr [0xc]                   
  1dc1  8d7cf4           lea di, [si - 0xc]                       
  1dc4  893e0c00         mov word ptr [0xc], di                   
  1dc8  ffd0             call ax                                  
  1dca  56               push si                                  
  1dcb  57               push di                                  
  1dcc  56               push si                                  
  1dcd  e8ede4           call 0x2bd                               
  1dd0  89360c00         mov word ptr [0xc], si                   
  1dd4  8bec             mov bp, sp                               
  1dd6  b80000           mov ax, 0                                
  1dd9  50               push ax                                  
  1dda  8b4408           mov ax, word ptr [si + 8]                
  1ddd  3d0c00           cmp ax, 0xc                              
  1de0  7f4e             jg 0x1e30                                
  1de2  3dc0ff           cmp ax, 0xffc0                           
  1de5  7e75             jle 0x1e5c                               
  1de7  e8d0f0           call 0xeba                               
  1dea  ff4508           inc word ptr [di + 8]                    
  1ded  ff360200         push word ptr [2]                        
  1df1  80260300f3       and byte ptr [3], 0xf3                   
  1df6  800e030004       or byte ptr [3], 4                       
  1dfb  8bf7             mov si, di                               
  1dfd  e837f5           call 0x1337                              
  1e00  8f060200         pop word ptr [2]                         
  1e04  50               push ax                                  
  1e05  8bfc             mov di, sp                               
  1e07  e831f1           call 0xf3b                               
  1e0a  ff4c08           dec word ptr [si + 8]                    
  1e0d  8d7c0c           lea di, [si + 0xc]                       
  1e10  57               push di                                  
  1e11  56               push si                                  
  1e12  57               push di                                  
  1e13  e8d9e2           call 0xef                                
  1e16  58               pop ax                                   
  1e17  d1f8             sar ax, 1                                
  1e19  735d             jae 0x1e78                               
  1e1b  c7048564         mov word ptr [si], 0x6485                
  1e1f  c74402def9       mov word ptr [si + 2], 0xf9de            
  1e24  c7440433f3       mov word ptr [si + 4], 0xf333            
  1e29  c7440604b5       mov word ptr [si + 6], 0xb504            
  1e2e  eb5b             jmp 0x1e8b                               
  1e30  3d0140           cmp ax, 0x4001                           
  1e33  7510             jne 0x1e45                               
  1e35  b8ff7f           mov ax, 0x7fff                           
  1e38  234406           and ax, word ptr [si + 6]                
  1e3b  0b4404           or ax, word ptr [si + 4]                 
  1e3e  0b4402           or ax, word ptr [si + 2]                 
  1e41  0b04             or ax, word ptr [si]                     
  1e43  751e             jne 0x1e63                               
  1e45  807c0a00         cmp byte ptr [si + 0xa], 0               
  1e49  7526             jne 0x1e71                               
  1e4b  8bfe             mov di, si                               
  1e4d  b508             mov ch, 8                                
  1e4f  e8c208           call 0x2714                              
  1e52  b80140           mov ax, 0x4001                           
  1e55  b100             mov cl, 0                                
  1e57  e8e3ef           call 0xe3d                               
  1e5a  eb55             jmp 0x1eb1                               
  1e5c  8bfe             mov di, si                               
  1e5e  e860ef           call 0xdc1                               
  1e61  eb4e             jmp 0x1eb1                               
  1e63  c7440600c0       mov word ptr [si + 6], 0xc000            
  1e68  8bfe             mov di, si                               
  1e6a  b501             mov ch, 1                                
  1e6c  e8a508           call 0x2714                              
  1e6f  eb40             jmp 0x1eb1                               
  1e71  8bfe             mov di, si                               
  1e73  e8b1ef           call 0xe27                               
  1e76  eb39             jmp 0x1eb1                               
  1e78  c7040000         mov word ptr [si], 0                     
  1e7c  c744020000       mov word ptr [si + 2], 0                 
  1e81  c744040000       mov word ptr [si + 4], 0                 
  1e86  c744060080       mov word ptr [si + 6], 0x8000            
  1e8b  40               inc ax                                   
  1e8c  894408           mov word ptr [si + 8], ax                
  1e8f  c6440a00         mov byte ptr [si + 0xa], 0               
  1e93  8bfe             mov di, si                               
  1e95  8d750c           lea si, [di + 0xc]                       
  1e98  e813fb           call 0x19ae                              
  1e9b  56               push si                                  
  1e9c  57               push di                                  
  1e9d  56               push si                                  
  1e9e  e81ce4           call 0x2bd                               
  1ea1  56               push si                                  
  1ea2  57               push di                                  
  1ea3  56               push si                                  
  1ea4  e84ce2           call 0xf3                                
  1ea7  807efe01         cmp byte ptr [bp - 2], 1                 
  1eab  7504             jne 0x1eb1                               
  1ead  80740a01         xor byte ptr [si + 0xa], 1               
  1eb1  89360c00         mov word ptr [0xc], si                   
  1eb5  8be5             mov sp, bp                               
  1eb7  c3               ret                                      

res_1704_1eb8:  ; ENTRY
  1eb8  53               push bx                                  
  1eb9  51               push cx                                  
  1eba  52               push dx                                  
  1ebb  b104             mov cl, 4                                
  1ebd  b50a             mov ch, 0xa                              
  1ebf  268b1c           mov bx, word ptr es:[si]                 
  1ec2  8ac7             mov al, bh                               
  1ec4  d2e8             shr al, cl                               
  1ec6  f6e5             mul ch                                   
  1ec8  b20f             mov dl, 0xf                              
  1eca  22d7             and dl, bh                               
  1ecc  02c2             add al, dl                               
  1ece  f6e5             mul ch                                   
  1ed0  baf000           mov dx, 0xf0                             
  1ed3  22d3             and dl, bl                               
  1ed5  d3ea             shr dx, cl                               
  1ed7  03c2             add ax, dx                               
  1ed9  b90a00           mov cx, 0xa                              
  1edc  f7e1             mul cx                                   
  1ede  83e30f           and bx, 0xf                              
  1ee1  03c3             add ax, bx                               
  1ee3  5a               pop dx                                   
  1ee4  59               pop cx                                   
  1ee5  5b               pop bx                                   
  1ee6  c3               ret                                      

res_1704_1ee7:  ; ENTRY
  1ee7  55               push bp                                  
  1ee8  8bec             mov bp, sp                               
  1eea  56               push si                                  
  1eeb  57               push di                                  
  1eec  268a4409         mov al, byte ptr es:[si + 9]             
  1ef0  258000           and ax, 0x80                             
  1ef3  d0c0             rol al, 1                                
  1ef5  88450a           mov byte ptr [di + 0xa], al              
  1ef8  b104             mov cl, 4                                
  1efa  268a4408         mov al, byte ptr es:[si + 8]             
  1efe  d3e0             shl ax, cl                               
  1f00  d2e8             shr al, cl                               
  1f02  d50a             aad 0xa                                  
  1f04  bf1027           mov di, 0x2710                           
  1f07  f7e7             mul di                                   
  1f09  93               xchg bx, ax                              
  1f0a  8d7406           lea si, [si + 6]                         
  1f0d  e8a8ff           call 0x1eb8                              
  1f10  03c3             add ax, bx                               
  1f12  12d6             adc dl, dh                               
  1f14  8bda             mov bx, dx                               
  1f16  f7e7             mul di                                   
  1f18  93               xchg bx, ax                              
  1f19  8bca             mov cx, dx                               
  1f1b  f7e7             mul di                                   
  1f1d  03c8             add cx, ax                               
  1f1f  12d6             adc dl, dh                               
  1f21  83ee02           sub si, 2                                
  1f24  e891ff           call 0x1eb8                              
  1f27  03c3             add ax, bx                               
  1f29  83d100           adc cx, 0                                
  1f2c  12d6             adc dl, dh                               
  1f2e  56               push si                                  
  1f2f  8bda             mov bx, dx                               
  1f31  f7e7             mul di                                   
  1f33  91               xchg cx, ax                              
  1f34  8bf2             mov si, dx                               
  1f36  f7e7             mul di                                   
  1f38  93               xchg bx, ax                              
  1f39  87fa             xchg dx, di                              
  1f3b  f7e2             mul dx                                   
  1f3d  03de             add bx, si                               
  1f3f  13f8             adc di, ax                               
  1f41  5e               pop si                                   
  1f42  83ee02           sub si, 2                                
  1f45  e870ff           call 0x1eb8                              
  1f48  03c1             add ax, cx                               
  1f4a  13da             adc bx, dx                               
  1f4c  13fa             adc di, dx                               
  1f4e  be1027           mov si, 0x2710                           
  1f51  f7e6             mul si                                   
  1f53  93               xchg bx, ax                              
  1f54  8bca             mov cx, dx                               
  1f56  f7e6             mul si                                   
  1f58  96               xchg si, ax                              
  1f59  87fa             xchg dx, di                              
  1f5b  f7e2             mul dx                                   
  1f5d  03ce             add cx, si                               
  1f5f  13f8             adc di, ax                               
  1f61  83d200           adc dx, 0                                
  1f64  8b76fe           mov si, word ptr [bp - 2]                
  1f67  e84eff           call 0x1eb8                              
  1f6a  03d8             add bx, ax                               
  1f6c  83d100           adc cx, 0                                
  1f6f  83d700           adc di, 0                                
  1f72  83d200           adc dx, 0                                
  1f75  b84000           mov ax, 0x40                             
  1f78  0bd2             or dx, dx                                
  1f7a  750d             jne 0x1f89                               
  1f7c  2d1000           sub ax, 0x10                             
  1f7f  742c             je 0x1fad                                
  1f81  87d7             xchg di, dx                              
  1f83  87f9             xchg cx, di                              
  1f85  87cb             xchg bx, cx                              
  1f87  ebef             jmp 0x1f78                               
  1f89  780b             js 0x1f96                                
  1f8b  48               dec ax                                   
  1f8c  d1e3             shl bx, 1                                
  1f8e  d1d1             rcl cx, 1                                
  1f90  d1d7             rcl di, 1                                
  1f92  13d2             adc dx, dx                               
  1f94  79f5             jns 0x1f8b                               
  1f96  8b76fc           mov si, word ptr [bp - 4]                
  1f99  891c             mov word ptr [si], bx                    
  1f9b  894c02           mov word ptr [si + 2], cx                
  1f9e  897c04           mov word ptr [si + 4], di                
  1fa1  895406           mov word ptr [si + 6], dx                
  1fa4  894408           mov word ptr [si + 8], ax                
  1fa7  5f               pop di                                   
  1fa8  5e               pop si                                   
  1fa9  8be5             mov sp, bp                               
  1fab  5d               pop bp                                   
  1fac  c3               ret                                      
  1fad  b801c0           mov ax, 0xc001                           
  1fb0  ebe4             jmp 0x1f96                               

res_1704_1fb2:  ; ENTRY
  1fb2  50               push ax                                  
  1fb3  51               push cx                                  
  1fb4  b064             mov al, 0x64                             
  1fb6  b104             mov cl, 4                                
  1fb8  92               xchg dx, ax                              
  1fb9  f6f2             div dl                                   
res_1704_1fbb:  ; case
  1fbb  8ad4             mov dl, ah                               
  1fbd  d40a             aam 0xa                                  
  1fbf  d2e4             shl ah, cl                               
  1fc1  0ae0             or ah, al                                
  1fc3  92               xchg dx, ax                              
  1fc4  d40a             aam 0xa                                  
  1fc6  d2e4             shl ah, cl                               
  1fc8  0ac4             or al, ah                                
  1fca  8ae6             mov ah, dh                               
  1fcc  ab               stosw word ptr es:[di], ax               
  1fcd  59               pop cx                                   
  1fce  58               pop ax                                   
  1fcf  c3               ret                                      

res_1704_1fd0:  ; ENTRY
  1fd0  55               push bp                                  
  1fd1  8bec             mov bp, sp                               
  1fd3  56               push si                                  
  1fd4  57               push di                                  
  1fd5  fc               cld                                      
  1fd6  8b4408           mov ax, word ptr [si + 8]                
  1fd9  8b1c             mov bx, word ptr [si]                    
  1fdb  8b4c02           mov cx, word ptr [si + 2]                
  1fde  8b5406           mov dx, word ptr [si + 6]                
  1fe1  8b7404           mov si, word ptr [si + 4]                
  1fe4  3d0000           cmp ax, 0                                
  1fe7  7c38             jl 0x2021                                
  1fe9  2d3c00           sub ax, 0x3c                             
  1fec  7c1f             jl 0x200d                                
  1fee  7f33             jg 0x2023                                
  1ff0  81fa0bde         cmp dx, 0xde0b                           
  1ff4  7217             jb 0x200d                                
  1ff6  772b             ja 0x2023                                
  1ff8  81fe3a6b         cmp si, 0x6b3a                           
  1ffc  720f             jb 0x200d                                
  1ffe  7723             ja 0x2023                                
  2000  81f93f76         cmp cx, 0x763f                           
  2004  7207             jb 0x200d                                
  2006  771b             ja 0x2023                                
  2008  83fbf0           cmp bx, -0x10                            
  200b  7716             ja 0x2023                                
  200d  b400             mov ah, 0                                
  200f  2c04             sub al, 4                                
  2011  0410             add al, 0x10                             
  2013  7f10             jg 0x2025                                
  2015  8ae7             mov ah, bh                               
  2017  8bd9             mov bx, cx                               
  2019  8bce             mov cx, si                               
  201b  8bf2             mov si, dx                               
  201d  2bd2             sub dx, dx                               
  201f  ebf0             jmp 0x2011                               
  2021  eb67             jmp 0x208a                               
  2023  eb6e             jmp 0x2093                               
  2025  2c10             sub al, 0x10                             
  2027  7d0e             jge 0x2037                               
  2029  d1ea             shr dx, 1                                
  202b  d1de             rcr si, 1                                
  202d  d1d9             rcr cx, 1                                
  202f  d1db             rcr bx, 1                                
  2031  d0dc             rcr ah, 1                                
  2033  fec0             inc al                                   
  2035  7cf2             jl 0x2029                                
  2037  02e4             add ah, ah                               
  2039  83d300           adc bx, 0                                
  203c  83d100           adc cx, 0                                
  203f  83d600           adc si, 0                                
  2042  83d200           adc dx, 0                                
  2045  96               xchg si, ax                              
  2046  be1027           mov si, 0x2710                           
  2049  f7f6             div si                                   
  204b  91               xchg cx, ax                              
  204c  f7f6             div si                                   
  204e  93               xchg bx, ax                              
  204f  f7f6             div si                                   
  2051  e85eff           call 0x1fb2                              
  2054  2bd2             sub dx, dx                               
  2056  91               xchg cx, ax                              
  2057  f7f6             div si                                   
  2059  93               xchg bx, ax                              
  205a  f7f6             div si                                   
  205c  91               xchg cx, ax                              
  205d  f7f6             div si                                   
  205f  e850ff           call 0x1fb2                              
  2062  8bd3             mov dx, bx                               
  2064  91               xchg cx, ax                              
  2065  f7f6             div si                                   
  2067  91               xchg cx, ax                              
  2068  f7f6             div si                                   
  206a  e845ff           call 0x1fb2                              
  206d  8bd1             mov dx, cx                               
  206f  f7f6             div si                                   
  2071  e83eff           call 0x1fb2                              
  2074  d40a             aam 0xa                                  
  2076  b104             mov cl, 4                                
  2078  d2e4             shl ah, cl                               
  207a  0ac4             or al, ah                                
  207c  aa               stosb byte ptr es:[di], al               
  207d  8b76fe           mov si, word ptr [bp - 2]                
  2080  8a440a           mov al, byte ptr [si + 0xa]              
  2083  d0c8             ror al, 1                                
  2085  aa               stosb byte ptr es:[di], al               
  2086  5f               pop di                                   
  2087  5e               pop si                                   
  2088  5d               pop bp                                   
  2089  c3               ret                                      
  208a  b000             mov al, 0                                
  208c  b90900           mov cx, 9                                
  208f  f3aa             rep stosb byte ptr es:[di], al           
  2091  ebea             jmp 0x207d                               
  2093  b508             mov ch, 8                                
  2095  e87c06           call 0x2714                              
  2098  b099             mov al, 0x99                             
  209a  ebf0             jmp 0x208c                               
  209c  a921b321bd21c721 dw 21a9,21b3,21bd,21c7,21d1,21d8,21f6,21df,2587,25fc,266c,266e,0b89,108a,0c8d,0ef8,2287,228e,2298,2295,229f,229e,22a7,22a6,0b89,108a,0c8d,0ef8,0b0f,10e2,0be6,0f3b,231f,2319,2380,23ee,2328,23fe,2319,23de,2333,2319,235c,241b,23b2,2428,23b7,240e,01b5,13e8 jump table
  2100  06               push es                                  
  2101  e99805           jmp 0x269c                               
  2104  7724             ja 0x212a                                
  2106  f6c420           test ah, 0x20                            
  2109  75f1             jne 0x20fc                               
  210b  42               inc dx                                   
  210c  8ac4             mov al, ah                               
  210e  8cdf             mov di, ds                               
  2110  24c0             and al, 0xc0                             
  2112  740e             je 0x2122                                
  2114  3c80             cmp al, 0x80                             
  2116  8cd7             mov di, ss                               
  2118  7208             jb 0x2122                                
  211a  8b7e00           mov di, word ptr [bp]                    
  211d  7703             ja 0x2122                                
  211f  8b7e14           mov di, word ptr [bp + 0x14]             
  2122  26ac             lodsb al, byte ptr es:[si]               
  2124  86e0             xchg al, ah                              
  2126  2407             and al, 7                                
  2128  eb48             jmp 0x2172                               
  212a  3c09             cmp al, 9                                
  212c  751f             jne 0x214d                               
  212e  36a00700         mov al, byte ptr ss:[7]                  
  2132  8cc3             mov bx, es                               
  2134  80e3f8           and bl, 0xf8                             
  2137  368e1e0a00       mov ds, word ptr ss:[0xa]                
  213c  304705           xor byte ptr [bx + 5], al                
  213f  06               push es                                  
  2140  07               pop es                                   
  2141  26c744fd89e4     mov word ptr es:[si - 3], 0xe489         
  2147  304705           xor byte ptr [bx + 5], al                
  214a  e94f05           jmp 0x269c                               
  214d  e90106           jmp 0x2751                               
  2150  3400             xor al, 0                                
  2152  fb               sti                                      
  2153  fc               cld                                      
  2154  50               push ax                                  
  2155  51               push cx                                  
  2156  52               push dx                                  
  2157  53               push bx                                  
  2158  1e               push ds                                  
  2159  55               push bp                                  
  215a  56               push si                                  
  215b  57               push di                                  
  215c  06               push es                                  
  215d  8bec             mov bp, sp                               
  215f  36892e3200       mov word ptr ss:[0x32], bp               
  2164  c47612           les si, ptr [bp + 0x12]                  
  2167  4e               dec si                                   
  2168  b200             mov dl, 0                                
  216a  26ad             lodsw ax, word ptr es:[si]               
  216c  2c34             sub al, 0x34                             
  216e  3c08             cmp al, 8                                
  2170  7392             jae 0x2104                               
  2172  bb07c0           mov bx, 0xc007                           
  2175  22dc             and bl, ah                               
  2177  22fc             and bh, ah                               
  2179  91               xchg cx, ax                              
  217a  80ffc0           cmp bh, 0xc0                             
  217d  7367             jae 0x21e6                               
  217f  80ff40           cmp bh, 0x40                             
  2182  7712             ja 0x2196                                
  2184  7414             je 0x219a                                
  2186  2bc0             sub ax, ax                               
  2188  80fb06           cmp bl, 6                                
  218b  7510             jne 0x219d                               
  218d  26ad             lodsw ax, word ptr es:[si]               
  218f  897612           mov word ptr [bp + 0x12], si             
  2192  8cde             mov si, ds                               
  2194  eb65             jmp 0x21fb                               
  2196  26ad             lodsw ax, word ptr es:[si]               
  2198  eb03             jmp 0x219d                               
  219a  26ac             lodsb al, byte ptr es:[si]               
  219c  98               cwde                                     
  219d  897612           mov word ptr [bp + 0x12], si             
  21a0  b700             mov bh, 0                                
  21a2  d1e3             shl bx, 1                                
  21a4  2effa79c20       jmp word ptr cs:[bx + 0x209c]            
res_1704_21a9:  ; case
  21a9  03460a           add ax, word ptr [bp + 0xa]              
  21ac  034604           add ax, word ptr [bp + 4]                
  21af  8cde             mov si, ds                               
  21b1  eb48             jmp 0x21fb                               
res_1704_21b3:  ; case
  21b3  03460a           add ax, word ptr [bp + 0xa]              
  21b6  034602           add ax, word ptr [bp + 2]                
  21b9  8cde             mov si, ds                               
  21bb  eb3e             jmp 0x21fb                               
res_1704_21bd:  ; case
  21bd  034606           add ax, word ptr [bp + 6]                
  21c0  034604           add ax, word ptr [bp + 4]                
  21c3  8cd6             mov si, ss                               
  21c5  eb34             jmp 0x21fb                               
res_1704_21c7:  ; case
  21c7  034606           add ax, word ptr [bp + 6]                
  21ca  034602           add ax, word ptr [bp + 2]                
  21cd  8cd6             mov si, ss                               
  21cf  eb2a             jmp 0x21fb                               
res_1704_21d1:  ; case
  21d1  034604           add ax, word ptr [bp + 4]                
  21d4  8cde             mov si, ds                               
  21d6  eb23             jmp 0x21fb                               
res_1704_21d8:  ; case
  21d8  034602           add ax, word ptr [bp + 2]                
  21db  8cde             mov si, ds                               
  21dd  eb1c             jmp 0x21fb                               
res_1704_21df:  ; case
  21df  03460a           add ax, word ptr [bp + 0xa]              
  21e2  8cde             mov si, ds                               
  21e4  eb15             jmp 0x21fb                               
  21e6  897612           mov word ptr [bp + 0x12], si             
  21e9  8cd0             mov ax, ss                               
  21eb  8ed8             mov ds, ax                               
  21ed  8ec0             mov es, ax                               
  21ef  f6c101           test cl, 1                               
  21f2  7433             je 0x2227                                
  21f4  eb17             jmp 0x220d                               
res_1704_21f6:  ; case
  21f6  034606           add ax, word ptr [bp + 6]                
  21f9  8cd6             mov si, ss                               
  21fb  96               xchg si, ax                              
  21fc  80fa01           cmp dl, 1                                
  21ff  75               db 75                                    resync
res_1704_2200:  ; case
  2200  01978ec0         add word ptr [bx - 0x3f72], dx           
  2204  8cd0             mov ax, ss                               
  2206  8ed8             mov ds, ax                               
  2208  f6c101           test cl, 1                               
  220b  741a             je 0x2227                                
  220d  80fdc0           cmp ch, 0xc0                             
  2210  7303             jae 0x2215                               
  2212  e99900           jmp 0x22ae                               
  2215  f6c520           test ch, 0x20                            
  2218  7503             jne 0x221d                               
  221a  e93802           jmp 0x2455                               
  221d  bb0600           mov bx, 6                                
  2220  22d9             and bl, cl                               
  2222  2effa7ac20       jmp word ptr cs:[bx + 0x20ac]            
  2227  b83800           mov ax, 0x38                             
  222a  22c5             and al, ch                               
  222c  d1e8             shr ax, 1                                
  222e  d1e8             shr ax, 1                                
  2230  95               xchg bp, ax                              
  2231  80fdc0           cmp ch, 0xc0                             
  2234  732a             jae 0x2260                               
  2236  8b3e0c00         mov di, word ptr [0xc]                   
  223a  83ef0c           sub di, 0xc                              
  223d  893e0c00         mov word ptr [0xc], di                   
  2241  bb0600           mov bx, 6                                
  2244  22d9             and bl, cl                               
  2246  2eff97b420       call word ptr cs:[bx + 0x20b4]           
  224b  8cd1             mov cx, ss                               
  224d  8ec1             mov es, cx                               
  224f  be0c00           mov si, 0xc                              
  2252  8bdf             mov bx, di                               
  2254  8d00             lea ax, [bx + si]                        
  2256  8bd0             mov dx, ax                               
  2258  b99726           mov cx, 0x2697                           
  225b  2effa6bc20       jmp word ptr cs:[bp + 0x20bc]            
  2260  b700             mov bh, 0                                
  2262  2e8a9f0200       mov bl, byte ptr cs:[bx + 2]             
  2267  a10c00           mov ax, word ptr [0xc]                   
  226a  03d8             add bx, ax                               
  226c  f6c104           test cl, 4                               
  226f  8bd0             mov dx, ax                               
  2271  7402             je 0x2275                                
  2273  8bd3             mov dx, bx                               
  2275  2bf6             sub si, si                               
  2277  f6c102           test cl, 2                               
  227a  7403             je 0x227f                                
  227c  be0c00           mov si, 0xc                              
  227f  b99726           mov cx, 0x2697                           
  2282  2effa6bc20       jmp word ptr cs:[bp + 0x20bc]            
res_1704_2287:  ; case
  2287  50               push ax                                  
  2288  53               push bx                                  
  2289  52               push dx                                  
  228a  51               push cx                                  
  228b  e965de           jmp 0xf3                                 
res_1704_228e:  ; case
  228e  50               push ax                                  
  228f  53               push bx                                  
  2290  52               push dx                                  
  2291  51               push cx                                  
  2292  e928e0           jmp 0x2bd                                
res_1704_2295:  ; case
  2295  83c60c           add si, 0xc                              
res_1704_2298:  ; case
  2298  50               push ax                                  
  2299  53               push bx                                  
  229a  51               push cx                                  
  229b  e93be7           jmp 0x9d9                                
res_1704_229e:  ; case
  229e  93               xchg bx, ax                              
res_1704_229f:  ; case
  229f  50               push ax                                  
  22a0  53               push bx                                  
  22a1  52               push dx                                  
  22a2  51               push cx                                  
  22a3  e949de           jmp 0xef                                 
res_1704_22a6:  ; case
  22a6  93               xchg bx, ax                              
res_1704_22a7:  ; case
  22a7  50               push ax                                  
  22a8  53               push bx                                  
  22a9  52               push dx                                  
  22aa  51               push cx                                  
  22ab  e9dce1           jmp 0x48a                                
  22ae  bd0600           mov bp, 6                                
  22b1  23e9             and bp, cx                               
  22b3  f6c520           test ch, 0x20                            
  22b6  7542             jne 0x22fa                               
  22b8  f6c510           test ch, 0x10                            
  22bb  751a             jne 0x22d7                               
  22bd  f6c508           test ch, 8                               
  22c0  7554             jne 0x2316                               
  22c2  8b3e0c00         mov di, word ptr [0xc]                   
  22c6  b8f4ff           mov ax, 0xfff4                           
  22c9  03f8             add di, ax                               
  22cb  a30400           mov word ptr [4], ax                     
  22ce  b89226           mov ax, 0x2692                           
  22d1  50               push ax                                  
  22d2  2effa6cc20       jmp word ptr cs:[bp + 0x20cc]            
  22d7  8b3e0c00         mov di, word ptr [0xc]                   
  22db  87f7             xchg di, si                              
  22dd  f6c508           test ch, 8                               
  22e0  7509             jne 0x22eb                               
  22e2  b89c26           mov ax, 0x269c                           
  22e5  50               push ax                                  
  22e6  2effa6d420       jmp word ptr cs:[bp + 0x20d4]            
  22eb  c70604000c00     mov word ptr [4], 0xc                    
  22f1  b89226           mov ax, 0x2692                           
  22f4  50               push ax                                  
  22f5  2effa6d420       jmp word ptr cs:[bp + 0x20d4]            
  22fa  b80800           mov ax, 8                                
  22fd  22c5             and al, ch                               
  22ff  0be8             or bp, ax                                
  2301  b89c26           mov ax, 0x269c                           
  2304  50               push ax                                  
  2305  f6c510           test ch, 0x10                            
  2308  7505             jne 0x230f                               
  230a  2effa6dc20       jmp word ptr cs:[bp + 0x20dc]            
  230f  87f7             xchg di, si                              
  2311  2effa6ec20       jmp word ptr cs:[bp + 0x20ec]            
  2316  e98303           jmp 0x269c                               
res_1704_2319:  ; case
  2319  b501             mov ch, 1                                
  231b  e8f603           call 0x2714                              
  231e  c3               ret                                      
res_1704_231f:  ; case
  231f  b104             mov cl, 4                                
  2321  268b4402         mov ax, word ptr es:[si + 2]             
  2325  a30000           mov word ptr [0], ax                     
res_1704_2328:  ; case
  2328  268b04           mov ax, word ptr es:[si]                 
  232b  a30200           mov word ptr [2], ax                     
  232e  b500             mov ch, 0                                
  2330  e9e103           jmp 0x2714                               
res_1704_2333:  ; case
  2333  e87c00           call 0x23b2                              
  2336  e87e00           call 0x23b7                              
  2339  a11000           mov ax, word ptr [0x10]                  
  233c  2b060c00         sub ax, word ptr [0xc]                   
  2340  b96000           mov cx, 0x60                             
  2343  3bc1             cmp ax, cx                               
  2345  7201             jb 0x2348                                
  2347  91               xchg cx, ax                              
  2348  b20c             mov dl, 0xc                              
  234a  f6f2             div dl                                   
  234c  91               xchg cx, ax                              
  234d  03c9             add cx, cx                               
  234f  b8ffff           mov ax, 0xffff                           
  2352  d3e8             shr ax, cl                               
  2354  ab               stosw word ptr es:[di], ax               
  2355  2bc0             sub ax, ax                               
  2357  ab               stosw word ptr es:[di], ax               
  2358  ab               stosw word ptr es:[di], ax               
  2359  ab               stosw word ptr es:[di], ax               
  235a  ab               stosw word ptr es:[di], ax               
  235b  c3               ret                                      
res_1704_235c:  ; case
  235c  e8d4ff           call 0x2333                              
  235f  8b360c00         mov si, word ptr [0xc]                   
  2363  268b6df6         mov bp, word ptr es:[di - 0xa]           
  2367  f7dd             neg bp                                   
  2369  4d               dec bp                                   
  236a  740f             je 0x237b                                
  236c  e8dce9           call 0xd4b                               
  236f  83c60c           add si, 0xc                              
  2372  83c70a           add di, 0xa                              
  2375  d1e5             shl bp, 1                                
  2377  d1e5             shl bp, 1                                
  2379  ebef             jmp 0x236a                               
  237b  89360c00         mov word ptr [0xc], si                   
  237f  c3               ret                                      
res_1704_2380:  ; case
  2380  8b3e0c00         mov di, word ptr [0xc]                   
  2384  268b6c04         mov bp, word ptr es:[si + 4]             
  2388  f7dd             neg bp                                   
  238a  4d               dec bp                                   
  238b  7492             je 0x231f                                
  238d  83c65e           add si, 0x5e                             
  2390  83ee0a           sub si, 0xa                              
  2393  d1ed             shr bp, 1                                
  2395  d1ed             shr bp, 1                                
  2397  73f7             jae 0x2390                               
  2399  83ef0c           sub di, 0xc                              
  239c  e8d9e9           call 0xd78                               
  239f  83ee0a           sub si, 0xa                              
  23a2  d1ed             shr bp, 1                                
  23a4  d1ed             shr bp, 1                                
  23a6  72f1             jb 0x2399                                
  23a8  83c6fc           add si, -4                               
  23ab  893e0c00         mov word ptr [0xc], di                   
  23af  e96dff           jmp 0x231f                               
res_1704_23b2:  ; case
  23b2  a10200           mov ax, word ptr [2]                     
  23b5  ab               stosw word ptr es:[di], ax               
  23b6  c3               ret                                      
res_1704_23b7:  ; case
  23b7  a11000           mov ax, word ptr [0x10]                  
  23ba  2b060c00         sub ax, word ptr [0xc]                   
  23be  b96000           mov cx, 0x60                             
  23c1  3bc1             cmp ax, cx                               
  23c3  7201             jb 0x23c6                                
  23c5  91               xchg cx, ax                              
  23c6  f7d8             neg ax                                   
  23c8  b10c             mov cl, 0xc                              
  23ca  f6f9             idiv cl                                  
  23cc  2407             and al, 7                                
  23ce  b103             mov cl, 3                                
  23d0  d2e0             shl al, cl                               
  23d2  8b0e0000         mov cx, word ptr [0]                     
  23d6  80e5c7           and ch, 0xc7                             
  23d9  0ae8             or ch, al                                
  23db  91               xchg cx, ax                              
  23dc  ab               stosw word ptr es:[di], ax               
  23dd  c3               ret                                      
res_1704_23de:  ; case
  23de  8b3e0c00         mov di, word ptr [0xc]                   
  23e2  83ef0c           sub di, 0xc                              
  23e5  e8e6ed           call 0x11ce                              
  23e8  832e0c000c       sub word ptr [0xc], 0xc                  
  23ed  c3               ret                                      
res_1704_23ee:  ; case
  23ee  8b3e0c00         mov di, word ptr [0xc]                   
  23f2  83ef0c           sub di, 0xc                              
  23f5  e8effa           call 0x1ee7                              
  23f8  832e0c000c       sub word ptr [0xc], 0xc                  
  23fd  c3               ret                                      
res_1704_23fe:  ; case
  23fe  8b3e0c00         mov di, word ptr [0xc]                   
  2402  83ef0c           sub di, 0xc                              
  2405  e870e9           call 0xd78                               
  2408  832e0c000c       sub word ptr [0xc], 0xc                  
  240d  c3               ret                                      
res_1704_240e:  ; case
  240e  8b360c00         mov si, word ptr [0xc]                   
  2412  e82cee           call 0x1241                              
  2415  83060c000c       add word ptr [0xc], 0xc                  
  241a  c3               ret                                      
res_1704_241b:  ; case
  241b  8b360c00         mov si, word ptr [0xc]                   
  241f  e8aefb           call 0x1fd0                              
  2422  83060c000c       add word ptr [0xc], 0xc                  
  2427  c3               ret                                      
res_1704_2428:  ; case
  2428  8b360c00         mov si, word ptr [0xc]                   
  242c  e81ce9           call 0xd4b                               
  242f  83060c000c       add word ptr [0xc], 0xc                  
  2434  c3               ret                                      
  2435  7424ce2487248224 dw 2474,24ce,2487,2482,24d5,24ce,24d5,24d5,24c9,24ce,24e6,24f1,24f1,24ce,24f1,24f1,00b7 jump table
  2457  2e8a9f0200       mov bl, byte ptr cs:[bx + 2]             
  245c  8b360c00         mov si, word ptr [0xc]                   
  2460  03f3             add si, bx                               
  2462  b318             mov bl, 0x18                             
  2464  22dd             and bl, ch                               
  2466  80e106           and cl, 6                                
  2469  0ad9             or bl, cl                                
  246b  fc               cld                                      
  246c  b90600           mov cx, 6                                
  246f  2effa73524       jmp word ptr cs:[bx + 0x2435]            
res_1704_2474:  ; case
  2474  832e0c000c       sub word ptr [0xc], 0xc                  
  2479  8b3e0c00         mov di, word ptr [0xc]                   
  247d  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  247f  e91a02           jmp 0x269c                               
res_1704_2482:  ; case
  2482  bf0c00           mov di, 0xc                              
  2485  eb03             jmp 0x248a                               
res_1704_2487:  ; case
  2487  bf0000           mov di, 0                                
  248a  a11000           mov ax, word ptr [0x10]                  
  248d  2d0c00           sub ax, 0xc                              
  2490  3bf0             cmp si, ax                               
  2492  7410             je 0x24a4                                
  2494  87fe             xchg si, di                              
  2496  b80140           mov ax, 0x4001                           
  2499  b100             mov cl, 0                                
  249b  e89fe9           call 0xe3d                               
  249e  01360c00         add word ptr [0xc], si                   
  24a2  eb59             jmp 0x24fd                               
  24a4  83c70c           add di, 0xc                              
  24a7  8bd7             mov dx, di                               
  24a9  8bce             mov cx, si                               
  24ab  2b0e0c00         sub cx, word ptr [0xc]                   
  24af  7412             je 0x24c3                                
  24b1  16               push ss                                  
  24b2  07               pop es                                   
  24b3  83ee02           sub si, 2                                
  24b6  8b3e1000         mov di, word ptr [0x10]                  
  24ba  83ef02           sub di, 2                                
  24bd  fd               std                                      
  24be  d1e9             shr cx, 1                                
  24c0  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  24c2  fc               cld                                      
  24c3  01160c00         add word ptr [0xc], dx                   
  24c7  eb34             jmp 0x24fd                               
res_1704_24c9:  ; case
  24c9  f6c507           test ch, 7                               
  24cc  742f             je 0x24fd                                
res_1704_24ce:  ; case
  24ce  b501             mov ch, 1                                
  24d0  e84102           call 0x2714                              
  24d3  eb28             jmp 0x24fd                               
res_1704_24d5:  ; case
  24d5  8b3e0c00         mov di, word ptr [0xc]                   
  24d9  8b05             mov ax, word ptr [di]                    
  24db  8704             xchg word ptr [si], ax                   
  24dd  ab               stosw word ptr es:[di], ax               
  24de  83c602           add si, 2                                
  24e1  e2f6             loop 0x24d9                              
  24e3  e9b601           jmp 0x269c                               
res_1704_24e6:  ; case
  24e6  8bfe             mov di, si                               
  24e8  8b360c00         mov si, word ptr [0xc]                   
  24ec  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  24ee  e9ab01           jmp 0x269c                               
res_1704_24f1:  ; case
  24f1  8bfe             mov di, si                               
  24f3  8b360c00         mov si, word ptr [0xc]                   
  24f7  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  24f9  89360c00         mov word ptr [0xc], si                   
  24fd  e99c01           jmp 0x269c                               
  2500  0404             add al, 4                                
  2502  0404             add al, 4                                
  2504  0404             add al, 4                                
  2506  0404             add al, 4                                
  2508  0000             add byte ptr [bx + si], al               
  250a  0000             add byte ptr [bx + si], al               
  250c  0000             add byte ptr [bx + si], al               
  250e  0004             add byte ptr [si], al                    
  2510  0408             add al, 8                                
  2512  06               push es                                  
  2513  08060402         or byte ptr [0x204], al                  
  2517  000a             add byte ptr [bp + si], cl               
  2519  0804             or byte ptr [si], al                     
  251b  0404             add al, 4                                
  251d  0a04             or al, byte ptr [si]                     
  251f  04               db 04                                    resync
  2520  6025652572257225 dw 2560,2565,2572,2572,0a99,0ad5,2572,2572,0dc1,0dd2,0de3,0df4,0e05,0e16,0e27,2572,19ae,1aa6,1730,1826,256a,2572,2572,2572,08d1,1b5d,0805,2572,1337,1013,2572,2572 jump table
res_1704_2560:  ; case
  2560  80740a01         xor byte ptr [si + 0xa], 1               
  2564  c3               ret                                      
res_1704_2565:  ; case
  2565  c6440a00         mov byte ptr [si + 0xa], 0               
  2569  c3               ret                                      
res_1704_256a:  ; case
  256a  56               push si                                  
  256b  57               push di                                  
  256c  e86fea           call 0xfde                               
  256f  5f               pop di                                   
  2570  5e               pop si                                   
  2571  c3               ret                                      
res_1704_2572:  ; case
  2572  b501             mov ch, 1                                
  2574  e89d01           call 0x2714                              
  2577  e92201           jmp 0x269c                               
  257a  c3               ret                                      
  257b  9a25d125ad25bc25 dw 259a,25d1,25ad,25bc,25d9,25ec,1fbb,2200 jump table
  258b  dd               db dd                                    
  258c  2e8a870025       mov al, byte ptr cs:[bx + 0x2500]        
  2591  98               cwde                                     
  2592  97               xchg di, ax                              
  2593  d1e3             shl bx, 1                                
  2595  2effa57b25       jmp word ptr cs:[di + 0x257b]            
res_1704_259a:  ; case
  259a  8b3e0c00         mov di, word ptr [0xc]                   
  259e  83ef0c           sub di, 0xc                              
  25a1  2eff972025       call word ptr cs:[bx + 0x2520]           
  25a6  893e0c00         mov word ptr [0xc], di                   
  25aa  e9ef00           jmp 0x269c                               
res_1704_25ad:  ; case
  25ad  8b360c00         mov si, word ptr [0xc]                   
  25b1  8bfe             mov di, si                               
  25b3  b89c26           mov ax, 0x269c                           
  25b6  50               push ax                                  
  25b7  2effa72025       jmp word ptr cs:[bx + 0x2520]            
res_1704_25bc:  ; case
  25bc  8b360c00         mov si, word ptr [0xc]                   
  25c0  8bfe             mov di, si                               
  25c2  83ef0c           sub di, 0xc                              
  25c5  2eff972025       call word ptr cs:[bx + 0x2520]           
  25ca  893e0c00         mov word ptr [0xc], di                   
  25ce  e9cb00           jmp 0x269c                               
res_1704_25d1:  ; case
  25d1  83060c000c       add word ptr [0xc], 0xc                  
  25d6  e9c300           jmp 0x269c                               
res_1704_25d9:  ; case
  25d9  8b3e0c00         mov di, word ptr [0xc]                   
  25dd  8d750c           lea si, [di + 0xc]                       
  25e0  2eff972025       call word ptr cs:[bx + 0x2520]           
  25e5  89360c00         mov word ptr [0xc], si                   
  25e9  e9b000           jmp 0x269c                               
res_1704_25ec:  ; case
  25ec  8b3e0c00         mov di, word ptr [0xc]                   
  25f0  8d750c           lea si, [di + 0xc]                       
  25f3  b89c26           mov ax, 0x269c                           
  25f6  50               push ax                                  
  25f7  2effa72025       jmp word ptr cs:[bx + 0x2520]            
res_1704_25fc:  ; case
  25fc  80e51f           and ch, 0x1f                             
  25ff  80fd03           cmp ch, 3                                
  2602  7555             jne 0x2659                               
  2604  c70638000200     mov word ptr [0x38], 2                   
  260a  c7063400656d     mov word ptr [0x34], 0x6d65              
  2610  c70636007587     mov word ptr [0x36], 0x8775              
  2616  c70604000000     mov word ptr [4], 0                      
  261c  8b3e1000         mov di, word ptr [0x10]                  
  2620  893e0c00         mov word ptr [0xc], di                   
  2624  8b1e0e00         mov bx, word ptr [0xe]                   
  2628  2bdf             sub bx, di                               
  262a  f7db             neg bx                                   
  262c  b80140           mov ax, 0x4001                           
  262f  b100             mov cl, 0                                
  2631  e809e8           call 0xe3d                               
  2634  c64507c0         mov byte ptr [di + 7], 0xc0              
  2638  8d750a           lea si, [di + 0xa]                       
  263b  83ef02           sub di, 2                                
  263e  8b0e0e00         mov cx, word ptr [0xe]                   
  2642  2bcf             sub cx, di                               
  2644  f7d9             neg cx                                   
  2646  d1e9             shr cx, 1                                
  2648  fd               std                                      
  2649  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  264b  c70600000041     mov word ptr [0], 0x4100                 
  2651  c70602003f03     mov word ptr [2], 0x33f                  
  2657  eb11             jmp 0x266a                               
  2659  80fd02           cmp ch, 2                                
  265c  7507             jne 0x2665                               
  265e  c606000000       mov byte ptr [0], 0                      
  2663  eb05             jmp 0x266a                               
  2665  b501             mov ch, 1                                
  2667  e8aa00           call 0x2714                              
  266a  eb30             jmp 0x269c                               
res_1704_266c:  ; case
  266c  ebf7             jmp 0x2665                               
res_1704_266e:  ; case
  266e  f6c51f           test ch, 0x1f                            
  2671  75f2             jne 0x2665                               
  2673  a10c00           mov ax, word ptr [0xc]                   
  2676  2b061000         sub ax, word ptr [0x10]                  
  267a  b10c             mov cl, 0xc                              
  267c  f6f9             idiv cl                                  
  267e  2407             and al, 7                                
  2680  b103             mov cl, 3                                
  2682  d2e0             shl al, cl                               
  2684  8b0e0000         mov cx, word ptr [0]                     
  2688  80e5c7           and ch, 0xc7                             
  268b  0ae8             or ch, al                                
  268d  894e10           mov word ptr [bp + 0x10], cx             
  2690  eb0a             jmp 0x269c                               
  2692  368b360400       mov si, word ptr ss:[4]                  
  2697  3601360c00       add word ptr ss:[0xc], si                
  269c  36a10e00         mov ax, word ptr ss:[0xe]                
  26a0  3639060c00       cmp word ptr ss:[0xc], ax                
  26a5  720f             jb 0x26b6                                
  26a7  368b263200       mov sp, word ptr ss:[0x32]               
  26ac  07               pop es                                   
  26ad  5f               pop di                                   
  26ae  5e               pop si                                   
  26af  5d               pop bp                                   
  26b0  1f               pop ds                                   
  26b1  5b               pop bx                                   
  26b2  5a               pop dx                                   
  26b3  59               pop cx                                   
  26b4  58               pop ax                                   
  26b5  cf               iret                                     
  26b6  b540             mov ch, 0x40                             
  26b8  8b3e1000         mov di, word ptr [0x10]                  
  26bc  893e0c00         mov word ptr [0xc], di                   
  26c0  e85100           call 0x2714                              
  26c3  cc               int3                                     
  26c4  ebe1             jmp 0x26a7                               
  26c6  ed               in ax, dx                                
  26c7  1bf1             sbb si, cx                               
  26c9  1bf5             sbb si, bp                               
  26cb  1bed             sbb bp, bp                               
  26cd  1bf1             sbb si, cx                               
  26cf  1bf5             sbb si, bp                               
  26d1  1bd6             sbb dx, si                               
  26d3  1c37             sbb al, 0x37                             
  26d5  1d491d           sbb ax, 0x1d49                           
  26d8  5b               pop bx                                   
  26d9  1da81d           sbb ax, 0x1da8                           
  26dc  ad               lodsw ax, word ptr [si]                  
  26dd  1db81d           sbb ax, 0x1db8                           
  26e0  fb               sti                                      
  26e1  fc               cld                                      
  26e2  50               push ax                                  
  26e3  51               push cx                                  
  26e4  52               push dx                                  
  26e5  53               push bx                                  
  26e6  1e               push ds                                  
  26e7  55               push bp                                  
  26e8  56               push si                                  
  26e9  57               push di                                  
  26ea  06               push es                                  
  26eb  8bec             mov bp, sp                               
  26ed  3689263200       mov word ptr ss:[0x32], sp               
  26f2  c57612           lds si, ptr [bp + 0x12]                  
  26f5  ac               lodsb al, byte ptr [si]                  
  26f6  897612           mov word ptr [bp + 0x12], si             
  26f9  8cd7             mov di, ss                               
  26fb  8edf             mov ds, di                               
  26fd  98               cwde                                     
  26fe  93               xchg bx, ax                              
  26ff  80fbe6           cmp bl, 0xe6                             
  2702  7209             jb 0x270d                                
  2704  b89c26           mov ax, 0x269c                           
  2707  50               push ax                                  
  2708  2effa7e026       jmp word ptr cs:[bx + 0x26e0]            
  270d  b501             mov ch, 1                                
  270f  e80200           call 0x2714                              
  2712  eb88             jmp 0x269c                               

res_1704_2714:  ; ENTRY
  2714  50               push ax                                  
  2715  51               push cx                                  
  2716  1e               push ds                                  
  2717  16               push ss                                  
  2718  1f               pop ds                                   
  2719  a00000           mov al, byte ptr [0]                     
  271c  8a0e0200         mov cl, byte ptr [2]                     
  2720  80e17f           and cl, 0x7f                             
  2723  80f17f           xor cl, 0x7f                             
  2726  0ac5             or al, ch                                
  2728  8ae0             mov ah, al                               
  272a  22e1             and ah, cl                               
  272c  32e0             xor ah, al                               
  272e  f6c408           test ah, 8                               
  2731  7402             je 0x2735                                
  2733  0c20             or al, 0x20                              
  2735  84c1             test cl, al                              
  2737  740f             je 0x2748                                
  2739  0c80             or al, 0x80                              
  273b  a20000           mov byte ptr [0], al                     
  273e  22c1             and al, cl                               
  2740  3c20             cmp al, 0x20                             
  2742  750d             jne 0x2751                               
  2744  1f               pop ds                                   
  2745  59               pop cx                                   
  2746  58               pop ax                                   
  2747  c3               ret                                      
  2748  247f             and al, 0x7f                             
  274a  a20000           mov byte ptr [0], al                     
  274d  1f               pop ds                                   
  274e  59               pop cx                                   
  274f  58               pop ax                                   
  2750  c3               ret                                      
  2751  9abf100000       lcall 0, 0x10bf                          -> 0000:10bf
  2756  b435             mov ah, 0x35                             
  2758  cd21             int 0x21                                 
  275a  36891e4000       mov word ptr ss:[0x40], bx               
  275f  368c064200       mov word ptr ss:[0x42], es               
  2764  368b263200       mov sp, word ptr ss:[0x32]               
  2769  07               pop es                                   
  276a  5f               pop di                                   
  276b  5e               pop si                                   
  276c  5d               pop bp                                   
  276d  1f               pop ds                                   
  276e  5b               pop bx                                   
  276f  5a               pop dx                                   
  2770  59               pop cx                                   
  2771  58               pop ax                                   
  2772  36ff2e4000       ljmp ss:[0x40]                           
  2777  00               db 00                                    
