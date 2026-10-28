; res_0ecc file_off 0x10cc0

res_0ecc_0009:  ; ENTRY
  0009  55               push bp                                  
  000a  8bec             mov bp, sp                               
  000c  90               nop                                      
  000d  0e               push cs                                  
  000e  e8a202           call 0x2b3                               
  0011  89169c69         mov word ptr [0x699c], dx                
  0015  a39a69           mov word ptr [0x699a], ax                
  0018  c41e9a69         les bx, ptr [0x699a]                     
  001c  66a19a69         mov eax, dword ptr [0x699a]              
  0020  66268907         mov dword ptr es:[bx], eax               
  0024  c41e9a69         les bx, ptr [0x699a]                     
  0028  66a19a69         mov eax, dword ptr [0x699a]              
  002c  6626894704       mov dword ptr es:[bx + 4], eax           
  0031  c41e9a69         les bx, ptr [0x699a]                     
  0035  26c6470901       mov byte ptr es:[bx + 9], 1              
  003a  c41e9a69         les bx, ptr [0x699a]                     
  003e  8b4606           mov ax, word ptr [bp + 6]                
  0041  2689470a         mov word ptr es:[bx + 0xa], ax           
  0045  c41e9a69         les bx, ptr [0x699a]                     
  0049  8b4608           mov ax, word ptr [bp + 8]                
  004c  2689470c         mov word ptr es:[bx + 0xc], ax           
  0050  5d               pop bp                                   
  0051  cb               retf                                     
  0052  66c7069a69000000 mov dword ptr [0x699a], 0                
  005b  cb               retf                                     

