; seg 0dc8  img 0xdc80..0x10400  file off 0xe880
  0dc8:0000  87e2             xchg dx, sp                              
  0dc8:0002  000c             add byte ptr [si], cl                    
  0dc8:0004  1824             sbb byte ptr [si], ah                    
  0dc8:0006  303c             xor byte ptr [si], bh                    
  0dc8:0008  48               dec ax                                   
  0dc8:0009  54               push sp                                  
  0dc8:000a  60               pushaw                                   
  0dc8:000b  6c               insb byte ptr es:[di], dx                
  0dc8:000c  7884             js 0xffffff92                            
  0dc8:000e  90               nop                                      
  0dc8:000f  9c               pushf                                    
  0dc8:0010  a8b4             test al, 0xb4                            
  0dc8:0012  52               push dx                                  
  0dc8:0013  56               push si                                  
  0dc8:0014  8b5406           mov dx, word ptr [si + 6]                
  0dc8:0017  80e67f           and dh, 0x7f                             
  0dc8:001a  0b14             or dx, word ptr [si]                     
  0dc8:001c  0b5402           or dx, word ptr [si + 2]                 
  0dc8:001f  0b5404           or dx, word ptr [si + 4]                 
  0dc8:0022  7520             jne 0x44                                 
  0dc8:0024  83fbff           cmp bx, -1                               
  0dc8:0027  7417             je 0x40                                  
  0dc8:0029  817f080140       cmp word ptr [bx + 8], 0x4001            
  0dc8:002e  7c10             jl 0x40                                  
  0dc8:0030  8b5706           mov dx, word ptr [bx + 6]                
  0dc8:0033  80e67f           and dh, 0x7f                             
  0dc8:0036  0b17             or dx, word ptr [bx]                     
  0dc8:0038  0b5702           or dx, word ptr [bx + 2]                 
  0dc8:003b  0b5704           or dx, word ptr [bx + 4]                 
  0dc8:003e  7544             jne 0x84                                 
  0dc8:0040  f8               clc                                      
  0dc8:0041  5e               pop si                                   
  0dc8:0042  5a               pop dx                                   
  0dc8:0043  c3               ret                                      
  0dc8:0044  83fbff           cmp bx, -1                               
  0dc8:0047  743d             je 0x86                                  
  0dc8:0049  817f080140       cmp word ptr [bx + 8], 0x4001            
  0dc8:004e  7c36             jl 0x86                                  
  0dc8:0050  8b5706           mov dx, word ptr [bx + 6]                
  0dc8:0053  80e67f           and dh, 0x7f                             
  0dc8:0056  0b17             or dx, word ptr [bx]                     
  0dc8:0058  0b5702           or dx, word ptr [bx + 2]                 
  0dc8:005b  0b5704           or dx, word ptr [bx + 4]                 
  0dc8:005e  7426             je 0x86                                  
  0dc8:0060  8b5406           mov dx, word ptr [si + 6]                
  0dc8:0063  3b5706           cmp dx, word ptr [bx + 6]                
  0dc8:0066  771e             ja 0x86                                  
  0dc8:0068  721a             jb 0x84                                  
  0dc8:006a  8b5404           mov dx, word ptr [si + 4]                
  0dc8:006d  3b5704           cmp dx, word ptr [bx + 4]                
  0dc8:0070  7714             ja 0x86                                  
  0dc8:0072  7210             jb 0x84                                  
  0dc8:0074  8b5402           mov dx, word ptr [si + 2]                
  0dc8:0077  3b5702           cmp dx, word ptr [bx + 2]                
  0dc8:007a  770a             ja 0x86                                  
  0dc8:007c  7206             jb 0x84                                  
  0dc8:007e  8b14             mov dx, word ptr [si]                    
  0dc8:0080  3b17             cmp dx, word ptr [bx]                    
  0dc8:0082  7702             ja 0x86                                  
  0dc8:0084  8bf3             mov si, bx                               
  0dc8:0086  57               push di                                  
  0dc8:0087  b501             mov ch, 1                                
  0dc8:0089  e88826           call 0x2714                              -> 0dc8:2714
  0dc8:008c  b90600           mov cx, 6                                
  0dc8:008f  fc               cld                                      
  0dc8:0090  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:0092  f9               stc                                      
  0dc8:0093  5f               pop di                                   
  0dc8:0094  ebab             jmp 0x41                                 
  0dc8:0096  8a440a           mov al, byte ptr [si + 0xa]              
  0dc8:0099  8846fb           mov byte ptr [bp - 5], al                
  0dc8:009c  c746fc0140       mov word ptr [bp - 4], 0x4001            
  0dc8:00a1  90               nop                                      
  0dc8:00a2  eb3d             jmp 0xe1                                 
  0dc8:00a4  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:00a7  90               nop                                      
  0dc8:00a8  e8a80d           call 0xe53                               -> 0dc8:0e53
  0dc8:00ab  e99301           jmp 0x241                                
  0dc8:00ae  53               push bx                                  
  0dc8:00af  57               push di                                  
  0dc8:00b0  8bdf             mov bx, di                               
  0dc8:00b2  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:00b5  90               nop                                      
  0dc8:00b6  e859ff           call 0x12                                -> 0dc8:0012
  0dc8:00b9  5f               pop di                                   
  0dc8:00ba  5b               pop bx                                   
  0dc8:00bb  72ee             jb 0xab                                  
  0dc8:00bd  81fb0140         cmp bx, 0x4001                           
  0dc8:00c1  7cd3             jl 0x96                                  
  0dc8:00c3  8a46fa           mov al, byte ptr [bp - 6]                
  0dc8:00c6  0ac0             or al, al                                
  0dc8:00c8  75da             jne 0xa4                                 
  0dc8:00ca  ebca             jmp 0x96                                 
  0dc8:00cc  bbffff           mov bx, 0xffff                           
  0dc8:00cf  8a450a           mov al, byte ptr [di + 0xa]              
  0dc8:00d2  32c1             xor al, cl                               
  0dc8:00d4  8bf7             mov si, di                               
  0dc8:00d6  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:00d9  90               nop                                      
  0dc8:00da  e835ff           call 0x12                                -> 0dc8:0012
  0dc8:00dd  72cc             jb 0xab                                  
  0dc8:00df  ebb8             jmp 0x99                                 
  0dc8:00e1  8b04             mov ax, word ptr [si]                    
  0dc8:00e3  8b5c02           mov bx, word ptr [si + 2]                
  0dc8:00e6  8b4c04           mov cx, word ptr [si + 4]                
  0dc8:00e9  8b5406           mov dx, word ptr [si + 6]                
  0dc8:00ec  e93f01           jmp 0x22e                                
  0dc8:00ef  b101             mov cl, 1                                
  0dc8:00f1  eb02             jmp 0xf5                                 
  0dc8:00f3  b100             mov cl, 0                                

proc_0dc8_00f5:
  0dc8:00f5  55               push bp                                  
  0dc8:00f6  8bec             mov bp, sp                               
  0dc8:00f8  8d66fa           lea sp, [bp - 6]                         
  0dc8:00fb  56               push si                                  
  0dc8:00fc  57               push di                                  
  0dc8:00fd  8b7608           mov si, word ptr [bp + 8]                
  0dc8:0100  8b7e06           mov di, word ptr [bp + 6]                
  0dc8:0103  8ac1             mov al, cl                               
  0dc8:0105  32450a           xor al, byte ptr [di + 0xa]              
  0dc8:0108  32440a           xor al, byte ptr [si + 0xa]              
  0dc8:010b  8846fa           mov byte ptr [bp - 6], al                
  0dc8:010e  8b4408           mov ax, word ptr [si + 8]                
  0dc8:0111  8b5d08           mov bx, word ptr [di + 8]                
  0dc8:0114  3d0140           cmp ax, 0x4001                           
  0dc8:0117  7d95             jge 0xae                                 
  0dc8:0119  81fb0140         cmp bx, 0x4001                           
  0dc8:011d  7dad             jge 0xcc                                 
  0dc8:011f  3bc3             cmp ax, bx                               
  0dc8:0121  7d08             jge 0x12b                                
  0dc8:0123  324d0a           xor cl, byte ptr [di + 0xa]              
  0dc8:0126  93               xchg bx, ax                              
  0dc8:0127  87f7             xchg di, si                              
  0dc8:0129  eb03             jmp 0x12e                                
  0dc8:012b  8a4c0a           mov cl, byte ptr [si + 0xa]              
  0dc8:012e  884efb           mov byte ptr [bp - 5], cl                
  0dc8:0131  8b4c08           mov cx, word ptr [si + 8]                
  0dc8:0134  894efc           mov word ptr [bp - 4], cx                
  0dc8:0137  81fb01c0         cmp bx, 0xc001                           
  0dc8:013b  7ea4             jle 0xe1                                 
  0dc8:013d  2bc3             sub ax, bx                               
  0dc8:013f  3d4100           cmp ax, 0x41                             
  0dc8:0142  7f9d             jg 0xe1                                  
  0dc8:0144  8b5d02           mov bx, word ptr [di + 2]                
  0dc8:0147  8b4d04           mov cx, word ptr [di + 4]                
  0dc8:014a  8b5506           mov dx, word ptr [di + 6]                
  0dc8:014d  8b3d             mov di, word ptr [di]                    
  0dc8:014f  97               xchg di, ax                              
  0dc8:0150  c646fe00         mov byte ptr [bp - 2], 0                 
  0dc8:0154  83ef08           sub di, 8                                
  0dc8:0157  7c18             jl 0x171                                 
  0dc8:0159  8846fe           mov byte ptr [bp - 2], al                
  0dc8:015c  8ac4             mov al, ah                               
  0dc8:015e  8ae3             mov ah, bl                               
  0dc8:0160  8adf             mov bl, bh                               
  0dc8:0162  8af9             mov bh, cl                               
  0dc8:0164  8acd             mov cl, ch                               
  0dc8:0166  8aea             mov ch, dl                               
  0dc8:0168  8ad6             mov dl, dh                               
  0dc8:016a  b600             mov dh, 0                                
  0dc8:016c  83ef08           sub di, 8                                
  0dc8:016f  7de8             jge 0x159                                
  0dc8:0171  83e707           and di, 7                                
  0dc8:0174  740e             je 0x184                                 
  0dc8:0176  d1ea             shr dx, 1                                
  0dc8:0178  d1d9             rcr cx, 1                                
  0dc8:017a  d1db             rcr bx, 1                                
  0dc8:017c  d1d8             rcr ax, 1                                
  0dc8:017e  d05efe           rcr byte ptr [bp - 2], 1                 
  0dc8:0181  4f               dec di                                   
  0dc8:0182  75f2             jne 0x176                                
  0dc8:0184  807efa00         cmp byte ptr [bp - 6], 0                 
  0dc8:0188  751d             jne 0x1a7                                
  0dc8:018a  0304             add ax, word ptr [si]                    
  0dc8:018c  135c02           adc bx, word ptr [si + 2]                
  0dc8:018f  134c04           adc cx, word ptr [si + 4]                
  0dc8:0192  135406           adc dx, word ptr [si + 6]                
  0dc8:0195  7377             jae 0x20e                                
  0dc8:0197  d1da             rcr dx, 1                                
  0dc8:0199  d1d9             rcr cx, 1                                
  0dc8:019b  d1db             rcr bx, 1                                
  0dc8:019d  d1d8             rcr ax, 1                                
  0dc8:019f  d05efe           rcr byte ptr [bp - 2], 1                 
  0dc8:01a2  ff46fc           inc word ptr [bp - 4]                    
  0dc8:01a5  eb67             jmp 0x20e                                
  0dc8:01a7  8076fb01         xor byte ptr [bp - 5], 1                 
  0dc8:01ab  2b04             sub ax, word ptr [si]                    
  0dc8:01ad  1b5c02           sbb bx, word ptr [si + 2]                
  0dc8:01b0  1b4c04           sbb cx, word ptr [si + 4]                
  0dc8:01b3  1b5406           sbb dx, word ptr [si + 6]                
  0dc8:01b6  7318             jae 0x1d0                                
  0dc8:01b8  8076fb01         xor byte ptr [bp - 5], 1                 
  0dc8:01bc  f7d2             not dx                                   
  0dc8:01be  f7d1             not cx                                   
  0dc8:01c0  f7d3             not bx                                   
  0dc8:01c2  f7d0             not ax                                   
  0dc8:01c4  f65efe           neg byte ptr [bp - 2]                    
  0dc8:01c7  f5               cmc                                      
  0dc8:01c8  13c7             adc ax, di                               
  0dc8:01ca  13df             adc bx, di                               
  0dc8:01cc  13cf             adc cx, di                               
  0dc8:01ce  13d7             adc dx, di                               
  0dc8:01d0  be0800           mov si, 8                                
  0dc8:01d3  0af6             or dh, dh                                
  0dc8:01d5  7535             jne 0x20c                                
  0dc8:01d7  8af2             mov dh, dl                               
  0dc8:01d9  8ad5             mov dl, ch                               
  0dc8:01db  8ae9             mov ch, cl                               
  0dc8:01dd  8acf             mov cl, bh                               
  0dc8:01df  8afb             mov bh, bl                               
  0dc8:01e1  8adc             mov bl, ah                               
  0dc8:01e3  8ae0             mov ah, al                               
  0dc8:01e5  8a46fe           mov al, byte ptr [bp - 2]                
  0dc8:01e8  c646fe00         mov byte ptr [bp - 2], 0                 
  0dc8:01ec  836efc08         sub word ptr [bp - 4], 8                 
  0dc8:01f0  4e               dec si                                   
  0dc8:01f1  7de0             jge 0x1d3                                
  0dc8:01f3  c746fc01c0       mov word ptr [bp - 4], 0xc001            
  0dc8:01f8  c646fb00         mov byte ptr [bp - 5], 0                 
  0dc8:01fc  eb30             jmp 0x22e                                
  0dc8:01fe  ff4efc           dec word ptr [bp - 4]                    
  0dc8:0201  d066fe           shl byte ptr [bp - 2], 1                 
  0dc8:0204  d1d0             rcl ax, 1                                
  0dc8:0206  d1d3             rcl bx, 1                                
  0dc8:0208  d1d1             rcl cx, 1                                
  0dc8:020a  13d2             adc dx, dx                               
  0dc8:020c  79f0             jns 0x1fe                                
  0dc8:020e  d066fe           shl byte ptr [bp - 2], 1                 
  0dc8:0211  13c7             adc ax, di                               
  0dc8:0213  13df             adc bx, di                               
  0dc8:0215  13cf             adc cx, di                               
  0dc8:0217  13d7             adc dx, di                               
  0dc8:0219  7305             jae 0x220                                
  0dc8:021b  d1da             rcr dx, 1                                
  0dc8:021d  ff46fc           inc word ptr [bp - 4]                    
  0dc8:0220  817efc0140       cmp word ptr [bp - 4], 0x4001            
  0dc8:0225  7d22             jge 0x249                                
  0dc8:0227  817efc01c0       cmp word ptr [bp - 4], 0xc001            
  0dc8:022c  7e24             jle 0x252                                
  0dc8:022e  fc               cld                                      
  0dc8:022f  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:0232  ab               stosw word ptr es:[di], ax               
  0dc8:0233  93               xchg bx, ax                              
  0dc8:0234  ab               stosw word ptr es:[di], ax               
  0dc8:0235  91               xchg cx, ax                              
  0dc8:0236  ab               stosw word ptr es:[di], ax               
  0dc8:0237  92               xchg dx, ax                              
  0dc8:0238  ab               stosw word ptr es:[di], ax               
  0dc8:0239  8b46fc           mov ax, word ptr [bp - 4]                
  0dc8:023c  ab               stosw word ptr es:[di], ax               
  0dc8:023d  8a46fb           mov al, byte ptr [bp - 5]                
  0dc8:0240  aa               stosb byte ptr es:[di], al               
  0dc8:0241  5f               pop di                                   
  0dc8:0242  5e               pop si                                   
  0dc8:0243  8be5             mov sp, bp                               
  0dc8:0245  5d               pop bp                                   
  0dc8:0246  c20600           ret 6                                    
  0dc8:0249  b508             mov ch, 8                                
  0dc8:024b  c746fc0140       mov word ptr [bp - 4], 0x4001            
  0dc8:0250  eb07             jmp 0x259                                
  0dc8:0252  b510             mov ch, 0x10                             
  0dc8:0254  c746fc01c0       mov word ptr [bp - 4], 0xc001            
  0dc8:0259  e8b824           call 0x2714                              -> 0dc8:2714
  0dc8:025c  c646fb00         mov byte ptr [bp - 5], 0                 
  0dc8:0260  2bc0             sub ax, ax                               
  0dc8:0262  8bd8             mov bx, ax                               
  0dc8:0264  8bc8             mov cx, ax                               
  0dc8:0266  99               cdq                                      
  0dc8:0267  ebc5             jmp 0x22e                                
  0dc8:0269  b80140           mov ax, 0x4001                           
  0dc8:026c  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:026f  8a4efa           mov cl, byte ptr [bp - 6]                
  0dc8:0272  e8c80b           call 0xe3d                               -> 0dc8:0e3d
  0dc8:0275  58               pop ax                                   
  0dc8:0276  e9d400           jmp 0x34d                                
  0dc8:0279  57               push di                                  
  0dc8:027a  8bdf             mov bx, di                               
  0dc8:027c  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:027f  e890fd           call 0x12                                -> 0dc8:0012
  0dc8:0282  5f               pop di                                   
  0dc8:0283  72f0             jb 0x275                                 
  0dc8:0285  817d0801c0       cmp word ptr [di + 8], 0xc001            
  0dc8:028a  7e18             jle 0x2a4                                
  0dc8:028c  ebdb             jmp 0x269                                
  0dc8:028e  56               push si                                  
  0dc8:028f  bbffff           mov bx, 0xffff                           
  0dc8:0292  8bf7             mov si, di                               
  0dc8:0294  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:0297  e878fd           call 0x12                                -> 0dc8:0012
  0dc8:029a  5e               pop si                                   
  0dc8:029b  72d8             jb 0x275                                 
  0dc8:029d  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0dc8:02a2  7fc5             jg 0x269                                 
  0dc8:02a4  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:02a7  e8a90b           call 0xe53                               -> 0dc8:0e53
  0dc8:02aa  ebc9             jmp 0x275                                
  0dc8:02ac  b508             mov ch, 8                                
  0dc8:02ae  e86324           call 0x2714                              -> 0dc8:2714
  0dc8:02b1  ebb6             jmp 0x269                                
  0dc8:02b3  b510             mov ch, 0x10                             
  0dc8:02b5  e85c24           call 0x2714                              -> 0dc8:2714
  0dc8:02b8  b801c0           mov ax, 0xc001                           
  0dc8:02bb  ebaf             jmp 0x26c                                

proc_0dc8_02bd:
  0dc8:02bd  55               push bp                                  
  0dc8:02be  8bec             mov bp, sp                               
  0dc8:02c0  56               push si                                  
  0dc8:02c1  57               push di                                  
  0dc8:02c2  fc               cld                                      
  0dc8:02c3  8b7608           mov si, word ptr [bp + 8]                
  0dc8:02c6  8b7e06           mov di, word ptr [bp + 6]                
  0dc8:02c9  8a4c0a           mov cl, byte ptr [si + 0xa]              
  0dc8:02cc  324d0a           xor cl, byte ptr [di + 0xa]              
  0dc8:02cf  51               push cx                                  
  0dc8:02d0  ba0140           mov dx, 0x4001                           
  0dc8:02d3  8b5d08           mov bx, word ptr [di + 8]                
  0dc8:02d6  b901c0           mov cx, 0xc001                           
  0dc8:02d9  8b4408           mov ax, word ptr [si + 8]                
  0dc8:02dc  3bc2             cmp ax, dx                               
  0dc8:02de  7d99             jge 0x279                                
  0dc8:02e0  3bda             cmp bx, dx                               
  0dc8:02e2  7daa             jge 0x28e                                
  0dc8:02e4  3bc1             cmp ax, cx                               
  0dc8:02e6  7ed0             jle 0x2b8                                
  0dc8:02e8  3bd9             cmp bx, cx                               
  0dc8:02ea  7ecc             jle 0x2b8                                
  0dc8:02ec  03c3             add ax, bx                               
  0dc8:02ee  48               dec ax                                   
  0dc8:02ef  3d0140           cmp ax, 0x4001                           
  0dc8:02f2  7db8             jge 0x2ac                                
  0dc8:02f4  40               inc ax                                   
  0dc8:02f5  3d01c0           cmp ax, 0xc001                           
  0dc8:02f8  7eb9             jle 0x2b3                                
  0dc8:02fa  ff7406           push word ptr [si + 6]                   
  0dc8:02fd  ff7404           push word ptr [si + 4]                   
  0dc8:0300  ff7402           push word ptr [si + 2]                   
  0dc8:0303  ff34             push word ptr [si]                       
  0dc8:0305  83ec04           sub sp, 4                                
  0dc8:0308  ff7506           push word ptr [di + 6]                   
  0dc8:030b  ff7504           push word ptr [di + 4]                   
  0dc8:030e  ff7502           push word ptr [di + 2]                   
  0dc8:0311  ff35             push word ptr [di]                       
  0dc8:0313  97               xchg di, ax                              
  0dc8:0314  8bec             mov bp, sp                               
  0dc8:0316  e83a00           call 0x353                               -> 0dc8:0353
  0dc8:0319  83c414           add sp, 0x14                             
  0dc8:031c  0bd2             or dx, dx                                
  0dc8:031e  780b             js 0x32b                                 
  0dc8:0320  4f               dec di                                   
  0dc8:0321  d1e6             shl si, 1                                
  0dc8:0323  d1d0             rcl ax, 1                                
  0dc8:0325  d1d3             rcl bx, 1                                
  0dc8:0327  d1d1             rcl cx, 1                                
  0dc8:0329  d1d2             rcl dx, 1                                
  0dc8:032b  d1e6             shl si, 1                                
  0dc8:032d  150000           adc ax, 0                                
  0dc8:0330  730b             jae 0x33d                                
  0dc8:0332  13d8             adc bx, ax                               
  0dc8:0334  13c8             adc cx, ax                               
  0dc8:0336  13d0             adc dx, ax                               
  0dc8:0338  7303             jae 0x33d                                
  0dc8:033a  d1da             rcr dx, 1                                
  0dc8:033c  47               inc di                                   
  0dc8:033d  8bf7             mov si, di                               
  0dc8:033f  8b7e1e           mov di, word ptr [bp + 0x1e]             
  0dc8:0342  ab               stosw word ptr es:[di], ax               
  0dc8:0343  93               xchg bx, ax                              
  0dc8:0344  ab               stosw word ptr es:[di], ax               
  0dc8:0345  91               xchg cx, ax                              
  0dc8:0346  ab               stosw word ptr es:[di], ax               
  0dc8:0347  92               xchg dx, ax                              
  0dc8:0348  ab               stosw word ptr es:[di], ax               
  0dc8:0349  96               xchg si, ax                              
  0dc8:034a  ab               stosw word ptr es:[di], ax               
  0dc8:034b  58               pop ax                                   
  0dc8:034c  aa               stosb byte ptr es:[di], al               
  0dc8:034d  5f               pop di                                   
  0dc8:034e  5e               pop si                                   
  0dc8:034f  5d               pop bp                                   
  0dc8:0350  c20600           ret 6                                    
  0dc8:0353  57               push di                                  
  0dc8:0354  2bff             sub di, di                               
  0dc8:0356  8bcf             mov cx, di                               
  0dc8:0358  8bf7             mov si, di                               
  0dc8:035a  f6460f80         test byte ptr [bp + 0xf], 0x80           
  0dc8:035e  7406             je 0x366                                 
  0dc8:0360  8b4e00           mov cx, word ptr [bp]                    
  0dc8:0363  8b7602           mov si, word ptr [bp + 2]                
  0dc8:0366  f6460380         test byte ptr [bp + 3], 0x80             
  0dc8:036a  740f             je 0x37b                                 
  0dc8:036c  034e0c           add cx, word ptr [bp + 0xc]              
  0dc8:036f  13760e           adc si, word ptr [bp + 0xe]              
  0dc8:0372  13ff             adc di, di                               
  0dc8:0374  f6460f80         test byte ptr [bp + 0xf], 0x80           
  0dc8:0378  7401             je 0x37b                                 
  0dc8:037a  4f               dec di                                   
  0dc8:037b  2bdb             sub bx, bx                               
  0dc8:037d  8b460c           mov ax, word ptr [bp + 0xc]              
  0dc8:0380  f76604           mul word ptr [bp + 4]                    
  0dc8:0383  03c8             add cx, ax                               
  0dc8:0385  13f2             adc si, dx                               
  0dc8:0387  83d700           adc di, 0                                
  0dc8:038a  8b4610           mov ax, word ptr [bp + 0x10]             
  0dc8:038d  0bc0             or ax, ax                                
  0dc8:038f  7417             je 0x3a8                                 
  0dc8:0391  f76600           mul word ptr [bp]                        
  0dc8:0394  03c8             add cx, ax                               
  0dc8:0396  13f2             adc si, dx                               
  0dc8:0398  83d700           adc di, 0                                
  0dc8:039b  8b4610           mov ax, word ptr [bp + 0x10]             
  0dc8:039e  f76602           mul word ptr [bp + 2]                    
  0dc8:03a1  03f0             add si, ax                               
  0dc8:03a3  13fa             adc di, dx                               
  0dc8:03a5  83d300           adc bx, 0                                
  0dc8:03a8  8b460c           mov ax, word ptr [bp + 0xc]              
  0dc8:03ab  f76606           mul word ptr [bp + 6]                    
  0dc8:03ae  03f0             add si, ax                               
  0dc8:03b0  13fa             adc di, dx                               
  0dc8:03b2  83d300           adc bx, 0                                
  0dc8:03b5  8b460e           mov ax, word ptr [bp + 0xe]              
  0dc8:03b8  f76604           mul word ptr [bp + 4]                    
  0dc8:03bb  03f0             add si, ax                               
  0dc8:03bd  13fa             adc di, dx                               
  0dc8:03bf  83d300           adc bx, 0                                
  0dc8:03c2  8b4612           mov ax, word ptr [bp + 0x12]             
  0dc8:03c5  0bc0             or ax, ax                                
  0dc8:03c7  740a             je 0x3d3                                 
  0dc8:03c9  f76600           mul word ptr [bp]                        
  0dc8:03cc  03f0             add si, ax                               
  0dc8:03ce  13fa             adc di, dx                               
  0dc8:03d0  83d300           adc bx, 0                                
  0dc8:03d3  2bc9             sub cx, cx                               
  0dc8:03d5  56               push si                                  
  0dc8:03d6  8bf1             mov si, cx                               
  0dc8:03d8  8b460e           mov ax, word ptr [bp + 0xe]              
  0dc8:03db  f76606           mul word ptr [bp + 6]                    
  0dc8:03de  03f8             add di, ax                               
  0dc8:03e0  13da             adc bx, dx                               
  0dc8:03e2  83d100           adc cx, 0                                
  0dc8:03e5  8b4610           mov ax, word ptr [bp + 0x10]             
  0dc8:03e8  0bc0             or ax, ax                                
  0dc8:03ea  7417             je 0x403                                 
  0dc8:03ec  f76604           mul word ptr [bp + 4]                    
  0dc8:03ef  03f8             add di, ax                               
  0dc8:03f1  13da             adc bx, dx                               
  0dc8:03f3  83d100           adc cx, 0                                
  0dc8:03f6  8b4610           mov ax, word ptr [bp + 0x10]             
  0dc8:03f9  f76606           mul word ptr [bp + 6]                    
  0dc8:03fc  03d8             add bx, ax                               
  0dc8:03fe  13ca             adc cx, dx                               
  0dc8:0400  83d600           adc si, 0                                
  0dc8:0403  8b4612           mov ax, word ptr [bp + 0x12]             
  0dc8:0406  0bc0             or ax, ax                                
  0dc8:0408  7424             je 0x42e                                 
  0dc8:040a  f76602           mul word ptr [bp + 2]                    
  0dc8:040d  03f8             add di, ax                               
  0dc8:040f  13da             adc bx, dx                               
  0dc8:0411  83d100           adc cx, 0                                
  0dc8:0414  83d600           adc si, 0                                
  0dc8:0417  8b4612           mov ax, word ptr [bp + 0x12]             
  0dc8:041a  f76604           mul word ptr [bp + 4]                    
  0dc8:041d  03d8             add bx, ax                               
  0dc8:041f  13ca             adc cx, dx                               
  0dc8:0421  83d600           adc si, 0                                
  0dc8:0424  8b4612           mov ax, word ptr [bp + 0x12]             
  0dc8:0427  f76606           mul word ptr [bp + 6]                    
  0dc8:042a  03c8             add cx, ax                               
  0dc8:042c  13f2             adc si, dx                               
  0dc8:042e  8bd6             mov dx, si                               
  0dc8:0430  97               xchg di, ax                              
  0dc8:0431  5e               pop si                                   
  0dc8:0432  5f               pop di                                   
  0dc8:0433  c3               ret                                      
  0dc8:0434  8bf7             mov si, di                               
  0dc8:0436  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:0439  90               nop                                      
  0dc8:043a  e8d5fb           call 0x12                                -> 0dc8:0012
  0dc8:043d  722f             jb 0x46e                                 
  0dc8:043f  817f080140       cmp word ptr [bx + 8], 0x4001            
  0dc8:0444  7c30             jl 0x476                                 
  0dc8:0446  e80a0a           call 0xe53                               -> 0dc8:0e53
  0dc8:0449  eb23             jmp 0x46e                                
  0dc8:044b  8bf3             mov si, bx                               
  0dc8:044d  bbffff           mov bx, 0xffff                           
  0dc8:0450  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:0453  90               nop                                      
  0dc8:0454  e8bbfb           call 0x12                                -> 0dc8:0012
  0dc8:0457  7215             jb 0x46e                                 
  0dc8:0459  eb05             jmp 0x460                                
  0dc8:045b  b504             mov ch, 4                                
  0dc8:045d  e8b422           call 0x2714                              -> 0dc8:2714
  0dc8:0460  b80140           mov ax, 0x4001                           
  0dc8:0463  8a4ef9           mov cl, byte ptr [bp - 7]                
  0dc8:0466  90               nop                                      
  0dc8:0467  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:046a  90               nop                                      
  0dc8:046b  e8cf09           call 0xe3d                               -> 0dc8:0e3d
  0dc8:046e  e96103           jmp 0x7d2                                
  0dc8:0471  b510             mov ch, 0x10                             
  0dc8:0473  e89e22           call 0x2714                              -> 0dc8:2714
  0dc8:0476  b801c0           mov ax, 0xc001                           
  0dc8:0479  ebe8             jmp 0x463                                
  0dc8:047b  b508             mov ch, 8                                
  0dc8:047d  ebde             jmp 0x45d                                
  0dc8:047f  8b46ee           mov ax, word ptr [bp - 0x12]             
  0dc8:0482  0b46ec           or ax, word ptr [bp - 0x14]              
  0dc8:0485  755f             jne 0x4e6                                
  0dc8:0487  e95403           jmp 0x7de                                

