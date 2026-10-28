; seg 06f7  img 0x6f70..0x72b0  file off 0x7b70
  06f7:0000  00cd             add ch, cl                               
  06f7:0002  33b80100         xor di, word ptr [bx + si + 1]           
  06f7:0006  cd33             int 0x33                                 
  06f7:0008  cb               retf                                     

proc_06f7_0009:
  06f7:0009  55               push bp                                  
  06f7:000a  8bec             mov bp, sp                               
  06f7:000c  90               nop                                      
  06f7:000d  0e               push cs                                  
  06f7:000e  e8a202           call 0x2b3                               -> 06f7:02b3
  06f7:0011  8916be15         mov word ptr [0x15be], dx                
  06f7:0015  a3bc15           mov word ptr [0x15bc], ax                
  06f7:0018  c41ebc15         les bx, ptr [0x15bc]                     
  06f7:001c  66a1bc15         mov eax, dword ptr [0x15bc]              
  06f7:0020  66268907         mov dword ptr es:[bx], eax               
  06f7:0024  c41ebc15         les bx, ptr [0x15bc]                     
  06f7:0028  66a1bc15         mov eax, dword ptr [0x15bc]              
  06f7:002c  6626894704       mov dword ptr es:[bx + 4], eax           
  06f7:0031  c41ebc15         les bx, ptr [0x15bc]                     
  06f7:0035  26c6470901       mov byte ptr es:[bx + 9], 1              
  06f7:003a  c41ebc15         les bx, ptr [0x15bc]                     
  06f7:003e  8b4606           mov ax, word ptr [bp + 6]                
  06f7:0041  2689470a         mov word ptr es:[bx + 0xa], ax           
  06f7:0045  c41ebc15         les bx, ptr [0x15bc]                     
  06f7:0049  8b4608           mov ax, word ptr [bp + 8]                
  06f7:004c  2689470c         mov word ptr es:[bx + 0xc], ax           
  06f7:0050  5d               pop bp                                   
  06f7:0051  cb               retf                                     
  06f7:0052  66c706bc1500000000 mov dword ptr [0x15bc], 0                
  06f7:005b  cb               retf                                     
  06f7:005c  c80c0000         enter 0xc, 0                             
  06f7:0060  56               push si                                  
  06f7:0061  66833ebc1500     cmp dword ptr [0x15bc], 0                
  06f7:0067  7505             jne 0x6e                                 
  06f7:0069  33c0             xor ax, ax                               
  06f7:006b  e9f500           jmp 0x163                                
  06f7:006e  8b4606           mov ax, word ptr [bp + 6]                
  06f7:0071  c1e803           shr ax, 3                                
  06f7:0074  40               inc ax                                   
  06f7:0075  8bf0             mov si, ax                               
  06f7:0077  66a1bc15         mov eax, dword ptr [0x15bc]              
  06f7:007b  668946f4         mov dword ptr [bp - 0xc], eax            
  06f7:007f  c41ebc15         les bx, ptr [0x15bc]                     
  06f7:0083  66268b07         mov eax, dword ptr es:[bx]               
  06f7:0087  668946fc         mov dword ptr [bp - 4], eax              
  06f7:008b  c45efc           les bx, ptr [bp - 4]                     
  06f7:008e  26807f0900       cmp byte ptr es:[bx + 9], 0              
  06f7:0093  7503             jne 0x98                                 
  06f7:0095  e9a500           jmp 0x13d                                
  06f7:0098  c45efc           les bx, ptr [bp - 4]                     
  06f7:009b  2639770c         cmp word ptr es:[bx + 0xc], si           
  06f7:009f  7303             jae 0xa4                                 
  06f7:00a1  e99900           jmp 0x13d                                
  06f7:00a4  c45efc           les bx, ptr [bp - 4]                     
  06f7:00a7  268b470c         mov ax, word ptr es:[bx + 0xc]           
  06f7:00ab  2bc6             sub ax, si                               
  06f7:00ad  3d0800           cmp ax, 8                                
  06f7:00b0  770a             ja 0xbc                                  
  06f7:00b2  668b46fc         mov eax, dword ptr [bp - 4]              
  06f7:00b6  668946f8         mov dword ptr [bp - 8], eax              
  06f7:00ba  eb67             jmp 0x123                                
  06f7:00bc  90               nop                                      
  06f7:00bd  0e               push cs                                  
  06f7:00be  e8f201           call 0x2b3                               -> 06f7:02b3
  06f7:00c1  8956fa           mov word ptr [bp - 6], dx                
  06f7:00c4  8946f8           mov word ptr [bp - 8], ax                
  06f7:00c7  c45efc           les bx, ptr [bp - 4]                     
  06f7:00ca  26c41f           les bx, ptr es:[bx]                      
  06f7:00cd  8b46fa           mov ax, word ptr [bp - 6]                
  06f7:00d0  8b56f8           mov dx, word ptr [bp - 8]                
  06f7:00d3  26894706         mov word ptr es:[bx + 6], ax             
  06f7:00d7  26895704         mov word ptr es:[bx + 4], dx             
  06f7:00db  c45efc           les bx, ptr [bp - 4]                     
  06f7:00de  66268b07         mov eax, dword ptr es:[bx]               
  06f7:00e2  c45ef8           les bx, ptr [bp - 8]                     
  06f7:00e5  66268907         mov dword ptr es:[bx], eax               
  06f7:00e9  c45ef8           les bx, ptr [bp - 8]                     
  06f7:00ec  668b46fc         mov eax, dword ptr [bp - 4]              
  06f7:00f0  6626894704       mov dword ptr es:[bx + 4], eax           
  06f7:00f5  c45efc           les bx, ptr [bp - 4]                     
  06f7:00f8  668b46f8         mov eax, dword ptr [bp - 8]              
  06f7:00fc  66268907         mov dword ptr es:[bx], eax               
  06f7:0100  c45efc           les bx, ptr [bp - 4]                     
  06f7:0103  2629770c         sub word ptr es:[bx + 0xc], si           
  06f7:0107  c45ef8           les bx, ptr [bp - 8]                     
  06f7:010a  2689770c         mov word ptr es:[bx + 0xc], si           
  06f7:010e  c45efc           les bx, ptr [bp - 4]                     
  06f7:0111  268b470a         mov ax, word ptr es:[bx + 0xa]           
  06f7:0115  c45efc           les bx, ptr [bp - 4]                     
  06f7:0118  2603470c         add ax, word ptr es:[bx + 0xc]           
  06f7:011c  c45ef8           les bx, ptr [bp - 8]                     
  06f7:011f  2689470a         mov word ptr es:[bx + 0xa], ax           
  06f7:0123  c45ef8           les bx, ptr [bp - 8]                     
  06f7:0126  26c6470900       mov byte ptr es:[bx + 9], 0              
  06f7:012b  668b46f4         mov eax, dword ptr [bp - 0xc]            
  06f7:012f  66a3bc15         mov dword ptr [0x15bc], eax              
  06f7:0133  c45ef8           les bx, ptr [bp - 8]                     
  06f7:0136  268b470a         mov ax, word ptr es:[bx + 0xa]           
  06f7:013a  e92eff           jmp 0x6b                                 
  06f7:013d  c45efc           les bx, ptr [bp - 4]                     
  06f7:0140  26807f0900       cmp byte ptr es:[bx + 9], 0              
  06f7:0145  7408             je 0x14f                                 
  06f7:0147  668b46fc         mov eax, dword ptr [bp - 4]              
  06f7:014b  668946f4         mov dword ptr [bp - 0xc], eax            
  06f7:014f  668b46fc         mov eax, dword ptr [bp - 4]              
  06f7:0153  663b06bc15       cmp eax, dword ptr [0x15bc]              
  06f7:0158  7503             jne 0x15d                                
  06f7:015a  e90cff           jmp 0x69                                 
  06f7:015d  c45efc           les bx, ptr [bp - 4]                     
  06f7:0160  e920ff           jmp 0x83                                 
  06f7:0163  5e               pop si                                   
  06f7:0164  c9               leave                                    
  06f7:0165  cb               retf                                     
  06f7:0166  c8080000         enter 8, 0                               
  06f7:016a  66833ebc1500     cmp dword ptr [0x15bc], 0                
  06f7:0170  7505             jne 0x177                                
  06f7:0172  33c0             xor ax, ax                               
  06f7:0174  e93a01           jmp 0x2b1                                
  06f7:0177  c41ebc15         les bx, ptr [0x15bc]                     
  06f7:017b  66268b07         mov eax, dword ptr es:[bx]               
  06f7:017f  668946fc         mov dword ptr [bp - 4], eax              
  06f7:0183  c45efc           les bx, ptr [bp - 4]                     
  06f7:0186  268a4709         mov al, byte ptr es:[bx + 9]             
  06f7:018a  98               cwde                                     
  06f7:018b  0bc0             or ax, ax                                
  06f7:018d  7403             je 0x192                                 
  06f7:018f  e90201           jmp 0x294                                
  06f7:0192  c45efc           les bx, ptr [bp - 4]                     
  06f7:0195  268b470a         mov ax, word ptr es:[bx + 0xa]           
  06f7:0199  3b4606           cmp ax, word ptr [bp + 6]                
  06f7:019c  7403             je 0x1a1                                 
  06f7:019e  e9f300           jmp 0x294                                
  06f7:01a1  c45efc           les bx, ptr [bp - 4]                     
  06f7:01a4  26c45f04         les bx, ptr es:[bx + 4]                  
  06f7:01a8  26807f0900       cmp byte ptr es:[bx + 9], 0              
  06f7:01ad  7466             je 0x215                                 
  06f7:01af  c45efc           les bx, ptr [bp - 4]                     
  06f7:01b2  268b470a         mov ax, word ptr es:[bx + 0xa]           
  06f7:01b6  c45efc           les bx, ptr [bp - 4]                     
  06f7:01b9  26c45f04         les bx, ptr es:[bx + 4]                  
  06f7:01bd  263b470a         cmp ax, word ptr es:[bx + 0xa]           
  06f7:01c1  7652             jbe 0x215                                
  06f7:01c3  c45efc           les bx, ptr [bp - 4]                     
  06f7:01c6  66268b4704       mov eax, dword ptr es:[bx + 4]           
  06f7:01cb  668946f8         mov dword ptr [bp - 8], eax              
  06f7:01cf  c45efc           les bx, ptr [bp - 4]                     
  06f7:01d2  268b470c         mov ax, word ptr es:[bx + 0xc]           
  06f7:01d6  c45ef8           les bx, ptr [bp - 8]                     
  06f7:01d9  2601470c         add word ptr es:[bx + 0xc], ax           
  06f7:01dd  c45efc           les bx, ptr [bp - 4]                     
  06f7:01e0  66268b07         mov eax, dword ptr es:[bx]               
  06f7:01e4  c45ef8           les bx, ptr [bp - 8]                     
  06f7:01e7  66268907         mov dword ptr es:[bx], eax               
  06f7:01eb  c45efc           les bx, ptr [bp - 4]                     
  06f7:01ee  26c41f           les bx, ptr es:[bx]                      
  06f7:01f1  8b46fa           mov ax, word ptr [bp - 6]                
  06f7:01f4  8b56f8           mov dx, word ptr [bp - 8]                
  06f7:01f7  26894706         mov word ptr es:[bx + 6], ax             
  06f7:01fb  26895704         mov word ptr es:[bx + 4], dx             
  06f7:01ff  ff76fe           push word ptr [bp - 2]                   
  06f7:0202  ff76fc           push word ptr [bp - 4]                   
  06f7:0205  90               nop                                      
  06f7:0206  0e               push cs                                  
  06f7:0207  e82d01           call 0x337                               -> 06f7:0337
  06f7:020a  83c404           add sp, 4                                
  06f7:020d  668b46f8         mov eax, dword ptr [bp - 8]              
  06f7:0211  668946fc         mov dword ptr [bp - 4], eax              
  06f7:0215  c45efc           les bx, ptr [bp - 4]                     
  06f7:0218  26c41f           les bx, ptr es:[bx]                      
  06f7:021b  26807f0900       cmp byte ptr es:[bx + 9], 0              
  06f7:0220  745c             je 0x27e                                 
  06f7:0222  c45efc           les bx, ptr [bp - 4]                     
  06f7:0225  268b470a         mov ax, word ptr es:[bx + 0xa]           
  06f7:0229  c45efc           les bx, ptr [bp - 4]                     
  06f7:022c  26c41f           les bx, ptr es:[bx]                      
  06f7:022f  263b470a         cmp ax, word ptr es:[bx + 0xa]           
  06f7:0233  7349             jae 0x27e                                
  06f7:0235  c45efc           les bx, ptr [bp - 4]                     
  06f7:0238  66268b07         mov eax, dword ptr es:[bx]               
  06f7:023c  668946f8         mov dword ptr [bp - 8], eax              
  06f7:0240  c45ef8           les bx, ptr [bp - 8]                     
  06f7:0243  268b470c         mov ax, word ptr es:[bx + 0xc]           
  06f7:0247  c45efc           les bx, ptr [bp - 4]                     
  06f7:024a  2601470c         add word ptr es:[bx + 0xc], ax           
  06f7:024e  c45ef8           les bx, ptr [bp - 8]                     
  06f7:0251  66268b07         mov eax, dword ptr es:[bx]               
  06f7:0255  c45efc           les bx, ptr [bp - 4]                     
  06f7:0258  66268907         mov dword ptr es:[bx], eax               
  06f7:025c  c45ef8           les bx, ptr [bp - 8]                     
  06f7:025f  26c41f           les bx, ptr es:[bx]                      
  06f7:0262  8b46fe           mov ax, word ptr [bp - 2]                
  06f7:0265  8b56fc           mov dx, word ptr [bp - 4]                
  06f7:0268  26894706         mov word ptr es:[bx + 6], ax             
  06f7:026c  26895704         mov word ptr es:[bx + 4], dx             
  06f7:0270  ff76fa           push word ptr [bp - 6]                   
  06f7:0273  ff76f8           push word ptr [bp - 8]                   
  06f7:0276  90               nop                                      
  06f7:0277  0e               push cs                                  
  06f7:0278  e8bc00           call 0x337                               -> 06f7:0337
  06f7:027b  83c404           add sp, 4                                
  06f7:027e  c45efc           les bx, ptr [bp - 4]                     
  06f7:0281  26c6470901       mov byte ptr es:[bx + 9], 1              
  06f7:0286  668b46fc         mov eax, dword ptr [bp - 4]              
  06f7:028a  66a3bc15         mov dword ptr [0x15bc], eax              
  06f7:028e  b80100           mov ax, 1                                
  06f7:0291  e9e0fe           jmp 0x174                                
  06f7:0294  668b46fc         mov eax, dword ptr [bp - 4]              
  06f7:0298  663b06bc15       cmp eax, dword ptr [0x15bc]              
  06f7:029d  750c             jne 0x2ab                                
  06f7:029f  1e               push ds                                  
  06f7:02a0  68f806           push 0x6f8                                ; "palloc: no hdr"
  06f7:02a3  9a9900c30b       lcall 0xbc3, 0x99                        -> 0bc3:0099 [reloc]
  06f7:02a8  83c404           add sp, 4                                
  06f7:02ab  c45efc           les bx, ptr [bp - 4]                     
  06f7:02ae  e9cafe           jmp 0x17b                                
  06f7:02b1  c9               leave                                    
  06f7:02b2  cb               retf                                     
  06f7:02b3  c8080000         enter 8, 0                               
  06f7:02b7  a1f606           mov ax, word ptr [0x6f6]                 
  06f7:02ba  8b16f406         mov dx, word ptr [0x6f4]                 
  06f7:02be  83c2f2           add dx, -0xe                             
  06f7:02c1  8946fa           mov word ptr [bp - 6], ax                
  06f7:02c4  8956f8           mov word ptr [bp - 8], dx                
  06f7:02c7  817ef8a414       cmp word ptr [bp - 8], 0x14a4            
  06f7:02cc  7308             jae 0x2d6                                
  06f7:02ce  8c5efa           mov word ptr [bp - 6], ds                
  06f7:02d1  c746f8ae15       mov word ptr [bp - 8], 0x15ae            
  06f7:02d6  66a1f406         mov eax, dword ptr [0x6f4]               
  06f7:02da  668946fc         mov dword ptr [bp - 4], eax              
  06f7:02de  817efcae15       cmp word ptr [bp - 4], 0x15ae            
  06f7:02e3  7608             jbe 0x2ed                                
  06f7:02e5  8c5efe           mov word ptr [bp - 2], ds                
  06f7:02e8  c746fca414       mov word ptr [bp - 4], 0x14a4            
  06f7:02ed  c45efc           les bx, ptr [bp - 4]                     
  06f7:02f0  268a4708         mov al, byte ptr es:[bx + 8]             
  06f7:02f4  98               cwde                                     
  06f7:02f5  0bc0             or ax, ax                                
  06f7:02f7  7520             jne 0x319                                
  06f7:02f9  c45efc           les bx, ptr [bp - 4]                     
  06f7:02fc  26c6470801       mov byte ptr es:[bx + 8], 1              
  06f7:0301  8b46fe           mov ax, word ptr [bp - 2]                
  06f7:0304  8b56fc           mov dx, word ptr [bp - 4]                
  06f7:0307  83c20e           add dx, 0xe                              
  06f7:030a  a3f606           mov word ptr [0x6f6], ax                 
  06f7:030d  8916f406         mov word ptr [0x6f4], dx                 
  06f7:0311  8b56fe           mov dx, word ptr [bp - 2]                
  06f7:0314  8b46fc           mov ax, word ptr [bp - 4]                
  06f7:0317  eb1c             jmp 0x335                                
  06f7:0319  668b46fc         mov eax, dword ptr [bp - 4]              
  06f7:031d  663b46f8         cmp eax, dword ptr [bp - 8]              
  06f7:0321  750c             jne 0x32f                                
  06f7:0323  1e               push ds                                  
  06f7:0324  680707           push 0x707                                ; "palloc: out of hdrs"
  06f7:0327  9a9900c30b       lcall 0xbc3, 0x99                        -> 0bc3:0099 [reloc]
  06f7:032c  83c404           add sp, 4                                
  06f7:032f  8346fc0e         add word ptr [bp - 4], 0xe               
  06f7:0333  eba9             jmp 0x2de                                
  06f7:0335  c9               leave                                    
  06f7:0336  cb               retf                                     

proc_06f7_0337:
  06f7:0337  55               push bp                                  
  06f7:0338  8bec             mov bp, sp                               
  06f7:033a  c45e06           les bx, ptr [bp + 6]                     
  06f7:033d  26               db 26
  06f7:033e  c6               db c6
  06f7:033f  47               inc di                                   