res_0ecc_005c:  ; ENTRY
  005c  c80c0000         enter 0xc, 0                             
  0060  56               push si                                  
  0061  66833e9a6900     cmp dword ptr [0x699a], 0                
  0067  7505             jne 0x6e                                 
  0069  33c0             xor ax, ax                               
  006b  e9f500           jmp 0x163                                
  006e  8b4606           mov ax, word ptr [bp + 6]                
  0071  c1e803           shr ax, 3                                
  0074  40               inc ax                                   
  0075  8bf0             mov si, ax                               
  0077  66a19a69         mov eax, dword ptr [0x699a]              
  007b  668946f4         mov dword ptr [bp - 0xc], eax            
  007f  c41e9a69         les bx, ptr [0x699a]                     
  0083  66268b07         mov eax, dword ptr es:[bx]               
  0087  668946fc         mov dword ptr [bp - 4], eax              
  008b  c45efc           les bx, ptr [bp - 4]                     
  008e  26807f0900       cmp byte ptr es:[bx + 9], 0              
  0093  7503             jne 0x98                                 
  0095  e9a500           jmp 0x13d                                
  0098  c45efc           les bx, ptr [bp - 4]                     
  009b  2639770c         cmp word ptr es:[bx + 0xc], si           
  009f  7303             jae 0xa4                                 
  00a1  e99900           jmp 0x13d                                
  00a4  c45efc           les bx, ptr [bp - 4]                     
  00a7  268b470c         mov ax, word ptr es:[bx + 0xc]           
  00ab  2bc6             sub ax, si                               
  00ad  3d0800           cmp ax, 8                                
  00b0  770a             ja 0xbc                                  
  00b2  668b46fc         mov eax, dword ptr [bp - 4]              
  00b6  668946f8         mov dword ptr [bp - 8], eax              
  00ba  eb67             jmp 0x123                                
  00bc  90               nop                                      
  00bd  0e               push cs                                  
  00be  e8f201           call 0x2b3                               
  00c1  8956fa           mov word ptr [bp - 6], dx                
  00c4  8946f8           mov word ptr [bp - 8], ax                
  00c7  c45efc           les bx, ptr [bp - 4]                     
  00ca  26c41f           les bx, ptr es:[bx]                      
  00cd  8b46fa           mov ax, word ptr [bp - 6]                
  00d0  8b56f8           mov dx, word ptr [bp - 8]                
  00d3  26894706         mov word ptr es:[bx + 6], ax             
  00d7  26895704         mov word ptr es:[bx + 4], dx             
  00db  c45efc           les bx, ptr [bp - 4]                     
  00de  66268b07         mov eax, dword ptr es:[bx]               
  00e2  c45ef8           les bx, ptr [bp - 8]                     
  00e5  66268907         mov dword ptr es:[bx], eax               
  00e9  c45ef8           les bx, ptr [bp - 8]                     
  00ec  668b46fc         mov eax, dword ptr [bp - 4]              
  00f0  6626894704       mov dword ptr es:[bx + 4], eax           
  00f5  c45efc           les bx, ptr [bp - 4]                     
  00f8  668b46f8         mov eax, dword ptr [bp - 8]              
  00fc  66268907         mov dword ptr es:[bx], eax               
  0100  c45efc           les bx, ptr [bp - 4]                     
  0103  2629770c         sub word ptr es:[bx + 0xc], si           
  0107  c45ef8           les bx, ptr [bp - 8]                     
  010a  2689770c         mov word ptr es:[bx + 0xc], si           
  010e  c45efc           les bx, ptr [bp - 4]                     
  0111  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0115  c45efc           les bx, ptr [bp - 4]                     
  0118  2603470c         add ax, word ptr es:[bx + 0xc]           
  011c  c45ef8           les bx, ptr [bp - 8]                     
  011f  2689470a         mov word ptr es:[bx + 0xa], ax           
  0123  c45ef8           les bx, ptr [bp - 8]                     
  0126  26c6470900       mov byte ptr es:[bx + 9], 0              
  012b  668b46f4         mov eax, dword ptr [bp - 0xc]            
  012f  66a39a69         mov dword ptr [0x699a], eax              
  0133  c45ef8           les bx, ptr [bp - 8]                     
  0136  268b470a         mov ax, word ptr es:[bx + 0xa]           
  013a  e92eff           jmp 0x6b                                 
  013d  c45efc           les bx, ptr [bp - 4]                     
  0140  26807f0900       cmp byte ptr es:[bx + 9], 0              
  0145  7408             je 0x14f                                 
  0147  668b46fc         mov eax, dword ptr [bp - 4]              
  014b  668946f4         mov dword ptr [bp - 0xc], eax            
  014f  668b46fc         mov eax, dword ptr [bp - 4]              
  0153  663b069a69       cmp eax, dword ptr [0x699a]              
  0158  7503             jne 0x15d                                
  015a  e90cff           jmp 0x69                                 
  015d  c45efc           les bx, ptr [bp - 4]                     
  0160  e920ff           jmp 0x83                                 
  0163  5e               pop si                                   
  0164  c9               leave                                    
  0165  cb               retf                                     