proc_0dc8_048a:
  0dc8:048a  55               push bp                                  
  0dc8:048b  8bec             mov bp, sp                               
  0dc8:048d  56               push si                                  
  0dc8:048e  57               push di                                  
  0dc8:048f  8d66f4           lea sp, [bp - 0xc]                       
  0dc8:0492  8b7e06           mov di, word ptr [bp + 6]                
  0dc8:0495  8b5e08           mov bx, word ptr [bp + 8]                
  0dc8:0498  fc               cld                                      
  0dc8:0499  8a470a           mov al, byte ptr [bx + 0xa]              
  0dc8:049c  32450a           xor al, byte ptr [di + 0xa]              
  0dc8:049f  8846f9           mov byte ptr [bp - 7], al                
  0dc8:04a2  8b7508           mov si, word ptr [di + 8]                
  0dc8:04a5  8b4708           mov ax, word ptr [bx + 8]                
  0dc8:04a8  81fe0140         cmp si, 0x4001                           
  0dc8:04ac  7d86             jge 0x434                                
  0dc8:04ae  3d0140           cmp ax, 0x4001                           
  0dc8:04b1  7d98             jge 0x44b                                
  0dc8:04b3  81fe01c0         cmp si, 0xc001                           
  0dc8:04b7  7ea2             jle 0x45b                                
  0dc8:04b9  3d01c0           cmp ax, 0xc001                           
  0dc8:04bc  7eb8             jle 0x476                                
  0dc8:04be  2bc6             sub ax, si                               
  0dc8:04c0  3d0140           cmp ax, 0x4001                           
  0dc8:04c3  7db6             jge 0x47b                                
  0dc8:04c5  3d01c0           cmp ax, 0xc001                           
  0dc8:04c8  7ea7             jle 0x471                                
  0dc8:04ca  8b5506           mov dx, word ptr [di + 6]                
  0dc8:04cd  52               push dx                                  
  0dc8:04ce  8b4d04           mov cx, word ptr [di + 4]                
  0dc8:04d1  51               push cx                                  
  0dc8:04d2  ff7502           push word ptr [di + 2]                   
  0dc8:04d5  ff35             push word ptr [di]                       
  0dc8:04d7  8946fa           mov word ptr [bp - 6], ax                
  0dc8:04da  c646f800         mov byte ptr [bp - 8], 0                 
  0dc8:04de  8b7f06           mov di, word ptr [bx + 6]                
  0dc8:04e1  8b7704           mov si, word ptr [bx + 4]                
  0dc8:04e4  e399             jcxz 0x47f                               
  0dc8:04e6  91               xchg cx, ax                              
  0dc8:04e7  8b4f02           mov cx, word ptr [bx + 2]                
  0dc8:04ea  8b1f             mov bx, word ptr [bx]                    
  0dc8:04ec  3bfa             cmp di, dx                               
  0dc8:04ee  727a             jb 0x56a                                 
  0dc8:04f0  c646f801         mov byte ptr [bp - 8], 1                 
  0dc8:04f4  2b5eec           sub bx, word ptr [bp - 0x14]             
  0dc8:04f7  1b4eee           sbb cx, word ptr [bp - 0x12]             
  0dc8:04fa  1bf0             sbb si, ax                               
  0dc8:04fc  1bfa             sbb di, dx                               
  0dc8:04fe  736a             jae 0x56a                                
  0dc8:0500  2bc0             sub ax, ax                               
  0dc8:0502  99               cdq                                      
  0dc8:0503  2bc6             sub ax, si                               
  0dc8:0505  1bd7             sbb dx, di                               
  0dc8:0507  f776f2           div word ptr [bp - 0xe]                  
  0dc8:050a  8946f6           mov word ptr [bp - 0xa], ax              
  0dc8:050d  f766f2           mul word ptr [bp - 0xe]                  
  0dc8:0510  03f0             add si, ax                               
  0dc8:0512  13fa             adc di, dx                               
  0dc8:0514  8b46f0           mov ax, word ptr [bp - 0x10]             
  0dc8:0517  f766f6           mul word ptr [bp - 0xa]                  
  0dc8:051a  03c8             add cx, ax                               
  0dc8:051c  13f2             adc si, dx                               
  0dc8:051e  83d700           adc di, 0                                
  0dc8:0521  8b46ee           mov ax, word ptr [bp - 0x12]             
  0dc8:0524  f766f6           mul word ptr [bp - 0xa]                  
  0dc8:0527  03d8             add bx, ax                               
  0dc8:0529  13ca             adc cx, dx                               
  0dc8:052b  83d600           adc si, 0                                
  0dc8:052e  83d700           adc di, 0                                
  0dc8:0531  8b46ec           mov ax, word ptr [bp - 0x14]             
  0dc8:0534  f766f6           mul word ptr [bp - 0xa]                  
  0dc8:0537  f75ef6           neg word ptr [bp - 0xa]                  
  0dc8:053a  805ef800         sbb byte ptr [bp - 8], 0                 
  0dc8:053e  03da             add bx, dx                               
  0dc8:0540  83d100           adc cx, 0                                
  0dc8:0543  83d600           adc si, 0                                
  0dc8:0546  83d700           adc di, 0                                
  0dc8:0549  97               xchg di, ax                              
  0dc8:054a  7c19             jl 0x565                                 
  0dc8:054c  3b76f2           cmp si, word ptr [bp - 0xe]              
  0dc8:054f  7216             jb 0x567                                 
  0dc8:0551  8346f601         add word ptr [bp - 0xa], 1               
  0dc8:0555  8056f800         adc byte ptr [bp - 8], 0                 
  0dc8:0559  2b7eec           sub di, word ptr [bp - 0x14]             
  0dc8:055c  1b5eee           sbb bx, word ptr [bp - 0x12]             
  0dc8:055f  1b4ef0           sbb cx, word ptr [bp - 0x10]             
  0dc8:0562  1b76f2           sbb si, word ptr [bp - 0xe]              
  0dc8:0565  7c66             jl 0x5cd                                 
  0dc8:0567  e9cc00           jmp 0x636                                
  0dc8:056a  8bc6             mov ax, si                               
  0dc8:056c  8bd7             mov dx, di                               
  0dc8:056e  f776f2           div word ptr [bp - 0xe]                  
  0dc8:0571  8946f6           mov word ptr [bp - 0xa], ax              
  0dc8:0574  f766f2           mul word ptr [bp - 0xe]                  
  0dc8:0577  2bf0             sub si, ax                               
  0dc8:0579  1bfa             sbb di, dx                               
  0dc8:057b  8b46f0           mov ax, word ptr [bp - 0x10]             
  0dc8:057e  f766f6           mul word ptr [bp - 0xa]                  
  0dc8:0581  2bc8             sub cx, ax                               
  0dc8:0583  1bf2             sbb si, dx                               
  0dc8:0585  83df00           sbb di, 0                                
  0dc8:0588  8b46ee           mov ax, word ptr [bp - 0x12]             
  0dc8:058b  f766f6           mul word ptr [bp - 0xa]                  
  0dc8:058e  2bd8             sub bx, ax                               
  0dc8:0590  1bca             sbb cx, dx                               
  0dc8:0592  83de00           sbb si, 0                                
  0dc8:0595  83df00           sbb di, 0                                
  0dc8:0598  8b46ec           mov ax, word ptr [bp - 0x14]             
  0dc8:059b  f766f6           mul word ptr [bp - 0xa]                  
  0dc8:059e  f7d8             neg ax                                   
  0dc8:05a0  1bda             sbb bx, dx                               
  0dc8:05a2  83d900           sbb cx, 0                                
  0dc8:05a5  83de00           sbb si, 0                                
  0dc8:05a8  83df00           sbb di, 0                                
  0dc8:05ab  97               xchg di, ax                              
  0dc8:05ac  7db9             jge 0x567                                
  0dc8:05ae  8bd6             mov dx, si                               
  0dc8:05b0  f7da             neg dx                                   
  0dc8:05b2  3b56f2           cmp dx, word ptr [bp - 0xe]              
  0dc8:05b5  7216             jb 0x5cd                                 
  0dc8:05b7  836ef601         sub word ptr [bp - 0xa], 1               
  0dc8:05bb  805ef800         sbb byte ptr [bp - 8], 0                 
  0dc8:05bf  037eec           add di, word ptr [bp - 0x14]             
  0dc8:05c2  135eee           adc bx, word ptr [bp - 0x12]             
  0dc8:05c5  134ef0           adc cx, word ptr [bp - 0x10]             
  0dc8:05c8  1376f2           adc si, word ptr [bp - 0xe]              
  0dc8:05cb  7d69             jge 0x636                                
  0dc8:05cd  2bc0             sub ax, ax                               
  0dc8:05cf  99               cdq                                      
  0dc8:05d0  2bc1             sub ax, cx                               
  0dc8:05d2  1bd6             sbb dx, si                               
  0dc8:05d4  f776f2           div word ptr [bp - 0xe]                  
  0dc8:05d7  8946f4           mov word ptr [bp - 0xc], ax              
  0dc8:05da  f766f2           mul word ptr [bp - 0xe]                  
  0dc8:05dd  03c8             add cx, ax                               
  0dc8:05df  13f2             adc si, dx                               
  0dc8:05e1  8b46f0           mov ax, word ptr [bp - 0x10]             
  0dc8:05e4  f766f4           mul word ptr [bp - 0xc]                  
  0dc8:05e7  03d8             add bx, ax                               
  0dc8:05e9  13ca             adc cx, dx                               
  0dc8:05eb  83d600           adc si, 0                                
  0dc8:05ee  8b46ee           mov ax, word ptr [bp - 0x12]             
  0dc8:05f1  f766f4           mul word ptr [bp - 0xc]                  
  0dc8:05f4  03f8             add di, ax                               
  0dc8:05f6  13da             adc bx, dx                               
  0dc8:05f8  83d100           adc cx, 0                                
  0dc8:05fb  83d600           adc si, 0                                
  0dc8:05fe  8b46ec           mov ax, word ptr [bp - 0x14]             
  0dc8:0601  f766f4           mul word ptr [bp - 0xc]                  
  0dc8:0604  2bc0             sub ax, ax                               
  0dc8:0606  f75ef4           neg word ptr [bp - 0xc]                  
  0dc8:0609  1946f6           sbb word ptr [bp - 0xa], ax              
  0dc8:060c  1846f8           sbb byte ptr [bp - 8], al                
  0dc8:060f  03fa             add di, dx                               
  0dc8:0611  13d8             adc bx, ax                               
  0dc8:0613  13c8             adc cx, ax                               
  0dc8:0615  13f0             adc si, ax                               
  0dc8:0617  7c7b             jl 0x694                                 
  0dc8:0619  3b4ef2           cmp cx, word ptr [bp - 0xe]              
  0dc8:061c  7215             jb 0x633                                 
  0dc8:061e  8346f401         add word ptr [bp - 0xc], 1               
  0dc8:0622  1146f6           adc word ptr [bp - 0xa], ax              
  0dc8:0625  1046f8           adc byte ptr [bp - 8], al                
  0dc8:0628  2b7eee           sub di, word ptr [bp - 0x12]             
  0dc8:062b  1b5ef0           sbb bx, word ptr [bp - 0x10]             
  0dc8:062e  1b4ef2           sbb cx, word ptr [bp - 0xe]              
  0dc8:0631  7c61             jl 0x694                                 
  0dc8:0633  e9b300           jmp 0x6e9                                
  0dc8:0636  8bc1             mov ax, cx                               
  0dc8:0638  8bd6             mov dx, si                               
  0dc8:063a  f776f2           div word ptr [bp - 0xe]                  
  0dc8:063d  8946f4           mov word ptr [bp - 0xc], ax              
  0dc8:0640  f766f2           mul word ptr [bp - 0xe]                  
  0dc8:0643  2bc8             sub cx, ax                               
  0dc8:0645  1bf2             sbb si, dx                               
  0dc8:0647  8b46f0           mov ax, word ptr [bp - 0x10]             
  0dc8:064a  f766f4           mul word ptr [bp - 0xc]                  
  0dc8:064d  2bd8             sub bx, ax                               
  0dc8:064f  1bca             sbb cx, dx                               
  0dc8:0651  83de00           sbb si, 0                                
  0dc8:0654  8b46ee           mov ax, word ptr [bp - 0x12]             
  0dc8:0657  f766f4           mul word ptr [bp - 0xc]                  
  0dc8:065a  2bf8             sub di, ax                               
  0dc8:065c  1bda             sbb bx, dx                               
  0dc8:065e  83d900           sbb cx, 0                                
  0dc8:0661  83de00           sbb si, 0                                
  0dc8:0664  8b46ec           mov ax, word ptr [bp - 0x14]             
  0dc8:0667  f766f4           mul word ptr [bp - 0xc]                  
  0dc8:066a  2bc0             sub ax, ax                               
  0dc8:066c  2bfa             sub di, dx                               
  0dc8:066e  1bd8             sbb bx, ax                               
  0dc8:0670  1bc8             sbb cx, ax                               
  0dc8:0672  1bf0             sbb si, ax                               
  0dc8:0674  7d73             jge 0x6e9                                
  0dc8:0676  8bd1             mov dx, cx                               
  0dc8:0678  f7da             neg dx                                   
  0dc8:067a  3b56f2           cmp dx, word ptr [bp - 0xe]              
  0dc8:067d  7215             jb 0x694                                 
  0dc8:067f  836ef401         sub word ptr [bp - 0xc], 1               
  0dc8:0683  1946f6           sbb word ptr [bp - 0xa], ax              
  0dc8:0686  1846f8           sbb byte ptr [bp - 8], al                
  0dc8:0689  037eee           add di, word ptr [bp - 0x12]             
  0dc8:068c  135ef0           adc bx, word ptr [bp - 0x10]             
  0dc8:068f  134ef2           adc cx, word ptr [bp - 0xe]              
  0dc8:0692  7d55             jge 0x6e9                                
  0dc8:0694  2bc0             sub ax, ax                               
  0dc8:0696  99               cdq                                      
  0dc8:0697  2bc3             sub ax, bx                               
  0dc8:0699  1bd1             sbb dx, cx                               
  0dc8:069b  f776f2           div word ptr [bp - 0xe]                  
  0dc8:069e  8bf0             mov si, ax                               
  0dc8:06a0  f766f2           mul word ptr [bp - 0xe]                  
  0dc8:06a3  03d8             add bx, ax                               
  0dc8:06a5  13ca             adc cx, dx                               
  0dc8:06a7  8b46f0           mov ax, word ptr [bp - 0x10]             
  0dc8:06aa  f7e6             mul si                                   
  0dc8:06ac  03f8             add di, ax                               
  0dc8:06ae  13da             adc bx, dx                               
  0dc8:06b0  83d100           adc cx, 0                                
  0dc8:06b3  8b46ee           mov ax, word ptr [bp - 0x12]             
  0dc8:06b6  f7e6             mul si                                   
  0dc8:06b8  2bc0             sub ax, ax                               
  0dc8:06ba  f7de             neg si                                   
  0dc8:06bc  1946f4           sbb word ptr [bp - 0xc], ax              
  0dc8:06bf  1946f6           sbb word ptr [bp - 0xa], ax              
  0dc8:06c2  1846f8           sbb byte ptr [bp - 8], al                
  0dc8:06c5  03fa             add di, dx                               
  0dc8:06c7  13d8             adc bx, ax                               
  0dc8:06c9  13c8             adc cx, ax                               
  0dc8:06cb  7c64             jl 0x731                                 
  0dc8:06cd  3b5ef2           cmp bx, word ptr [bp - 0xe]              
  0dc8:06d0  7214             jb 0x6e6                                 
  0dc8:06d2  83c601           add si, 1                                
  0dc8:06d5  1146f4           adc word ptr [bp - 0xc], ax              
  0dc8:06d8  1146f6           adc word ptr [bp - 0xa], ax              
  0dc8:06db  1046f8           adc byte ptr [bp - 8], al                
  0dc8:06de  2b7ef0           sub di, word ptr [bp - 0x10]             
  0dc8:06e1  1b5ef2           sbb bx, word ptr [bp - 0xe]              
  0dc8:06e4  7c4b             jl 0x731                                 
  0dc8:06e6  e98a00           jmp 0x773                                
  0dc8:06e9  8bc3             mov ax, bx                               
  0dc8:06eb  8bd1             mov dx, cx                               
  0dc8:06ed  f776f2           div word ptr [bp - 0xe]                  
  0dc8:06f0  8bf0             mov si, ax                               
  0dc8:06f2  f766f2           mul word ptr [bp - 0xe]                  
  0dc8:06f5  2bd8             sub bx, ax                               
  0dc8:06f7  1bca             sbb cx, dx                               
  0dc8:06f9  8b46f0           mov ax, word ptr [bp - 0x10]             
  0dc8:06fc  f7e6             mul si                                   
  0dc8:06fe  2bf8             sub di, ax                               
  0dc8:0700  1bda             sbb bx, dx                               
  0dc8:0702  83d900           sbb cx, 0                                
  0dc8:0705  8b46ee           mov ax, word ptr [bp - 0x12]             
  0dc8:0708  f7e6             mul si                                   
  0dc8:070a  2bc0             sub ax, ax                               
  0dc8:070c  2bfa             sub di, dx                               
  0dc8:070e  1bd8             sbb bx, ax                               
  0dc8:0710  1bc8             sbb cx, ax                               
  0dc8:0712  7d5f             jge 0x773                                
  0dc8:0714  8bd3             mov dx, bx                               
  0dc8:0716  f7da             neg dx                                   
  0dc8:0718  3b56f2           cmp dx, word ptr [bp - 0xe]              
  0dc8:071b  7214             jb 0x731                                 
  0dc8:071d  83ee01           sub si, 1                                
  0dc8:0720  1946f4           sbb word ptr [bp - 0xc], ax              
  0dc8:0723  1946f6           sbb word ptr [bp - 0xa], ax              
  0dc8:0726  1846f8           sbb byte ptr [bp - 8], al                
  0dc8:0729  037ef0           add di, word ptr [bp - 0x10]             
  0dc8:072c  135ef2           adc bx, word ptr [bp - 0xe]              
  0dc8:072f  7d42             jge 0x773                                
  0dc8:0731  8b46f0           mov ax, word ptr [bp - 0x10]             
  0dc8:0734  d1e8             shr ax, 1                                
  0dc8:0736  f7d8             neg ax                                   
  0dc8:0738  8b4ef2           mov cx, word ptr [bp - 0xe]              
  0dc8:073b  03c1             add ax, cx                               
  0dc8:073d  2bd2             sub dx, dx                               
  0dc8:073f  2bc7             sub ax, di                               
  0dc8:0741  1bd3             sbb dx, bx                               
  0dc8:0743  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0dc8:0746  8b7ef6           mov di, word ptr [bp - 0xa]              
  0dc8:0749  3bd1             cmp dx, cx                               
  0dc8:074b  731b             jae 0x768                                
  0dc8:074d  f7f1             div cx                                   
  0dc8:074f  2bd1             sub dx, cx                               
  0dc8:0751  f7da             neg dx                                   
  0dc8:0753  f7d8             neg ax                                   
  0dc8:0755  8a56f8           mov dl, byte ptr [bp - 8]                
  0dc8:0758  83de00           sbb si, 0                                
  0dc8:075b  7334             jae 0x791                                
  0dc8:075d  83db00           sbb bx, 0                                
  0dc8:0760  83df00           sbb di, 0                                
  0dc8:0763  80da00           sbb dl, 0                                
  0dc8:0766  eb29             jmp 0x791                                
  0dc8:0768  2bc0             sub ax, ax                               
  0dc8:076a  99               cdq                                      
  0dc8:076b  f9               stc                                      
  0dc8:076c  ebe7             jmp 0x755                                
  0dc8:076e  2bc0             sub ax, ax                               
  0dc8:0770  99               cdq                                      
  0dc8:0771  eb1b             jmp 0x78e                                
  0dc8:0773  8b46f0           mov ax, word ptr [bp - 0x10]             
  0dc8:0776  d1e8             shr ax, 1                                
  0dc8:0778  f7d8             neg ax                                   
  0dc8:077a  99               cdq                                      
  0dc8:077b  03c7             add ax, di                               
  0dc8:077d  13d3             adc dx, bx                               
  0dc8:077f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0dc8:0782  8b7ef6           mov di, word ptr [bp - 0xa]              
  0dc8:0785  8b4ef2           mov cx, word ptr [bp - 0xe]              
  0dc8:0788  3bd1             cmp dx, cx                               
  0dc8:078a  73e2             jae 0x76e                                
  0dc8:078c  f7f1             div cx                                   
  0dc8:078e  8a56f8           mov dl, byte ptr [bp - 8]                
  0dc8:0791  d0ea             shr dl, 1                                
  0dc8:0793  730d             jae 0x7a2                                
  0dc8:0795  d1df             rcr di, 1                                
  0dc8:0797  d1db             rcr bx, 1                                
  0dc8:0799  d1de             rcr si, 1                                
  0dc8:079b  d1d8             rcr ax, 1                                
  0dc8:079d  d0de             rcr dh, 1                                
  0dc8:079f  ff46fa           inc word ptr [bp - 6]                    
  0dc8:07a2  d1e9             shr cx, 1                                
  0dc8:07a4  2aee             sub ch, dh                               
  0dc8:07a6  8b4efa           mov cx, word ptr [bp - 6]                
  0dc8:07a9  150000           adc ax, 0                                
  0dc8:07ac  730b             jae 0x7b9                                
  0dc8:07ae  13f0             adc si, ax                               
  0dc8:07b0  13d8             adc bx, ax                               
  0dc8:07b2  13f8             adc di, ax                               
  0dc8:07b4  7303             jae 0x7b9                                
  0dc8:07b6  d1df             rcr di, 1                                
  0dc8:07b8  41               inc cx                                   
  0dc8:07b9  81f90140         cmp cx, 0x4001                           
  0dc8:07bd  7d1c             jge 0x7db                                
  0dc8:07bf  8bd7             mov dx, di                               
  0dc8:07c1  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:07c4  fc               cld                                      
  0dc8:07c5  ab               stosw word ptr es:[di], ax               
  0dc8:07c6  96               xchg si, ax                              
  0dc8:07c7  ab               stosw word ptr es:[di], ax               
  0dc8:07c8  93               xchg bx, ax                              
  0dc8:07c9  ab               stosw word ptr es:[di], ax               
  0dc8:07ca  92               xchg dx, ax                              
  0dc8:07cb  ab               stosw word ptr es:[di], ax               
  0dc8:07cc  91               xchg cx, ax                              
  0dc8:07cd  ab               stosw word ptr es:[di], ax               
  0dc8:07ce  8a46f9           mov al, byte ptr [bp - 7]                
  0dc8:07d1  aa               stosb byte ptr es:[di], al               
  0dc8:07d2  8d66fc           lea sp, [bp - 4]                         
  0dc8:07d5  5f               pop di                                   
  0dc8:07d6  5e               pop si                                   
  0dc8:07d7  5d               pop bp                                   
  0dc8:07d8  c20600           ret 6                                    
  0dc8:07db  e982fc           jmp 0x460                                
  0dc8:07de  8bca             mov cx, dx                               
  0dc8:07e0  8bd7             mov dx, di                               
  0dc8:07e2  96               xchg si, ax                              
  0dc8:07e3  3bd1             cmp dx, cx                               
  0dc8:07e5  7206             jb 0x7ed                                 
  0dc8:07e7  2bd1             sub dx, cx                               
  0dc8:07e9  c646f801         mov byte ptr [bp - 8], 1                 
  0dc8:07ed  f7f1             div cx                                   
  0dc8:07ef  97               xchg di, ax                              
  0dc8:07f0  8b4702           mov ax, word ptr [bx + 2]                
  0dc8:07f3  f7f1             div cx                                   
  0dc8:07f5  8b1f             mov bx, word ptr [bx]                    
  0dc8:07f7  93               xchg bx, ax                              
  0dc8:07f8  f7f1             div cx                                   
  0dc8:07fa  96               xchg si, ax                              
  0dc8:07fb  2bc0             sub ax, ax                               
  0dc8:07fd  f7f1             div cx                                   
  0dc8:07ff  eb8d             jmp 0x78e                                
  0dc8:0801  8b360c00         mov si, word ptr [0xc]                   

proc_0dc8_0805:
  0dc8:0805  55               push bp                                  
  0dc8:0806  8bec             mov bp, sp                               
  0dc8:0808  56               push si                                  
  0dc8:0809  57               push di                                  
  0dc8:080a  8b4408           mov ax, word ptr [si + 8]                
  0dc8:080d  3d01c0           cmp ax, 0xc001                           
  0dc8:0810  7e29             jle 0x83b                                
  0dc8:0812  3d0140           cmp ax, 0x4001                           
  0dc8:0815  7d28             jge 0x83f                                
  0dc8:0817  807c0a00         cmp byte ptr [si + 0xa], 0               
  0dc8:081b  752c             jne 0x849                                
  0dc8:081d  e84b06           call 0xe6b                               -> 0dc8:0e6b
  0dc8:0820  e83700           call 0x85a                               -> 0dc8:085a
  0dc8:0823  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:0827  56               push si                                  
  0dc8:0828  57               push di                                  
  0dc8:0829  56               push si                                  
  0dc8:082a  e85dfc           call 0x48a                               -> 0dc8:048a
  0dc8:082d  57               push di                                  
  0dc8:082e  56               push si                                  
  0dc8:082f  56               push si                                  
  0dc8:0830  e8c0f8           call 0xf3                                -> 0dc8:00f3
  0dc8:0833  ff4c08           dec word ptr [si + 8]                    
  0dc8:0836  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:083b  5f               pop di                                   
  0dc8:083c  5e               pop si                                   
  0dc8:083d  5d               pop bp                                   
  0dc8:083e  c3               ret                                      
  0dc8:083f  bbffff           mov bx, 0xffff                           
  0dc8:0842  8bfe             mov di, si                               
  0dc8:0844  e8cbf7           call 0x12                                -> 0dc8:0012
  0dc8:0847  ebf2             jmp 0x83b                                
  0dc8:0849  b501             mov ch, 1                                
  0dc8:084b  e8c61e           call 0x2714                              -> 0dc8:2714
  0dc8:084e  8bfe             mov di, si                               
  0dc8:0850  e8d405           call 0xe27                               -> 0dc8:0e27
  0dc8:0853  c745080140       mov word ptr [di + 8], 0x4001            
  0dc8:0858  ebe1             jmp 0x83b                                
  0dc8:085a  56               push si                                  
  0dc8:085b  57               push di                                  
  0dc8:085c  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:0860  8b5d08           mov bx, word ptr [di + 8]                
  0dc8:0863  8b5506           mov dx, word ptr [di + 6]                
  0dc8:0866  8b4504           mov ax, word ptr [di + 4]                
  0dc8:0869  8b4d02           mov cx, word ptr [di + 2]                
  0dc8:086c  d1fb             sar bx, 1                                
  0dc8:086e  7307             jae 0x877                                
  0dc8:0870  43               inc bx                                   
  0dc8:0871  d1ea             shr dx, 1                                
  0dc8:0873  d1d8             rcr ax, 1                                
  0dc8:0875  d1d9             rcr cx, 1                                
  0dc8:0877  83fafe           cmp dx, -2                               
  0dc8:087a  731d             jae 0x899                                
  0dc8:087c  53               push bx                                  
  0dc8:087d  51               push cx                                  
  0dc8:087e  8bca             mov cx, dx                               
  0dc8:0880  8bd8             mov bx, ax                               
  0dc8:0882  8bf2             mov si, dx                               
  0dc8:0884  f9               stc                                      
  0dc8:0885  d1de             rcr si, 1                                
  0dc8:0887  f7f6             div si                                   
  0dc8:0889  4e               dec si                                   
  0dc8:088a  3bf0             cmp si, ax                               
  0dc8:088c  7612             jbe 0x8a0                                
  0dc8:088e  46               inc si                                   
  0dc8:088f  03f0             add si, ax                               
  0dc8:0891  d1de             rcr si, 1                                
  0dc8:0893  8bd1             mov dx, cx                               
  0dc8:0895  8bc3             mov ax, bx                               
  0dc8:0897  ebee             jmp 0x887                                
  0dc8:0899  f9               stc                                      
  0dc8:089a  d1da             rcr dx, 1                                
  0dc8:089c  d1d8             rcr ax, 1                                
  0dc8:089e  eb17             jmp 0x8b7                                
  0dc8:08a0  46               inc si                                   
  0dc8:08a1  3bf0             cmp si, ax                               
  0dc8:08a3  7301             jae 0x8a6                                
  0dc8:08a5  96               xchg si, ax                              
  0dc8:08a6  59               pop cx                                   
  0dc8:08a7  5b               pop bx                                   
  0dc8:08a8  91               xchg cx, ax                              
  0dc8:08a9  f7f6             div si                                   
  0dc8:08ab  2bd2             sub dx, dx                               
  0dc8:08ad  03f1             add si, cx                               
  0dc8:08af  d1de             rcr si, 1                                
  0dc8:08b1  d1d8             rcr ax, 1                                
  0dc8:08b3  13c2             adc ax, dx                               
  0dc8:08b5  13d6             adc dx, si                               
  0dc8:08b7  fc               cld                                      
  0dc8:08b8  2bc9             sub cx, cx                               
  0dc8:08ba  91               xchg cx, ax                              
  0dc8:08bb  ab               stosw word ptr es:[di], ax               
  0dc8:08bc  ab               stosw word ptr es:[di], ax               
  0dc8:08bd  91               xchg cx, ax                              
  0dc8:08be  ab               stosw word ptr es:[di], ax               
  0dc8:08bf  92               xchg dx, ax                              
  0dc8:08c0  ab               stosw word ptr es:[di], ax               
  0dc8:08c1  93               xchg bx, ax                              
  0dc8:08c2  ab               stosw word ptr es:[di], ax               
  0dc8:08c3  b000             mov al, 0                                
  0dc8:08c5  aa               stosb byte ptr es:[di], al               
  0dc8:08c6  5f               pop di                                   
  0dc8:08c7  5e               pop si                                   
  0dc8:08c8  c3               ret                                      
  0dc8:08c9  0002             add byte ptr [bp + si], al               
  0dc8:08cb  40               inc ax                                   
  0dc8:08cc  42               inc dx                                   
  0dc8:08cd  0103             add word ptr [bp + di], ax               
  0dc8:08cf  41               inc cx                                   
  0dc8:08d0  43               inc bx                                   

proc_0dc8_08d1:
  0dc8:08d1  55               push bp                                  
  0dc8:08d2  8bec             mov bp, sp                               
  0dc8:08d4  ff750a           push word ptr [di + 0xa]                 
  0dc8:08d7  8d66fa           lea sp, [bp - 6]                         
  0dc8:08da  56               push si                                  
  0dc8:08db  57               push di                                  
  0dc8:08dc  8b05             mov ax, word ptr [di]                    
  0dc8:08de  8b5d02           mov bx, word ptr [di + 2]                
  0dc8:08e1  8b4d04           mov cx, word ptr [di + 4]                
  0dc8:08e4  8b5506           mov dx, word ptr [di + 6]                
  0dc8:08e7  c746fc0000       mov word ptr [bp - 4], 0                 
  0dc8:08ec  8b7d08           mov di, word ptr [di + 8]                
  0dc8:08ef  2b7c08           sub di, word ptr [si + 8]                
  0dc8:08f2  7d17             jge 0x90b                                
  0dc8:08f4  eb51             jmp 0x947                                
  0dc8:08f6  47               inc di                                   
  0dc8:08f7  eb3d             jmp 0x936                                
  0dc8:08f9  4f               dec di                                   
  0dc8:08fa  7cfa             jl 0x8f6                                 
  0dc8:08fc  d166fc           shl word ptr [bp - 4], 1                 
  0dc8:08ff  d1e0             shl ax, 1                                
  0dc8:0901  d1d3             rcl bx, 1                                
  0dc8:0903  d1d1             rcl cx, 1                                
  0dc8:0905  13d2             adc dx, dx                               
  0dc8:0907  721b             jb 0x924                                 
  0dc8:0909  79ee             jns 0x8f9                                
  0dc8:090b  3b5406           cmp dx, word ptr [si + 6]                
  0dc8:090e  7714             ja 0x924                                 
  0dc8:0910  72e7             jb 0x8f9                                 
  0dc8:0912  3b4c04           cmp cx, word ptr [si + 4]                
  0dc8:0915  770d             ja 0x924                                 
  0dc8:0917  72e0             jb 0x8f9                                 
  0dc8:0919  3b5c02           cmp bx, word ptr [si + 2]                
  0dc8:091c  7706             ja 0x924                                 
  0dc8:091e  72d9             jb 0x8f9                                 
  0dc8:0920  3b04             cmp ax, word ptr [si]                    
  0dc8:0922  72d5             jb 0x8f9                                 
  0dc8:0924  ff46fc           inc word ptr [bp - 4]                    
  0dc8:0927  2b04             sub ax, word ptr [si]                    
  0dc8:0929  1b5c02           sbb bx, word ptr [si + 2]                
  0dc8:092c  1b4c04           sbb cx, word ptr [si + 4]                
  0dc8:092f  1b5406           sbb dx, word ptr [si + 6]                
  0dc8:0932  0bff             or di, di                                
  0dc8:0934  7fc3             jg 0x8f9                                 
  0dc8:0936  0bd2             or dx, dx                                
  0dc8:0938  780d             js 0x947                                 
  0dc8:093a  7443             je 0x97f                                 
  0dc8:093c  4f               dec di                                   
  0dc8:093d  d1e0             shl ax, 1                                
  0dc8:093f  d1d3             rcl bx, 1                                
  0dc8:0941  d1d1             rcl cx, 1                                
  0dc8:0943  13d2             adc dx, dx                               
  0dc8:0945  79f5             jns 0x93c                                
  0dc8:0947  037c08           add di, word ptr [si + 8]                
  0dc8:094a  57               push di                                  
  0dc8:094b  8b7ef6           mov di, word ptr [bp - 0xa]              
  0dc8:094e  ab               stosw word ptr es:[di], ax               
  0dc8:094f  93               xchg bx, ax                              
  0dc8:0950  ab               stosw word ptr es:[di], ax               
  0dc8:0951  91               xchg cx, ax                              
  0dc8:0952  ab               stosw word ptr es:[di], ax               
  0dc8:0953  92               xchg dx, ax                              
  0dc8:0954  ab               stosw word ptr es:[di], ax               
  0dc8:0955  58               pop ax                                   
  0dc8:0956  ab               stosw word ptr es:[di], ax               
  0dc8:0957  8a46fe           mov al, byte ptr [bp - 2]                
  0dc8:095a  aa               stosb byte ptr es:[di], al               
  0dc8:095b  80260100b8       and byte ptr [1], 0xb8                   
  0dc8:0960  bf0700           mov di, 7                                
  0dc8:0963  8b46fc           mov ax, word ptr [bp - 4]                
  0dc8:0966  807efe01         cmp byte ptr [bp - 2], 1                 
  0dc8:096a  7502             jne 0x96e                                
  0dc8:096c  f7d8             neg ax                                   
  0dc8:096e  23f8             and di, ax                               
  0dc8:0970  2e8a95c908       mov dl, byte ptr cs:[di + 0x8c9]         
  0dc8:0975  08160100         or byte ptr [1], dl                      
  0dc8:0979  5f               pop di                                   
  0dc8:097a  5e               pop si                                   
  0dc8:097b  8be5             mov sp, bp                               
  0dc8:097d  5d               pop bp                                   
  0dc8:097e  c3               ret                                      
  0dc8:097f  87d1             xchg cx, dx                              
  0dc8:0981  87cb             xchg bx, cx                              
  0dc8:0983  93               xchg bx, ax                              
  0dc8:0984  83ef10           sub di, 0x10                             
  0dc8:0987  0bd2             or dx, dx                                
  0dc8:0989  75ab             jne 0x936                                
  0dc8:098b  87d1             xchg cx, dx                              
  0dc8:098d  87cb             xchg bx, cx                              
  0dc8:098f  83ef10           sub di, 0x10                             
  0dc8:0992  0bd2             or dx, dx                                
  0dc8:0994  75a0             jne 0x936                                
  0dc8:0996  87d1             xchg cx, dx                              
  0dc8:0998  83ef10           sub di, 0x10                             
  0dc8:099b  0bd2             or dx, dx                                
  0dc8:099d  7597             jne 0x936                                
  0dc8:099f  bf01c0           mov di, 0xc001                           
  0dc8:09a2  2bd2             sub dx, dx                               
  0dc8:09a4  2bc9             sub cx, cx                               
  0dc8:09a6  2bdb             sub bx, bx                               
  0dc8:09a8  2bc0             sub ax, ax                               
  0dc8:09aa  eb9e             jmp 0x94a                                
  0dc8:09ac  8b5406           mov dx, word ptr [si + 6]                
  0dc8:09af  80e67f           and dh, 0x7f                             
  0dc8:09b2  0b14             or dx, word ptr [si]                     
  0dc8:09b4  0b5402           or dx, word ptr [si + 2]                 
  0dc8:09b7  0b5404           or dx, word ptr [si + 4]                 
  0dc8:09ba  7433             je 0x9ef                                 
  0dc8:09bc  b501             mov ch, 1                                
  0dc8:09be  e8531d           call 0x2714                              -> 0dc8:2714
  0dc8:09c1  b80045           mov ax, 0x4500                           
  0dc8:09c4  e99000           jmp 0xa57                                
  0dc8:09c7  8b5506           mov dx, word ptr [di + 6]                
  0dc8:09ca  80e67f           and dh, 0x7f                             
  0dc8:09cd  0b15             or dx, word ptr [di]                     
  0dc8:09cf  0b5502           or dx, word ptr [di + 2]                 
  0dc8:09d2  0b5504           or dx, word ptr [di + 4]                 
  0dc8:09d5  75e5             jne 0x9bc                                
  0dc8:09d7  eb1c             jmp 0x9f5                                

proc_0dc8_09d9:
  0dc8:09d9  55               push bp                                  
  0dc8:09da  8bec             mov bp, sp                               
  0dc8:09dc  56               push si                                  
  0dc8:09dd  57               push di                                  
  0dc8:09de  8b7606           mov si, word ptr [bp + 6]                
  0dc8:09e1  8b7e04           mov di, word ptr [bp + 4]                
  0dc8:09e4  8b4408           mov ax, word ptr [si + 8]                
  0dc8:09e7  8b5d08           mov bx, word ptr [di + 8]                
  0dc8:09ea  3d0140           cmp ax, 0x4001                           
  0dc8:09ed  7dbd             jge 0x9ac                                
  0dc8:09ef  81fb0140         cmp bx, 0x4001                           
  0dc8:09f3  7dd2             jge 0x9c7                                
  0dc8:09f5  8bd0             mov dx, ax                               
  0dc8:09f7  3bc3             cmp ax, bx                               
  0dc8:09f9  7f02             jg 0x9fd                                 
  0dc8:09fb  8bd3             mov dx, bx                               
  0dc8:09fd  81fa01c0         cmp dx, 0xc001                           
  0dc8:0a01  7e3b             jle 0xa3e                                
  0dc8:0a03  8a4c0a           mov cl, byte ptr [si + 0xa]              
  0dc8:0a06  3a4d0a           cmp cl, byte ptr [di + 0xa]              
  0dc8:0a09  7c49             jl 0xa54                                 
  0dc8:0a0b  7f3d             jg 0xa4a                                 
  0dc8:0a0d  3bc3             cmp ax, bx                               
  0dc8:0a0f  7c34             jl 0xa45                                 
  0dc8:0a11  7f3c             jg 0xa4f                                 
  0dc8:0a13  8b4406           mov ax, word ptr [si + 6]                
  0dc8:0a16  3b4506           cmp ax, word ptr [di + 6]                
  0dc8:0a19  7528             jne 0xa43                                
  0dc8:0a1b  b503             mov ch, 3                                
  0dc8:0a1d  222e0300         and ch, byte ptr [3]                     
  0dc8:0a21  743e             je 0xa61                                 
  0dc8:0a23  8b4404           mov ax, word ptr [si + 4]                
  0dc8:0a26  3b4504           cmp ax, word ptr [di + 4]                
  0dc8:0a29  7518             jne 0xa43                                
  0dc8:0a2b  8b4402           mov ax, word ptr [si + 2]                
  0dc8:0a2e  3b4502           cmp ax, word ptr [di + 2]                
  0dc8:0a31  7510             jne 0xa43                                
  0dc8:0a33  80fd02           cmp ch, 2                                
  0dc8:0a36  744b             je 0xa83                                 
  0dc8:0a38  8b04             mov ax, word ptr [si]                    
  0dc8:0a3a  3b05             cmp ax, word ptr [di]                    
  0dc8:0a3c  7505             jne 0xa43                                
  0dc8:0a3e  b80040           mov ax, 0x4000                           
  0dc8:0a41  eb14             jmp 0xa57                                
  0dc8:0a43  770a             ja 0xa4f                                 
  0dc8:0a45  80f900           cmp cl, 0                                
  0dc8:0a48  750a             jne 0xa54                                
  0dc8:0a4a  b80001           mov ax, 0x100                            
  0dc8:0a4d  eb08             jmp 0xa57                                
  0dc8:0a4f  80f900           cmp cl, 0                                
  0dc8:0a52  75f6             jne 0xa4a                                
  0dc8:0a54  b80000           mov ax, 0                                
  0dc8:0a57  88260100         mov byte ptr [1], ah                     
  0dc8:0a5b  5f               pop di                                   
  0dc8:0a5c  5e               pop si                                   
  0dc8:0a5d  5d               pop bp                                   
  0dc8:0a5e  c20400           ret 4                                    
  0dc8:0a61  8b1c             mov bx, word ptr [si]                    
  0dc8:0a63  2b1d             sub bx, word ptr [di]                    
  0dc8:0a65  8b5c02           mov bx, word ptr [si + 2]                
  0dc8:0a68  1b5d02           sbb bx, word ptr [di + 2]                
  0dc8:0a6b  8b5c04           mov bx, word ptr [si + 4]                
  0dc8:0a6e  1b5d04           sbb bx, word ptr [di + 4]                
  0dc8:0a71  7709             ja 0xa7c                                 
  0dc8:0a73  f7db             neg bx                                   
  0dc8:0a75  83e380           and bx, 0xff80                           
  0dc8:0a78  74c4             je 0xa3e                                 
  0dc8:0a7a  ebc9             jmp 0xa45                                
  0dc8:0a7c  83e380           and bx, 0xff80                           
  0dc8:0a7f  74bd             je 0xa3e                                 
  0dc8:0a81  ebcc             jmp 0xa4f                                
  0dc8:0a83  8b1c             mov bx, word ptr [si]                    
  0dc8:0a85  2b1d             sub bx, word ptr [di]                    
  0dc8:0a87  7709             ja 0xa92                                 
  0dc8:0a89  f7db             neg bx                                   
  0dc8:0a8b  80e7fc           and bh, 0xfc                             
  0dc8:0a8e  74ae             je 0xa3e                                 
  0dc8:0a90  ebb3             jmp 0xa45                                
  0dc8:0a92  80e7fc           and bh, 0xfc                             
  0dc8:0a95  74a7             je 0xa3e                                 
  0dc8:0a97  ebb6             jmp 0xa4f                                
  0dc8:0a99  b80040           mov ax, 0x4000                           
  0dc8:0a9c  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0dc8:0aa1  7e13             jle 0xab6                                
  0dc8:0aa3  817c080140       cmp word ptr [si + 8], 0x4001            
  0dc8:0aa8  7d11             jge 0xabb                                
  0dc8:0aaa  b80001           mov ax, 0x100                            
  0dc8:0aad  807c0a01         cmp byte ptr [si + 0xa], 1               
  0dc8:0ab1  7403             je 0xab6                                 
  0dc8:0ab3  b80000           mov ax, 0                                
  0dc8:0ab6  88260100         mov byte ptr [1], ah                     
  0dc8:0aba  c3               ret                                      
  0dc8:0abb  8b5406           mov dx, word ptr [si + 6]                
  0dc8:0abe  80e67f           and dh, 0x7f                             
  0dc8:0ac1  0b14             or dx, word ptr [si]                     
  0dc8:0ac3  0b5402           or dx, word ptr [si + 2]                 
  0dc8:0ac6  0b5404           or dx, word ptr [si + 4]                 
  0dc8:0ac9  74df             je 0xaaa                                 
  0dc8:0acb  b501             mov ch, 1                                
  0dc8:0acd  e8441c           call 0x2714                              -> 0dc8:2714
  0dc8:0ad0  b80045           mov ax, 0x4500                           
  0dc8:0ad3  ebe1             jmp 0xab6                                
  0dc8:0ad5  b80040           mov ax, 0x4000                           
  0dc8:0ad8  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0dc8:0add  7e13             jle 0xaf2                                
  0dc8:0adf  817c080140       cmp word ptr [si + 8], 0x4001            
  0dc8:0ae4  7d11             jge 0xaf7                                
  0dc8:0ae6  b80004           mov ax, 0x400                            
  0dc8:0ae9  807c0a01         cmp byte ptr [si + 0xa], 1               
  0dc8:0aed  7503             jne 0xaf2                                
  0dc8:0aef  0d0002           or ax, 0x200                             
  0dc8:0af2  88260100         mov byte ptr [1], ah                     
  0dc8:0af6  c3               ret                                      
  0dc8:0af7  b80005           mov ax, 0x500                            
  0dc8:0afa  8b5406           mov dx, word ptr [si + 6]                
  0dc8:0afd  80e67f           and dh, 0x7f                             
  0dc8:0b00  0b14             or dx, word ptr [si]                     
  0dc8:0b02  0b5402           or dx, word ptr [si + 2]                 
  0dc8:0b05  0b5404           or dx, word ptr [si + 4]                 
  0dc8:0b08  74df             je 0xae9                                 
  0dc8:0b0a  b80001           mov ax, 0x100                            
  0dc8:0b0d  ebda             jmp 0xae9                                
  0dc8:0b0f  8b4404           mov ax, word ptr [si + 4]                
  0dc8:0b12  8b5406           mov dx, word ptr [si + 6]                
  0dc8:0b15  8b5c08           mov bx, word ptr [si + 8]                
  0dc8:0b18  8a4c0a           mov cl, byte ptr [si + 0xa]              
  0dc8:0b1b  833c00           cmp word ptr [si], 0                     
  0dc8:0b1e  750f             jne 0xb2f                                
  0dc8:0b20  837c0200         cmp word ptr [si + 2], 0                 
  0dc8:0b24  7509             jne 0xb2f                                
  0dc8:0b26  a87f             test al, 0x7f                            
  0dc8:0b28  7505             jne 0xb2f                                
  0dc8:0b2a  f6c401           test ah, 1                               
  0dc8:0b2d  740f             je 0xb3e                                 
  0dc8:0b2f  02c0             add al, al                               
  0dc8:0b31  80d400           adc ah, 0                                
  0dc8:0b34  83d200           adc dx, 0                                
  0dc8:0b37  7305             jae 0xb3e                                
  0dc8:0b39  d1da             rcr dx, 1                                
  0dc8:0b3b  d1d8             rcr ax, 1                                
  0dc8:0b3d  43               inc bx                                   
  0dc8:0b3e  83c37e           add bx, 0x7e                             
  0dc8:0b41  7e32             jle 0xb75                                
  0dc8:0b43  81fbff00         cmp bx, 0xff                             
  0dc8:0b47  7d17             jge 0xb60                                
  0dc8:0b49  d1e2             shl dx, 1                                
  0dc8:0b4b  d0e9             shr cl, 1                                
  0dc8:0b4d  d0db             rcr bl, 1                                
  0dc8:0b4f  d1da             rcr dx, 1                                
  0dc8:0b51  8ac4             mov al, ah                               
  0dc8:0b53  8ae2             mov ah, dl                               
  0dc8:0b55  8ad6             mov dl, dh                               
  0dc8:0b57  8af3             mov dh, bl                               
  0dc8:0b59  ab               stosw word ptr es:[di], ax               
  0dc8:0b5a  92               xchg dx, ax                              
  0dc8:0b5b  ab               stosw word ptr es:[di], ax               
  0dc8:0b5c  83ef04           sub di, 4                                
  0dc8:0b5f  c3               ret                                      
  0dc8:0b60  817c080140       cmp word ptr [si + 8], 0x4001            
  0dc8:0b65  7d09             jge 0xb70                                
  0dc8:0b67  b508             mov ch, 8                                
  0dc8:0b69  e8a81b           call 0x2714                              -> 0dc8:2714
  0dc8:0b6c  2bd2             sub dx, dx                               
  0dc8:0b6e  2bc0             sub ax, ax                               
  0dc8:0b70  bbff00           mov bx, 0xff                             
  0dc8:0b73  ebd4             jmp 0xb49                                
  0dc8:0b75  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0dc8:0b7a  7e05             jle 0xb81                                
  0dc8:0b7c  b510             mov ch, 0x10                             
  0dc8:0b7e  e8931b           call 0x2714                              -> 0dc8:2714
  0dc8:0b81  2bdb             sub bx, bx                               
  0dc8:0b83  8bd3             mov dx, bx                               
  0dc8:0b85  8bc3             mov ax, bx                               
  0dc8:0b87  ebc0             jmp 0xb49                                
  0dc8:0b89  268b04           mov ax, word ptr es:[si]                 
  0dc8:0b8c  268b5402         mov dx, word ptr es:[si + 2]             
  0dc8:0b90  56               push si                                  
  0dc8:0b91  2bf6             sub si, si                               
  0dc8:0b93  d1e2             shl dx, 1                                
  0dc8:0b95  d1d6             rcl si, 1                                
  0dc8:0b97  2bdb             sub bx, bx                               
  0dc8:0b99  02de             add bl, dh                               
  0dc8:0b9b  742e             je 0xbcb                                 
  0dc8:0b9d  80feff           cmp dh, 0xff                             
  0dc8:0ba0  7424             je 0xbc6                                 
  0dc8:0ba2  83eb7e           sub bx, 0x7e                             
  0dc8:0ba5  f9               stc                                      
  0dc8:0ba6  d0da             rcr dl, 1                                
  0dc8:0ba8  8af2             mov dh, dl                               
  0dc8:0baa  8ad4             mov dl, ah                               
  0dc8:0bac  8ae8             mov ch, al                               
  0dc8:0bae  b100             mov cl, 0                                
  0dc8:0bb0  2bc0             sub ax, ax                               
  0dc8:0bb2  8905             mov word ptr [di], ax                    
  0dc8:0bb4  894502           mov word ptr [di + 2], ax                
  0dc8:0bb7  894d04           mov word ptr [di + 4], cx                
  0dc8:0bba  895506           mov word ptr [di + 6], dx                
  0dc8:0bbd  895d08           mov word ptr [di + 8], bx                
  0dc8:0bc0  96               xchg si, ax                              
  0dc8:0bc1  88450a           mov byte ptr [di + 0xa], al              
  0dc8:0bc4  5e               pop si                                   
  0dc8:0bc5  c3               ret                                      
  0dc8:0bc6  bb0140           mov bx, 0x4001                           
  0dc8:0bc9  ebda             jmp 0xba5                                
  0dc8:0bcb  8bca             mov cx, dx                               
  0dc8:0bcd  0bc8             or cx, ax                                
  0dc8:0bcf  740e             je 0xbdf                                 
  0dc8:0bd1  83eb7e           sub bx, 0x7e                             
  0dc8:0bd4  d0ea             shr dl, 1                                
  0dc8:0bd6  03c0             add ax, ax                               
  0dc8:0bd8  12d2             adc dl, dl                               
  0dc8:0bda  78cc             js 0xba8                                 
  0dc8:0bdc  4b               dec bx                                   
  0dc8:0bdd  ebf7             jmp 0xbd6                                
  0dc8:0bdf  bb01c0           mov bx, 0xc001                           
  0dc8:0be2  ebc4             jmp 0xba8                                
  0dc8:0be4  8ec1             mov es, cx                               
  0dc8:0be6  57               push di                                  
  0dc8:0be7  8b4401           mov ax, word ptr [si + 1]                
  0dc8:0bea  8b7c03           mov di, word ptr [si + 3]                
  0dc8:0bed  8b4c05           mov cx, word ptr [si + 5]                
  0dc8:0bf0  8a5407           mov dl, byte ptr [si + 7]                
  0dc8:0bf3  8b5c08           mov bx, word ptr [si + 8]                
  0dc8:0bf6  b603             mov dh, 3                                
  0dc8:0bf8  22f0             and dh, al                               
  0dc8:0bfa  0a34             or dh, byte ptr [si]                     
  0dc8:0bfc  7504             jne 0xc02                                
  0dc8:0bfe  a808             test al, 8                               
  0dc8:0c00  7411             je 0xc13                                 
  0dc8:0c02  050400           add ax, 4                                
  0dc8:0c05  83d700           adc di, 0                                
  0dc8:0c08  83d100           adc cx, 0                                
  0dc8:0c0b  80d200           adc dl, 0                                
  0dc8:0c0e  7303             jae 0xc13                                
  0dc8:0c10  d0da             rcr dl, 1                                
  0dc8:0c12  43               inc bx                                   
  0dc8:0c13  81c3fe03         add bx, 0x3fe                            
  0dc8:0c17  7e42             jle 0xc5b                                
  0dc8:0c19  81fbff07         cmp bx, 0x7ff                            
  0dc8:0c1d  7d49             jge 0xc68                                
  0dc8:0c1f  24f8             and al, 0xf8                             
  0dc8:0c21  d0e2             shl dl, 1                                
  0dc8:0c23  d1eb             shr bx, 1                                
  0dc8:0c25  d0da             rcr dl, 1                                
  0dc8:0c27  0ac7             or al, bh                                
  0dc8:0c29  8af3             mov dh, bl                               
  0dc8:0c2b  8bdf             mov bx, di                               
  0dc8:0c2d  d1ef             shr di, 1                                
  0dc8:0c2f  d1d8             rcr ax, 1                                
  0dc8:0c31  d1da             rcr dx, 1                                
  0dc8:0c33  d1d9             rcr cx, 1                                
  0dc8:0c35  d1db             rcr bx, 1                                
  0dc8:0c37  d1ef             shr di, 1                                
  0dc8:0c39  d1d8             rcr ax, 1                                
  0dc8:0c3b  d1da             rcr dx, 1                                
  0dc8:0c3d  d1d9             rcr cx, 1                                
  0dc8:0c3f  d1db             rcr bx, 1                                
  0dc8:0c41  0a440a           or al, byte ptr [si + 0xa]               
  0dc8:0c44  d1ef             shr di, 1                                
  0dc8:0c46  d1d8             rcr ax, 1                                
  0dc8:0c48  d1da             rcr dx, 1                                
  0dc8:0c4a  d1d9             rcr cx, 1                                
  0dc8:0c4c  d1db             rcr bx, 1                                
  0dc8:0c4e  5f               pop di                                   
  0dc8:0c4f  fc               cld                                      
  0dc8:0c50  ab               stosw word ptr es:[di], ax               
  0dc8:0c51  93               xchg bx, ax                              
  0dc8:0c52  ab               stosw word ptr es:[di], ax               
  0dc8:0c53  91               xchg cx, ax                              
  0dc8:0c54  ab               stosw word ptr es:[di], ax               
  0dc8:0c55  92               xchg dx, ax                              
  0dc8:0c56  ab               stosw word ptr es:[di], ax               
  0dc8:0c57  83ef08           sub di, 8                                
  0dc8:0c5a  c3               ret                                      
  0dc8:0c5b  2bd2             sub dx, dx                               
  0dc8:0c5d  817c0801c0       cmp word ptr [si + 8], 0xc001            
  0dc8:0c62  7e13             jle 0xc77                                
  0dc8:0c64  b510             mov ch, 0x10                             
  0dc8:0c66  eb0c             jmp 0xc74                                
  0dc8:0c68  817c080140       cmp word ptr [si + 8], 0x4001            
  0dc8:0c6d  7d15             jge 0xc84                                
  0dc8:0c6f  bae0ff           mov dx, 0xffe0                           
  0dc8:0c72  b508             mov ch, 8                                
  0dc8:0c74  e89d1a           call 0x2714                              -> 0dc8:2714
  0dc8:0c77  0a540a           or dl, byte ptr [si + 0xa]               
  0dc8:0c7a  d1ca             ror dx, 1                                
  0dc8:0c7c  2bc9             sub cx, cx                               
  0dc8:0c7e  8bd9             mov bx, cx                               
  0dc8:0c80  8bc1             mov ax, cx                               
  0dc8:0c82  ebca             jmp 0xc4e                                
  0dc8:0c84  bbff07           mov bx, 0x7ff                            
  0dc8:0c87  eb96             jmp 0xc1f                                
  0dc8:0c89  8bf3             mov si, bx                               
  0dc8:0c8b  8ec0             mov es, ax                               
  0dc8:0c8d  268b5406         mov dx, word ptr es:[si + 6]             
  0dc8:0c91  b90500           mov cx, 5                                
  0dc8:0c94  d1e2             shl dx, 1                                
  0dc8:0c96  d0d5             rcl ch, 1                                
  0dc8:0c98  886d0a           mov byte ptr [di + 0xa], ch              
  0dc8:0c9b  d3ea             shr dx, cl                               
  0dc8:0c9d  7463             je 0xd02                                 
  0dc8:0c9f  81faff07         cmp dx, 0x7ff                            
  0dc8:0ca3  7443             je 0xce8                                 
  0dc8:0ca5  b310             mov bl, 0x10                             
  0dc8:0ca7  81eafe03         sub dx, 0x3fe                            
  0dc8:0cab  895508           mov word ptr [di + 8], dx                
  0dc8:0cae  268b5405         mov dx, word ptr es:[si + 5]             
  0dc8:0cb2  80e60f           and dh, 0xf                              
  0dc8:0cb5  0af3             or dh, bl                                
  0dc8:0cb7  268b4c03         mov cx, word ptr es:[si + 3]             
  0dc8:0cbb  268b5c01         mov bx, word ptr es:[si + 1]             
  0dc8:0cbf  268a24           mov ah, byte ptr es:[si]                 
  0dc8:0cc2  b000             mov al, 0                                
  0dc8:0cc4  d1e0             shl ax, 1                                
  0dc8:0cc6  d1d3             rcl bx, 1                                
  0dc8:0cc8  d1d1             rcl cx, 1                                
  0dc8:0cca  d1d2             rcl dx, 1                                
  0dc8:0ccc  d1e0             shl ax, 1                                
  0dc8:0cce  d1d3             rcl bx, 1                                
  0dc8:0cd0  d1d1             rcl cx, 1                                
  0dc8:0cd2  d1d2             rcl dx, 1                                
  0dc8:0cd4  d1e0             shl ax, 1                                
  0dc8:0cd6  d1d3             rcl bx, 1                                
  0dc8:0cd8  d1d1             rcl cx, 1                                
  0dc8:0cda  d1d2             rcl dx, 1                                
  0dc8:0cdc  8905             mov word ptr [di], ax                    
  0dc8:0cde  895d02           mov word ptr [di + 2], bx                
  0dc8:0ce1  894d04           mov word ptr [di + 4], cx                
  0dc8:0ce4  895506           mov word ptr [di + 6], dx                
  0dc8:0ce7  c3               ret                                      
  0dc8:0ce8  bb0f00           mov bx, 0xf                              
  0dc8:0ceb  26225c06         and bl, byte ptr es:[si + 6]             
  0dc8:0cef  260b5c04         or bx, word ptr es:[si + 4]              
  0dc8:0cf3  260b5c02         or bx, word ptr es:[si + 2]              
  0dc8:0cf7  260b1c           or bx, word ptr es:[si]                  
  0dc8:0cfa  ba0140           mov dx, 0x4001                           
  0dc8:0cfd  80cb10           or bl, 0x10                              
  0dc8:0d00  eba9             jmp 0xcab                                
  0dc8:0d02  bb0f00           mov bx, 0xf                              
  0dc8:0d05  26225c06         and bl, byte ptr es:[si + 6]             
  0dc8:0d09  260b5c04         or bx, word ptr es:[si + 4]              
  0dc8:0d0d  260b5c02         or bx, word ptr es:[si + 2]              
  0dc8:0d11  260b1c           or bx, word ptr es:[si]                  
  0dc8:0d14  7505             jne 0xd1b                                
  0dc8:0d16  ba01c0           mov dx, 0xc001                           
  0dc8:0d19  eb90             jmp 0xcab                                
  0dc8:0d1b  268b5405         mov dx, word ptr es:[si + 5]             
  0dc8:0d1f  80e60f           and dh, 0xf                              
  0dc8:0d22  268b4c03         mov cx, word ptr es:[si + 3]             
  0dc8:0d26  268b5c01         mov bx, word ptr es:[si + 1]             
  0dc8:0d2a  268a24           mov ah, byte ptr es:[si]                 
  0dc8:0d2d  b004             mov al, 4                                
  0dc8:0d2f  fec8             dec al                                   
  0dc8:0d31  d0e4             shl ah, 1                                
  0dc8:0d33  d1d3             rcl bx, 1                                
  0dc8:0d35  d1d1             rcl cx, 1                                
  0dc8:0d37  13d2             adc dx, dx                               
  0dc8:0d39  79f4             jns 0xd2f                                
  0dc8:0d3b  50               push ax                                  
  0dc8:0d3c  b400             mov ah, 0                                
  0dc8:0d3e  2dfe04           sub ax, 0x4fe                            
  0dc8:0d41  894508           mov word ptr [di + 8], ax                
  0dc8:0d44  58               pop ax                                   
  0dc8:0d45  b000             mov al, 0                                
  0dc8:0d47  eb93             jmp 0xcdc                                
  0dc8:0d49  8ec1             mov es, cx                               
  0dc8:0d4b  fc               cld                                      
  0dc8:0d4c  a5               movsw word ptr es:[di], word ptr [si]    
  0dc8:0d4d  a5               movsw word ptr es:[di], word ptr [si]    
  0dc8:0d4e  a5               movsw word ptr es:[di], word ptr [si]    
  0dc8:0d4f  a5               movsw word ptr es:[di], word ptr [si]    
  0dc8:0d50  ad               lodsw ax, word ptr [si]                  
  0dc8:0d51  8a0c             mov cl, byte ptr [si]                    
  0dc8:0d53  3d0140           cmp ax, 0x4001                           
  0dc8:0d56  7d13             jge 0xd6b                                
  0dc8:0d58  05fe3f           add ax, 0x3ffe                           
  0dc8:0d5b  7c13             jl 0xd70                                 
  0dc8:0d5d  d1e0             shl ax, 1                                
  0dc8:0d5f  d0e9             shr cl, 1                                
  0dc8:0d61  d1d8             rcr ax, 1                                
  0dc8:0d63  ab               stosw word ptr es:[di], ax               
  0dc8:0d64  83ef0a           sub di, 0xa                              
  0dc8:0d67  83ee0a           sub si, 0xa                              
  0dc8:0d6a  c3               ret                                      
  0dc8:0d6b  b8ff7f           mov ax, 0x7fff                           
  0dc8:0d6e  ebed             jmp 0xd5d                                
  0dc8:0d70  2bc0             sub ax, ax                               
  0dc8:0d72  ebe9             jmp 0xd5d                                
  0dc8:0d74  8bf3             mov si, bx                               
  0dc8:0d76  8ec0             mov es, ax                               
  0dc8:0d78  56               push si                                  
  0dc8:0d79  8cd9             mov cx, ds                               
  0dc8:0d7b  8cc2             mov dx, es                               
  0dc8:0d7d  8ec1             mov es, cx                               
  0dc8:0d7f  8eda             mov ds, dx                               
  0dc8:0d81  fd               std                                      
  0dc8:0d82  8d7408           lea si, [si + 8]                         
  0dc8:0d85  8d7d0a           lea di, [di + 0xa]                       
  0dc8:0d88  ad               lodsw ax, word ptr [si]                  
  0dc8:0d89  93               xchg bx, ax                              
  0dc8:0d8a  2bc0             sub ax, ax                               
  0dc8:0d8c  d1e3             shl bx, 1                                
  0dc8:0d8e  d1d0             rcl ax, 1                                
  0dc8:0d90  aa               stosb byte ptr es:[di], al               
  0dc8:0d91  4f               dec di                                   
  0dc8:0d92  d1eb             shr bx, 1                                
  0dc8:0d94  7413             je 0xda9                                 
  0dc8:0d96  81ebfe3f         sub bx, 0x3ffe                           
  0dc8:0d9a  93               xchg bx, ax                              
  0dc8:0d9b  ab               stosw word ptr es:[di], ax               
  0dc8:0d9c  a5               movsw word ptr es:[di], word ptr [si]    
  0dc8:0d9d  a5               movsw word ptr es:[di], word ptr [si]    
  0dc8:0d9e  a5               movsw word ptr es:[di], word ptr [si]    
  0dc8:0d9f  a5               movsw word ptr es:[di], word ptr [si]    
  0dc8:0da0  fc               cld                                      
  0dc8:0da1  8ec2             mov es, dx                               
  0dc8:0da3  8ed9             mov ds, cx                               
  0dc8:0da5  47               inc di                                   
  0dc8:0da6  47               inc di                                   
  0dc8:0da7  5e               pop si                                   
  0dc8:0da8  c3               ret                                      
  0dc8:0da9  b801c0           mov ax, 0xc001                           
  0dc8:0dac  ab               stosw word ptr es:[di], ax               
  0dc8:0dad  2bc0             sub ax, ax                               
  0dc8:0daf  ab               stosw word ptr es:[di], ax               
  0dc8:0db0  ab               stosw word ptr es:[di], ax               
  0dc8:0db1  ab               stosw word ptr es:[di], ax               
  0dc8:0db2  ab               stosw word ptr es:[di], ax               
  0dc8:0db3  ebeb             jmp 0xda0                                
  0dc8:0db5  0000             add byte ptr [bx + si], al               
  0dc8:0db7  0000             add byte ptr [bx + si], al               
  0dc8:0db9  0000             add byte ptr [bx + si], al               
  0dc8:0dbb  00800100         add byte ptr [bx + si + 1], al           
  0dc8:0dbf  0000             add byte ptr [bx + si], al               
  0dc8:0dc1  b8b50d           mov ax, 0xdb5                             ; "Floating point error: %s."
  0dc8:0dc4  eb64             jmp 0xe2a                                
  0dc8:0dc6  fe8a1bcd         dec byte ptr [bp + si - 0x32e5]          
  0dc8:0dca  4b               dec bx                                   
  0dc8:0dcb  789a             js 0xd67                                 
  0dc8:0dcd  d402             aam 2                                    
  0dc8:0dcf  0000             add byte ptr [bx + si], al               
  0dc8:0dd1  00b8c60d         add byte ptr [bx + si + 0xdc6], bh       
  0dc8:0dd5  eb53             jmp 0xe2a                                
  0dc8:0dd7  bbf017           mov bx, 0x17f0                           
  0dc8:0dda  5c               pop sp                                   
  0dc8:0ddb  293b             sub word ptr [bp + di], di               
  0dc8:0ddd  aa               stosb byte ptr es:[di], al               
  0dc8:0dde  b80100           mov ax, 1                                
  0dc8:0de1  0000             add byte ptr [bx + si], al               
  0dc8:0de3  b8d70d           mov ax, 0xdd7                            
  0dc8:0de6  eb42             jmp 0xe2a                                
  0dc8:0de8  35c268           xor ax, 0x68c2                           
  0dc8:0deb  21a2da0f         and word ptr [bp + si + 0xfda], sp       
  0dc8:0def  c9               leave                                    
  0dc8:0df0  0200             add al, byte ptr [bx + si]               
  0dc8:0df2  0000             add byte ptr [bx + si], al               
  0dc8:0df4  b8e80d           mov ax, 0xde8                            
  0dc8:0df7  eb31             jmp 0xe2a                                
  0dc8:0df9  99               cdq                                      
  0dc8:0dfa  f7cffb84         test di, 0x84fb                          
  0dc8:0dfe  9a209affff       lcall 0xffff, 0x9a20                     -> ffff:9a20
  0dc8:0e03  0000             add byte ptr [bx + si], al               
  0dc8:0e05  b8f90d           mov ax, 0xdf9                            
  0dc8:0e08  eb20             jmp 0xe2a                                
  0dc8:0e0a  ac               lodsb al, byte ptr [si]                  
  0dc8:0e0b  79cf             jns 0xddc                                
  0dc8:0e0d  d1f7             sal di, 1                                
  0dc8:0e0f  17               pop ss                                   
  0dc8:0e10  72b1             jb 0xdc3                                 
  0dc8:0e12  0000             add byte ptr [bx + si], al               
  0dc8:0e14  0000             add byte ptr [bx + si], al               
  0dc8:0e16  b80a0e           mov ax, 0xe0a                            
  0dc8:0e19  eb0f             jmp 0xe2a                                
  0dc8:0e1b  0000             add byte ptr [bx + si], al               
  0dc8:0e1d  0000             add byte ptr [bx + si], al               
  0dc8:0e1f  0000             add byte ptr [bx + si], al               
  0dc8:0e21  0000             add byte ptr [bx + si], al               
  0dc8:0e23  01c0             add ax, ax                               
  0dc8:0e25  0000             add byte ptr [bx + si], al               
  0dc8:0e27  b81b0e           mov ax, 0xe1b                            
  0dc8:0e2a  1e               push ds                                  
  0dc8:0e2b  8cc9             mov cx, cs                               
  0dc8:0e2d  8ed9             mov ds, cx                               
  0dc8:0e2f  96               xchg si, ax                              
  0dc8:0e30  fc               cld                                      
  0dc8:0e31  b90500           mov cx, 5                                
  0dc8:0e34  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:0e36  a4               movsb byte ptr es:[di], byte ptr [si]    
  0dc8:0e37  83ef0b           sub di, 0xb                              
  0dc8:0e3a  96               xchg si, ax                              
  0dc8:0e3b  1f               pop ds                                   
  0dc8:0e3c  c3               ret                                      
  0dc8:0e3d  fc               cld                                      
  0dc8:0e3e  57               push di                                  
  0dc8:0e3f  50               push ax                                  
  0dc8:0e40  3d01c0           cmp ax, 0xc001                           
  0dc8:0e43  b80000           mov ax, 0                                
  0dc8:0e46  ab               stosw word ptr es:[di], ax               
  0dc8:0e47  ab               stosw word ptr es:[di], ax               
  0dc8:0e48  ab               stosw word ptr es:[di], ax               
  0dc8:0e49  d1d8             rcr ax, 1                                
  0dc8:0e4b  ab               stosw word ptr es:[di], ax               
  0dc8:0e4c  58               pop ax                                   
  0dc8:0e4d  ab               stosw word ptr es:[di], ax               
  0dc8:0e4e  8ac1             mov al, cl                               
  0dc8:0e50  aa               stosb byte ptr es:[di], al               
  0dc8:0e51  5f               pop di                                   
  0dc8:0e52  c3               ret                                      
  0dc8:0e53  b501             mov ch, 1                                
  0dc8:0e55  e8bc18           call 0x2714                              -> 0dc8:2714
  0dc8:0e58  57               push di                                  
  0dc8:0e59  2bc0             sub ax, ax                               
  0dc8:0e5b  fc               cld                                      
  0dc8:0e5c  ab               stosw word ptr es:[di], ax               
  0dc8:0e5d  ab               stosw word ptr es:[di], ax               
  0dc8:0e5e  ab               stosw word ptr es:[di], ax               
  0dc8:0e5f  b4c0             mov ah, 0xc0                             
  0dc8:0e61  ab               stosw word ptr es:[di], ax               
  0dc8:0e62  b80140           mov ax, 0x4001                           
  0dc8:0e65  ab               stosw word ptr es:[di], ax               
  0dc8:0e66  b001             mov al, 1                                
  0dc8:0e68  aa               stosb byte ptr es:[di], al               
  0dc8:0e69  5f               pop di                                   
  0dc8:0e6a  c3               ret                                      
  0dc8:0e6b  57               push di                                  
  0dc8:0e6c  06               push es                                  
  0dc8:0e6d  8cd7             mov di, ss                               
  0dc8:0e6f  8ec7             mov es, di                               
  0dc8:0e71  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:0e76  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:0e7a  fc               cld                                      
  0dc8:0e7b  b90500           mov cx, 5                                
  0dc8:0e7e  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:0e80  a4               movsb byte ptr es:[di], byte ptr [si]    
  0dc8:0e81  07               pop es                                   
  0dc8:0e82  5f               pop di                                   
  0dc8:0e83  83ee0b           sub si, 0xb                              
  0dc8:0e86  c3               ret                                      
  0dc8:0e87  56               push si                                  
  0dc8:0e88  57               push di                                  
  0dc8:0e89  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:0e8e  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:0e92  1e               push ds                                  
  0dc8:0e93  06               push es                                  
  0dc8:0e94  1e               push ds                                  
  0dc8:0e95  07               pop es                                   
  0dc8:0e96  0e               push cs                                  
  0dc8:0e97  1f               pop ds                                   
  0dc8:0e98  fc               cld                                      
  0dc8:0e99  b90500           mov cx, 5                                
  0dc8:0e9c  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:0e9e  a4               movsb byte ptr es:[di], byte ptr [si]    
  0dc8:0e9f  07               pop es                                   
  0dc8:0ea0  1f               pop ds                                   
  0dc8:0ea1  5f               pop di                                   
  0dc8:0ea2  5e               pop si                                   
  0dc8:0ea3  c3               ret                                      
  0dc8:0ea4  56               push si                                  
  0dc8:0ea5  8b360c00         mov si, word ptr [0xc]                   
  0dc8:0ea9  fc               cld                                      
  0dc8:0eaa  b90500           mov cx, 5                                
  0dc8:0ead  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:0eaf  a4               movsb byte ptr es:[di], byte ptr [si]    
  0dc8:0eb0  46               inc si                                   
  0dc8:0eb1  89360c00         mov word ptr [0xc], si                   
  0dc8:0eb5  83ef0b           sub di, 0xb                              
  0dc8:0eb8  5e               pop si                                   
  0dc8:0eb9  c3               ret                                      
  0dc8:0eba  56               push si                                  
  0dc8:0ebb  57               push di                                  
  0dc8:0ebc  06               push es                                  
  0dc8:0ebd  8b360c00         mov si, word ptr [0xc]                   
  0dc8:0ec1  8d7cf4           lea di, [si - 0xc]                       
  0dc8:0ec4  893e0c00         mov word ptr [0xc], di                   
  0dc8:0ec8  fc               cld                                      
  0dc8:0ec9  8cd1             mov cx, ss                               
  0dc8:0ecb  8ec1             mov es, cx                               
  0dc8:0ecd  b90500           mov cx, 5                                
  0dc8:0ed0  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:0ed2  a4               movsb byte ptr es:[di], byte ptr [si]    
  0dc8:0ed3  07               pop es                                   
  0dc8:0ed4  5f               pop di                                   
  0dc8:0ed5  5e               pop si                                   
  0dc8:0ed6  c3               ret                                      
  0dc8:0ed7  56               push si                                  
  0dc8:0ed8  57               push di                                  
  0dc8:0ed9  8b360c00         mov si, word ptr [0xc]                   
  0dc8:0edd  8bfe             mov di, si                               
  0dc8:0edf  fc               cld                                      
  0dc8:0ee0  06               push es                                  
  0dc8:0ee1  8cd1             mov cx, ss                               
  0dc8:0ee3  8ec1             mov es, cx                               
  0dc8:0ee5  b90500           mov cx, 5                                
  0dc8:0ee8  ad               lodsw ax, word ptr [si]                  
  0dc8:0ee9  87450c           xchg word ptr [di + 0xc], ax             
  0dc8:0eec  ab               stosw word ptr es:[di], ax               
  0dc8:0eed  e2f9             loop 0xee8                               
  0dc8:0eef  ac               lodsb al, byte ptr [si]                  
  0dc8:0ef0  86450c           xchg byte ptr [di + 0xc], al             
  0dc8:0ef3  aa               stosb byte ptr es:[di], al               
  0dc8:0ef4  07               pop es                                   
  0dc8:0ef5  5f               pop di                                   
  0dc8:0ef6  5e               pop si                                   
  0dc8:0ef7  c3               ret                                      
  0dc8:0ef8  268b04           mov ax, word ptr es:[si]                 
  0dc8:0efb  2bc9             sub cx, cx                               
  0dc8:0efd  99               cdq                                      
  0dc8:0efe  33c2             xor ax, dx                               
  0dc8:0f00  2bc2             sub ax, dx                               
  0dc8:0f02  7432             je 0xf36                                 
  0dc8:0f04  80e201           and dl, 1                                
  0dc8:0f07  8bd9             mov bx, cx                               
  0dc8:0f09  91               xchg cx, ax                              
  0dc8:0f0a  d1e0             shl ax, 1                                
  0dc8:0f0c  d1d8             rcr ax, 1                                
  0dc8:0f0e  43               inc bx                                   
  0dc8:0f0f  d1e9             shr cx, 1                                
  0dc8:0f11  d1d8             rcr ax, 1                                
  0dc8:0f13  e307             jcxz 0xf1c                               
  0dc8:0f15  43               inc bx                                   
  0dc8:0f16  d1e9             shr cx, 1                                
  0dc8:0f18  75f2             jne 0xf0c                                
  0dc8:0f1a  d1d8             rcr ax, 1                                
  0dc8:0f1c  88550a           mov byte ptr [di + 0xa], dl              
  0dc8:0f1f  895d08           mov word ptr [di + 8], bx                
  0dc8:0f22  894506           mov word ptr [di + 6], ax                
  0dc8:0f25  894d04           mov word ptr [di + 4], cx                
  0dc8:0f28  894d02           mov word ptr [di + 2], cx                
  0dc8:0f2b  890d             mov word ptr [di], cx                    
  0dc8:0f2d  c3               ret                                      
  0dc8:0f2e  2bc9             sub cx, cx                               
  0dc8:0f30  8bd1             mov dx, cx                               
  0dc8:0f32  0bc0             or ax, ax                                
  0dc8:0f34  75d1             jne 0xf07                                
  0dc8:0f36  bb01c0           mov bx, 0xc001                           
  0dc8:0f39  ebe1             jmp 0xf1c                                
  0dc8:0f3b  8b4c08           mov cx, word ptr [si + 8]                
  0dc8:0f3e  83f910           cmp cx, 0x10                             
  0dc8:0f41  7f70             jg 0xfb3                                 
  0dc8:0f43  81f901c0         cmp cx, 0xc001                           
  0dc8:0f47  7e74             jle 0xfbd                                
  0dc8:0f49  8b5c06           mov bx, word ptr [si + 6]                
  0dc8:0f4c  2bc0             sub ax, ax                               
  0dc8:0f4e  0bc9             or cx, cx                                
  0dc8:0f50  7d04             jge 0xf56                                
  0dc8:0f52  d1eb             shr bx, 1                                
  0dc8:0f54  d1da             rcr dx, 1                                
  0dc8:0f56  8b5404           mov dx, word ptr [si + 4]                
  0dc8:0f59  0bc9             or cx, cx                                
  0dc8:0f5b  7e08             jle 0xf65                                
  0dc8:0f5d  d1e2             shl dx, 1                                
  0dc8:0f5f  d1d3             rcl bx, 1                                
  0dc8:0f61  d1d0             rcl ax, 1                                
  0dc8:0f63  e2f8             loop 0xf5d                               
  0dc8:0f65  0b14             or dx, word ptr [si]                     
  0dc8:0f67  0b5402           or dx, word ptr [si + 2]                 
  0dc8:0f6a  0ade             or bl, dh                                
  0dc8:0f6c  0ada             or bl, dl                                
  0dc8:0f6e  b10c             mov cl, 0xc                              
  0dc8:0f70  220e0300         and cl, byte ptr [3]                     
  0dc8:0f74  80f90c           cmp cl, 0xc                              
  0dc8:0f77  742a             je 0xfa3                                 
  0dc8:0f79  80f900           cmp cl, 0                                
  0dc8:0f7c  7416             je 0xf94                                 
  0dc8:0f7e  024c0a           add cl, byte ptr [si + 0xa]              
  0dc8:0f81  80f904           cmp cl, 4                                
  0dc8:0f84  741d             je 0xfa3                                 
  0dc8:0f86  80f909           cmp cl, 9                                
  0dc8:0f89  7418             je 0xfa3                                 
  0dc8:0f8b  f7db             neg bx                                   
  0dc8:0f8d  150000           adc ax, 0                                
  0dc8:0f90  7221             jb 0xfb3                                 
  0dc8:0f92  eb0f             jmp 0xfa3                                
  0dc8:0f94  b201             mov dl, 1                                
  0dc8:0f96  22d0             and dl, al                               
  0dc8:0f98  0ada             or bl, dl                                
  0dc8:0f9a  81c3ff7f         add bx, 0x7fff                           
  0dc8:0f9e  150000           adc ax, 0                                
  0dc8:0fa1  7210             jb 0xfb3                                 
  0dc8:0fa3  807c0a01         cmp byte ptr [si + 0xa], 1               
  0dc8:0fa7  7418             je 0xfc1                                 
  0dc8:0fa9  9e               sahf                                     
  0dc8:0faa  791b             jns 0xfc7                                
  0dc8:0fac  803e3b0001       cmp byte ptr [0x3b], 1                   
  0dc8:0fb1  7414             je 0xfc7                                 
  0dc8:0fb3  b508             mov ch, 8                                
  0dc8:0fb5  e85c17           call 0x2714                              -> 0dc8:2714
  0dc8:0fb8  b80080           mov ax, 0x8000                           
  0dc8:0fbb  eb0a             jmp 0xfc7                                
  0dc8:0fbd  2bc0             sub ax, ax                               
  0dc8:0fbf  eb06             jmp 0xfc7                                
  0dc8:0fc1  f7d8             neg ax                                   
  0dc8:0fc3  7402             je 0xfc7                                 
  0dc8:0fc5  79ec             jns 0xfb3                                
  0dc8:0fc7  c6063b0000       mov byte ptr [0x3b], 0                   
  0dc8:0fcc  268905           mov word ptr es:[di], ax                 
  0dc8:0fcf  c3               ret                                      
  0dc8:0fd0  c6063b0001       mov byte ptr [0x3b], 1                   
  0dc8:0fd5  8b4c08           mov cx, word ptr [si + 8]                
  0dc8:0fd8  83f910           cmp cx, 0x10                             
  0dc8:0fdb  e963ff           jmp 0xf41                                
  0dc8:0fde  56               push si                                  
  0dc8:0fdf  57               push di                                  
  0dc8:0fe0  fc               cld                                      
  0dc8:0fe1  b90500           mov cx, 5                                
  0dc8:0fe4  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:0fe6  a4               movsb byte ptr es:[di], byte ptr [si]    
  0dc8:0fe7  5f               pop di                                   
  0dc8:0fe8  5e               pop si                                   
  0dc8:0fe9  87f7             xchg di, si                              
  0dc8:0feb  8d7408           lea si, [si + 8]                         
  0dc8:0fee  813c01c0         cmp word ptr [si], 0xc001                
  0dc8:0ff2  7e0f             jle 0x1003                               
  0dc8:0ff4  813c0140         cmp word ptr [si], 0x4001                
  0dc8:0ff8  7d0a             jge 0x1004                               
  0dc8:0ffa  ff0c             dec word ptr [si]                        
  0dc8:0ffc  e8f9fe           call 0xef8                               -> 0dc8:0ef8
  0dc8:0fff  c7040100         mov word ptr [si], 1                     
  0dc8:1003  c3               ret                                      
  0dc8:1004  c70401c0         mov word ptr [si], 0xc001                
  0dc8:1008  c745080d00       mov word ptr [di + 8], 0xd               
  0dc8:100d  c6450780         mov byte ptr [di + 7], 0x80              
  0dc8:1011  ebf0             jmp 0x1003                               