res_0ecc_0166:  ; ENTRY
  0166  c8080000         enter 8, 0                               
  016a  66833e9a6900     cmp dword ptr [0x699a], 0                
  0170  7505             jne 0x177                                
  0172  33c0             xor ax, ax                               
  0174  e93a01           jmp 0x2b1                                
  0177  c41e9a69         les bx, ptr [0x699a]                     
  017b  66268b07         mov eax, dword ptr es:[bx]               
  017f  668946fc         mov dword ptr [bp - 4], eax              
  0183  c45efc           les bx, ptr [bp - 4]                     
  0186  268a4709         mov al, byte ptr es:[bx + 9]             
  018a  98               cwde                                     
  018b  0bc0             or ax, ax                                
  018d  7403             je 0x192                                 
  018f  e90201           jmp 0x294                                
  0192  c45efc           les bx, ptr [bp - 4]                     
  0195  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0199  3b4606           cmp ax, word ptr [bp + 6]                
  019c  7403             je 0x1a1                                 
  019e  e9f300           jmp 0x294                                
  01a1  c45efc           les bx, ptr [bp - 4]                     
  01a4  26c45f04         les bx, ptr es:[bx + 4]                  
  01a8  26807f0900       cmp byte ptr es:[bx + 9], 0              
  01ad  7466             je 0x215                                 
  01af  c45efc           les bx, ptr [bp - 4]                     
  01b2  268b470a         mov ax, word ptr es:[bx + 0xa]           
  01b6  c45efc           les bx, ptr [bp - 4]                     
  01b9  26c45f04         les bx, ptr es:[bx + 4]                  
  01bd  263b470a         cmp ax, word ptr es:[bx + 0xa]           
  01c1  7652             jbe 0x215                                
  01c3  c45efc           les bx, ptr [bp - 4]                     
  01c6  66268b4704       mov eax, dword ptr es:[bx + 4]           
  01cb  668946f8         mov dword ptr [bp - 8], eax              
  01cf  c45efc           les bx, ptr [bp - 4]                     
  01d2  268b470c         mov ax, word ptr es:[bx + 0xc]           
  01d6  c45ef8           les bx, ptr [bp - 8]                     
  01d9  2601470c         add word ptr es:[bx + 0xc], ax           
  01dd  c45efc           les bx, ptr [bp - 4]                     
  01e0  66268b07         mov eax, dword ptr es:[bx]               
  01e4  c45ef8           les bx, ptr [bp - 8]                     
  01e7  66268907         mov dword ptr es:[bx], eax               
  01eb  c45efc           les bx, ptr [bp - 4]                     
  01ee  26c41f           les bx, ptr es:[bx]                      
  01f1  8b46fa           mov ax, word ptr [bp - 6]                
  01f4  8b56f8           mov dx, word ptr [bp - 8]                
  01f7  26894706         mov word ptr es:[bx + 6], ax             
  01fb  26895704         mov word ptr es:[bx + 4], dx             
  01ff  ff76fe           push word ptr [bp - 2]                   
  0202  ff76fc           push word ptr [bp - 4]                   
  0205  90               nop                                      
  0206  0e               push cs                                  
  0207  e82d01           call 0x337                               
  020a  83c404           add sp, 4                                
  020d  668b46f8         mov eax, dword ptr [bp - 8]              
  0211  668946fc         mov dword ptr [bp - 4], eax              
  0215  c45efc           les bx, ptr [bp - 4]                     
  0218  26c41f           les bx, ptr es:[bx]                      
  021b  26807f0900       cmp byte ptr es:[bx + 9], 0              
  0220  745c             je 0x27e                                 
  0222  c45efc           les bx, ptr [bp - 4]                     
  0225  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0229  c45efc           les bx, ptr [bp - 4]                     
  022c  26c41f           les bx, ptr es:[bx]                      
  022f  263b470a         cmp ax, word ptr es:[bx + 0xa]           
  0233  7349             jae 0x27e                                
  0235  c45efc           les bx, ptr [bp - 4]                     
  0238  66268b07         mov eax, dword ptr es:[bx]               
  023c  668946f8         mov dword ptr [bp - 8], eax              
  0240  c45ef8           les bx, ptr [bp - 8]                     
  0243  268b470c         mov ax, word ptr es:[bx + 0xc]           
  0247  c45efc           les bx, ptr [bp - 4]                     
  024a  2601470c         add word ptr es:[bx + 0xc], ax           
  024e  c45ef8           les bx, ptr [bp - 8]                     
  0251  66268b07         mov eax, dword ptr es:[bx]               
  0255  c45efc           les bx, ptr [bp - 4]                     
  0258  66268907         mov dword ptr es:[bx], eax               
  025c  c45ef8           les bx, ptr [bp - 8]                     
  025f  26c41f           les bx, ptr es:[bx]                      
  0262  8b46fe           mov ax, word ptr [bp - 2]                
  0265  8b56fc           mov dx, word ptr [bp - 4]                
  0268  26894706         mov word ptr es:[bx + 6], ax             
  026c  26895704         mov word ptr es:[bx + 4], dx             
  0270  ff76fa           push word ptr [bp - 6]                   
  0273  ff76f8           push word ptr [bp - 8]                   
  0276  90               nop                                      
  0277  0e               push cs                                  
  0278  e8bc00           call 0x337                               
  027b  83c404           add sp, 4                                
  027e  c45efc           les bx, ptr [bp - 4]                     
  0281  26c6470901       mov byte ptr es:[bx + 9], 1              
  0286  668b46fc         mov eax, dword ptr [bp - 4]              
  028a  66a39a69         mov dword ptr [0x699a], eax              
  028e  b80100           mov ax, 1                                
  0291  e9e0fe           jmp 0x174                                
  0294  668b46fc         mov eax, dword ptr [bp - 4]              
  0298  663b069a69       cmp eax, dword ptr [0x699a]              
  029d  750c             jne 0x2ab                                
  029f  1e               push ds                                  
  02a0  68d633           push 0x33d6                              
  02a3  9a99001d15       lcall 0x151d, 0x99                       -> 151d:0099
  02a8  83c404           add sp, 4                                
  02ab  c45efc           les bx, ptr [bp - 4]                     
  02ae  e9cafe           jmp 0x17b                                
  02b1  c9               leave                                    
  02b2  cb               retf                                     