proc_0dc8_1013:
  0dc8:1013  55               push bp                                  
  0dc8:1014  8bec             mov bp, sp                               
  0dc8:1016  56               push si                                  
  0dc8:1017  57               push di                                  
  0dc8:1018  8b4c08           mov cx, word ptr [si + 8]                
  0dc8:101b  83f90f           cmp cx, 0xf                              
  0dc8:101e  7f08             jg 0x1028                                
  0dc8:1020  0bc9             or cx, cx                                
  0dc8:1022  7f0e             jg 0x1032                                
  0dc8:1024  2bc0             sub ax, ax                               
  0dc8:1026  eb1c             jmp 0x1044                               
  0dc8:1028  b508             mov ch, 8                                
  0dc8:102a  e8e716           call 0x2714                              -> 0dc8:2714
  0dc8:102d  b8ff7f           mov ax, 0x7fff                           
  0dc8:1030  eb0a             jmp 0x103c                               
  0dc8:1032  8b4406           mov ax, word ptr [si + 6]                
  0dc8:1035  f6d9             neg cl                                   
  0dc8:1037  80c110           add cl, 0x10                             
  0dc8:103a  d3e8             shr ax, cl                               
  0dc8:103c  807c0a01         cmp byte ptr [si + 0xa], 1               
  0dc8:1040  7502             jne 0x1044                               
  0dc8:1042  f7d8             neg ax                                   
  0dc8:1044  8b4d08           mov cx, word ptr [di + 8]                
  0dc8:1047  81f901c0         cmp cx, 0xc001                           
  0dc8:104b  7e15             jle 0x1062                               
  0dc8:104d  81f90140         cmp cx, 0x4001                           
  0dc8:1051  7d0f             jge 0x1062                               
  0dc8:1053  03c1             add ax, cx                               
  0dc8:1055  3d01c0           cmp ax, 0xc001                           
  0dc8:1058  7e16             jle 0x1070                               
  0dc8:105a  3d0140           cmp ax, 0x4001                           
  0dc8:105d  7d07             jge 0x1066                               
  0dc8:105f  894508           mov word ptr [di + 8], ax                
  0dc8:1062  5f               pop di                                   
  0dc8:1063  5e               pop si                                   
  0dc8:1064  5d               pop bp                                   
  0dc8:1065  c3               ret                                      
  0dc8:1066  b508             mov ch, 8                                
  0dc8:1068  e8a916           call 0x2714                              -> 0dc8:2714
  0dc8:106b  b80140           mov ax, 0x4001                           
  0dc8:106e  eb08             jmp 0x1078                               
  0dc8:1070  b510             mov ch, 0x10                             
  0dc8:1072  e89f16           call 0x2714                              -> 0dc8:2714
  0dc8:1075  b801c0           mov ax, 0xc001                           
  0dc8:1078  e8c2fd           call 0xe3d                               -> 0dc8:0e3d
  0dc8:107b  ebe5             jmp 0x1062                               
  0dc8:107d  8bca             mov cx, dx                               
  0dc8:107f  93               xchg bx, ax                              
  0dc8:1080  eb0f             jmp 0x1091                               
  0dc8:1082  8bca             mov cx, dx                               
  0dc8:1084  93               xchg bx, ax                              
  0dc8:1085  ba0000           mov dx, 0                                
  0dc8:1088  eb19             jmp 0x10a3                               
  0dc8:108a  268b1c           mov bx, word ptr es:[si]                 
  0dc8:108d  268b4c02         mov cx, word ptr es:[si + 2]             
  0dc8:1091  2bc0             sub ax, ax                               
  0dc8:1093  ba0000           mov dx, 0                                
  0dc8:1096  0bc9             or cx, cx                                
  0dc8:1098  7909             jns 0x10a3                               
  0dc8:109a  f7d1             not cx                                   
  0dc8:109c  f7db             neg bx                                   
  0dc8:109e  83d9ff           sbb cx, -1                               
  0dc8:10a1  b201             mov dl, 1                                
  0dc8:10a3  88550a           mov byte ptr [di + 0xa], dl              
  0dc8:10a6  b210             mov dl, 0x10                             
  0dc8:10a8  0bc9             or cx, cx                                
  0dc8:10aa  750c             jne 0x10b8                               
  0dc8:10ac  87d9             xchg cx, bx                              
  0dc8:10ae  b200             mov dl, 0                                
  0dc8:10b0  e31e             jcxz 0x10d0                              
  0dc8:10b2  eb04             jmp 0x10b8                               
  0dc8:10b4  d1db             rcr bx, 1                                
  0dc8:10b6  d1d8             rcr ax, 1                                
  0dc8:10b8  42               inc dx                                   
  0dc8:10b9  d1e9             shr cx, 1                                
  0dc8:10bb  75f7             jne 0x10b4                               
  0dc8:10bd  d1db             rcr bx, 1                                
  0dc8:10bf  d1d8             rcr ax, 1                                
  0dc8:10c1  895508           mov word ptr [di + 8], dx                
  0dc8:10c4  895d06           mov word ptr [di + 6], bx                
  0dc8:10c7  894504           mov word ptr [di + 4], ax                
  0dc8:10ca  894d02           mov word ptr [di + 2], cx                
  0dc8:10cd  890d             mov word ptr [di], cx                    
  0dc8:10cf  c3               ret                                      
  0dc8:10d0  ba01c0           mov dx, 0xc001                           
  0dc8:10d3  ebec             jmp 0x10c1                               
  0dc8:10d5  c6063b0001       mov byte ptr [0x3b], 1                   
  0dc8:10da  8b4c08           mov cx, word ptr [si + 8]                
  0dc8:10dd  83f920           cmp cx, 0x20                             
  0dc8:10e0  eb06             jmp 0x10e8                               
  0dc8:10e2  8b4c08           mov cx, word ptr [si + 8]                
  0dc8:10e5  83f920           cmp cx, 0x20                             
  0dc8:10e8  7f33             jg 0x111d                                
  0dc8:10ea  0bc9             or cx, cx                                
  0dc8:10ec  7d3c             jge 0x112a                               
  0dc8:10ee  81f901c0         cmp cx, 0xc001                           
  0dc8:10f2  7e13             jle 0x1107                               
  0dc8:10f4  b30c             mov bl, 0xc                              
  0dc8:10f6  221e0300         and bl, byte ptr [3]                     
  0dc8:10fa  025c0a           add bl, byte ptr [si + 0xa]              
  0dc8:10fd  80fb05           cmp bl, 5                                
  0dc8:1100  740b             je 0x110d                                
  0dc8:1102  80fb08           cmp bl, 8                                
  0dc8:1105  7406             je 0x110d                                
  0dc8:1107  2bd2             sub dx, dx                               
  0dc8:1109  8bc2             mov ax, dx                               
  0dc8:110b  eb1a             jmp 0x1127                               
  0dc8:110d  2bd2             sub dx, dx                               
  0dc8:110f  b80100           mov ax, 1                                
  0dc8:1112  80fb05           cmp bl, 5                                
  0dc8:1115  7510             jne 0x1127                               
  0dc8:1117  f7d8             neg ax                                   
  0dc8:1119  f7d2             not dx                                   
  0dc8:111b  eb0a             jmp 0x1127                               
  0dc8:111d  b508             mov ch, 8                                
  0dc8:111f  e8f215           call 0x2714                              -> 0dc8:2714
  0dc8:1122  ba0080           mov dx, 0x8000                           
  0dc8:1125  2bc0             sub ax, ax                               
  0dc8:1127  e99700           jmp 0x11c1                               
  0dc8:112a  8b5c02           mov bx, word ptr [si + 2]                
  0dc8:112d  0a1c             or bl, byte ptr [si]                     
  0dc8:112f  0a5c01           or bl, byte ptr [si + 1]                 
  0dc8:1132  8b4404           mov ax, word ptr [si + 4]                
  0dc8:1135  8b5406           mov dx, word ptr [si + 6]                
  0dc8:1138  80e910           sub cl, 0x10                             
  0dc8:113b  7710             ja 0x114d                                
  0dc8:113d  0ac3             or al, bl                                
  0dc8:113f  0ac7             or al, bh                                
  0dc8:1141  93               xchg bx, ax                              
  0dc8:1142  92               xchg dx, ax                              
  0dc8:1143  2bd2             sub dx, dx                               
  0dc8:1145  80c110           add cl, 0x10                             
  0dc8:1148  7ef3             jle 0x113d                               
  0dc8:114a  80e10f           and cl, 0xf                              
  0dc8:114d  e31d             jcxz 0x116c                              
  0dc8:114f  56               push si                                  
  0dc8:1150  beffff           mov si, 0xffff                           
  0dc8:1153  d3c2             rol dx, cl                               
  0dc8:1155  d3c0             rol ax, cl                               
  0dc8:1157  d3e6             shl si, cl                               
  0dc8:1159  8bce             mov cx, si                               
  0dc8:115b  23c8             and cx, ax                               
  0dc8:115d  33c1             xor ax, cx                               
  0dc8:115f  23f2             and si, dx                               
  0dc8:1161  33d6             xor dx, si                               
  0dc8:1163  0bc6             or ax, si                                
  0dc8:1165  0adf             or bl, bh                                
  0dc8:1167  0ad9             or bl, cl                                
  0dc8:1169  8afd             mov bh, ch                               
  0dc8:116b  5e               pop si                                   
  0dc8:116c  b10c             mov cl, 0xc                              
  0dc8:116e  220e0300         and cl, byte ptr [3]                     
  0dc8:1172  80f90c           cmp cl, 0xc                              
  0dc8:1175  743d             je 0x11b4                                
  0dc8:1177  80f900           cmp cl, 0                                
  0dc8:117a  7413             je 0x118f                                
  0dc8:117c  024c0a           add cl, byte ptr [si + 0xa]              
  0dc8:117f  80f904           cmp cl, 4                                
  0dc8:1182  7430             je 0x11b4                                
  0dc8:1184  80f909           cmp cl, 9                                
  0dc8:1187  742b             je 0x11b4                                
  0dc8:1189  f7db             neg bx                                   
  0dc8:118b  720c             jb 0x1199                                
  0dc8:118d  eb25             jmp 0x11b4                               
  0dc8:118f  b101             mov cl, 1                                
  0dc8:1191  22c8             and cl, al                               
  0dc8:1193  0ad9             or bl, cl                                
  0dc8:1195  81c3ff7f         add bx, 0x7fff                           
  0dc8:1199  150000           adc ax, 0                                
  0dc8:119c  83d200           adc dx, 0                                
  0dc8:119f  7913             jns 0x11b4                               
  0dc8:11a1  807c0a01         cmp byte ptr [si + 0xa], 1               
  0dc8:11a5  750a             jne 0x11b1                               
  0dc8:11a7  81fa0080         cmp dx, 0x8000                           
  0dc8:11ab  7504             jne 0x11b1                               
  0dc8:11ad  0bc0             or ax, ax                                
  0dc8:11af  7403             je 0x11b4                                
  0dc8:11b1  e969ff           jmp 0x111d                               
  0dc8:11b4  807c0a01         cmp byte ptr [si + 0xa], 1               
  0dc8:11b8  7507             jne 0x11c1                               
  0dc8:11ba  f7d2             not dx                                   
  0dc8:11bc  f7d8             neg ax                                   
  0dc8:11be  83daff           sbb dx, -1                               
  0dc8:11c1  c6063b0000       mov byte ptr [0x3b], 0                   
  0dc8:11c6  268905           mov word ptr es:[di], ax                 
  0dc8:11c9  26895502         mov word ptr es:[di + 2], dx             
  0dc8:11cd  c3               ret                                      
  0dc8:11ce  55               push bp                                  
  0dc8:11cf  56               push si                                  
  0dc8:11d0  268b04           mov ax, word ptr es:[si]                 
  0dc8:11d3  268b5c02         mov bx, word ptr es:[si + 2]             
  0dc8:11d7  268b4c04         mov cx, word ptr es:[si + 4]             
  0dc8:11db  268b5406         mov dx, word ptr es:[si + 6]             
  0dc8:11df  bd0000           mov bp, 0                                
  0dc8:11e2  0bd2             or dx, dx                                
  0dc8:11e4  7c13             jl 0x11f9                                
  0dc8:11e6  7f26             jg 0x120e                                
  0dc8:11e8  0bc9             or cx, cx                                
  0dc8:11ea  7522             jne 0x120e                               
  0dc8:11ec  0bdb             or bx, bx                                
  0dc8:11ee  751e             jne 0x120e                               
  0dc8:11f0  0bc0             or ax, ax                                
  0dc8:11f2  751a             jne 0x120e                               
  0dc8:11f4  be01c0           mov si, 0xc001                           
  0dc8:11f7  eb33             jmp 0x122c                               
  0dc8:11f9  f7d2             not dx                                   
  0dc8:11fb  f7d1             not cx                                   
  0dc8:11fd  f7d3             not bx                                   
  0dc8:11ff  f7d8             neg ax                                   
  0dc8:1201  f5               cmc                                      
  0dc8:1202  83d300           adc bx, 0                                
  0dc8:1205  83d100           adc cx, 0                                
  0dc8:1208  83d200           adc dx, 0                                
  0dc8:120b  bd0100           mov bp, 1                                
  0dc8:120e  be4000           mov si, 0x40                             
  0dc8:1211  0bd2             or dx, dx                                
  0dc8:1213  750a             jne 0x121f                               
  0dc8:1215  87d1             xchg cx, dx                              
  0dc8:1217  87cb             xchg bx, cx                              
  0dc8:1219  93               xchg bx, ax                              
  0dc8:121a  83ee10           sub si, 0x10                             
  0dc8:121d  ebf2             jmp 0x1211                               
  0dc8:121f  780b             js 0x122c                                
  0dc8:1221  4e               dec si                                   
  0dc8:1222  03c0             add ax, ax                               
  0dc8:1224  13db             adc bx, bx                               
  0dc8:1226  13c9             adc cx, cx                               
  0dc8:1228  13d2             adc dx, dx                               
  0dc8:122a  79f5             jns 0x1221                               
  0dc8:122c  897508           mov word ptr [di + 8], si                
  0dc8:122f  895506           mov word ptr [di + 6], dx                
  0dc8:1232  894d04           mov word ptr [di + 4], cx                
  0dc8:1235  895d02           mov word ptr [di + 2], bx                
  0dc8:1238  8905             mov word ptr [di], ax                    
  0dc8:123a  95               xchg bp, ax                              
  0dc8:123b  88450a           mov byte ptr [di + 0xa], al              
  0dc8:123e  5e               pop si                                   
  0dc8:123f  5d               pop bp                                   
  0dc8:1240  c3               ret                                      
  0dc8:1241  55               push bp                                  
  0dc8:1242  57               push di                                  
  0dc8:1243  8b4c08           mov cx, word ptr [si + 8]                
  0dc8:1246  83f93f           cmp cx, 0x3f                             
  0dc8:1249  7f39             jg 0x1284                                
  0dc8:124b  0bc9             or cx, cx                                
  0dc8:124d  7d46             jge 0x1295                               
  0dc8:124f  81f901c0         cmp cx, 0xc001                           
  0dc8:1253  7e13             jle 0x1268                               
  0dc8:1255  b30c             mov bl, 0xc                              
  0dc8:1257  221e0300         and bl, byte ptr [3]                     
  0dc8:125b  025c0a           add bl, byte ptr [si + 0xa]              
  0dc8:125e  80fb05           cmp bl, 5                                
  0dc8:1261  7409             je 0x126c                                
  0dc8:1263  80fb08           cmp bl, 8                                
  0dc8:1266  7404             je 0x126c                                
  0dc8:1268  2bed             sub bp, bp                               
  0dc8:126a  eb20             jmp 0x128c                               
  0dc8:126c  2bed             sub bp, bp                               
  0dc8:126e  8bd5             mov dx, bp                               
  0dc8:1270  b80100           mov ax, 1                                
  0dc8:1273  80fb05           cmp bl, 5                                
  0dc8:1276  8bdd             mov bx, bp                               
  0dc8:1278  7518             jne 0x1292                               
  0dc8:127a  f7d8             neg ax                                   
  0dc8:127c  f7d3             not bx                                   
  0dc8:127e  f7d2             not dx                                   
  0dc8:1280  f7d5             not bp                                   
  0dc8:1282  eb0e             jmp 0x1292                               
  0dc8:1284  b508             mov ch, 8                                
  0dc8:1286  e88b14           call 0x2714                              -> 0dc8:2714
  0dc8:1289  bd0080           mov bp, 0x8000                           
  0dc8:128c  2bd2             sub dx, dx                               
  0dc8:128e  8bda             mov bx, dx                               
  0dc8:1290  8bc3             mov ax, bx                               
  0dc8:1292  e99100           jmp 0x1326                               
  0dc8:1295  8b6c06           mov bp, word ptr [si + 6]                
  0dc8:1298  8b5404           mov dx, word ptr [si + 4]                
  0dc8:129b  8b5c02           mov bx, word ptr [si + 2]                
  0dc8:129e  8b3c             mov di, word ptr [si]                    
  0dc8:12a0  2bc0             sub ax, ax                               
  0dc8:12a2  80e930           sub cl, 0x30                             
  0dc8:12a5  7716             ja 0x12bd                                
  0dc8:12a7  0ac4             or al, ah                                
  0dc8:12a9  b400             mov ah, 0                                
  0dc8:12ab  0bc7             or ax, di                                
  0dc8:12ad  8bfb             mov di, bx                               
  0dc8:12af  8bda             mov bx, dx                               
  0dc8:12b1  8bd5             mov dx, bp                               
  0dc8:12b3  2bed             sub bp, bp                               
  0dc8:12b5  80c110           add cl, 0x10                             
  0dc8:12b8  7eed             jle 0x12a7                               
  0dc8:12ba  80e10f           and cl, 0xf                              
  0dc8:12bd  f6d9             neg cl                                   
  0dc8:12bf  7411             je 0x12d2                                
  0dc8:12c1  80c110           add cl, 0x10                             
  0dc8:12c4  0ac4             or al, ah                                
  0dc8:12c6  d1ed             shr bp, 1                                
  0dc8:12c8  d1da             rcr dx, 1                                
  0dc8:12ca  d1db             rcr bx, 1                                
  0dc8:12cc  d1df             rcr di, 1                                
  0dc8:12ce  d0dc             rcr ah, 1                                
  0dc8:12d0  e2f2             loop 0x12c4                              
  0dc8:12d2  b10c             mov cl, 0xc                              
  0dc8:12d4  220e0300         and cl, byte ptr [3]                     
  0dc8:12d8  80f90c           cmp cl, 0xc                              
  0dc8:12db  7430             je 0x130d                                
  0dc8:12dd  80f900           cmp cl, 0                                
  0dc8:12e0  7415             je 0x12f7                                
  0dc8:12e2  024c0a           add cl, byte ptr [si + 0xa]              
  0dc8:12e5  80f904           cmp cl, 4                                
  0dc8:12e8  7423             je 0x130d                                
  0dc8:12ea  80f909           cmp cl, 9                                
  0dc8:12ed  741e             je 0x130d                                
  0dc8:12ef  f7d8             neg ax                                   
  0dc8:12f1  720d             jb 0x1300                                
  0dc8:12f3  eb18             jmp 0x130d                               
  0dc8:12f5  eb8d             jmp 0x1284                               
  0dc8:12f7  b101             mov cl, 1                                
  0dc8:12f9  23cf             and cx, di                               
  0dc8:12fb  0ac1             or al, cl                                
  0dc8:12fd  05ff7f           add ax, 0x7fff                           
  0dc8:1300  b90000           mov cx, 0                                
  0dc8:1303  13f9             adc di, cx                               
  0dc8:1305  13d9             adc bx, cx                               
  0dc8:1307  13d1             adc dx, cx                               
  0dc8:1309  13e9             adc bp, cx                               
  0dc8:130b  78e8             js 0x12f5                                
  0dc8:130d  97               xchg di, ax                              
  0dc8:130e  807c0a01         cmp byte ptr [si + 0xa], 1               
  0dc8:1312  7512             jne 0x1326                               
  0dc8:1314  f7d5             not bp                                   
  0dc8:1316  f7d2             not dx                                   
  0dc8:1318  f7d3             not bx                                   
  0dc8:131a  f7d8             neg ax                                   
  0dc8:131c  f5               cmc                                      
  0dc8:131d  83d300           adc bx, 0                                
  0dc8:1320  83d200           adc dx, 0                                
  0dc8:1323  83d500           adc bp, 0                                
  0dc8:1326  5f               pop di                                   
  0dc8:1327  ab               stosw word ptr es:[di], ax               
  0dc8:1328  93               xchg bx, ax                              
  0dc8:1329  ab               stosw word ptr es:[di], ax               
  0dc8:132a  92               xchg dx, ax                              
  0dc8:132b  ab               stosw word ptr es:[di], ax               
  0dc8:132c  95               xchg bp, ax                              
  0dc8:132d  ab               stosw word ptr es:[di], ax               
  0dc8:132e  83ef08           sub di, 8                                
  0dc8:1331  5d               pop bp                                   
  0dc8:1332  c3               ret                                      
  0dc8:1333  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1337  55               push bp                                  
  0dc8:1338  56               push si                                  
  0dc8:1339  57               push di                                  
  0dc8:133a  87ee             xchg si, bp                              
  0dc8:133c  8b4e08           mov cx, word ptr [bp + 8]                
  0dc8:133f  83f940           cmp cx, 0x40                             
  0dc8:1342  7d31             jge 0x1375                               
  0dc8:1344  0bc9             or cx, cx                                
  0dc8:1346  7d4a             jge 0x1392                               
  0dc8:1348  81f901c0         cmp cx, 0xc001                           
  0dc8:134c  7e18             jle 0x1366                               
  0dc8:134e  b520             mov ch, 0x20                             
  0dc8:1350  e8c113           call 0x2714                              -> 0dc8:2714
  0dc8:1353  b10c             mov cl, 0xc                              
  0dc8:1355  220e0300         and cl, byte ptr [3]                     
  0dc8:1359  024e0a           add cl, byte ptr [bp + 0xa]              
  0dc8:135c  80f905           cmp cl, 5                                
  0dc8:135f  740c             je 0x136d                                
  0dc8:1361  80f908           cmp cl, 8                                
  0dc8:1364  7407             je 0x136d                                
  0dc8:1366  2bdb             sub bx, bx                               
  0dc8:1368  be01c0           mov si, 0xc001                           
  0dc8:136b  eb11             jmp 0x137e                               
  0dc8:136d  be0100           mov si, 1                                
  0dc8:1370  bb0080           mov bx, 0x8000                           
  0dc8:1373  eb09             jmp 0x137e                               
  0dc8:1375  7418             je 0x138f                                
  0dc8:1377  b520             mov ch, 0x20                             
  0dc8:1379  e89813           call 0x2714                              -> 0dc8:2714
  0dc8:137c  eb11             jmp 0x138f                               
  0dc8:137e  2bc0             sub ax, ax                               
  0dc8:1380  894600           mov word ptr [bp], ax                    
  0dc8:1383  894602           mov word ptr [bp + 2], ax                
  0dc8:1386  894604           mov word ptr [bp + 4], ax                
  0dc8:1389  895e06           mov word ptr [bp + 6], bx                
  0dc8:138c  897608           mov word ptr [bp + 8], si                
  0dc8:138f  e9b000           jmp 0x1442                               
  0dc8:1392  be3800           mov si, 0x38                             
  0dc8:1395  23f1             and si, cx                               
  0dc8:1397  33ce             xor cx, si                               
  0dc8:1399  d1ee             shr si, 1                                
  0dc8:139b  d1ee             shr si, 1                                
  0dc8:139d  d1ee             shr si, 1                                
  0dc8:139f  f7de             neg si                                   
  0dc8:13a1  83c607           add si, 7                                
  0dc8:13a4  83fe07           cmp si, 7                                
  0dc8:13a7  7506             jne 0x13af                               
  0dc8:13a9  b400             mov ah, 0                                
  0dc8:13ab  8a02             mov al, byte ptr [bp + si]               
  0dc8:13ad  eb02             jmp 0x13b1                               
  0dc8:13af  8b02             mov ax, word ptr [bp + si]               
  0dc8:13b1  2bdb             sub bx, bx                               
  0dc8:13b3  8bfe             mov di, si                               
  0dc8:13b5  4f               dec di                                   
  0dc8:13b6  7c06             jl 0x13be                                
  0dc8:13b8  0a1b             or bl, byte ptr [bp + di]                
  0dc8:13ba  883b             mov byte ptr [bp + di], bh               
  0dc8:13bc  ebf7             jmp 0x13b5                               
  0dc8:13be  baff00           mov dx, 0xff                             
  0dc8:13c1  80e107           and cl, 7                                
  0dc8:13c4  d3ea             shr dx, cl                               
  0dc8:13c6  8bfa             mov di, dx                               
  0dc8:13c8  47               inc di                                   
  0dc8:13c9  23d0             and dx, ax                               
  0dc8:13cb  7504             jne 0x13d1                               
  0dc8:13cd  0adb             or bl, bl                                
  0dc8:13cf  7471             je 0x1442                                
  0dc8:13d1  b520             mov ch, 0x20                             
  0dc8:13d3  e83e13           call 0x2714                              -> 0dc8:2714
  0dc8:13d6  33c2             xor ax, dx                               
  0dc8:13d8  b10c             mov cl, 0xc                              
  0dc8:13da  220e0300         and cl, byte ptr [3]                     
  0dc8:13de  80f90c           cmp cl, 0xc                              
  0dc8:13e1  7418             je 0x13fb                                
  0dc8:13e3  80f900           cmp cl, 0                                
  0dc8:13e6  741e             je 0x1406                                
  0dc8:13e8  024e0a           add cl, byte ptr [bp + 0xa]              
  0dc8:13eb  80f904           cmp cl, 4                                
  0dc8:13ee  740b             je 0x13fb                                
  0dc8:13f0  80f909           cmp cl, 9                                
  0dc8:13f3  7406             je 0x13fb                                
  0dc8:13f5  0ada             or bl, dl                                
  0dc8:13f7  7523             jne 0x141c                               
  0dc8:13f9  eb47             jmp 0x1442                               
  0dc8:13fb  8802             mov byte ptr [bp + si], al               
  0dc8:13fd  807e0700         cmp byte ptr [bp + 7], 0                 
  0dc8:1401  753f             jne 0x1442                               
  0dc8:1403  e960ff           jmp 0x1366                               
  0dc8:1406  0adb             or bl, bl                                
  0dc8:1408  750c             jne 0x1416                               
  0dc8:140a  85c7             test di, ax                              
  0dc8:140c  7508             jne 0x1416                               
  0dc8:140e  03d2             add dx, dx                               
  0dc8:1410  3bd7             cmp dx, di                               
  0dc8:1412  76e7             jbe 0x13fb                               
  0dc8:1414  eb06             jmp 0x141c                               
  0dc8:1416  03d2             add dx, dx                               
  0dc8:1418  3bd7             cmp dx, di                               
  0dc8:141a  72df             jb 0x13fb                                
  0dc8:141c  83ee07           sub si, 7                                
  0dc8:141f  7c09             jl 0x142a                                
  0dc8:1421  03c7             add ax, di                               
  0dc8:1423  884207           mov byte ptr [bp + si + 7], al           
  0dc8:1426  f6dc             neg ah                                   
  0dc8:1428  eb0f             jmp 0x1439                               
  0dc8:142a  03c7             add ax, di                               
  0dc8:142c  894207           mov word ptr [bp + si + 7], ax           
  0dc8:142f  46               inc si                                   
  0dc8:1430  46               inc si                                   
  0dc8:1431  7f06             jg 0x1439                                
  0dc8:1433  80520700         adc byte ptr [bp + si + 7], 0            
  0dc8:1437  72f7             jb 0x1430                                
  0dc8:1439  7307             jae 0x1442                               
  0dc8:143b  f9               stc                                      
  0dc8:143c  d15e06           rcr word ptr [bp + 6], 1                 
  0dc8:143f  ff4608           inc word ptr [bp + 8]                    
  0dc8:1442  5f               pop di                                   
  0dc8:1443  5e               pop si                                   
  0dc8:1444  5d               pop bp                                   
  0dc8:1445  c3               ret                                      
  0dc8:1446  55               push bp                                  
  0dc8:1447  56               push si                                  
  0dc8:1448  57               push di                                  
  0dc8:1449  8b2e0c00         mov bp, word ptr [0xc]                   
  0dc8:144d  8b4600           mov ax, word ptr [bp]                    
  0dc8:1450  8b5e02           mov bx, word ptr [bp + 2]                
  0dc8:1453  8b4e04           mov cx, word ptr [bp + 4]                
  0dc8:1456  8b5606           mov dx, word ptr [bp + 6]                
  0dc8:1459  2bff             sub di, di                               
  0dc8:145b  8b7608           mov si, word ptr [bp + 8]                
  0dc8:145e  81fe01c0         cmp si, 0xc001                           
  0dc8:1462  7421             je 0x1485                                
  0dc8:1464  83fef0           cmp si, -0x10                            
  0dc8:1467  7f0d             jg 0x1476                                
  0dc8:1469  8bf8             mov di, ax                               
  0dc8:146b  8bc3             mov ax, bx                               
  0dc8:146d  8bd9             mov bx, cx                               
  0dc8:146f  8bca             mov cx, dx                               
  0dc8:1471  2bd2             sub dx, dx                               
  0dc8:1473  83c610           add si, 0x10                             
  0dc8:1476  46               inc si                                   
  0dc8:1477  7f0c             jg 0x1485                                
  0dc8:1479  d1ea             shr dx, 1                                
  0dc8:147b  d1d9             rcr cx, 1                                
  0dc8:147d  d1db             rcr bx, 1                                
  0dc8:147f  d1d8             rcr ax, 1                                
  0dc8:1481  d1df             rcr di, 1                                
  0dc8:1483  ebf1             jmp 0x1476                               
  0dc8:1485  d1e7             shl di, 1                                
  0dc8:1487  bf0000           mov di, 0                                
  0dc8:148a  13c7             adc ax, di                               
  0dc8:148c  13df             adc bx, di                               
  0dc8:148e  13cf             adc cx, di                               
  0dc8:1490  13d7             adc dx, di                               
  0dc8:1492  894600           mov word ptr [bp], ax                    
  0dc8:1495  895e02           mov word ptr [bp + 2], bx                
  0dc8:1498  894e04           mov word ptr [bp + 4], cx                
  0dc8:149b  895606           mov word ptr [bp + 6], dx                
  0dc8:149e  8bdf             mov bx, di                               
  0dc8:14a0  8bcf             mov cx, di                               
  0dc8:14a2  8bf7             mov si, di                               
  0dc8:14a4  f6460380         test byte ptr [bp + 3], 0x80             
  0dc8:14a8  740a             je 0x14b4                                
  0dc8:14aa  8b5e00           mov bx, word ptr [bp]                    
  0dc8:14ad  8b4e02           mov cx, word ptr [bp + 2]                
  0dc8:14b0  d1e3             shl bx, 1                                
  0dc8:14b2  d1d1             rcl cx, 1                                
  0dc8:14b4  8b4600           mov ax, word ptr [bp]                    
  0dc8:14b7  f76604           mul word ptr [bp + 4]                    
  0dc8:14ba  03d8             add bx, ax                               
  0dc8:14bc  13ca             adc cx, dx                               
  0dc8:14be  13f7             adc si, di                               
  0dc8:14c0  03d8             add bx, ax                               
  0dc8:14c2  13ca             adc cx, dx                               
  0dc8:14c4  13f7             adc si, di                               
  0dc8:14c6  8bd9             mov bx, cx                               
  0dc8:14c8  8bce             mov cx, si                               
  0dc8:14ca  2bf6             sub si, si                               
  0dc8:14cc  8b4602           mov ax, word ptr [bp + 2]                
  0dc8:14cf  f76604           mul word ptr [bp + 4]                    
  0dc8:14d2  03d8             add bx, ax                               
  0dc8:14d4  13ca             adc cx, dx                               
  0dc8:14d6  13f7             adc si, di                               
  0dc8:14d8  03d8             add bx, ax                               
  0dc8:14da  13ca             adc cx, dx                               
  0dc8:14dc  13f7             adc si, di                               
  0dc8:14de  8b4600           mov ax, word ptr [bp]                    
  0dc8:14e1  f76606           mul word ptr [bp + 6]                    
  0dc8:14e4  03d8             add bx, ax                               
  0dc8:14e6  13ca             adc cx, dx                               
  0dc8:14e8  13f7             adc si, di                               
  0dc8:14ea  03d8             add bx, ax                               
  0dc8:14ec  13ca             adc cx, dx                               
  0dc8:14ee  13f7             adc si, di                               
  0dc8:14f0  d1e3             shl bx, 1                                
  0dc8:14f2  13cf             adc cx, di                               
  0dc8:14f4  13f7             adc si, di                               
  0dc8:14f6  8bd9             mov bx, cx                               
  0dc8:14f8  8bce             mov cx, si                               
  0dc8:14fa  2bf6             sub si, si                               
  0dc8:14fc  8b4604           mov ax, word ptr [bp + 4]                
  0dc8:14ff  f7e0             mul ax                                   
  0dc8:1501  03d8             add bx, ax                               
  0dc8:1503  13ca             adc cx, dx                               
  0dc8:1505  13f7             adc si, di                               
  0dc8:1507  8b4606           mov ax, word ptr [bp + 6]                
  0dc8:150a  f76602           mul word ptr [bp + 2]                    
  0dc8:150d  03d8             add bx, ax                               
  0dc8:150f  13ca             adc cx, dx                               
  0dc8:1511  13f7             adc si, di                               
  0dc8:1513  03d8             add bx, ax                               
  0dc8:1515  13ca             adc cx, dx                               
  0dc8:1517  13f7             adc si, di                               
  0dc8:1519  8b4606           mov ax, word ptr [bp + 6]                
  0dc8:151c  f76604           mul word ptr [bp + 4]                    
  0dc8:151f  03c8             add cx, ax                               
  0dc8:1521  13f2             adc si, dx                               
  0dc8:1523  13ff             adc di, di                               
  0dc8:1525  03c8             add cx, ax                               
  0dc8:1527  13f2             adc si, dx                               
  0dc8:1529  83d700           adc di, 0                                
  0dc8:152c  8b4606           mov ax, word ptr [bp + 6]                
  0dc8:152f  f7e0             mul ax                                   
  0dc8:1531  03f0             add si, ax                               
  0dc8:1533  13fa             adc di, dx                               
  0dc8:1535  895e00           mov word ptr [bp], bx                    
  0dc8:1538  894e02           mov word ptr [bp + 2], cx                
  0dc8:153b  897604           mov word ptr [bp + 4], si                
  0dc8:153e  897e06           mov word ptr [bp + 6], di                
  0dc8:1541  c6460a00         mov byte ptr [bp + 0xa], 0               
  0dc8:1545  c746080000       mov word ptr [bp + 8], 0                 
  0dc8:154a  5f               pop di                                   
  0dc8:154b  5e               pop si                                   
  0dc8:154c  5d               pop bp                                   
  0dc8:154d  c3               ret                                      

proc_0dc8_154e:
  0dc8:154e  55               push bp                                  
  0dc8:154f  8bec             mov bp, sp                               
  0dc8:1551  56               push si                                  
  0dc8:1552  57               push di                                  
  0dc8:1553  1e               push ds                                  
  0dc8:1554  06               push es                                  
  0dc8:1555  b00c             mov al, 0xc                              
  0dc8:1557  f66606           mul byte ptr [bp + 6]                    
  0dc8:155a  2d0c00           sub ax, 0xc                              
  0dc8:155d  96               xchg si, ax                              
  0dc8:155e  037604           add si, word ptr [bp + 4]                
  0dc8:1561  e823f9           call 0xe87                               -> 0dc8:0e87
  0dc8:1564  8bfe             mov di, si                               
  0dc8:1566  fe4e06           dec byte ptr [bp + 6]                    
  0dc8:1569  7e78             jle 0x15e3                               
  0dc8:156b  55               push bp                                  
  0dc8:156c  8b2e0c00         mov bp, word ptr [0xc]                   
  0dc8:1570  8a4616           mov al, byte ptr [bp + 0x16]             
  0dc8:1573  30460a           xor byte ptr [bp + 0xa], al              
  0dc8:1576  e8daed           call 0x353                               -> 0dc8:0353
  0dc8:1579  894600           mov word ptr [bp], ax                    
  0dc8:157c  895e02           mov word ptr [bp + 2], bx                
  0dc8:157f  894e04           mov word ptr [bp + 4], cx                
  0dc8:1582  895606           mov word ptr [bp + 6], dx                
  0dc8:1585  83ef0c           sub di, 0xc                              
  0dc8:1588  2e8b1d           mov bx, word ptr cs:[di]                 
  0dc8:158b  2e8b4d02         mov cx, word ptr cs:[di + 2]             
  0dc8:158f  2e8b5504         mov dx, word ptr cs:[di + 4]             
  0dc8:1593  2e8b7506         mov si, word ptr cs:[di + 6]             
  0dc8:1597  2e8a450a         mov al, byte ptr cs:[di + 0xa]           
  0dc8:159b  3a460a           cmp al, byte ptr [bp + 0xa]              
  0dc8:159e  7434             je 0x15d4                                
  0dc8:15a0  2b5e00           sub bx, word ptr [bp]                    
  0dc8:15a3  1b4e02           sbb cx, word ptr [bp + 2]                
  0dc8:15a6  1b5604           sbb dx, word ptr [bp + 4]                
  0dc8:15a9  1b7606           sbb si, word ptr [bp + 6]                
  0dc8:15ac  7314             jae 0x15c2                               
  0dc8:15ae  f7d6             not si                                   
  0dc8:15b0  f7d2             not dx                                   
  0dc8:15b2  f7d1             not cx                                   
  0dc8:15b4  f7db             neg bx                                   
  0dc8:15b6  f5               cmc                                      
  0dc8:15b7  83d100           adc cx, 0                                
  0dc8:15ba  83d200           adc dx, 0                                
  0dc8:15bd  83d600           adc si, 0                                
  0dc8:15c0  3401             xor al, 1                                
  0dc8:15c2  895e00           mov word ptr [bp], bx                    
  0dc8:15c5  894e02           mov word ptr [bp + 2], cx                
  0dc8:15c8  895604           mov word ptr [bp + 4], dx                
  0dc8:15cb  897606           mov word ptr [bp + 6], si                
  0dc8:15ce  88460a           mov byte ptr [bp + 0xa], al              
  0dc8:15d1  5d               pop bp                                   
  0dc8:15d2  eb92             jmp 0x1566                               
  0dc8:15d4  015e00           add word ptr [bp], bx                    
  0dc8:15d7  114e02           adc word ptr [bp + 2], cx                
  0dc8:15da  115604           adc word ptr [bp + 4], dx                
  0dc8:15dd  117606           adc word ptr [bp + 6], si                
  0dc8:15e0  5d               pop bp                                   
  0dc8:15e1  eb83             jmp 0x1566                               
  0dc8:15e3  8b360c00         mov si, word ptr [0xc]                   
  0dc8:15e7  fc               cld                                      
  0dc8:15e8  ad               lodsw ax, word ptr [si]                  
  0dc8:15e9  93               xchg bx, ax                              
  0dc8:15ea  ad               lodsw ax, word ptr [si]                  
  0dc8:15eb  91               xchg cx, ax                              
  0dc8:15ec  ad               lodsw ax, word ptr [si]                  
  0dc8:15ed  92               xchg dx, ax                              
  0dc8:15ee  ad               lodsw ax, word ptr [si]                  
  0dc8:15ef  97               xchg di, ax                              
  0dc8:15f0  ad               lodsw ax, word ptr [si]                  
  0dc8:15f1  ac               lodsb al, byte ptr [si]                  
  0dc8:15f2  46               inc si                                   
  0dc8:15f3  89360c00         mov word ptr [0xc], si                   
  0dc8:15f7  87f7             xchg di, si                              
  0dc8:15f9  2bff             sub di, di                               
  0dc8:15fb  3c01             cmp al, 1                                
  0dc8:15fd  7511             jne 0x1610                               
  0dc8:15ff  f7d6             not si                                   
  0dc8:1601  f7d2             not dx                                   
  0dc8:1603  f7d1             not cx                                   
  0dc8:1605  f7db             neg bx                                   
  0dc8:1607  f5               cmc                                      
  0dc8:1608  13cf             adc cx, di                               
  0dc8:160a  13d7             adc dx, di                               
  0dc8:160c  13f7             adc si, di                               
  0dc8:160e  eb12             jmp 0x1622                               
  0dc8:1610  f9               stc                                      
  0dc8:1611  d1de             rcr si, 1                                
  0dc8:1613  d1da             rcr dx, 1                                
  0dc8:1615  d1d9             rcr cx, 1                                
  0dc8:1617  d1db             rcr bx, 1                                
  0dc8:1619  13df             adc bx, di                               
  0dc8:161b  13cf             adc cx, di                               
  0dc8:161d  13d7             adc dx, di                               
  0dc8:161f  13f7             adc si, di                               
  0dc8:1621  47               inc di                                   
  0dc8:1622  a10c00           mov ax, word ptr [0xc]                   
  0dc8:1625  97               xchg di, ax                              
  0dc8:1626  93               xchg bx, ax                              
  0dc8:1627  ab               stosw word ptr es:[di], ax               
  0dc8:1628  91               xchg cx, ax                              
  0dc8:1629  ab               stosw word ptr es:[di], ax               
  0dc8:162a  92               xchg dx, ax                              
  0dc8:162b  ab               stosw word ptr es:[di], ax               
  0dc8:162c  96               xchg si, ax                              
  0dc8:162d  ab               stosw word ptr es:[di], ax               
  0dc8:162e  93               xchg bx, ax                              
  0dc8:162f  ab               stosw word ptr es:[di], ax               
  0dc8:1630  b000             mov al, 0                                
  0dc8:1632  aa               stosb byte ptr es:[di], al               
  0dc8:1633  07               pop es                                   
  0dc8:1634  1f               pop ds                                   
  0dc8:1635  5f               pop di                                   
  0dc8:1636  5e               pop si                                   
  0dc8:1637  5d               pop bp                                   
  0dc8:1638  c20400           ret 4                                    
  0dc8:163b  0800             or byte ptr [bx + si], al                
  0dc8:163d  0000             add byte ptr [bx + si], al               
  0dc8:163f  0000             add byte ptr [bx + si], al               
  0dc8:1641  0000             add byte ptr [bx + si], al               
  0dc8:1643  0000             add byte ptr [bx + si], al               
  0dc8:1645  0000             add byte ptr [bx + si], al               
  0dc8:1647  0000             add byte ptr [bx + si], al               
  0dc8:1649  b6aa             mov dh, 0xaa                             
  0dc8:164b  aa               stosb byte ptr es:[di], al               
  0dc8:164c  aa               stosb byte ptr es:[di], al               
  0dc8:164d  aa               stosb byte ptr es:[di], al               
  0dc8:164e  aa               stosb byte ptr es:[di], al               
  0dc8:164f  aa               stosb byte ptr es:[di], al               
  0dc8:1650  2a00             sub al, byte ptr [bx + si]               
  0dc8:1652  0001             add byte ptr [bx + di], al               
  0dc8:1654  0003             add byte ptr [bp + di], al               
  0dc8:1656  2422             and al, 0x22                             
  0dc8:1658  2222             and ah, byte ptr [bp + si]               
  0dc8:165a  2222             and ah, byte ptr [bp + si]               
  0dc8:165c  0200             add al, byte ptr [bx + si]               
  0dc8:165e  0000             add byte ptr [bx + si], al               
  0dc8:1660  00b3e400         add byte ptr [bp + di + 0xe4], dh        
  0dc8:1664  0dd000           or ax, 0xd0                              
  0dc8:1667  0d0000           or ax, 0                                 
  0dc8:166a  0001             add byte ptr [bx + di], al               
  0dc8:166c  006e08           add byte ptr [bp + 8], ch                
  0dc8:166f  4b               dec bx                                   
  0dc8:1670  c7               db c7
  0dc8:1671  3b2e0000         cmp bp, word ptr [0]                     
  0dc8:1675  0000             add byte ptr [bx + si], al               
  0dc8:1677  0000             add byte ptr [bx + si], al               
  0dc8:1679  c6401699         mov byte ptr [bx + si + 0x16], 0x99      
  0dc8:167d  6b0000           imul ax, word ptr [bx + si], 0           
  0dc8:1680  0000             add byte ptr [bx + si], al               
  0dc8:1682  0001             add byte ptr [bx + di], al               
  0dc8:1684  000c             add byte ptr [si], cl                    
  0dc8:1686  45               inc bp                                   
  0dc8:1687  92               xchg dx, ax                              
  0dc8:1688  b000             mov al, 0                                
  0dc8:168a  0000             add byte ptr [bx + si], al               
  0dc8:168c  0000             add byte ptr [bx + si], al               
  0dc8:168e  0000             add byte ptr [bx + si], al               
  0dc8:1690  00d5             add ch, dl                               
  0dc8:1692  45               inc bp                                   
  0dc8:1693  d6               salc                                     
  0dc8:1694  0000             add byte ptr [bx + si], al               
  0dc8:1696  0000             add byte ptr [bx + si], al               
  0dc8:1698  0000             add byte ptr [bx + si], al               
  0dc8:169a  0001             add byte ptr [bx + di], al               
  0dc8:169c  0008             add byte ptr [bx + si], cl               
  0dc8:169e  0000             add byte ptr [bx + si], al               
  0dc8:16a0  0000             add byte ptr [bx + si], al               
  0dc8:16a2  0000             add byte ptr [bx + si], al               
  0dc8:16a4  0000             add byte ptr [bx + si], al               
  0dc8:16a6  0000             add byte ptr [bx + si], al               
  0dc8:16a8  0000             add byte ptr [bx + si], al               
  0dc8:16aa  0088ffff         add byte ptr [bx + si - 1], cl           
  0dc8:16ae  ff               db ff
  0dc8:16af  ff               db ff
  0dc8:16b0  ff               db ff
  0dc8:16b1  ff               db ff
  0dc8:16b2  7f00             jg 0x16b4                                
  0dc8:16b4  0001             add byte ptr [bx + di], al               
  0dc8:16b6  00a69aaa         add byte ptr [bp - 0x5566], ah           
  0dc8:16ba  aa               stosb byte ptr es:[di], al               
  0dc8:16bb  aa               stosb byte ptr es:[di], al               
  0dc8:16bc  aa               stosb byte ptr es:[di], al               
  0dc8:16bd  aa               stosb byte ptr es:[di], al               
  0dc8:16be  0a00             or al, byte ptr [bx + si]                
  0dc8:16c0  0000             add byte ptr [bx + si], al               
  0dc8:16c2  007fe6           add byte ptr [bx - 0x1a], bh             
  0dc8:16c5  045b             add al, 0x5b                             
  0dc8:16c7  b005             mov al, 5                                
  0dc8:16c9  5b               pop bx                                   
  0dc8:16ca  0000             add byte ptr [bx + si], al               
  0dc8:16cc  0001             add byte ptr [bx + di], al               
  0dc8:16ce  00ef             add bh, ch                               
  0dc8:16d0  269b             wait                                     
  0dc8:16d2  011a             add word ptr [bp + si], bx               
  0dc8:16d4  a00100           mov al, byte ptr [1]                     
  0dc8:16d7  0000             add byte ptr [bx + si], al               
  0dc8:16d9  0000             add byte ptr [bx + si], al               
  0dc8:16db  1dcedc           sbb ax, 0xdcce                           
  0dc8:16de  93               xchg bx, ax                              
  0dc8:16df  9f               lahf                                     
  0dc8:16e0  0400             add al, 0                                
  0dc8:16e2  0000             add byte ptr [bx + si], al               
  0dc8:16e4  0001             add byte ptr [bx + di], al               
  0dc8:16e6  000f             add byte ptr [bx], cl                    
  0dc8:16e8  b14b             mov cl, 0x4b                             
  0dc8:16ea  f7080000         test word ptr [bx + si], 0               
  0dc8:16ee  0000             add byte ptr [bx + si], al               
  0dc8:16f0  0000             add byte ptr [bx + si], al               
  0dc8:16f2  0003             add byte ptr [bp + di], al               
  0dc8:16f4  d87b0c           fdivr dword ptr [bp + di + 0xc]          
  0dc8:16f7  0000             add byte ptr [bx + si], al               
  0dc8:16f9  0000             add byte ptr [bx + si], al               
  0dc8:16fb  0000             add byte ptr [bx + si], al               
  0dc8:16fd  0100             add word ptr [bx + si], ax               
  0dc8:16ff  e869f7           call 0xe6b                               -> 0dc8:0e6b
  0dc8:1702  e841fd           call 0x1446                              -> 0dc8:1446
  0dc8:1705  2eff363b16       push word ptr cs:[0x163b]                
  0dc8:170a  b83d16           mov ax, 0x163d                           
  0dc8:170d  50               push ax                                  
  0dc8:170e  e83dfe           call 0x154e                              -> 0dc8:154e
  0dc8:1711  ff360c00         push word ptr [0xc]                      
  0dc8:1715  56               push si                                  
  0dc8:1716  56               push si                                  
  0dc8:1717  e8a3eb           call 0x2bd                               -> 0dc8:02bd
  0dc8:171a  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:171f  c3               ret                                      
  0dc8:1720  e823fd           call 0x1446                              -> 0dc8:1446
  0dc8:1723  2eff369d16       push word ptr cs:[0x169d]                
  0dc8:1728  b89f16           mov ax, 0x169f                           
  0dc8:172b  50               push ax                                  
  0dc8:172c  e81ffe           call 0x154e                              -> 0dc8:154e
  0dc8:172f  c3               ret                                      
  0dc8:1730  e838f7           call 0xe6b                               -> 0dc8:0e6b
  0dc8:1733  e810fd           call 0x1446                              -> 0dc8:1446
  0dc8:1736  e881f7           call 0xeba                               -> 0dc8:0eba
  0dc8:1739  e8c9ff           call 0x1705                              -> 0dc8:1705
  0dc8:173c  e8e4ff           call 0x1723                              -> 0dc8:1723
  0dc8:173f  c3               ret                                      
  0dc8:1740  35c268           xor ax, 0x68c2                           
  0dc8:1743  21a2da0f         and word ptr [bp + si + 0xfda], sp       
  0dc8:1747  c9               leave                                    
  0dc8:1748  0100             add word ptr [bx + si], ax               
  0dc8:174a  0000             add byte ptr [bx + si], al               
  0dc8:174c  0800             or byte ptr [bx + si], al                
  0dc8:174e  0000             add byte ptr [bx + si], al               
  0dc8:1750  0000             add byte ptr [bx + si], al               
  0dc8:1752  0000             add byte ptr [bx + si], al               
  0dc8:1754  0000             add byte ptr [bx + si], al               
  0dc8:1756  0000             add byte ptr [bx + si], al               
  0dc8:1758  0000             add byte ptr [bx + si], al               
  0dc8:175a  57               push di                                  
  0dc8:175b  55               push bp                                  
  0dc8:175c  55               push bp                                  
  0dc8:175d  55               push bp                                  
  0dc8:175e  55               push bp                                  
  0dc8:175f  55               push bp                                  
  0dc8:1760  55               push bp                                  
  0dc8:1761  0100             add word ptr [bx + si], ax               
  0dc8:1763  0001             add byte ptr [bx + di], al               
  0dc8:1765  00be3233         add byte ptr [bp + 0x3332], bh           
  0dc8:1769  3333             xor si, word ptr [bp + di]               
  0dc8:176b  3303             xor ax, word ptr [bp + di]               
  0dc8:176d  0000             add byte ptr [bx + si], al               
  0dc8:176f  0000             add byte ptr [bx + si], al               
  0dc8:1771  007d1e           add byte ptr [di + 0x1e], bh             
  0dc8:1774  49               dec cx                                   
  0dc8:1775  92               xchg dx, ax                              
  0dc8:1776  2409             and al, 9                                
  0dc8:1778  0000             add byte ptr [bx + si], al               
  0dc8:177a  0000             add byte ptr [bx + si], al               
  0dc8:177c  0100             add word ptr [bx + si], ax               
  0dc8:177e  bcfec6           mov sp, 0xc6fe                           
  0dc8:1781  711c             jno 0x179f                               
  0dc8:1783  0000             add byte ptr [bx + si], al               
  0dc8:1785  0000             add byte ptr [bx + si], al               
  0dc8:1787  0000             add byte ptr [bx + si], al               
  0dc8:1789  005cff           add byte ptr [si - 1], bl                
  0dc8:178c  16               push ss                                  
  0dc8:178d  5d               pop bp                                   
  0dc8:178e  0000             add byte ptr [bx + si], al               
  0dc8:1790  0000             add byte ptr [bx + si], al               
  0dc8:1792  0000             add byte ptr [bx + si], al               
  0dc8:1794  0100             add word ptr [bx + si], ax               
  0dc8:1796  d8bb3a01         fdivr dword ptr [bp + di + 0x13a]        
  0dc8:179a  0000             add byte ptr [bx + si], al               
  0dc8:179c  0000             add byte ptr [bx + si], al               
  0dc8:179e  0000             add byte ptr [bx + si], al               
  0dc8:17a0  0000             add byte ptr [bx + si], al               
  0dc8:17a2  0a0c             or cl, byte ptr [si]                     
  0dc8:17a4  0400             add al, 0                                
  0dc8:17a6  0000             add byte ptr [bx + si], al               
  0dc8:17a8  0000             add byte ptr [bx + si], al               
  0dc8:17aa  0000             add byte ptr [bx + si], al               
  0dc8:17ac  0100             add word ptr [bx + si], ax               
  0dc8:17ae  0000             add byte ptr [bx + si], al               
  0dc8:17b0  0000             add byte ptr [bx + si], al               
  0dc8:17b2  0000             add byte ptr [bx + si], al               
  0dc8:17b4  00e7             add bh, ah                               
  0dc8:17b6  fd               std                                      
  0dc8:17b7  ff00             inc word ptr [bx + si]                   
  0dc8:17b9  00bda4d6         add byte ptr [di - 0x295c], bh           
  0dc8:17bd  7bee             jnp 0x17ad                               
  0dc8:17bf  645c             pop sp                                   
  0dc8:17c1  b3ff             mov bl, 0xff                             
  0dc8:17c3  ff00             inc word ptr [bx + si]                   
  0dc8:17c5  00b58547         add byte ptr [di + 0x4785], dh           
  0dc8:17c9  fc               cld                                      
  0dc8:17ca  7430             je 0x17fc                                
  0dc8:17cc  11a10000         adc word ptr [bx + di], sp               
  0dc8:17d0  0000             add byte ptr [bx + si], al               
  0dc8:17d2  0000             add byte ptr [bx + si], al               
  0dc8:17d4  0000             add byte ptr [bx + si], al               
  0dc8:17d6  0000             add byte ptr [bx + si], al               
  0dc8:17d8  00800100         add byte ptr [bx + si + 1], al           
  0dc8:17dc  0000             add byte ptr [bx + si], al               
  0dc8:17de  9c               pushf                                    
  0dc8:17df  fa               cli                                      
  0dc8:17e0  64b0b2           mov al, 0xb2                             
  0dc8:17e3  1d07e6           sbb ax, 0xe607                           
  0dc8:17e6  fe               db fe
  0dc8:17e7  ff00             inc word ptr [bx + si]                   
  0dc8:17e9  009cfa64         add byte ptr [si + 0x64fa], bl           
  0dc8:17ed  b0b2             mov al, 0xb2                             
  0dc8:17ef  1d07e6           sbb ax, 0xe607                           
  0dc8:17f2  ff               db ff
  0dc8:17f3  ff00             inc word ptr [bx + si]                   
  0dc8:17f5  00f5             add ch, dh                               
  0dc8:17f7  bb4b04           mov bx, 0x44b                            
  0dc8:17fa  46               inc si                                   
  0dc8:17fb  56               push si                                  
  0dc8:17fc  85ac0000         test word ptr [si], bp                   
  0dc8:1800  0000             add byte ptr [bx + si], al               
  0dc8:1802  e66e             out 0x6e, al                             
  0dc8:1804  d91f             fstp dword ptr [bx]                      
  0dc8:1806  bd09fa           mov bp, 0xfa09                           
  0dc8:1809  e9feff           jmp 0x180a                               
  0dc8:180c  0000             add byte ptr [bx + si], al               
  0dc8:180e  8d7b35           lea di, [bp + di + 0x35]                 
  0dc8:1811  bd5b84           mov bp, 0x845b                           
  0dc8:1814  dd               db dd
  0dc8:1815  f6ff             idiv bh                                  
  0dc8:1817  ff00             inc word ptr [bx + si]                   
  0dc8:1819  007fd5           add byte ptr [bx - 0x2b], bh             
  0dc8:181c  3502db           xor ax, 0xdb02                           
  0dc8:181f  8073cc00         xor byte ptr [bp + di - 0x34], 0         
  0dc8:1823  0000             add byte ptr [bx + si], al               
  0dc8:1825  00558b           add byte ptr [di - 0x75], dl             
  0dc8:1828  ec               in al, dx                                
  0dc8:1829  8d66fe           lea sp, [bp - 2]                         
  0dc8:182c  56               push si                                  
  0dc8:182d  57               push di                                  
  0dc8:182e  56               push si                                  
  0dc8:182f  57               push di                                  
  0dc8:1830  56               push si                                  
  0dc8:1831  e856ec           call 0x48a                               -> 0dc8:048a
  0dc8:1834  c746fe0000       mov word ptr [bp - 2], 0                 
  0dc8:1839  bfae17           mov di, 0x17ae                           
  0dc8:183c  837efe03         cmp word ptr [bp - 2], 3                 
  0dc8:1840  7321             jae 0x1863                               
  0dc8:1842  87f7             xchg di, si                              
  0dc8:1844  e840f6           call 0xe87                               -> 0dc8:0e87
  0dc8:1847  87fe             xchg si, di                              
  0dc8:1849  56               push si                                  
  0dc8:184a  ff360c00         push word ptr [0xc]                      
  0dc8:184e  e888f1           call 0x9d9                               -> 0dc8:09d9
  0dc8:1851  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:1856  3d0000           cmp ax, 0                                
  0dc8:1859  7508             jne 0x1863                               
  0dc8:185b  ff46fe           inc word ptr [bp - 2]                    
  0dc8:185e  83c70c           add di, 0xc                              
  0dc8:1861  ebd9             jmp 0x183c                               
  0dc8:1863  837efe00         cmp word ptr [bp - 2], 0                 
  0dc8:1867  7505             jne 0x186e                               
  0dc8:1869  e86d00           call 0x18d9                              -> 0dc8:18d9
  0dc8:186c  eb65             jmp 0x18d3                               
  0dc8:186e  8b5efe           mov bx, word ptr [bp - 2]                
  0dc8:1871  4b               dec bx                                   
  0dc8:1872  2e8a9f0200       mov bl, byte ptr cs:[bx + 2]             
  0dc8:1877  895efe           mov word ptr [bp - 2], bx                
  0dc8:187a  81c30218         add bx, 0x1802                           
  0dc8:187e  8bfb             mov di, bx                               
  0dc8:1880  87f7             xchg di, si                              
  0dc8:1882  e802f6           call 0xe87                               -> 0dc8:0e87
  0dc8:1885  87fe             xchg si, di                              
  0dc8:1887  56               push si                                  
  0dc8:1888  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:188c  57               push di                                  
  0dc8:188d  8d45f4           lea ax, [di - 0xc]                       
  0dc8:1890  a30c00           mov word ptr [0xc], ax                   
  0dc8:1893  50               push ax                                  
  0dc8:1894  e858e8           call 0xef                                -> 0dc8:00ef
  0dc8:1897  56               push si                                  
  0dc8:1898  57               push di                                  
  0dc8:1899  56               push si                                  
  0dc8:189a  e820ea           call 0x2bd                               -> 0dc8:02bd
  0dc8:189d  e821f5           call 0xdc1                               -> 0dc8:0dc1
  0dc8:18a0  57               push di                                  
  0dc8:18a1  56               push si                                  
  0dc8:18a2  56               push si                                  
  0dc8:18a3  e84de8           call 0xf3                                -> 0dc8:00f3
  0dc8:18a6  ff360c00         push word ptr [0xc]                      
  0dc8:18aa  56               push si                                  
  0dc8:18ab  56               push si                                  
  0dc8:18ac  e8dbeb           call 0x48a                               -> 0dc8:048a
  0dc8:18af  83060c0018       add word ptr [0xc], 0x18                 
  0dc8:18b4  e82200           call 0x18d9                              -> 0dc8:18d9
  0dc8:18b7  8b7efe           mov di, word ptr [bp - 2]                
  0dc8:18ba  81c7de17         add di, 0x17de                           
  0dc8:18be  87f7             xchg di, si                              
  0dc8:18c0  e8c4f5           call 0xe87                               -> 0dc8:0e87
  0dc8:18c3  87fe             xchg si, di                              
  0dc8:18c5  ff360c00         push word ptr [0xc]                      
  0dc8:18c9  56               push si                                  
  0dc8:18ca  56               push si                                  
  0dc8:18cb  e825e8           call 0xf3                                -> 0dc8:00f3
  0dc8:18ce  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:18d3  5f               pop di                                   
  0dc8:18d4  5e               pop si                                   
  0dc8:18d5  8be5             mov sp, bp                               
  0dc8:18d7  5d               pop bp                                   
  0dc8:18d8  c3               ret                                      
  0dc8:18d9  56               push si                                  
  0dc8:18da  57               push di                                  
  0dc8:18db  e88df5           call 0xe6b                               -> 0dc8:0e6b
  0dc8:18de  837c08e0         cmp word ptr [si + 8], -0x20             
  0dc8:18e2  7f07             jg 0x18eb                                
  0dc8:18e4  8bfe             mov di, si                               
  0dc8:18e6  e8bbf5           call 0xea4                               -> 0dc8:0ea4
  0dc8:18e9  eb22             jmp 0x190d                               
  0dc8:18eb  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:18ef  83450803         add word ptr [di + 8], 3                 
  0dc8:18f3  e850fb           call 0x1446                              -> 0dc8:1446
  0dc8:18f6  2eff364c17       push word ptr cs:[0x174c]                
  0dc8:18fb  b84e17           mov ax, 0x174e                           
  0dc8:18fe  50               push ax                                  
  0dc8:18ff  e84cfc           call 0x154e                              -> 0dc8:154e
  0dc8:1902  57               push di                                  
  0dc8:1903  56               push si                                  
  0dc8:1904  56               push si                                  
  0dc8:1905  e8b5e9           call 0x2bd                               -> 0dc8:02bd
  0dc8:1908  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:190d  5f               pop di                                   
  0dc8:190e  5e               pop si                                   
  0dc8:190f  c3               ret                                      
  0dc8:1910  0d0000           or ax, 0                                 
  0dc8:1913  0000             add byte ptr [bx + si], al               
  0dc8:1915  0000             add byte ptr [bx + si], al               
  0dc8:1917  0000             add byte ptr [bx + si], al               
  0dc8:1919  0000             add byte ptr [bx + si], al               
  0dc8:191b  0000             add byte ptr [bx + si], al               
  0dc8:191d  0003             add byte ptr [bp + di], al               
  0dc8:191f  0000             add byte ptr [bx + si], al               
  0dc8:1921  0000             add byte ptr [bx + si], al               
  0dc8:1923  0000             add byte ptr [bx + si], al               
  0dc8:1925  40               inc ax                                   
  0dc8:1926  0000             add byte ptr [bx + si], al               
  0dc8:1928  0000             add byte ptr [bx + si], al               
  0dc8:192a  a9aaaa           test ax, 0xaaaa                          
  0dc8:192d  aa               stosb byte ptr es:[di], al               
  0dc8:192e  aa               stosb byte ptr es:[di], al               
  0dc8:192f  aa               stosb byte ptr es:[di], al               
  0dc8:1930  aa               stosb byte ptr es:[di], al               
  0dc8:1931  0a00             or al, byte ptr [bx + si]                
  0dc8:1933  0000             add byte ptr [bx + si], al               
  0dc8:1935  007855           add byte ptr [bx + si + 0x55], bh        
  0dc8:1938  55               push bp                                  
  0dc8:1939  55               push bp                                  
  0dc8:193a  55               push bp                                  
  0dc8:193b  55               push bp                                  
  0dc8:193c  55               push bp                                  
  0dc8:193d  0100             add word ptr [bx + si], ax               
  0dc8:193f  0000             add byte ptr [bx + si], al               
  0dc8:1941  00262322         add byte ptr [0x2223], ah                
  0dc8:1945  2222             and ah, byte ptr [bp + si]               
  0dc8:1947  2222             and ah, byte ptr [bp + si]               
  0dc8:1949  0000             add byte ptr [bx + si], al               
  0dc8:194b  0000             add byte ptr [bx + si], al               
  0dc8:194d  001c             add byte ptr [si], bl                    
  0dc8:194f  2bd8             sub bx, ax                               
  0dc8:1951  822dd8           sub byte ptr [di], 0xd8                  
  0dc8:1954  0200             add al, byte ptr [bx + si]               
  0dc8:1956  0000             add byte ptr [bx + si], al               
  0dc8:1958  0000             add byte ptr [bx + si], al               
  0dc8:195a  fc               cld                                      
  0dc8:195b  f9               stc                                      
  0dc8:195c  334003           xor ax, word ptr [bx + si + 3]           
  0dc8:195f  3400             xor al, 0                                
  0dc8:1961  0000             add byte ptr [bx + si], al               
  0dc8:1963  0000             add byte ptr [bx + si], al               
  0dc8:1965  0014             add byte ptr [si], dl                    
  0dc8:1967  52               push dx                                  
  0dc8:1968  0334             add si, word ptr [si]                    
  0dc8:196a  40               inc ax                                   
  0dc8:196b  0300             add ax, word ptr [bx + si]               
  0dc8:196d  0000             add byte ptr [bx + si], al               
  0dc8:196f  0000             add byte ptr [bx + si], al               
  0dc8:1971  001e6cc7         add byte ptr [0xc76c], bl                
  0dc8:1975  3b2e0000         cmp bp, word ptr [0]                     
  0dc8:1979  0000             add byte ptr [bx + si], al               
  0dc8:197b  0000             add byte ptr [bx + si], al               
  0dc8:197d  004cb0           add byte ptr [si - 0x50], cl             
  0dc8:1980  c9               leave                                    
  0dc8:1981  4f               dec di                                   
  0dc8:1982  0200             add al, byte ptr [bx + si]               
  0dc8:1984  0000             add byte ptr [bx + si], al               
  0dc8:1986  0000             add byte ptr [bx + si], al               
  0dc8:1988  0000             add byte ptr [bx + si], al               
  0dc8:198a  91               xchg cx, ax                              
  0dc8:198b  0e               push cs                                  
  0dc8:198c  e61a             out 0x1a, al                             
  0dc8:198e  0000             add byte ptr [bx + si], al               
  0dc8:1990  0000             add byte ptr [bx + si], al               
  0dc8:1992  0000             add byte ptr [bx + si], al               
  0dc8:1994  0000             add byte ptr [bx + si], al               
  0dc8:1996  51               push cx                                  
  0dc8:1997  761f             jbe 0x19b8                               
  0dc8:1999  0100             add word ptr [bx + si], ax               
  0dc8:199b  0000             add byte ptr [bx + si], al               
  0dc8:199d  0000             add byte ptr [bx + si], al               
  0dc8:199f  0000             add byte ptr [bx + si], al               
  0dc8:19a1  00c5             add ch, al                               
  0dc8:19a3  2c0b             sub al, 0xb                              
  0dc8:19a5  0000             add byte ptr [bx + si], al               
  0dc8:19a7  0000             add byte ptr [bx + si], al               
  0dc8:19a9  0000             add byte ptr [bx + si], al               
  0dc8:19ab  0000             add byte ptr [bx + si], al               
  0dc8:19ad  005556           add byte ptr [di + 0x56], dl             
  0dc8:19b0  57               push di                                  
  0dc8:19b1  8b2e0c00         mov bp, word ptr [0xc]                   
  0dc8:19b5  8d7ef4           lea di, [bp - 0xc]                       
  0dc8:19b8  893e0c00         mov word ptr [0xc], di                   
  0dc8:19bc  e857f4           call 0xe16                               -> 0dc8:0e16
  0dc8:19bf  57               push di                                  
  0dc8:19c0  56               push si                                  
  0dc8:19c1  56               push si                                  
  0dc8:19c2  e8f8e8           call 0x2bd                               -> 0dc8:02bd
  0dc8:19c5  892e0c00         mov word ptr [0xc], bp                   
  0dc8:19c9  8b7c08           mov di, word ptr [si + 8]                
  0dc8:19cc  83ffc0           cmp di, -0x40                            
  0dc8:19cf  7e57             jle 0x1a28                               
  0dc8:19d1  8b04             mov ax, word ptr [si]                    
  0dc8:19d3  8b5c02           mov bx, word ptr [si + 2]                
  0dc8:19d6  8b4c04           mov cx, word ptr [si + 4]                
  0dc8:19d9  8b5406           mov dx, word ptr [si + 6]                
  0dc8:19dc  47               inc di                                   
  0dc8:19dd  7d17             jge 0x19f6                               
  0dc8:19df  d1ea             shr dx, 1                                
  0dc8:19e1  d1d9             rcr cx, 1                                
  0dc8:19e3  d1db             rcr bx, 1                                
  0dc8:19e5  d1d8             rcr ax, 1                                
  0dc8:19e7  47               inc di                                   
  0dc8:19e8  7cf5             jl 0x19df                                
  0dc8:19ea  150000           adc ax, 0                                
  0dc8:19ed  83d300           adc bx, 0                                
  0dc8:19f0  83d100           adc cx, 0                                
  0dc8:19f3  83d200           adc dx, 0                                
  0dc8:19f6  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:19fb  fc               cld                                      
  0dc8:19fc  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:1a00  ab               stosw word ptr es:[di], ax               
  0dc8:1a01  93               xchg bx, ax                              
  0dc8:1a02  ab               stosw word ptr es:[di], ax               
  0dc8:1a03  91               xchg cx, ax                              
  0dc8:1a04  ab               stosw word ptr es:[di], ax               
  0dc8:1a05  92               xchg dx, ax                              
  0dc8:1a06  ab               stosw word ptr es:[di], ax               
  0dc8:1a07  2bc0             sub ax, ax                               
  0dc8:1a09  ab               stosw word ptr es:[di], ax               
  0dc8:1a0a  aa               stosb byte ptr es:[di], al               
  0dc8:1a0b  83ef0b           sub di, 0xb                              
  0dc8:1a0e  2eff361019       push word ptr cs:[0x1910]                
  0dc8:1a13  b81219           mov ax, 0x1912                           
  0dc8:1a16  50               push ax                                  
  0dc8:1a17  e834fb           call 0x154e                              -> 0dc8:154e
  0dc8:1a1a  a10c00           mov ax, word ptr [0xc]                   
  0dc8:1a1d  50               push ax                                  
  0dc8:1a1e  56               push si                                  
  0dc8:1a1f  56               push si                                  
  0dc8:1a20  e89ae8           call 0x2bd                               -> 0dc8:02bd
  0dc8:1a23  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:1a28  5f               pop di                                   
  0dc8:1a29  5e               pop si                                   
  0dc8:1a2a  5d               pop bp                                   
  0dc8:1a2b  c3               ret                                      
  0dc8:1a2c  bbf017           mov bx, 0x17f0                           
  0dc8:1a2f  5c               pop sp                                   
  0dc8:1a30  293b             sub word ptr [bp + di], di               
  0dc8:1a32  aa               stosb byte ptr es:[di], al               
  0dc8:1a33  b80100           mov ax, 1                                
  0dc8:1a36  0000             add byte ptr [bx + si], al               
  0dc8:1a38  0900             or word ptr [bx + si], ax                
  0dc8:1a3a  0000             add byte ptr [bx + si], al               
  0dc8:1a3c  0000             add byte ptr [bx + si], al               
  0dc8:1a3e  0000             add byte ptr [bx + si], al               
  0dc8:1a40  0000             add byte ptr [bx + si], al               
  0dc8:1a42  0000             add byte ptr [bx + si], al               
  0dc8:1a44  0000             add byte ptr [bx + si], al               
  0dc8:1a46  685555           push 0x5555                              
  0dc8:1a49  55               push bp                                  
  0dc8:1a4a  55               push bp                                  
  0dc8:1a4b  55               push bp                                  
  0dc8:1a4c  55               push bp                                  
  0dc8:1a4d  050000           add ax, 0                                
  0dc8:1a50  0000             add byte ptr [bx + si], al               
  0dc8:1a52  ba3433           mov dx, 0x3334                           
  0dc8:1a55  3333             xor si, word ptr [bp + di]               
  0dc8:1a57  3333             xor si, word ptr [bp + di]               
  0dc8:1a59  0000             add byte ptr [bx + si], al               
  0dc8:1a5b  0000             add byte ptr [bx + si], al               
  0dc8:1a5d  00a7c348         add byte ptr [bx + 0x48c3], ah           
  0dc8:1a61  92               xchg dx, ax                              
  0dc8:1a62  2449             and al, 0x49                             
  0dc8:1a64  0200             add al, byte ptr [bx + si]               
  0dc8:1a66  0000             add byte ptr [bx + si], al               
  0dc8:1a68  0000             add byte ptr [bx + si], al               
  0dc8:1a6a  4d               dec bp                                   
  0dc8:1a6b  5d               pop bp                                   
  0dc8:1a6c  22c7             and al, bh                               
  0dc8:1a6e  711c             jno 0x1a8c                               
  0dc8:1a70  0000             add byte ptr [bx + si], al               
  0dc8:1a72  0000             add byte ptr [bx + si], al               
  0dc8:1a74  0000             add byte ptr [bx + si], al               
  0dc8:1a76  2456             and al, 0x56                             
  0dc8:1a78  eb5c             jmp 0x1ad6                               
  0dc8:1a7a  7401             je 0x1a7d                                
  0dc8:1a7c  0000             add byte ptr [bx + si], al               
  0dc8:1a7e  0000             add byte ptr [bx + si], al               
  0dc8:1a80  0000             add byte ptr [bx + si], al               
  0dc8:1a82  39adecb1         cmp word ptr [di - 0x4e14], bp           
  0dc8:1a86  1300             adc ax, word ptr [bx + si]               
  0dc8:1a88  0000             add byte ptr [bx + si], al               
  0dc8:1a8a  0000             add byte ptr [bx + si], al               
  0dc8:1a8c  0000             add byte ptr [bx + si], al               
  0dc8:1a8e  fd               std                                      
  0dc8:1a8f  d6               salc                                     
  0dc8:1a90  800f01           or byte ptr [bx], 1                      
  0dc8:1a93  0000             add byte ptr [bx + si], al               
  0dc8:1a95  0000             add byte ptr [bx + si], al               
  0dc8:1a97  0000             add byte ptr [bx + si], al               
  0dc8:1a99  00b57ae4         add byte ptr [di - 0x1b86], dh           
  0dc8:1a9d  1000             adc byte ptr [bx + si], al               
  0dc8:1a9f  0000             add byte ptr [bx + si], al               
  0dc8:1aa1  0000             add byte ptr [bx + si], al               
  0dc8:1aa3  0000             add byte ptr [bx + si], al               
  0dc8:1aa5  00558b           add byte ptr [di - 0x75], dl             
  0dc8:1aa8  ec               in al, dx                                
  0dc8:1aa9  ff7508           push word ptr [di + 8]                   
  0dc8:1aac  56               push si                                  
  0dc8:1aad  57               push di                                  
  0dc8:1aae  8b05             mov ax, word ptr [di]                    
  0dc8:1ab0  8b5d02           mov bx, word ptr [di + 2]                
  0dc8:1ab3  8b4d04           mov cx, word ptr [di + 4]                
  0dc8:1ab6  8b5506           mov dx, word ptr [di + 6]                
  0dc8:1ab9  81fa05b5         cmp dx, 0xb505                           
  0dc8:1abd  7710             ja 0x1acf                                
  0dc8:1abf  d1e0             shl ax, 1                                
  0dc8:1ac1  d1d3             rcl bx, 1                                
  0dc8:1ac3  d1d1             rcl cx, 1                                
  0dc8:1ac5  d1d2             rcl dx, 1                                
  0dc8:1ac7  be0000           mov si, 0                                
  0dc8:1aca  ff4efe           dec word ptr [bp - 2]                    
  0dc8:1acd  eb15             jmp 0x1ae4                               
  0dc8:1acf  f7d2             not dx                                   
  0dc8:1ad1  f7d1             not cx                                   
  0dc8:1ad3  f7d3             not bx                                   
  0dc8:1ad5  f7d8             neg ax                                   
  0dc8:1ad7  f5               cmc                                      
  0dc8:1ad8  83d300           adc bx, 0                                
  0dc8:1adb  83d100           adc cx, 0                                
  0dc8:1ade  83d200           adc dx, 0                                
  0dc8:1ae1  be0100           mov si, 1                                
  0dc8:1ae4  2bff             sub di, di                               
  0dc8:1ae6  0bd2             or dx, dx                                
  0dc8:1ae8  7519             jne 0x1b03                               
  0dc8:1aea  93               xchg bx, ax                              
  0dc8:1aeb  91               xchg cx, ax                              
  0dc8:1aec  92               xchg dx, ax                              
  0dc8:1aed  83ef10           sub di, 0x10                             
  0dc8:1af0  83ffc0           cmp di, -0x40                            
  0dc8:1af3  7ff1             jg 0x1ae6                                
  0dc8:1af5  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:1afa  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:1afe  e826f3           call 0xe27                               -> 0dc8:0e27
  0dc8:1b01  eb2d             jmp 0x1b30                               
  0dc8:1b03  780b             js 0x1b10                                
  0dc8:1b05  4f               dec di                                   
  0dc8:1b06  d1e0             shl ax, 1                                
  0dc8:1b08  d1d3             rcl bx, 1                                
  0dc8:1b0a  d1d1             rcl cx, 1                                
  0dc8:1b0c  13d2             adc dx, dx                               
  0dc8:1b0e  79f5             jns 0x1b05                               
  0dc8:1b10  56               push si                                  
  0dc8:1b11  57               push di                                  
  0dc8:1b12  52               push dx                                  
  0dc8:1b13  51               push cx                                  
  0dc8:1b14  53               push bx                                  
  0dc8:1b15  50               push ax                                  
  0dc8:1b16  8bf4             mov si, sp                               
  0dc8:1b18  e87b00           call 0x1b96                              -> 0dc8:1b96
  0dc8:1b1b  be2c1a           mov si, 0x1a2c                           
  0dc8:1b1e  e866f3           call 0xe87                               -> 0dc8:0e87
  0dc8:1b21  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1b25  8bc4             mov ax, sp                               
  0dc8:1b27  56               push si                                  
  0dc8:1b28  50               push ax                                  
  0dc8:1b29  56               push si                                  
  0dc8:1b2a  e890e7           call 0x2bd                               -> 0dc8:02bd
  0dc8:1b2d  83c40c           add sp, 0xc                              
  0dc8:1b30  8d76fe           lea si, [bp - 2]                         
  0dc8:1b33  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:1b38  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:1b3c  e8b9f3           call 0xef8                               -> 0dc8:0ef8
  0dc8:1b3f  8d750c           lea si, [di + 0xc]                       
  0dc8:1b42  56               push si                                  
  0dc8:1b43  57               push di                                  
  0dc8:1b44  57               push di                                  
  0dc8:1b45  e8abe5           call 0xf3                                -> 0dc8:00f3
  0dc8:1b48  57               push di                                  
  0dc8:1b49  ff76fc           push word ptr [bp - 4]                   
  0dc8:1b4c  ff76fc           push word ptr [bp - 4]                   
  0dc8:1b4f  e86be7           call 0x2bd                               -> 0dc8:02bd
  0dc8:1b52  83060c0018       add word ptr [0xc], 0x18                 
  0dc8:1b57  5f               pop di                                   
  0dc8:1b58  5e               pop si                                   
  0dc8:1b59  8be5             mov sp, bp                               
  0dc8:1b5b  5d               pop bp                                   
  0dc8:1b5c  c3               ret                                      