res_0ecc_02b3:  ; ENTRY
  02b3  c8080000         enter 8, 0                               
  02b7  a1d433           mov ax, word ptr [0x33d4]                
  02ba  8b16d233         mov dx, word ptr [0x33d2]                
  02be  83c2f2           add dx, -0xe                             
  02c1  8946fa           mov word ptr [bp - 6], ax                
  02c4  8956f8           mov word ptr [bp - 8], dx                
  02c7  817ef88268       cmp word ptr [bp - 8], 0x6882            
  02cc  7308             jae 0x2d6                                
  02ce  8c5efa           mov word ptr [bp - 6], ds                
  02d1  c746f88c69       mov word ptr [bp - 8], 0x698c            
  02d6  66a1d233         mov eax, dword ptr [0x33d2]              
  02da  668946fc         mov dword ptr [bp - 4], eax              
  02de  817efc8c69       cmp word ptr [bp - 4], 0x698c            
  02e3  7608             jbe 0x2ed                                
  02e5  8c5efe           mov word ptr [bp - 2], ds                
  02e8  c746fc8268       mov word ptr [bp - 4], 0x6882            
  02ed  c45efc           les bx, ptr [bp - 4]                     
  02f0  268a4708         mov al, byte ptr es:[bx + 8]             
  02f4  98               cwde                                     
  02f5  0bc0             or ax, ax                                
  02f7  7520             jne 0x319                                
  02f9  c45efc           les bx, ptr [bp - 4]                     
  02fc  26c6470801       mov byte ptr es:[bx + 8], 1              
  0301  8b46fe           mov ax, word ptr [bp - 2]                
  0304  8b56fc           mov dx, word ptr [bp - 4]                
  0307  83c20e           add dx, 0xe                              
  030a  a3d433           mov word ptr [0x33d4], ax                
  030d  8916d233         mov word ptr [0x33d2], dx                
  0311  8b56fe           mov dx, word ptr [bp - 2]                
  0314  8b46fc           mov ax, word ptr [bp - 4]                
  0317  eb1c             jmp 0x335                                
  0319  668b46fc         mov eax, dword ptr [bp - 4]              
  031d  663b46f8         cmp eax, dword ptr [bp - 8]              
  0321  750c             jne 0x32f                                
  0323  1e               push ds                                  
  0324  68e533           push 0x33e5                               ; "palloc: out of hdrs"
  0327  9a99001d15       lcall 0x151d, 0x99                       -> 151d:0099
  032c  83c404           add sp, 4                                
  032f  8346fc0e         add word ptr [bp - 4], 0xe               
  0333  eba9             jmp 0x2de                                
  0335  c9               leave                                    
  0336  cb               retf                                     

res_0ecc_0337:  ; ENTRY
  0337  55               push bp                                  
  0338  8bec             mov bp, sp                               
  033a  c45e06           les bx, ptr [bp + 6]                     
  033d  26c6470800       mov byte ptr es:[bx + 8], 0              
  0342  668b4606         mov eax, dword ptr [bp + 6]              
  0346  66a3d233         mov dword ptr [0x33d2], eax              
  034a  5d               pop bp                                   
  034b  cb               retf                                     
  034c  c8               db c8                                    