proc_0dc8_1b5d:
  0dc8:1b5d  55               push bp                                  
  0dc8:1b5e  8bec             mov bp, sp                               
  0dc8:1b60  56               push si                                  
  0dc8:1b61  57               push di                                  
  0dc8:1b62  8bf7             mov si, di                               
  0dc8:1b64  e804f3           call 0xe6b                               -> 0dc8:0e6b
  0dc8:1b67  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1b6b  e82800           call 0x1b96                              -> 0dc8:1b96
  0dc8:1b6e  be2c1a           mov si, 0x1a2c                           
  0dc8:1b71  e813f3           call 0xe87                               -> 0dc8:0e87
  0dc8:1b74  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1b78  56               push si                                  
  0dc8:1b79  8d740c           lea si, [si + 0xc]                       
  0dc8:1b7c  56               push si                                  
  0dc8:1b7d  56               push si                                  
  0dc8:1b7e  e83ce7           call 0x2bd                               -> 0dc8:02bd
  0dc8:1b81  56               push si                                  
  0dc8:1b82  ff76fe           push word ptr [bp - 2]                   
  0dc8:1b85  ff76fe           push word ptr [bp - 2]                   
  0dc8:1b88  e832e7           call 0x2bd                               -> 0dc8:02bd
  0dc8:1b8b  83060c0018       add word ptr [0xc], 0x18                 
  0dc8:1b90  5f               pop di                                   
  0dc8:1b91  5e               pop si                                   
  0dc8:1b92  8be5             mov sp, bp                               
  0dc8:1b94  5d               pop bp                                   
  0dc8:1b95  c3               ret                                      

proc_0dc8_1b96:
  0dc8:1b96  55               push bp                                  
  0dc8:1b97  8bec             mov bp, sp                               
  0dc8:1b99  56               push si                                  
  0dc8:1b9a  57               push di                                  
  0dc8:1b9b  837c08c0         cmp word ptr [si + 8], -0x40             
  0dc8:1b9f  7e46             jle 0x1be7                               
  0dc8:1ba1  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:1ba6  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:1baa  e814f2           call 0xdc1                               -> 0dc8:0dc1
  0dc8:1bad  ff4508           inc word ptr [di + 8]                    
  0dc8:1bb0  56               push si                                  
  0dc8:1bb1  57               push di                                  
  0dc8:1bb2  57               push di                                  
  0dc8:1bb3  e83de5           call 0xf3                                -> 0dc8:00f3
  0dc8:1bb6  56               push si                                  
  0dc8:1bb7  57               push di                                  
  0dc8:1bb8  57               push di                                  
  0dc8:1bb9  e8cee8           call 0x48a                               -> 0dc8:048a
  0dc8:1bbc  e8fbf2           call 0xeba                               -> 0dc8:0eba
  0dc8:1bbf  8b1e0c00         mov bx, word ptr [0xc]                   
  0dc8:1bc3  83470802         add word ptr [bx + 8], 2                 
  0dc8:1bc7  e87cf8           call 0x1446                              -> 0dc8:1446
  0dc8:1bca  2eff36381a       push word ptr cs:[0x1a38]                
  0dc8:1bcf  b83a1a           mov ax, 0x1a3a                           
  0dc8:1bd2  50               push ax                                  
  0dc8:1bd3  e878f9           call 0x154e                              -> 0dc8:154e
  0dc8:1bd6  ff360c00         push word ptr [0xc]                      
  0dc8:1bda  57               push di                                  
  0dc8:1bdb  56               push si                                  
  0dc8:1bdc  e8dee6           call 0x2bd                               -> 0dc8:02bd
  0dc8:1bdf  ff4408           inc word ptr [si + 8]                    
  0dc8:1be2  83060c0018       add word ptr [0xc], 0x18                 
  0dc8:1be7  5f               pop di                                   
  0dc8:1be8  5e               pop si                                   
  0dc8:1be9  8be5             mov sp, bp                               
  0dc8:1beb  5d               pop bp                                   
  0dc8:1bec  c3               ret                                      
  0dc8:1bed  b100             mov cl, 0                                
  0dc8:1bef  eb06             jmp 0x1bf7                               
  0dc8:1bf1  b102             mov cl, 2                                
  0dc8:1bf3  eb02             jmp 0x1bf7                               
  0dc8:1bf5  b104             mov cl, 4                                
  0dc8:1bf7  8ec7             mov es, di                               
  0dc8:1bf9  8bec             mov bp, sp                               
  0dc8:1bfb  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:1bff  8a6d0a           mov ch, byte ptr [di + 0xa]              
  0dc8:1c02  51               push cx                                  
  0dc8:1c03  50               push ax                                  
  0dc8:1c04  837d08e0         cmp word ptr [di + 8], -0x20             
  0dc8:1c08  7f0b             jg 0x1c15                                
  0dc8:1c0a  80f902           cmp cl, 2                                
  0dc8:1c0d  7503             jne 0x1c12                               
  0dc8:1c0f  e8aff1           call 0xdc1                               -> 0dc8:0dc1
  0dc8:1c12  e9ba00           jmp 0x1ccf                               
  0dc8:1c15  837d0840         cmp word ptr [di + 8], 0x40              
  0dc8:1c19  7e0b             jle 0x1c26                               
  0dc8:1c1b  e835f2           call 0xe53                               -> 0dc8:0e53
  0dc8:1c1e  c745062100       mov word ptr [di + 6], 0x21              
  0dc8:1c23  e9a900           jmp 0x1ccf                               
  0dc8:1c26  c6450a00         mov byte ptr [di + 0xa], 0               
  0dc8:1c2a  8d75f4           lea si, [di - 0xc]                       
  0dc8:1c2d  89360c00         mov word ptr [0xc], si                   
  0dc8:1c31  87fe             xchg si, di                              
  0dc8:1c33  e8bef1           call 0xdf4                               -> 0dc8:0df4
  0dc8:1c36  87fe             xchg si, di                              
  0dc8:1c38  836c0802         sub word ptr [si + 8], 2                 
  0dc8:1c3c  e892ec           call 0x8d1                               -> 0dc8:08d1
  0dc8:1c3f  2407             and al, 7                                
  0dc8:1c41  8846fc           mov byte ptr [bp - 4], al                
  0dc8:1c44  8a5efe           mov bl, byte ptr [bp - 2]                
  0dc8:1c47  80fb04           cmp bl, 4                                
  0dc8:1c4a  743b             je 0x1c87                                
  0dc8:1c4c  025efc           add bl, byte ptr [bp - 4]                
  0dc8:1c4f  80e307           and bl, 7                                
  0dc8:1c52  885efc           mov byte ptr [bp - 4], bl                
  0dc8:1c55  d1eb             shr bx, 1                                
  0dc8:1c57  7311             jae 0x1c6a                               
  0dc8:1c59  87fe             xchg si, di                              
  0dc8:1c5b  e896f1           call 0xdf4                               -> 0dc8:0df4
  0dc8:1c5e  87fe             xchg si, di                              
  0dc8:1c60  836c0802         sub word ptr [si + 8], 2                 
  0dc8:1c64  56               push si                                  
  0dc8:1c65  57               push di                                  
  0dc8:1c66  57               push di                                  
  0dc8:1c67  e885e4           call 0xef                                -> 0dc8:00ef
  0dc8:1c6a  893e0c00         mov word ptr [0xc], di                   
  0dc8:1c6e  8bf7             mov si, di                               
  0dc8:1c70  f646fc03         test byte ptr [bp - 4], 3                
  0dc8:1c74  7a05             jp 0x1c7b                                
  0dc8:1c76  e8a7fa           call 0x1720                              -> 0dc8:1720
  0dc8:1c79  eb03             jmp 0x1c7e                               
  0dc8:1c7b  e881fa           call 0x16ff                              -> 0dc8:16ff
  0dc8:1c7e  8a5efc           mov bl, byte ptr [bp - 4]                
  0dc8:1c81  d0eb             shr bl, 1                                
  0dc8:1c83  d0eb             shr bl, 1                                
  0dc8:1c85  eb3c             jmp 0x1cc3                               
  0dc8:1c87  f646fc01         test byte ptr [bp - 4], 1                
  0dc8:1c8b  7411             je 0x1c9e                                
  0dc8:1c8d  87f7             xchg di, si                              
  0dc8:1c8f  e862f1           call 0xdf4                               -> 0dc8:0df4
  0dc8:1c92  87f7             xchg di, si                              
  0dc8:1c94  836c0802         sub word ptr [si + 8], 2                 
  0dc8:1c98  56               push si                                  
  0dc8:1c99  57               push di                                  
  0dc8:1c9a  57               push di                                  
  0dc8:1c9b  e851e4           call 0xef                                -> 0dc8:00ef
  0dc8:1c9e  893e0c00         mov word ptr [0xc], di                   
  0dc8:1ca2  8bf7             mov si, di                               
  0dc8:1ca4  e889fa           call 0x1730                              -> 0dc8:1730
  0dc8:1ca7  8d7cf4           lea di, [si - 0xc]                       
  0dc8:1caa  8bc6             mov ax, si                               
  0dc8:1cac  f646fc03         test byte ptr [bp - 4], 3                
  0dc8:1cb0  7a02             jp 0x1cb4                                
  0dc8:1cb2  87f7             xchg di, si                              
  0dc8:1cb4  97               xchg di, ax                              
  0dc8:1cb5  56               push si                                  
  0dc8:1cb6  50               push ax                                  
  0dc8:1cb7  57               push di                                  
  0dc8:1cb8  e8cfe7           call 0x48a                               -> 0dc8:048a
  0dc8:1cbb  8a5efc           mov bl, byte ptr [bp - 4]                
  0dc8:1cbe  d0eb             shr bl, 1                                
  0dc8:1cc0  80e301           and bl, 1                                
  0dc8:1cc3  807efe02         cmp byte ptr [bp - 2], 2                 
  0dc8:1cc7  7403             je 0x1ccc                                
  0dc8:1cc9  325eff           xor bl, byte ptr [bp - 1]                
  0dc8:1ccc  885d0a           mov byte ptr [di + 0xa], bl              
  0dc8:1ccf  893e0c00         mov word ptr [0xc], di                   
  0dc8:1cd3  8be5             mov sp, bp                               
  0dc8:1cd5  c3               ret                                      
  0dc8:1cd6  8ec7             mov es, di                               
  0dc8:1cd8  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1cdc  8d7cf4           lea di, [si - 0xc]                       
  0dc8:1cdf  893e0c00         mov word ptr [0xc], di                   
  0dc8:1ce3  e8dbf0           call 0xdc1                               -> 0dc8:0dc1
  0dc8:1ce6  8b4408           mov ax, word ptr [si + 8]                
  0dc8:1ce9  3d0140           cmp ax, 0x4001                           
  0dc8:1cec  7d38             jge 0x1d26                               
  0dc8:1cee  3d01c0           cmp ax, 0xc001                           
  0dc8:1cf1  7e2e             jle 0x1d21                               
  0dc8:1cf3  b100             mov cl, 0                                
  0dc8:1cf5  8bde             mov bx, si                               
  0dc8:1cf7  48               dec ax                                   
  0dc8:1cf8  7c07             jl 0x1d01                                
  0dc8:1cfa  e8daf1           call 0xed7                               -> 0dc8:0ed7
  0dc8:1cfd  8bdf             mov bx, di                               
  0dc8:1cff  b101             mov cl, 1                                
  0dc8:1d01  b500             mov ch, 0                                
  0dc8:1d03  866f0a           xchg byte ptr [bx + 0xa], ch             
  0dc8:1d06  51               push cx                                  
  0dc8:1d07  e81cfb           call 0x1826                              -> 0dc8:1826
  0dc8:1d0a  59               pop cx                                   
  0dc8:1d0b  80f901           cmp cl, 1                                
  0dc8:1d0e  750e             jne 0x1d1e                               
  0dc8:1d10  51               push cx                                  
  0dc8:1d11  e8e0f0           call 0xdf4                               -> 0dc8:0df4
  0dc8:1d14  ff4d08           dec word ptr [di + 8]                    
  0dc8:1d17  57               push di                                  
  0dc8:1d18  56               push si                                  
  0dc8:1d19  56               push si                                  
  0dc8:1d1a  e8d2e3           call 0xef                                -> 0dc8:00ef
  0dc8:1d1d  59               pop cx                                   
  0dc8:1d1e  886c0a           mov byte ptr [si + 0xa], ch              
  0dc8:1d21  89360c00         mov word ptr [0xc], si                   
  0dc8:1d25  c3               ret                                      
  0dc8:1d26  8bfe             mov di, si                               
  0dc8:1d28  ff740a           push word ptr [si + 0xa]                 
  0dc8:1d2b  e8c6f0           call 0xdf4                               -> 0dc8:0df4
  0dc8:1d2e  58               pop ax                                   
  0dc8:1d2f  88440a           mov byte ptr [si + 0xa], al              
  0dc8:1d32  ff4c08           dec word ptr [si + 8]                    
  0dc8:1d35  ebea             jmp 0x1d21                               
  0dc8:1d37  8ec7             mov es, di                               
  0dc8:1d39  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1d3d  8d7cf4           lea di, [si - 0xc]                       
  0dc8:1d40  893e0c00         mov word ptr [0xc], di                   
  0dc8:1d44  e8cff0           call 0xe16                               -> 0dc8:0e16
  0dc8:1d47  eb22             jmp 0x1d6b                               
  0dc8:1d49  8ec7             mov es, di                               
  0dc8:1d4b  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1d4f  8d7cf4           lea di, [si - 0xc]                       
  0dc8:1d52  893e0c00         mov word ptr [0xc], di                   
  0dc8:1d56  e868f0           call 0xdc1                               -> 0dc8:0dc1
  0dc8:1d59  eb10             jmp 0x1d6b                               
  0dc8:1d5b  8ec7             mov es, di                               
  0dc8:1d5d  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1d61  8d7cf4           lea di, [si - 0xc]                       
  0dc8:1d64  893e0c00         mov word ptr [0xc], di                   
  0dc8:1d68  e89af0           call 0xe05                               -> 0dc8:0e05
  0dc8:1d6b  e869f1           call 0xed7                               -> 0dc8:0ed7
  0dc8:1d6e  807d0a00         cmp byte ptr [di + 0xa], 0               
  0dc8:1d72  7519             jne 0x1d8d                               
  0dc8:1d74  8b4508           mov ax, word ptr [di + 8]                
  0dc8:1d77  3d01c0           cmp ax, 0xc001                           
  0dc8:1d7a  7e0d             jle 0x1d89                               
  0dc8:1d7c  3d0140           cmp ax, 0x4001                           
  0dc8:1d7f  7d0c             jge 0x1d8d                               
  0dc8:1d81  e822fd           call 0x1aa6                              -> 0dc8:1aa6
  0dc8:1d84  89360c00         mov word ptr [0xc], si                   
  0dc8:1d88  c3               ret                                      
  0dc8:1d89  b504             mov ch, 4                                
  0dc8:1d8b  eb02             jmp 0x1d8f                               
  0dc8:1d8d  b501             mov ch, 1                                
  0dc8:1d8f  e88209           call 0x2714                              -> 0dc8:2714
  0dc8:1d92  b80140           mov ax, 0x4001                           
  0dc8:1d95  8bfe             mov di, si                               
  0dc8:1d97  b100             mov cl, 0                                
  0dc8:1d99  e8a1f0           call 0xe3d                               -> 0dc8:0e3d
  0dc8:1d9c  80fd01           cmp ch, 1                                
  0dc8:1d9f  75e3             jne 0x1d84                               
  0dc8:1da1  c7450600c0       mov word ptr [di + 6], 0xc000            
  0dc8:1da6  ebdc             jmp 0x1d84                               
  0dc8:1da8  b8e30d           mov ax, 0xde3                            
  0dc8:1dab  eb0e             jmp 0x1dbb                               
  0dc8:1dad  8ec7             mov es, di                               
  0dc8:1daf  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1db3  8d7cf4           lea di, [si - 0xc]                       
  0dc8:1db6  eb1c             jmp 0x1dd4                               
  0dc8:1db8  b8d20d           mov ax, 0xdd2                            
  0dc8:1dbb  8ec7             mov es, di                               
  0dc8:1dbd  8b360c00         mov si, word ptr [0xc]                   
  0dc8:1dc1  8d7cf4           lea di, [si - 0xc]                       
  0dc8:1dc4  893e0c00         mov word ptr [0xc], di                   
  0dc8:1dc8  ffd0             call ax                                  
  0dc8:1dca  56               push si                                  
  0dc8:1dcb  57               push di                                  
  0dc8:1dcc  56               push si                                  
  0dc8:1dcd  e8ede4           call 0x2bd                               -> 0dc8:02bd
  0dc8:1dd0  89360c00         mov word ptr [0xc], si                   
  0dc8:1dd4  8bec             mov bp, sp                               
  0dc8:1dd6  b80000           mov ax, 0                                
  0dc8:1dd9  50               push ax                                  
  0dc8:1dda  8b4408           mov ax, word ptr [si + 8]                
  0dc8:1ddd  3d0c00           cmp ax, 0xc                              
  0dc8:1de0  7f4e             jg 0x1e30                                
  0dc8:1de2  3dc0ff           cmp ax, 0xffc0                           
  0dc8:1de5  7e75             jle 0x1e5c                               
  0dc8:1de7  e8d0f0           call 0xeba                               -> 0dc8:0eba
  0dc8:1dea  ff4508           inc word ptr [di + 8]                    
  0dc8:1ded  ff360200         push word ptr [2]                        
  0dc8:1df1  80260300f3       and byte ptr [3], 0xf3                   
  0dc8:1df6  800e030004       or byte ptr [3], 4                       
  0dc8:1dfb  8bf7             mov si, di                               
  0dc8:1dfd  e837f5           call 0x1337                              -> 0dc8:1337
  0dc8:1e00  8f060200         pop word ptr [2]                         
  0dc8:1e04  50               push ax                                  
  0dc8:1e05  8bfc             mov di, sp                               
  0dc8:1e07  e831f1           call 0xf3b                               -> 0dc8:0f3b
  0dc8:1e0a  ff4c08           dec word ptr [si + 8]                    
  0dc8:1e0d  8d7c0c           lea di, [si + 0xc]                       
  0dc8:1e10  57               push di                                  
  0dc8:1e11  56               push si                                  
  0dc8:1e12  57               push di                                  
  0dc8:1e13  e8d9e2           call 0xef                                -> 0dc8:00ef
  0dc8:1e16  58               pop ax                                   
  0dc8:1e17  d1f8             sar ax, 1                                
  0dc8:1e19  735d             jae 0x1e78                               
  0dc8:1e1b  c7048564         mov word ptr [si], 0x6485                
  0dc8:1e1f  c74402def9       mov word ptr [si + 2], 0xf9de            
  0dc8:1e24  c7440433f3       mov word ptr [si + 4], 0xf333            
  0dc8:1e29  c7440604b5       mov word ptr [si + 6], 0xb504            
  0dc8:1e2e  eb5b             jmp 0x1e8b                               
  0dc8:1e30  3d0140           cmp ax, 0x4001                           
  0dc8:1e33  7510             jne 0x1e45                               
  0dc8:1e35  b8ff7f           mov ax, 0x7fff                           
  0dc8:1e38  234406           and ax, word ptr [si + 6]                
  0dc8:1e3b  0b4404           or ax, word ptr [si + 4]                 
  0dc8:1e3e  0b4402           or ax, word ptr [si + 2]                 
  0dc8:1e41  0b04             or ax, word ptr [si]                     
  0dc8:1e43  751e             jne 0x1e63                               
  0dc8:1e45  807c0a00         cmp byte ptr [si + 0xa], 0               
  0dc8:1e49  7526             jne 0x1e71                               
  0dc8:1e4b  8bfe             mov di, si                               
  0dc8:1e4d  b508             mov ch, 8                                
  0dc8:1e4f  e8c208           call 0x2714                              -> 0dc8:2714
  0dc8:1e52  b80140           mov ax, 0x4001                           
  0dc8:1e55  b100             mov cl, 0                                
  0dc8:1e57  e8e3ef           call 0xe3d                               -> 0dc8:0e3d
  0dc8:1e5a  eb55             jmp 0x1eb1                               
  0dc8:1e5c  8bfe             mov di, si                               
  0dc8:1e5e  e860ef           call 0xdc1                               -> 0dc8:0dc1
  0dc8:1e61  eb4e             jmp 0x1eb1                               
  0dc8:1e63  c7440600c0       mov word ptr [si + 6], 0xc000            
  0dc8:1e68  8bfe             mov di, si                               
  0dc8:1e6a  b501             mov ch, 1                                
  0dc8:1e6c  e8a508           call 0x2714                              -> 0dc8:2714
  0dc8:1e6f  eb40             jmp 0x1eb1                               
  0dc8:1e71  8bfe             mov di, si                               
  0dc8:1e73  e8b1ef           call 0xe27                               -> 0dc8:0e27
  0dc8:1e76  eb39             jmp 0x1eb1                               
  0dc8:1e78  c7040000         mov word ptr [si], 0                     
  0dc8:1e7c  c744020000       mov word ptr [si + 2], 0                 
  0dc8:1e81  c744040000       mov word ptr [si + 4], 0                 
  0dc8:1e86  c744060080       mov word ptr [si + 6], 0x8000            
  0dc8:1e8b  40               inc ax                                   
  0dc8:1e8c  894408           mov word ptr [si + 8], ax                
  0dc8:1e8f  c6440a00         mov byte ptr [si + 0xa], 0               
  0dc8:1e93  8bfe             mov di, si                               
  0dc8:1e95  8d750c           lea si, [di + 0xc]                       
  0dc8:1e98  e813fb           call 0x19ae                              -> 0dc8:19ae
  0dc8:1e9b  56               push si                                  
  0dc8:1e9c  57               push di                                  
  0dc8:1e9d  56               push si                                  
  0dc8:1e9e  e81ce4           call 0x2bd                               -> 0dc8:02bd
  0dc8:1ea1  56               push si                                  
  0dc8:1ea2  57               push di                                  
  0dc8:1ea3  56               push si                                  
  0dc8:1ea4  e84ce2           call 0xf3                                -> 0dc8:00f3
  0dc8:1ea7  807efe01         cmp byte ptr [bp - 2], 1                 
  0dc8:1eab  7504             jne 0x1eb1                               
  0dc8:1ead  80740a01         xor byte ptr [si + 0xa], 1               
  0dc8:1eb1  89360c00         mov word ptr [0xc], si                   
  0dc8:1eb5  8be5             mov sp, bp                               
  0dc8:1eb7  c3               ret                                      
  0dc8:1eb8  53               push bx                                  
  0dc8:1eb9  51               push cx                                  
  0dc8:1eba  52               push dx                                  
  0dc8:1ebb  b104             mov cl, 4                                
  0dc8:1ebd  b50a             mov ch, 0xa                              
  0dc8:1ebf  268b1c           mov bx, word ptr es:[si]                 
  0dc8:1ec2  8ac7             mov al, bh                               
  0dc8:1ec4  d2e8             shr al, cl                               
  0dc8:1ec6  f6e5             mul ch                                   
  0dc8:1ec8  b20f             mov dl, 0xf                              
  0dc8:1eca  22d7             and dl, bh                               
  0dc8:1ecc  02c2             add al, dl                               
  0dc8:1ece  f6e5             mul ch                                   
  0dc8:1ed0  baf000           mov dx, 0xf0                             
  0dc8:1ed3  22d3             and dl, bl                               
  0dc8:1ed5  d3ea             shr dx, cl                               
  0dc8:1ed7  03c2             add ax, dx                               
  0dc8:1ed9  b90a00           mov cx, 0xa                              
  0dc8:1edc  f7e1             mul cx                                   
  0dc8:1ede  83e30f           and bx, 0xf                              
  0dc8:1ee1  03c3             add ax, bx                               
  0dc8:1ee3  5a               pop dx                                   
  0dc8:1ee4  59               pop cx                                   
  0dc8:1ee5  5b               pop bx                                   
  0dc8:1ee6  c3               ret                                      

proc_0dc8_1ee7:
  0dc8:1ee7  55               push bp                                  
  0dc8:1ee8  8bec             mov bp, sp                               
  0dc8:1eea  56               push si                                  
  0dc8:1eeb  57               push di                                  
  0dc8:1eec  268a4409         mov al, byte ptr es:[si + 9]             
  0dc8:1ef0  258000           and ax, 0x80                             
  0dc8:1ef3  d0c0             rol al, 1                                
  0dc8:1ef5  88450a           mov byte ptr [di + 0xa], al              
  0dc8:1ef8  b104             mov cl, 4                                
  0dc8:1efa  268a4408         mov al, byte ptr es:[si + 8]             
  0dc8:1efe  d3e0             shl ax, cl                               
  0dc8:1f00  d2e8             shr al, cl                               
  0dc8:1f02  d50a             aad 0xa                                  
  0dc8:1f04  bf1027           mov di, 0x2710                           
  0dc8:1f07  f7e7             mul di                                   
  0dc8:1f09  93               xchg bx, ax                              
  0dc8:1f0a  8d7406           lea si, [si + 6]                         
  0dc8:1f0d  e8a8ff           call 0x1eb8                              -> 0dc8:1eb8
  0dc8:1f10  03c3             add ax, bx                               
  0dc8:1f12  12d6             adc dl, dh                               
  0dc8:1f14  8bda             mov bx, dx                               
  0dc8:1f16  f7e7             mul di                                   
  0dc8:1f18  93               xchg bx, ax                              
  0dc8:1f19  8bca             mov cx, dx                               
  0dc8:1f1b  f7e7             mul di                                   
  0dc8:1f1d  03c8             add cx, ax                               
  0dc8:1f1f  12d6             adc dl, dh                               
  0dc8:1f21  83ee02           sub si, 2                                
  0dc8:1f24  e891ff           call 0x1eb8                              -> 0dc8:1eb8
  0dc8:1f27  03c3             add ax, bx                               
  0dc8:1f29  83d100           adc cx, 0                                
  0dc8:1f2c  12d6             adc dl, dh                               
  0dc8:1f2e  56               push si                                  
  0dc8:1f2f  8bda             mov bx, dx                               
  0dc8:1f31  f7e7             mul di                                   
  0dc8:1f33  91               xchg cx, ax                              
  0dc8:1f34  8bf2             mov si, dx                               
  0dc8:1f36  f7e7             mul di                                   
  0dc8:1f38  93               xchg bx, ax                              
  0dc8:1f39  87fa             xchg dx, di                              
  0dc8:1f3b  f7e2             mul dx                                   
  0dc8:1f3d  03de             add bx, si                               
  0dc8:1f3f  13f8             adc di, ax                               
  0dc8:1f41  5e               pop si                                   
  0dc8:1f42  83ee02           sub si, 2                                
  0dc8:1f45  e870ff           call 0x1eb8                              -> 0dc8:1eb8
  0dc8:1f48  03c1             add ax, cx                               
  0dc8:1f4a  13da             adc bx, dx                               
  0dc8:1f4c  13fa             adc di, dx                               
  0dc8:1f4e  be1027           mov si, 0x2710                           
  0dc8:1f51  f7e6             mul si                                   
  0dc8:1f53  93               xchg bx, ax                              
  0dc8:1f54  8bca             mov cx, dx                               
  0dc8:1f56  f7e6             mul si                                   
  0dc8:1f58  96               xchg si, ax                              
  0dc8:1f59  87fa             xchg dx, di                              
  0dc8:1f5b  f7e2             mul dx                                   
  0dc8:1f5d  03ce             add cx, si                               
  0dc8:1f5f  13f8             adc di, ax                               
  0dc8:1f61  83d200           adc dx, 0                                
  0dc8:1f64  8b76fe           mov si, word ptr [bp - 2]                
  0dc8:1f67  e84eff           call 0x1eb8                              -> 0dc8:1eb8
  0dc8:1f6a  03d8             add bx, ax                               
  0dc8:1f6c  83d100           adc cx, 0                                
  0dc8:1f6f  83d700           adc di, 0                                
  0dc8:1f72  83d200           adc dx, 0                                
  0dc8:1f75  b84000           mov ax, 0x40                             
  0dc8:1f78  0bd2             or dx, dx                                
  0dc8:1f7a  750d             jne 0x1f89                               
  0dc8:1f7c  2d1000           sub ax, 0x10                             
  0dc8:1f7f  742c             je 0x1fad                                
  0dc8:1f81  87d7             xchg di, dx                              
  0dc8:1f83  87f9             xchg cx, di                              
  0dc8:1f85  87cb             xchg bx, cx                              
  0dc8:1f87  ebef             jmp 0x1f78                               
  0dc8:1f89  780b             js 0x1f96                                
  0dc8:1f8b  48               dec ax                                   
  0dc8:1f8c  d1e3             shl bx, 1                                
  0dc8:1f8e  d1d1             rcl cx, 1                                
  0dc8:1f90  d1d7             rcl di, 1                                
  0dc8:1f92  13d2             adc dx, dx                               
  0dc8:1f94  79f5             jns 0x1f8b                               
  0dc8:1f96  8b76fc           mov si, word ptr [bp - 4]                
  0dc8:1f99  891c             mov word ptr [si], bx                    
  0dc8:1f9b  894c02           mov word ptr [si + 2], cx                
  0dc8:1f9e  897c04           mov word ptr [si + 4], di                
  0dc8:1fa1  895406           mov word ptr [si + 6], dx                
  0dc8:1fa4  894408           mov word ptr [si + 8], ax                
  0dc8:1fa7  5f               pop di                                   
  0dc8:1fa8  5e               pop si                                   
  0dc8:1fa9  8be5             mov sp, bp                               
  0dc8:1fab  5d               pop bp                                   
  0dc8:1fac  c3               ret                                      
  0dc8:1fad  b801c0           mov ax, 0xc001                           
  0dc8:1fb0  ebe4             jmp 0x1f96                               
  0dc8:1fb2  50               push ax                                  
  0dc8:1fb3  51               push cx                                  
  0dc8:1fb4  b064             mov al, 0x64                             
  0dc8:1fb6  b104             mov cl, 4                                
  0dc8:1fb8  92               xchg dx, ax                              
  0dc8:1fb9  f6f2             div dl                                   
  0dc8:1fbb  8ad4             mov dl, ah                               
  0dc8:1fbd  d40a             aam 0xa                                  
  0dc8:1fbf  d2e4             shl ah, cl                               
  0dc8:1fc1  0ae0             or ah, al                                
  0dc8:1fc3  92               xchg dx, ax                              
  0dc8:1fc4  d40a             aam 0xa                                  
  0dc8:1fc6  d2e4             shl ah, cl                               
  0dc8:1fc8  0ac4             or al, ah                                
  0dc8:1fca  8ae6             mov ah, dh                               
  0dc8:1fcc  ab               stosw word ptr es:[di], ax               
  0dc8:1fcd  59               pop cx                                   
  0dc8:1fce  58               pop ax                                   
  0dc8:1fcf  c3               ret                                      

proc_0dc8_1fd0:
  0dc8:1fd0  55               push bp                                  
  0dc8:1fd1  8bec             mov bp, sp                               
  0dc8:1fd3  56               push si                                  
  0dc8:1fd4  57               push di                                  
  0dc8:1fd5  fc               cld                                      
  0dc8:1fd6  8b4408           mov ax, word ptr [si + 8]                
  0dc8:1fd9  8b1c             mov bx, word ptr [si]                    
  0dc8:1fdb  8b4c02           mov cx, word ptr [si + 2]                
  0dc8:1fde  8b5406           mov dx, word ptr [si + 6]                
  0dc8:1fe1  8b7404           mov si, word ptr [si + 4]                
  0dc8:1fe4  3d0000           cmp ax, 0                                
  0dc8:1fe7  7c38             jl 0x2021                                
  0dc8:1fe9  2d3c00           sub ax, 0x3c                             
  0dc8:1fec  7c1f             jl 0x200d                                
  0dc8:1fee  7f33             jg 0x2023                                
  0dc8:1ff0  81fa0bde         cmp dx, 0xde0b                           
  0dc8:1ff4  7217             jb 0x200d                                
  0dc8:1ff6  772b             ja 0x2023                                
  0dc8:1ff8  81fe3a6b         cmp si, 0x6b3a                           
  0dc8:1ffc  720f             jb 0x200d                                
  0dc8:1ffe  7723             ja 0x2023                                
  0dc8:2000  81f93f76         cmp cx, 0x763f                           
  0dc8:2004  7207             jb 0x200d                                
  0dc8:2006  771b             ja 0x2023                                
  0dc8:2008  83fbf0           cmp bx, -0x10                            
  0dc8:200b  7716             ja 0x2023                                
  0dc8:200d  b400             mov ah, 0                                
  0dc8:200f  2c04             sub al, 4                                
  0dc8:2011  0410             add al, 0x10                             
  0dc8:2013  7f10             jg 0x2025                                
  0dc8:2015  8ae7             mov ah, bh                               
  0dc8:2017  8bd9             mov bx, cx                               
  0dc8:2019  8bce             mov cx, si                               
  0dc8:201b  8bf2             mov si, dx                               
  0dc8:201d  2bd2             sub dx, dx                               
  0dc8:201f  ebf0             jmp 0x2011                               
  0dc8:2021  eb67             jmp 0x208a                               
  0dc8:2023  eb6e             jmp 0x2093                               
  0dc8:2025  2c10             sub al, 0x10                             
  0dc8:2027  7d0e             jge 0x2037                               
  0dc8:2029  d1ea             shr dx, 1                                
  0dc8:202b  d1de             rcr si, 1                                
  0dc8:202d  d1d9             rcr cx, 1                                
  0dc8:202f  d1db             rcr bx, 1                                
  0dc8:2031  d0dc             rcr ah, 1                                
  0dc8:2033  fec0             inc al                                   
  0dc8:2035  7cf2             jl 0x2029                                
  0dc8:2037  02e4             add ah, ah                               
  0dc8:2039  83d300           adc bx, 0                                
  0dc8:203c  83d100           adc cx, 0                                
  0dc8:203f  83d600           adc si, 0                                
  0dc8:2042  83d200           adc dx, 0                                
  0dc8:2045  96               xchg si, ax                              
  0dc8:2046  be1027           mov si, 0x2710                           
  0dc8:2049  f7f6             div si                                   
  0dc8:204b  91               xchg cx, ax                              
  0dc8:204c  f7f6             div si                                   
  0dc8:204e  93               xchg bx, ax                              
  0dc8:204f  f7f6             div si                                   
  0dc8:2051  e85eff           call 0x1fb2                              -> 0dc8:1fb2
  0dc8:2054  2bd2             sub dx, dx                               
  0dc8:2056  91               xchg cx, ax                              
  0dc8:2057  f7f6             div si                                   
  0dc8:2059  93               xchg bx, ax                              
  0dc8:205a  f7f6             div si                                   
  0dc8:205c  91               xchg cx, ax                              
  0dc8:205d  f7f6             div si                                   
  0dc8:205f  e850ff           call 0x1fb2                              -> 0dc8:1fb2
  0dc8:2062  8bd3             mov dx, bx                               
  0dc8:2064  91               xchg cx, ax                              
  0dc8:2065  f7f6             div si                                   
  0dc8:2067  91               xchg cx, ax                              
  0dc8:2068  f7f6             div si                                   
  0dc8:206a  e845ff           call 0x1fb2                              -> 0dc8:1fb2
  0dc8:206d  8bd1             mov dx, cx                               
  0dc8:206f  f7f6             div si                                   
  0dc8:2071  e83eff           call 0x1fb2                              -> 0dc8:1fb2
  0dc8:2074  d40a             aam 0xa                                  
  0dc8:2076  b104             mov cl, 4                                
  0dc8:2078  d2e4             shl ah, cl                               
  0dc8:207a  0ac4             or al, ah                                
  0dc8:207c  aa               stosb byte ptr es:[di], al               
  0dc8:207d  8b76fe           mov si, word ptr [bp - 2]                
  0dc8:2080  8a440a           mov al, byte ptr [si + 0xa]              
  0dc8:2083  d0c8             ror al, 1                                
  0dc8:2085  aa               stosb byte ptr es:[di], al               
  0dc8:2086  5f               pop di                                   
  0dc8:2087  5e               pop si                                   
  0dc8:2088  5d               pop bp                                   
  0dc8:2089  c3               ret                                      
  0dc8:208a  b000             mov al, 0                                
  0dc8:208c  b90900           mov cx, 9                                
  0dc8:208f  f3aa             rep stosb byte ptr es:[di], al           
  0dc8:2091  ebea             jmp 0x207d                               
  0dc8:2093  b508             mov ch, 8                                
  0dc8:2095  e87c06           call 0x2714                              -> 0dc8:2714
  0dc8:2098  b099             mov al, 0x99                             
  0dc8:209a  ebf0             jmp 0x208c                               
  0dc8:209c  a921b3           test ax, 0xb321                          
  0dc8:209f  21bd21c7         and word ptr [di - 0x38df], di           
  0dc8:20a3  21d1             and cx, dx                               
  0dc8:20a5  21d8             and ax, bx                               
  0dc8:20a7  21f6             and si, si                               
  0dc8:20a9  21df             and di, bx                               
  0dc8:20ab  218725fc         and word ptr [bx - 0x3db], ax            
  0dc8:20af  256c26           and ax, 0x266c                           
  0dc8:20b2  6e               outsb dx, byte ptr [si]                  
  0dc8:20b3  26890b           mov word ptr es:[bp + di], cx            
  0dc8:20b6  8a10             mov dl, byte ptr [bx + si]               
  0dc8:20b8  8d0c             lea cx, [si]                             
  0dc8:20ba  f8               clc                                      
  0dc8:20bb  0e               push cs                                  
  0dc8:20bc  8722             xchg word ptr [bp + si], sp              
  0dc8:20be  8e22             mov fs, word ptr [bp + si]               
  0dc8:20c0  98               cwde                                     
  0dc8:20c1  2295229f         and dl, byte ptr [di - 0x60de]           
  0dc8:20c5  229e22a7         and bl, byte ptr [bp - 0x58de]           
  0dc8:20c9  22a62289         and ah, byte ptr [bp - 0x76de]           
  0dc8:20cd  0b8a108d         or cx, word ptr [bp + si - 0x72f0]       
  0dc8:20d1  0cf8             or al, 0xf8                              
  0dc8:20d3  0e               push cs                                  
  0dc8:20d4  0f0b             ud2                                      
  0dc8:20d6  e210             loop 0x20e8                              
  0dc8:20d8  e60b             out 0xb, al                              
  0dc8:20da  3b0f             cmp cx, word ptr [bx]                    
  0dc8:20dc  1f               pop ds                                   
  0dc8:20dd  2319             and bx, word ptr [bx + di]               
  0dc8:20df  238023ee         and ax, word ptr [bx + si - 0x11dd]      
  0dc8:20e3  2328             and bp, word ptr [bx + si]               
  0dc8:20e5  23fe             and di, si                               
  0dc8:20e7  2319             and bx, word ptr [bx + di]               
  0dc8:20e9  23de             and bx, si                               
  0dc8:20eb  2333             and si, word ptr [bp + di]               
  0dc8:20ed  2319             and bx, word ptr [bx + di]               
  0dc8:20ef  235c23           and bx, word ptr [si + 0x23]             
  0dc8:20f2  1b24             sbb sp, word ptr [si]                    
  0dc8:20f4  b223             mov dl, 0x23                             
  0dc8:20f6  2824             sub byte ptr [si], ah                    
  0dc8:20f8  b723             mov bh, 0x23                             
  0dc8:20fa  0e               push cs                                  
  0dc8:20fb  24b5             and al, 0xb5                             
  0dc8:20fd  01e8             add ax, bp                               
  0dc8:20ff  1306e998         adc ax, word ptr [0x98e9]                
  0dc8:2103  057724           add ax, 0x2477                           
  0dc8:2106  f6c420           test ah, 0x20                            
  0dc8:2109  75f1             jne 0x20fc                               
  0dc8:210b  42               inc dx                                   
  0dc8:210c  8ac4             mov al, ah                               
  0dc8:210e  8cdf             mov di, ds                               
  0dc8:2110  24c0             and al, 0xc0                             
  0dc8:2112  740e             je 0x2122                                
  0dc8:2114  3c80             cmp al, 0x80                             
  0dc8:2116  8cd7             mov di, ss                               
  0dc8:2118  7208             jb 0x2122                                
  0dc8:211a  8b7e00           mov di, word ptr [bp]                    
  0dc8:211d  7703             ja 0x2122                                
  0dc8:211f  8b7e14           mov di, word ptr [bp + 0x14]             
  0dc8:2122  26ac             lodsb al, byte ptr es:[si]               
  0dc8:2124  86e0             xchg al, ah                              
  0dc8:2126  2407             and al, 7                                
  0dc8:2128  eb48             jmp 0x2172                               
  0dc8:212a  3c09             cmp al, 9                                
  0dc8:212c  751f             jne 0x214d                               
  0dc8:212e  36a00700         mov al, byte ptr ss:[7]                  
  0dc8:2132  8cc3             mov bx, es                               
  0dc8:2134  80e3f8           and bl, 0xf8                             
  0dc8:2137  368e1e0a00       mov ds, word ptr ss:[0xa]                
  0dc8:213c  304705           xor byte ptr [bx + 5], al                
  0dc8:213f  06               push es                                  
  0dc8:2140  07               pop es                                   
  0dc8:2141  26c744fd89e4     mov word ptr es:[si - 3], 0xe489         
  0dc8:2147  304705           xor byte ptr [bx + 5], al                
  0dc8:214a  e94f05           jmp 0x269c                               
  0dc8:214d  e90106           jmp 0x2751                               
  0dc8:2150  3400             xor al, 0                                
  0dc8:2152  fb               sti                                      
  0dc8:2153  fc               cld                                      
  0dc8:2154  50               push ax                                  
  0dc8:2155  51               push cx                                  
  0dc8:2156  52               push dx                                  
  0dc8:2157  53               push bx                                  
  0dc8:2158  1e               push ds                                  
  0dc8:2159  55               push bp                                  
  0dc8:215a  56               push si                                  
  0dc8:215b  57               push di                                  
  0dc8:215c  06               push es                                  
  0dc8:215d  8bec             mov bp, sp                               
  0dc8:215f  36892e3200       mov word ptr ss:[0x32], bp               
  0dc8:2164  c47612           les si, ptr [bp + 0x12]                  
  0dc8:2167  4e               dec si                                   
  0dc8:2168  b200             mov dl, 0                                
  0dc8:216a  26ad             lodsw ax, word ptr es:[si]               
  0dc8:216c  2c34             sub al, 0x34                             
  0dc8:216e  3c08             cmp al, 8                                
  0dc8:2170  7392             jae 0x2104                               
  0dc8:2172  bb07c0           mov bx, 0xc007                           
  0dc8:2175  22dc             and bl, ah                               
  0dc8:2177  22fc             and bh, ah                               
  0dc8:2179  91               xchg cx, ax                              
  0dc8:217a  80ffc0           cmp bh, 0xc0                             
  0dc8:217d  7367             jae 0x21e6                               
  0dc8:217f  80ff40           cmp bh, 0x40                             
  0dc8:2182  7712             ja 0x2196                                
  0dc8:2184  7414             je 0x219a                                
  0dc8:2186  2bc0             sub ax, ax                               
  0dc8:2188  80fb06           cmp bl, 6                                
  0dc8:218b  7510             jne 0x219d                               
  0dc8:218d  26ad             lodsw ax, word ptr es:[si]               
  0dc8:218f  897612           mov word ptr [bp + 0x12], si             
  0dc8:2192  8cde             mov si, ds                               
  0dc8:2194  eb65             jmp 0x21fb                               
  0dc8:2196  26ad             lodsw ax, word ptr es:[si]               
  0dc8:2198  eb03             jmp 0x219d                               
  0dc8:219a  26ac             lodsb al, byte ptr es:[si]               
  0dc8:219c  98               cwde                                     
  0dc8:219d  897612           mov word ptr [bp + 0x12], si             
  0dc8:21a0  b700             mov bh, 0                                
  0dc8:21a2  d1e3             shl bx, 1                                
  0dc8:21a4  2effa79c20       jmp word ptr cs:[bx + 0x209c]            
  0dc8:21a9  03460a           add ax, word ptr [bp + 0xa]              
  0dc8:21ac  034604           add ax, word ptr [bp + 4]                
  0dc8:21af  8cde             mov si, ds                               
  0dc8:21b1  eb48             jmp 0x21fb                               
  0dc8:21b3  03460a           add ax, word ptr [bp + 0xa]              
  0dc8:21b6  034602           add ax, word ptr [bp + 2]                
  0dc8:21b9  8cde             mov si, ds                               
  0dc8:21bb  eb3e             jmp 0x21fb                               
  0dc8:21bd  034606           add ax, word ptr [bp + 6]                
  0dc8:21c0  034604           add ax, word ptr [bp + 4]                
  0dc8:21c3  8cd6             mov si, ss                               
  0dc8:21c5  eb34             jmp 0x21fb                               
  0dc8:21c7  034606           add ax, word ptr [bp + 6]                
  0dc8:21ca  034602           add ax, word ptr [bp + 2]                
  0dc8:21cd  8cd6             mov si, ss                               
  0dc8:21cf  eb2a             jmp 0x21fb                               
  0dc8:21d1  034604           add ax, word ptr [bp + 4]                
  0dc8:21d4  8cde             mov si, ds                               
  0dc8:21d6  eb23             jmp 0x21fb                               
  0dc8:21d8  034602           add ax, word ptr [bp + 2]                
  0dc8:21db  8cde             mov si, ds                               
  0dc8:21dd  eb1c             jmp 0x21fb                               
  0dc8:21df  03460a           add ax, word ptr [bp + 0xa]              
  0dc8:21e2  8cde             mov si, ds                               
  0dc8:21e4  eb15             jmp 0x21fb                               
  0dc8:21e6  897612           mov word ptr [bp + 0x12], si             
  0dc8:21e9  8cd0             mov ax, ss                               
  0dc8:21eb  8ed8             mov ds, ax                               
  0dc8:21ed  8ec0             mov es, ax                               
  0dc8:21ef  f6c101           test cl, 1                               
  0dc8:21f2  7433             je 0x2227                                
  0dc8:21f4  eb17             jmp 0x220d                               
  0dc8:21f6  034606           add ax, word ptr [bp + 6]                
  0dc8:21f9  8cd6             mov si, ss                               
  0dc8:21fb  96               xchg si, ax                              
  0dc8:21fc  80fa01           cmp dl, 1                                
  0dc8:21ff  7501             jne 0x2202                               
  0dc8:2201  97               xchg di, ax                              
  0dc8:2202  8ec0             mov es, ax                               
  0dc8:2204  8cd0             mov ax, ss                               
  0dc8:2206  8ed8             mov ds, ax                               
  0dc8:2208  f6c101           test cl, 1                               
  0dc8:220b  741a             je 0x2227                                
  0dc8:220d  80fdc0           cmp ch, 0xc0                             
  0dc8:2210  7303             jae 0x2215                               
  0dc8:2212  e99900           jmp 0x22ae                               
  0dc8:2215  f6c520           test ch, 0x20                            
  0dc8:2218  7503             jne 0x221d                               
  0dc8:221a  e93802           jmp 0x2455                               
  0dc8:221d  bb0600           mov bx, 6                                
  0dc8:2220  22d9             and bl, cl                               
  0dc8:2222  2effa7ac20       jmp word ptr cs:[bx + 0x20ac]            
  0dc8:2227  b83800           mov ax, 0x38                             
  0dc8:222a  22c5             and al, ch                               
  0dc8:222c  d1e8             shr ax, 1                                
  0dc8:222e  d1e8             shr ax, 1                                
  0dc8:2230  95               xchg bp, ax                              
  0dc8:2231  80fdc0           cmp ch, 0xc0                             
  0dc8:2234  732a             jae 0x2260                               
  0dc8:2236  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:223a  83ef0c           sub di, 0xc                              
  0dc8:223d  893e0c00         mov word ptr [0xc], di                   
  0dc8:2241  bb0600           mov bx, 6                                
  0dc8:2244  22d9             and bl, cl                               
  0dc8:2246  2eff97b420       call word ptr cs:[bx + 0x20b4]           
  0dc8:224b  8cd1             mov cx, ss                               
  0dc8:224d  8ec1             mov es, cx                               
  0dc8:224f  be0c00           mov si, 0xc                              
  0dc8:2252  8bdf             mov bx, di                               
  0dc8:2254  8d00             lea ax, [bx + si]                        
  0dc8:2256  8bd0             mov dx, ax                               
  0dc8:2258  b99726           mov cx, 0x2697                           
  0dc8:225b  2effa6bc20       jmp word ptr cs:[bp + 0x20bc]            
  0dc8:2260  b700             mov bh, 0                                
  0dc8:2262  2e8a9f0200       mov bl, byte ptr cs:[bx + 2]             
  0dc8:2267  a10c00           mov ax, word ptr [0xc]                   
  0dc8:226a  03d8             add bx, ax                               
  0dc8:226c  f6c104           test cl, 4                               
  0dc8:226f  8bd0             mov dx, ax                               
  0dc8:2271  7402             je 0x2275                                
  0dc8:2273  8bd3             mov dx, bx                               
  0dc8:2275  2bf6             sub si, si                               
  0dc8:2277  f6c102           test cl, 2                               
  0dc8:227a  7403             je 0x227f                                
  0dc8:227c  be0c00           mov si, 0xc                              
  0dc8:227f  b99726           mov cx, 0x2697                           
  0dc8:2282  2effa6bc20       jmp word ptr cs:[bp + 0x20bc]            
  0dc8:2287  50               push ax                                  
  0dc8:2288  53               push bx                                  
  0dc8:2289  52               push dx                                  
  0dc8:228a  51               push cx                                  
  0dc8:228b  e965de           jmp 0xf3                                 
  0dc8:228e  50               push ax                                  
  0dc8:228f  53               push bx                                  
  0dc8:2290  52               push dx                                  
  0dc8:2291  51               push cx                                  
  0dc8:2292  e928e0           jmp 0x2bd                                
  0dc8:2295  83c60c           add si, 0xc                              
  0dc8:2298  50               push ax                                  
  0dc8:2299  53               push bx                                  
  0dc8:229a  51               push cx                                  
  0dc8:229b  e93be7           jmp 0x9d9                                
  0dc8:229e  93               xchg bx, ax                              
  0dc8:229f  50               push ax                                  
  0dc8:22a0  53               push bx                                  
  0dc8:22a1  52               push dx                                  
  0dc8:22a2  51               push cx                                  
  0dc8:22a3  e949de           jmp 0xef                                 
  0dc8:22a6  93               xchg bx, ax                              
  0dc8:22a7  50               push ax                                  
  0dc8:22a8  53               push bx                                  
  0dc8:22a9  52               push dx                                  
  0dc8:22aa  51               push cx                                  
  0dc8:22ab  e9dce1           jmp 0x48a                                
  0dc8:22ae  bd0600           mov bp, 6                                
  0dc8:22b1  23e9             and bp, cx                               
  0dc8:22b3  f6c520           test ch, 0x20                            
  0dc8:22b6  7542             jne 0x22fa                               
  0dc8:22b8  f6c510           test ch, 0x10                            
  0dc8:22bb  751a             jne 0x22d7                               
  0dc8:22bd  f6c508           test ch, 8                               
  0dc8:22c0  7554             jne 0x2316                               
  0dc8:22c2  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:22c6  b8f4ff           mov ax, 0xfff4                           
  0dc8:22c9  03f8             add di, ax                               
  0dc8:22cb  a30400           mov word ptr [4], ax                     
  0dc8:22ce  b89226           mov ax, 0x2692                           
  0dc8:22d1  50               push ax                                  
  0dc8:22d2  2effa6cc20       jmp word ptr cs:[bp + 0x20cc]            
  0dc8:22d7  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:22db  87f7             xchg di, si                              
  0dc8:22dd  f6c508           test ch, 8                               
  0dc8:22e0  7509             jne 0x22eb                               
  0dc8:22e2  b89c26           mov ax, 0x269c                           
  0dc8:22e5  50               push ax                                  
  0dc8:22e6  2effa6d420       jmp word ptr cs:[bp + 0x20d4]            
  0dc8:22eb  c70604000c00     mov word ptr [4], 0xc                    
  0dc8:22f1  b89226           mov ax, 0x2692                           
  0dc8:22f4  50               push ax                                  
  0dc8:22f5  2effa6d420       jmp word ptr cs:[bp + 0x20d4]            
  0dc8:22fa  b80800           mov ax, 8                                
  0dc8:22fd  22c5             and al, ch                               
  0dc8:22ff  0be8             or bp, ax                                
  0dc8:2301  b89c26           mov ax, 0x269c                           
  0dc8:2304  50               push ax                                  
  0dc8:2305  f6c510           test ch, 0x10                            
  0dc8:2308  7505             jne 0x230f                               
  0dc8:230a  2effa6dc20       jmp word ptr cs:[bp + 0x20dc]            
  0dc8:230f  87f7             xchg di, si                              
  0dc8:2311  2effa6ec20       jmp word ptr cs:[bp + 0x20ec]            
  0dc8:2316  e98303           jmp 0x269c                               
  0dc8:2319  b501             mov ch, 1                                
  0dc8:231b  e8f603           call 0x2714                              -> 0dc8:2714
  0dc8:231e  c3               ret                                      
  0dc8:231f  b104             mov cl, 4                                
  0dc8:2321  268b4402         mov ax, word ptr es:[si + 2]             
  0dc8:2325  a30000           mov word ptr [0], ax                     
  0dc8:2328  268b04           mov ax, word ptr es:[si]                 
  0dc8:232b  a30200           mov word ptr [2], ax                     
  0dc8:232e  b500             mov ch, 0                                
  0dc8:2330  e9e103           jmp 0x2714                               
  0dc8:2333  e87c00           call 0x23b2                              -> 0dc8:23b2
  0dc8:2336  e87e00           call 0x23b7                              -> 0dc8:23b7
  0dc8:2339  a11000           mov ax, word ptr [0x10]                  
  0dc8:233c  2b060c00         sub ax, word ptr [0xc]                   
  0dc8:2340  b96000           mov cx, 0x60                             
  0dc8:2343  3bc1             cmp ax, cx                               
  0dc8:2345  7201             jb 0x2348                                
  0dc8:2347  91               xchg cx, ax                              
  0dc8:2348  b20c             mov dl, 0xc                              
  0dc8:234a  f6f2             div dl                                   
  0dc8:234c  91               xchg cx, ax                              
  0dc8:234d  03c9             add cx, cx                               
  0dc8:234f  b8ffff           mov ax, 0xffff                           
  0dc8:2352  d3e8             shr ax, cl                               
  0dc8:2354  ab               stosw word ptr es:[di], ax               
  0dc8:2355  2bc0             sub ax, ax                               
  0dc8:2357  ab               stosw word ptr es:[di], ax               
  0dc8:2358  ab               stosw word ptr es:[di], ax               
  0dc8:2359  ab               stosw word ptr es:[di], ax               
  0dc8:235a  ab               stosw word ptr es:[di], ax               
  0dc8:235b  c3               ret                                      
  0dc8:235c  e8d4ff           call 0x2333                              -> 0dc8:2333
  0dc8:235f  8b360c00         mov si, word ptr [0xc]                   
  0dc8:2363  268b6df6         mov bp, word ptr es:[di - 0xa]           
  0dc8:2367  f7dd             neg bp                                   
  0dc8:2369  4d               dec bp                                   
  0dc8:236a  740f             je 0x237b                                
  0dc8:236c  e8dce9           call 0xd4b                               -> 0dc8:0d4b
  0dc8:236f  83c60c           add si, 0xc                              
  0dc8:2372  83c70a           add di, 0xa                              
  0dc8:2375  d1e5             shl bp, 1                                
  0dc8:2377  d1e5             shl bp, 1                                
  0dc8:2379  ebef             jmp 0x236a                               
  0dc8:237b  89360c00         mov word ptr [0xc], si                   
  0dc8:237f  c3               ret                                      
  0dc8:2380  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:2384  268b6c04         mov bp, word ptr es:[si + 4]             
  0dc8:2388  f7dd             neg bp                                   
  0dc8:238a  4d               dec bp                                   
  0dc8:238b  7492             je 0x231f                                
  0dc8:238d  83c65e           add si, 0x5e                             
  0dc8:2390  83ee0a           sub si, 0xa                              
  0dc8:2393  d1ed             shr bp, 1                                
  0dc8:2395  d1ed             shr bp, 1                                
  0dc8:2397  73f7             jae 0x2390                               
  0dc8:2399  83ef0c           sub di, 0xc                              
  0dc8:239c  e8d9e9           call 0xd78                               -> 0dc8:0d78
  0dc8:239f  83ee0a           sub si, 0xa                              
  0dc8:23a2  d1ed             shr bp, 1                                
  0dc8:23a4  d1ed             shr bp, 1                                
  0dc8:23a6  72f1             jb 0x2399                                
  0dc8:23a8  83c6fc           add si, -4                               
  0dc8:23ab  893e0c00         mov word ptr [0xc], di                   
  0dc8:23af  e96dff           jmp 0x231f                               
  0dc8:23b2  a10200           mov ax, word ptr [2]                     
  0dc8:23b5  ab               stosw word ptr es:[di], ax               
  0dc8:23b6  c3               ret                                      
  0dc8:23b7  a11000           mov ax, word ptr [0x10]                  
  0dc8:23ba  2b060c00         sub ax, word ptr [0xc]                   
  0dc8:23be  b96000           mov cx, 0x60                             
  0dc8:23c1  3bc1             cmp ax, cx                               
  0dc8:23c3  7201             jb 0x23c6                                
  0dc8:23c5  91               xchg cx, ax                              
  0dc8:23c6  f7d8             neg ax                                   
  0dc8:23c8  b10c             mov cl, 0xc                              
  0dc8:23ca  f6f9             idiv cl                                  
  0dc8:23cc  2407             and al, 7                                
  0dc8:23ce  b103             mov cl, 3                                
  0dc8:23d0  d2e0             shl al, cl                               
  0dc8:23d2  8b0e0000         mov cx, word ptr [0]                     
  0dc8:23d6  80e5c7           and ch, 0xc7                             
  0dc8:23d9  0ae8             or ch, al                                
  0dc8:23db  91               xchg cx, ax                              
  0dc8:23dc  ab               stosw word ptr es:[di], ax               
  0dc8:23dd  c3               ret                                      
  0dc8:23de  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:23e2  83ef0c           sub di, 0xc                              
  0dc8:23e5  e8e6ed           call 0x11ce                              -> 0dc8:11ce
  0dc8:23e8  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:23ed  c3               ret                                      
  0dc8:23ee  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:23f2  83ef0c           sub di, 0xc                              
  0dc8:23f5  e8effa           call 0x1ee7                              -> 0dc8:1ee7
  0dc8:23f8  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:23fd  c3               ret                                      
  0dc8:23fe  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:2402  83ef0c           sub di, 0xc                              
  0dc8:2405  e870e9           call 0xd78                               -> 0dc8:0d78
  0dc8:2408  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:240d  c3               ret                                      
  0dc8:240e  8b360c00         mov si, word ptr [0xc]                   
  0dc8:2412  e82cee           call 0x1241                              -> 0dc8:1241
  0dc8:2415  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:241a  c3               ret                                      
  0dc8:241b  8b360c00         mov si, word ptr [0xc]                   
  0dc8:241f  e8aefb           call 0x1fd0                              -> 0dc8:1fd0
  0dc8:2422  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:2427  c3               ret                                      
  0dc8:2428  8b360c00         mov si, word ptr [0xc]                   
  0dc8:242c  e81ce9           call 0xd4b                               -> 0dc8:0d4b
  0dc8:242f  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:2434  c3               ret                                      
  0dc8:2435  7424             je 0x245b                                
  0dc8:2437  ce               into                                     
  0dc8:2438  2487             and al, 0x87                             
  0dc8:243a  2482             and al, 0x82                             
  0dc8:243c  24d5             and al, 0xd5                             
  0dc8:243e  24ce             and al, 0xce                             
  0dc8:2440  24d5             and al, 0xd5                             
  0dc8:2442  24d5             and al, 0xd5                             
  0dc8:2444  24c9             and al, 0xc9                             
  0dc8:2446  24ce             and al, 0xce                             
  0dc8:2448  24e6             and al, 0xe6                             
  0dc8:244a  24f1             and al, 0xf1                             
  0dc8:244c  24f1             and al, 0xf1                             
  0dc8:244e  24ce             and al, 0xce                             
  0dc8:2450  24f1             and al, 0xf1                             
  0dc8:2452  24f1             and al, 0xf1                             
  0dc8:2454  24b7             and al, 0xb7                             
  0dc8:2456  002e8a9f         add byte ptr [0x9f8a], ch                
  0dc8:245a  0200             add al, byte ptr [bx + si]               
  0dc8:245c  8b360c00         mov si, word ptr [0xc]                   
  0dc8:2460  03f3             add si, bx                               
  0dc8:2462  b318             mov bl, 0x18                             
  0dc8:2464  22dd             and bl, ch                               
  0dc8:2466  80e106           and cl, 6                                
  0dc8:2469  0ad9             or bl, cl                                
  0dc8:246b  fc               cld                                      
  0dc8:246c  b90600           mov cx, 6                                
  0dc8:246f  2effa73524       jmp word ptr cs:[bx + 0x2435]            
  0dc8:2474  832e0c000c       sub word ptr [0xc], 0xc                  
  0dc8:2479  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:247d  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:247f  e91a02           jmp 0x269c                               
  0dc8:2482  bf0c00           mov di, 0xc                              
  0dc8:2485  eb03             jmp 0x248a                               
  0dc8:2487  bf0000           mov di, 0                                
  0dc8:248a  a11000           mov ax, word ptr [0x10]                  
  0dc8:248d  2d0c00           sub ax, 0xc                              
  0dc8:2490  3bf0             cmp si, ax                               
  0dc8:2492  7410             je 0x24a4                                
  0dc8:2494  87fe             xchg si, di                              
  0dc8:2496  b80140           mov ax, 0x4001                           
  0dc8:2499  b100             mov cl, 0                                
  0dc8:249b  e89fe9           call 0xe3d                               -> 0dc8:0e3d
  0dc8:249e  01360c00         add word ptr [0xc], si                   
  0dc8:24a2  eb59             jmp 0x24fd                               
  0dc8:24a4  83c70c           add di, 0xc                              
  0dc8:24a7  8bd7             mov dx, di                               
  0dc8:24a9  8bce             mov cx, si                               
  0dc8:24ab  2b0e0c00         sub cx, word ptr [0xc]                   
  0dc8:24af  7412             je 0x24c3                                
  0dc8:24b1  16               push ss                                  
  0dc8:24b2  07               pop es                                   
  0dc8:24b3  83ee02           sub si, 2                                
  0dc8:24b6  8b3e1000         mov di, word ptr [0x10]                  
  0dc8:24ba  83ef02           sub di, 2                                
  0dc8:24bd  fd               std                                      
  0dc8:24be  d1e9             shr cx, 1                                
  0dc8:24c0  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:24c2  fc               cld                                      
  0dc8:24c3  01160c00         add word ptr [0xc], dx                   
  0dc8:24c7  eb34             jmp 0x24fd                               
  0dc8:24c9  f6c507           test ch, 7                               
  0dc8:24cc  742f             je 0x24fd                                
  0dc8:24ce  b501             mov ch, 1                                
  0dc8:24d0  e84102           call 0x2714                              -> 0dc8:2714
  0dc8:24d3  eb28             jmp 0x24fd                               
  0dc8:24d5  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:24d9  8b05             mov ax, word ptr [di]                    
  0dc8:24db  8704             xchg word ptr [si], ax                   
  0dc8:24dd  ab               stosw word ptr es:[di], ax               
  0dc8:24de  83c602           add si, 2                                
  0dc8:24e1  e2f6             loop 0x24d9                              
  0dc8:24e3  e9b601           jmp 0x269c                               
  0dc8:24e6  8bfe             mov di, si                               
  0dc8:24e8  8b360c00         mov si, word ptr [0xc]                   
  0dc8:24ec  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:24ee  e9ab01           jmp 0x269c                               
  0dc8:24f1  8bfe             mov di, si                               
  0dc8:24f3  8b360c00         mov si, word ptr [0xc]                   
  0dc8:24f7  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:24f9  89360c00         mov word ptr [0xc], si                   
  0dc8:24fd  e99c01           jmp 0x269c                               
  0dc8:2500  0404             add al, 4                                
  0dc8:2502  0404             add al, 4                                
  0dc8:2504  0404             add al, 4                                
  0dc8:2506  0404             add al, 4                                
  0dc8:2508  0000             add byte ptr [bx + si], al               
  0dc8:250a  0000             add byte ptr [bx + si], al               
  0dc8:250c  0000             add byte ptr [bx + si], al               
  0dc8:250e  0004             add byte ptr [si], al                    
  0dc8:2510  0408             add al, 8                                
  0dc8:2512  06               push es                                  
  0dc8:2513  08060402         or byte ptr [0x204], al                  
  0dc8:2517  000a             add byte ptr [bp + si], cl               
  0dc8:2519  0804             or byte ptr [si], al                     
  0dc8:251b  0404             add al, 4                                
  0dc8:251d  0a04             or al, byte ptr [si]                     
  0dc8:251f  0460             add al, 0x60                             
  0dc8:2521  256525           and ax, 0x2565                           
  0dc8:2524  7225             jb 0x254b                                
  0dc8:2526  7225             jb 0x254d                                
  0dc8:2528  99               cdq                                      
  0dc8:2529  0ad5             or dl, ch                                
  0dc8:252b  0a7225           or dh, byte ptr [bp + si + 0x25]         
  0dc8:252e  7225             jb 0x2555                                
  0dc8:2530  c10dd2           ror word ptr [di], 0xd2                  
  0dc8:2533  0de30d           or ax, 0xde3                             
  0dc8:2536  f4               hlt                                      
  0dc8:2537  0d050e           or ax, 0xe05                             
  0dc8:253a  16               push ss                                  
  0dc8:253b  0e               push cs                                  
  0dc8:253c  27               daa                                      
  0dc8:253d  0e               push cs                                  
  0dc8:253e  7225             jb 0x2565                                
  0dc8:2540  ae               scasb al, byte ptr es:[di]               
  0dc8:2541  19a61a30         sbb word ptr [bp + 0x301a], sp           
  0dc8:2545  17               pop ss                                   
  0dc8:2546  26186a25         sbb byte ptr es:[bp + si + 0x25], ch     
  0dc8:254a  7225             jb 0x2571                                
  0dc8:254c  7225             jb 0x2573                                
  0dc8:254e  7225             jb 0x2575                                
  0dc8:2550  d108             ror word ptr [bx + si], 1                
  0dc8:2552  5d               pop bp                                   
  0dc8:2553  1b05             sbb ax, word ptr [di]                    
  0dc8:2555  087225           or byte ptr [bp + si + 0x25], dh         
  0dc8:2558  37               aaa                                      
  0dc8:2559  1313             adc dx, word ptr [bp + di]               
  0dc8:255b  107225           adc byte ptr [bp + si + 0x25], dh        
  0dc8:255e  7225             jb 0x2585                                
  0dc8:2560  80740a01         xor byte ptr [si + 0xa], 1               
  0dc8:2564  c3               ret                                      
  0dc8:2565  c6440a00         mov byte ptr [si + 0xa], 0               
  0dc8:2569  c3               ret                                      
  0dc8:256a  56               push si                                  
  0dc8:256b  57               push di                                  
  0dc8:256c  e86fea           call 0xfde                               -> 0dc8:0fde
  0dc8:256f  5f               pop di                                   
  0dc8:2570  5e               pop si                                   
  0dc8:2571  c3               ret                                      
  0dc8:2572  b501             mov ch, 1                                
  0dc8:2574  e89d01           call 0x2714                              -> 0dc8:2714
  0dc8:2577  e92201           jmp 0x269c                               
  0dc8:257a  c3               ret                                      
  0dc8:257b  9a25d125ad       lcall 0xad25, 0xd125                     -> ad25:d125
  0dc8:2580  25bc25           and ax, 0x25bc                           
  0dc8:2583  d925             fldenv [di]                              
  0dc8:2585  ec               in al, dx                                
  0dc8:2586  25bb1f           and ax, 0x1fbb                           
  0dc8:2589  0022             add byte ptr [bp + si], ah               
  0dc8:258b  dd               db dd
  0dc8:258c  2e8a870025       mov al, byte ptr cs:[bx + 0x2500]        
  0dc8:2591  98               cwde                                     
  0dc8:2592  97               xchg di, ax                              
  0dc8:2593  d1e3             shl bx, 1                                
  0dc8:2595  2effa57b25       jmp word ptr cs:[di + 0x257b]            
  0dc8:259a  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:259e  83ef0c           sub di, 0xc                              
  0dc8:25a1  2eff972025       call word ptr cs:[bx + 0x2520]           
  0dc8:25a6  893e0c00         mov word ptr [0xc], di                   
  0dc8:25aa  e9ef00           jmp 0x269c                               
  0dc8:25ad  8b360c00         mov si, word ptr [0xc]                   
  0dc8:25b1  8bfe             mov di, si                               
  0dc8:25b3  b89c26           mov ax, 0x269c                           
  0dc8:25b6  50               push ax                                  
  0dc8:25b7  2effa72025       jmp word ptr cs:[bx + 0x2520]            
  0dc8:25bc  8b360c00         mov si, word ptr [0xc]                   
  0dc8:25c0  8bfe             mov di, si                               
  0dc8:25c2  83ef0c           sub di, 0xc                              
  0dc8:25c5  2eff972025       call word ptr cs:[bx + 0x2520]           
  0dc8:25ca  893e0c00         mov word ptr [0xc], di                   
  0dc8:25ce  e9cb00           jmp 0x269c                               
  0dc8:25d1  83060c000c       add word ptr [0xc], 0xc                  
  0dc8:25d6  e9c300           jmp 0x269c                               
  0dc8:25d9  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:25dd  8d750c           lea si, [di + 0xc]                       
  0dc8:25e0  2eff972025       call word ptr cs:[bx + 0x2520]           
  0dc8:25e5  89360c00         mov word ptr [0xc], si                   
  0dc8:25e9  e9b000           jmp 0x269c                               
  0dc8:25ec  8b3e0c00         mov di, word ptr [0xc]                   
  0dc8:25f0  8d750c           lea si, [di + 0xc]                       
  0dc8:25f3  b89c26           mov ax, 0x269c                           
  0dc8:25f6  50               push ax                                  
  0dc8:25f7  2effa72025       jmp word ptr cs:[bx + 0x2520]            
  0dc8:25fc  80e51f           and ch, 0x1f                             
  0dc8:25ff  80fd03           cmp ch, 3                                
  0dc8:2602  7555             jne 0x2659                               
  0dc8:2604  c70638000200     mov word ptr [0x38], 2                   
  0dc8:260a  c7063400656d     mov word ptr [0x34], 0x6d65              
  0dc8:2610  c70636007587     mov word ptr [0x36], 0x8775              
  0dc8:2616  c70604000000     mov word ptr [4], 0                      
  0dc8:261c  8b3e1000         mov di, word ptr [0x10]                  
  0dc8:2620  893e0c00         mov word ptr [0xc], di                   
  0dc8:2624  8b1e0e00         mov bx, word ptr [0xe]                   
  0dc8:2628  2bdf             sub bx, di                               
  0dc8:262a  f7db             neg bx                                   
  0dc8:262c  b80140           mov ax, 0x4001                           
  0dc8:262f  b100             mov cl, 0                                
  0dc8:2631  e809e8           call 0xe3d                               -> 0dc8:0e3d
  0dc8:2634  c64507c0         mov byte ptr [di + 7], 0xc0              
  0dc8:2638  8d750a           lea si, [di + 0xa]                       
  0dc8:263b  83ef02           sub di, 2                                
  0dc8:263e  8b0e0e00         mov cx, word ptr [0xe]                   
  0dc8:2642  2bcf             sub cx, di                               
  0dc8:2644  f7d9             neg cx                                   
  0dc8:2646  d1e9             shr cx, 1                                
  0dc8:2648  fd               std                                      
  0dc8:2649  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0dc8:264b  c70600000041     mov word ptr [0], 0x4100                 
  0dc8:2651  c70602003f03     mov word ptr [2], 0x33f                  
  0dc8:2657  eb11             jmp 0x266a                               
  0dc8:2659  80fd02           cmp ch, 2                                
  0dc8:265c  7507             jne 0x2665                               
  0dc8:265e  c606000000       mov byte ptr [0], 0                      
  0dc8:2663  eb05             jmp 0x266a                               
  0dc8:2665  b501             mov ch, 1                                
  0dc8:2667  e8aa00           call 0x2714                              -> 0dc8:2714
  0dc8:266a  eb30             jmp 0x269c                               
  0dc8:266c  ebf7             jmp 0x2665                               
  0dc8:266e  f6c51f           test ch, 0x1f                            
  0dc8:2671  75f2             jne 0x2665                               
  0dc8:2673  a10c00           mov ax, word ptr [0xc]                   
  0dc8:2676  2b061000         sub ax, word ptr [0x10]                  
  0dc8:267a  b10c             mov cl, 0xc                              
  0dc8:267c  f6f9             idiv cl                                  
  0dc8:267e  2407             and al, 7                                
  0dc8:2680  b103             mov cl, 3                                
  0dc8:2682  d2e0             shl al, cl                               
  0dc8:2684  8b0e0000         mov cx, word ptr [0]                     
  0dc8:2688  80e5c7           and ch, 0xc7                             
  0dc8:268b  0ae8             or ch, al                                
  0dc8:268d  894e10           mov word ptr [bp + 0x10], cx             
  0dc8:2690  eb0a             jmp 0x269c                               
  0dc8:2692  368b360400       mov si, word ptr ss:[4]                  
  0dc8:2697  3601360c00       add word ptr ss:[0xc], si                
  0dc8:269c  36a10e00         mov ax, word ptr ss:[0xe]                
  0dc8:26a0  3639060c00       cmp word ptr ss:[0xc], ax                
  0dc8:26a5  720f             jb 0x26b6                                
  0dc8:26a7  368b263200       mov sp, word ptr ss:[0x32]               
  0dc8:26ac  07               pop es                                   
  0dc8:26ad  5f               pop di                                   
  0dc8:26ae  5e               pop si                                   
  0dc8:26af  5d               pop bp                                   
  0dc8:26b0  1f               pop ds                                   
  0dc8:26b1  5b               pop bx                                   
  0dc8:26b2  5a               pop dx                                   
  0dc8:26b3  59               pop cx                                   
  0dc8:26b4  58               pop ax                                   
  0dc8:26b5  cf               iret                                     
  0dc8:26b6  b540             mov ch, 0x40                             
  0dc8:26b8  8b3e1000         mov di, word ptr [0x10]                  
  0dc8:26bc  893e0c00         mov word ptr [0xc], di                   
  0dc8:26c0  e85100           call 0x2714                              -> 0dc8:2714
  0dc8:26c3  cc               int3                                     
  0dc8:26c4  ebe1             jmp 0x26a7                               
  0dc8:26c6  ed               in ax, dx                                
  0dc8:26c7  1bf1             sbb si, cx                               
  0dc8:26c9  1bf5             sbb si, bp                               
  0dc8:26cb  1bed             sbb bp, bp                               
  0dc8:26cd  1bf1             sbb si, cx                               
  0dc8:26cf  1bf5             sbb si, bp                               
  0dc8:26d1  1bd6             sbb dx, si                               
  0dc8:26d3  1c37             sbb al, 0x37                             
  0dc8:26d5  1d491d           sbb ax, 0x1d49                           
  0dc8:26d8  5b               pop bx                                   
  0dc8:26d9  1da81d           sbb ax, 0x1da8                           
  0dc8:26dc  ad               lodsw ax, word ptr [si]                  
  0dc8:26dd  1db81d           sbb ax, 0x1db8                           
  0dc8:26e0  fb               sti                                      
  0dc8:26e1  fc               cld                                      
  0dc8:26e2  50               push ax                                  
  0dc8:26e3  51               push cx                                  
  0dc8:26e4  52               push dx                                  
  0dc8:26e5  53               push bx                                  
  0dc8:26e6  1e               push ds                                  
  0dc8:26e7  55               push bp                                  
  0dc8:26e8  56               push si                                  
  0dc8:26e9  57               push di                                  
  0dc8:26ea  06               push es                                  
  0dc8:26eb  8bec             mov bp, sp                               
  0dc8:26ed  3689263200       mov word ptr ss:[0x32], sp               
  0dc8:26f2  c57612           lds si, ptr [bp + 0x12]                  
  0dc8:26f5  ac               lodsb al, byte ptr [si]                  
  0dc8:26f6  897612           mov word ptr [bp + 0x12], si             
  0dc8:26f9  8cd7             mov di, ss                               
  0dc8:26fb  8edf             mov ds, di                               
  0dc8:26fd  98               cwde                                     
  0dc8:26fe  93               xchg bx, ax                              
  0dc8:26ff  80fbe6           cmp bl, 0xe6                             
  0dc8:2702  7209             jb 0x270d                                
  0dc8:2704  b89c26           mov ax, 0x269c                           
  0dc8:2707  50               push ax                                  
  0dc8:2708  2effa7e026       jmp word ptr cs:[bx + 0x26e0]            
  0dc8:270d  b501             mov ch, 1                                
  0dc8:270f  e80200           call 0x2714                              -> 0dc8:2714
  0dc8:2712  eb88             jmp 0x269c                               
  0dc8:2714  50               push ax                                  
  0dc8:2715  51               push cx                                  
  0dc8:2716  1e               push ds                                  
  0dc8:2717  16               push ss                                  
  0dc8:2718  1f               pop ds                                   
  0dc8:2719  a00000           mov al, byte ptr [0]                     
  0dc8:271c  8a0e0200         mov cl, byte ptr [2]                     
  0dc8:2720  80e17f           and cl, 0x7f                             
  0dc8:2723  80f17f           xor cl, 0x7f                             
  0dc8:2726  0ac5             or al, ch                                
  0dc8:2728  8ae0             mov ah, al                               
  0dc8:272a  22e1             and ah, cl                               
  0dc8:272c  32e0             xor ah, al                               
  0dc8:272e  f6c408           test ah, 8                               
  0dc8:2731  7402             je 0x2735                                
  0dc8:2733  0c20             or al, 0x20                              
  0dc8:2735  84c1             test cl, al                              
  0dc8:2737  740f             je 0x2748                                
  0dc8:2739  0c80             or al, 0x80                              
  0dc8:273b  a20000           mov byte ptr [0], al                     
  0dc8:273e  22c1             and al, cl                               
  0dc8:2740  3c20             cmp al, 0x20                             
  0dc8:2742  750d             jne 0x2751                               
  0dc8:2744  1f               pop ds                                   
  0dc8:2745  59               pop cx                                   
  0dc8:2746  58               pop ax                                   
  0dc8:2747  c3               ret                                      
  0dc8:2748  247f             and al, 0x7f                             
  0dc8:274a  a20000           mov byte ptr [0], al                     
  0dc8:274d  1f               pop ds                                   
  0dc8:274e  59               pop cx                                   
  0dc8:274f  58               pop ax                                   
  0dc8:2750  c3               ret                                      
  0dc8:2751  9a8a100000       lcall 0, 0x108a                          -> 0000:108a [reloc]
  0dc8:2756  b435             mov ah, 0x35                             
  0dc8:2758  cd21             int 0x21                                 
  0dc8:275a  36891e4000       mov word ptr ss:[0x40], bx               
  0dc8:275f  368c064200       mov word ptr ss:[0x42], es               
  0dc8:2764  368b263200       mov sp, word ptr ss:[0x32]               
  0dc8:2769  07               pop es                                   
  0dc8:276a  5f               pop di                                   
  0dc8:276b  5e               pop si                                   
  0dc8:276c  5d               pop bp                                   
  0dc8:276d  1f               pop ds                                   
  0dc8:276e  5b               pop bx                                   
  0dc8:276f  5a               pop dx                                   
  0dc8:2770  59               pop cx                                   
  0dc8:2771  58               pop ax                                   
  0dc8:2772  36ff2e4000       ljmp ss:[0x40]                           
  0dc8:2777  0000             add byte ptr [bx + si], al               
  0dc8:2779  0000             add byte ptr [bx + si], al               
  0dc8:277b  0000             add byte ptr [bx + si], al               
  0dc8:277d  0000             add byte ptr [bx + si], al               
  0dc8:277f  00               db 00
