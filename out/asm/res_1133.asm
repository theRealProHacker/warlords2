; res_1133 file_off 0x13330
  000d  55               push bp                                  
  000e  8bec             mov bp, sp                               
  0010  8b4606           mov ax, word ptr [bp + 6]                
  0013  a39a6d           mov word ptr [0x6d9a], ax                
  0016  8b4608           mov ax, word ptr [bp + 8]                
  0019  a3986d           mov word ptr [0x6d98], ax                
  001c  5d               pop bp                                   
  001d  cb               retf                                     
  001e  55               push bp                                  
  001f  8bec             mov bp, sp                               
  0021  8b4606           mov ax, word ptr [bp + 6]                
  0024  01069a6d         add word ptr [0x6d9a], ax                
  0028  8b4608           mov ax, word ptr [bp + 8]                
  002b  0106986d         add word ptr [0x6d98], ax                
  002f  5d               pop bp                                   
  0030  cb               retf                                     
  0031  55               push bp                                  
  0032  8bec             mov bp, sp                               
  0034  56               push si                                  
  0035  57               push di                                  
  0036  8b7606           mov si, word ptr [bp + 6]                
  0039  8b7e08           mov di, word ptr [bp + 8]                
  003c  6a00             push 0                                   
  003e  6a00             push 0                                   
  0040  57               push di                                  
  0041  56               push si                                  
  0042  ff36986d         push word ptr [0x6d98]                   
  0046  ff369a6d         push word ptr [0x6d9a]                   
  004a  90               nop                                      
  004b  0e               push cs                                  
  004c  e84600           call 0x95                                
  004f  83c40c           add sp, 0xc                              
  0052  89369a6d         mov word ptr [0x6d9a], si                
  0056  893e986d         mov word ptr [0x6d98], di                
  005a  5f               pop di                                   
  005b  5e               pop si                                   
  005c  5d               pop bp                                   
  005d  cb               retf                                     
  005e  55               push bp                                  
  005f  8bec             mov bp, sp                               
  0061  56               push si                                  
  0062  57               push di                                  
  0063  8b7606           mov si, word ptr [bp + 6]                
  0066  8b7e08           mov di, word ptr [bp + 8]                
  0069  6a00             push 0                                   
  006b  6a00             push 0                                   
  006d  a1986d           mov ax, word ptr [0x6d98]                
  0070  03c7             add ax, di                               
  0072  50               push ax                                  
  0073  a19a6d           mov ax, word ptr [0x6d9a]                
  0076  03c6             add ax, si                               
  0078  50               push ax                                  
  0079  ff36986d         push word ptr [0x6d98]                   
  007d  ff369a6d         push word ptr [0x6d9a]                   
  0081  90               nop                                      
  0082  0e               push cs                                  
  0083  e80f00           call 0x95                                
  0086  83c40c           add sp, 0xc                              
  0089  01369a6d         add word ptr [0x6d9a], si                
  008d  013e986d         add word ptr [0x6d98], di                
  0091  5f               pop di                                   
  0092  5e               pop si                                   
  0093  5d               pop bp                                   
  0094  cb               retf                                     

res_1133_0095:  ; ENTRY
  0095  55               push bp                                  
  0096  8bec             mov bp, sp                               
  0098  ff7610           push word ptr [bp + 0x10]                
  009b  ff760e           push word ptr [bp + 0xe]                 
  009e  ff760c           push word ptr [bp + 0xc]                 
  00a1  ff760a           push word ptr [bp + 0xa]                 
  00a4  ff7608           push word ptr [bp + 8]                   
  00a7  ff7606           push word ptr [bp + 6]                   
  00aa  1e               push ds                                  
  00ab  682a34           push 0x342a                              
  00ae  90               nop                                      
  00af  0e               push cs                                  
  00b0  e80500           call 0xb8                                
  00b3  83c410           add sp, 0x10                             
  00b6  5d               pop bp                                   
  00b7  cb               retf                                     

res_1133_00b8:  ; ENTRY
  00b8  c8100000         enter 0x10, 0                            
  00bc  56               push si                                  
  00bd  57               push di                                  
  00be  c746f00000       mov word ptr [bp - 0x10], 0              
  00c3  8b460a           mov ax, word ptr [bp + 0xa]              
  00c6  3b460e           cmp ax, word ptr [bp + 0xe]              
  00c9  750b             jne 0xd6                                 
  00cb  8b460c           mov ax, word ptr [bp + 0xc]              
  00ce  3b4610           cmp ax, word ptr [bp + 0x10]             
  00d1  7503             jne 0xd6                                 
  00d3  e92402           jmp 0x2fa                                
  00d6  8b460c           mov ax, word ptr [bp + 0xc]              
  00d9  3b4610           cmp ax, word ptr [bp + 0x10]             
  00dc  7e24             jle 0x102                                
  00de  16               push ss                                  
  00df  8d4610           lea ax, [bp + 0x10]                      
  00e2  50               push ax                                  
  00e3  16               push ss                                  
  00e4  8d460c           lea ax, [bp + 0xc]                       
  00e7  50               push ax                                  
  00e8  90               nop                                      
  00e9  0e               push cs                                  
  00ea  e89d02           call 0x38a                               
  00ed  83c408           add sp, 8                                
  00f0  16               push ss                                  
  00f1  8d460e           lea ax, [bp + 0xe]                       
  00f4  50               push ax                                  
  00f5  16               push ss                                  
  00f6  8d460a           lea ax, [bp + 0xa]                       
  00f9  50               push ax                                  
  00fa  90               nop                                      
  00fb  0e               push cs                                  
  00fc  e88b02           call 0x38a                               
  00ff  83c408           add sp, 8                                
  0102  8b460a           mov ax, word ptr [bp + 0xa]              
  0105  3b460e           cmp ax, word ptr [bp + 0xe]              
  0108  7e24             jle 0x12e                                
  010a  16               push ss                                  
  010b  8d460e           lea ax, [bp + 0xe]                       
  010e  50               push ax                                  
  010f  16               push ss                                  
  0110  8d460a           lea ax, [bp + 0xa]                       
  0113  50               push ax                                  
  0114  90               nop                                      
  0115  0e               push cs                                  
  0116  e87102           call 0x38a                               
  0119  83c408           add sp, 8                                
  011c  16               push ss                                  
  011d  8d4610           lea ax, [bp + 0x10]                      
  0120  50               push ax                                  
  0121  16               push ss                                  
  0122  8d460c           lea ax, [bp + 0xc]                       
  0125  50               push ax                                  
  0126  90               nop                                      
  0127  0e               push cs                                  
  0128  e85f02           call 0x38a                               
  012b  83c408           add sp, 8                                
  012e  8cd8             mov ax, ds                               
  0130  394608           cmp word ptr [bp + 8], ax                
  0133  750c             jne 0x141                                
  0135  817e062a34       cmp word ptr [bp + 6], 0x342a            
  013a  7505             jne 0x141                                
  013c  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0141  8b460e           mov ax, word ptr [bp + 0xe]              
  0144  2b460a           sub ax, word ptr [bp + 0xa]              
  0147  8bd0             mov dx, ax                               
  0149  8b4610           mov ax, word ptr [bp + 0x10]             
  014c  2b460c           sub ax, word ptr [bp + 0xc]              
  014f  8bd8             mov bx, ax                               
  0151  0bd2             or dx, dx                                
  0153  7e05             jle 0x15a                                
  0155  b80100           mov ax, 1                                
  0158  eb0b             jmp 0x165                                
  015a  0bd2             or dx, dx                                
  015c  7504             jne 0x162                                
  015e  33c0             xor ax, ax                               
  0160  eb03             jmp 0x165                                
  0162  b8ffff           mov ax, 0xffff                           
  0165  8946f8           mov word ptr [bp - 8], ax                
  0168  0bdb             or bx, bx                                
  016a  7e05             jle 0x171                                
  016c  b80100           mov ax, 1                                
  016f  eb0b             jmp 0x17c                                
  0171  0bdb             or bx, bx                                
  0173  7504             jne 0x179                                
  0175  33c0             xor ax, ax                               
  0177  eb03             jmp 0x17c                                
  0179  b8ffff           mov ax, 0xffff                           
  017c  8946f6           mov word ptr [bp - 0xa], ax              
  017f  8bc2             mov ax, dx                               
  0181  99               cdq                                      
  0182  33c2             xor ax, dx                               
  0184  2bc2             sub ax, dx                               
  0186  8946fe           mov word ptr [bp - 2], ax                
  0189  8bc3             mov ax, bx                               
  018b  99               cdq                                      
  018c  33c2             xor ax, dx                               
  018e  2bc2             sub ax, dx                               
  0190  8946fc           mov word ptr [bp - 4], ax                
  0193  33c0             xor ax, ax                               
  0195  8946f2           mov word ptr [bp - 0xe], ax              
  0198  8946f4           mov word ptr [bp - 0xc], ax              
  019b  8b760a           mov si, word ptr [bp + 0xa]              
  019e  8b7e0c           mov di, word ptr [bp + 0xc]              
  01a1  8b46fe           mov ax, word ptr [bp - 2]                
  01a4  3b46fc           cmp ax, word ptr [bp - 4]                
  01a7  7d03             jge 0x1ac                                
  01a9  e99f00           jmp 0x24b                                
  01ac  c746fa0000       mov word ptr [bp - 6], 0                 
  01b1  e98900           jmp 0x23d                                
  01b4  8b46fc           mov ax, word ptr [bp - 4]                
  01b7  0146f2           add word ptr [bp - 0xe], ax              
  01ba  8b46f2           mov ax, word ptr [bp - 0xe]              
  01bd  3b46fe           cmp ax, word ptr [bp - 2]                
  01c0  7c09             jl 0x1cb                                 
  01c2  8b46fe           mov ax, word ptr [bp - 2]                
  01c5  2946f2           sub word ptr [bp - 0xe], ax              
  01c8  037ef6           add di, word ptr [bp - 0xa]              
  01cb  c41e4970         les bx, ptr [0x7049]                     
  01cf  26837f5dff       cmp word ptr es:[bx + 0x5d], -1          
  01d4  7528             jne 0x1fe                                
  01d6  66837e1200       cmp dword ptr [bp + 0x12], 0             
  01db  741f             je 0x1fc                                 
  01dd  8b46f0           mov ax, word ptr [bp - 0x10]             
  01e0  ff46f0           inc word ptr [bp - 0x10]                 
  01e3  c45e12           les bx, ptr [bp + 0x12]                  
  01e6  03d8             add bx, ax                               
  01e8  268a07           mov al, byte ptr es:[bx]                 
  01eb  98               cwde                                     
  01ec  50               push ax                                  
  01ed  57               push di                                  
  01ee  56               push si                                  
  01ef  ff7608           push word ptr [bp + 8]                   
  01f2  ff7606           push word ptr [bp + 6]                   
  01f5  ff1ed069         lcall [0x69d0]                           
  01f9  83c40a           add sp, 0xa                              
  01fc  eb39             jmp 0x237                                
  01fe  66837e1200       cmp dword ptr [bp + 0x12], 0             
  0203  741b             je 0x220                                 
  0205  57               push di                                  
  0206  56               push si                                  
  0207  ff7608           push word ptr [bp + 8]                   
  020a  ff7606           push word ptr [bp + 6]                   
  020d  ff1ecc69         lcall [0x69cc]                           
  0211  83c408           add sp, 8                                
  0214  c45e12           les bx, ptr [bp + 0x12]                  
  0217  035ef0           add bx, word ptr [bp - 0x10]             
  021a  268807           mov byte ptr es:[bx], al                 
  021d  ff46f0           inc word ptr [bp - 0x10]                 
  0220  c41e4970         les bx, ptr [0x7049]                     
  0224  26ff775d         push word ptr es:[bx + 0x5d]             
  0228  57               push di                                  
  0229  56               push si                                  
  022a  ff7608           push word ptr [bp + 8]                   
  022d  ff7606           push word ptr [bp + 6]                   
  0230  ff1ed069         lcall [0x69d0]                           
  0234  83c40a           add sp, 0xa                              
  0237  0376f8           add si, word ptr [bp - 8]                
  023a  ff46fa           inc word ptr [bp - 6]                    
  023d  8b46fa           mov ax, word ptr [bp - 6]                
  0240  3b46fe           cmp ax, word ptr [bp - 2]                
  0243  7f03             jg 0x248                                 
  0245  e96cff           jmp 0x1b4                                
  0248  e99c00           jmp 0x2e7                                
  024b  c746fa0000       mov word ptr [bp - 6], 0                 
  0250  e98900           jmp 0x2dc                                
  0253  8b46fe           mov ax, word ptr [bp - 2]                
  0256  0146f4           add word ptr [bp - 0xc], ax              
  0259  8b46f4           mov ax, word ptr [bp - 0xc]              
  025c  3b46fc           cmp ax, word ptr [bp - 4]                
  025f  7c09             jl 0x26a                                 
  0261  8b46fc           mov ax, word ptr [bp - 4]                
  0264  2946f4           sub word ptr [bp - 0xc], ax              
  0267  0376f8           add si, word ptr [bp - 8]                
  026a  c41e4970         les bx, ptr [0x7049]                     
  026e  26837f5dff       cmp word ptr es:[bx + 0x5d], -1          
  0273  7528             jne 0x29d                                
  0275  66837e1200       cmp dword ptr [bp + 0x12], 0             
  027a  741f             je 0x29b                                 
  027c  8b46f0           mov ax, word ptr [bp - 0x10]             
  027f  ff46f0           inc word ptr [bp - 0x10]                 
  0282  c45e12           les bx, ptr [bp + 0x12]                  
  0285  03d8             add bx, ax                               
  0287  268a07           mov al, byte ptr es:[bx]                 
  028a  98               cwde                                     
  028b  50               push ax                                  
  028c  57               push di                                  
  028d  56               push si                                  
  028e  ff7608           push word ptr [bp + 8]                   
  0291  ff7606           push word ptr [bp + 6]                   
  0294  ff1ed069         lcall [0x69d0]                           
  0298  83c40a           add sp, 0xa                              
  029b  eb39             jmp 0x2d6                                
  029d  66837e1200       cmp dword ptr [bp + 0x12], 0             
  02a2  741b             je 0x2bf                                 
  02a4  57               push di                                  
  02a5  56               push si                                  
  02a6  ff7608           push word ptr [bp + 8]                   
  02a9  ff7606           push word ptr [bp + 6]                   
  02ac  ff1ecc69         lcall [0x69cc]                           
  02b0  83c408           add sp, 8                                
  02b3  c45e12           les bx, ptr [bp + 0x12]                  
  02b6  035ef0           add bx, word ptr [bp - 0x10]             
  02b9  268807           mov byte ptr es:[bx], al                 
  02bc  ff46f0           inc word ptr [bp - 0x10]                 
  02bf  c41e4970         les bx, ptr [0x7049]                     
  02c3  26ff775d         push word ptr es:[bx + 0x5d]             
  02c7  57               push di                                  
  02c8  56               push si                                  
  02c9  ff7608           push word ptr [bp + 8]                   
  02cc  ff7606           push word ptr [bp + 6]                   
  02cf  ff1ed069         lcall [0x69d0]                           
  02d3  83c40a           add sp, 0xa                              
  02d6  037ef6           add di, word ptr [bp - 0xa]              
  02d9  ff46fa           inc word ptr [bp - 6]                    
  02dc  8b46fa           mov ax, word ptr [bp - 6]                
  02df  3b46fc           cmp ax, word ptr [bp - 4]                
  02e2  7f03             jg 0x2e7                                 
  02e4  e96cff           jmp 0x253                                
  02e7  8cd8             mov ax, ds                               
  02e9  394608           cmp word ptr [bp + 8], ax                
  02ec  750c             jne 0x2fa                                
  02ee  817e062a34       cmp word ptr [bp + 6], 0x342a            
  02f3  7505             jne 0x2fa                                
  02f5  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  02fa  5f               pop di                                   
  02fb  5e               pop si                                   
  02fc  c9               leave                                    
  02fd  cb               retf                                     

res_1133_02fe:  ; ENTRY
  02fe  55               push bp                                  
  02ff  8bec             mov bp, sp                               
  0301  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0306  c41e4970         les bx, ptr [0x7049]                     
  030a  26ff775d         push word ptr es:[bx + 0x5d]             
  030e  ff760a           push word ptr [bp + 0xa]                 
  0311  c41e4970         les bx, ptr [0x7049]                     
  0315  8b4608           mov ax, word ptr [bp + 8]                
  0318  2603470a         add ax, word ptr es:[bx + 0xa]           
  031c  50               push ax                                  
  031d  c41e4970         les bx, ptr [0x7049]                     
  0321  8b4606           mov ax, word ptr [bp + 6]                
  0324  26034708         add ax, word ptr es:[bx + 8]             
  0328  50               push ax                                  
  0329  c41e4970         les bx, ptr [0x7049]                     
  032d  26ff7706         push word ptr es:[bx + 6]                
  0331  26ff7704         push word ptr es:[bx + 4]                
  0335  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  033a  83c40c           add sp, 0xc                              
  033d  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0342  5d               pop bp                                   
  0343  cb               retf                                     

res_1133_0344:  ; ENTRY
  0344  55               push bp                                  
  0345  8bec             mov bp, sp                               
  0347  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  034c  c41e4970         les bx, ptr [0x7049]                     
  0350  26ff775d         push word ptr es:[bx + 0x5d]             
  0354  ff760a           push word ptr [bp + 0xa]                 
  0357  c41e4970         les bx, ptr [0x7049]                     
  035b  8b4608           mov ax, word ptr [bp + 8]                
  035e  2603470a         add ax, word ptr es:[bx + 0xa]           
  0362  50               push ax                                  
  0363  c41e4970         les bx, ptr [0x7049]                     
  0367  8b4606           mov ax, word ptr [bp + 6]                
  036a  26034708         add ax, word ptr es:[bx + 8]             
  036e  50               push ax                                  
  036f  c41e4970         les bx, ptr [0x7049]                     
  0373  26ff7706         push word ptr es:[bx + 6]                
  0377  26ff7704         push word ptr es:[bx + 4]                
  037b  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  0380  83c40c           add sp, 0xc                              
  0383  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0388  5d               pop bp                                   
  0389  cb               retf                                     

res_1133_038a:  ; ENTRY
  038a  c8020000         enter 2, 0                               
  038e  c45e06           les bx, ptr [bp + 6]                     
  0391  268b07           mov ax, word ptr es:[bx]                 
  0394  8946fe           mov word ptr [bp - 2], ax                
  0397  c45e0a           les bx, ptr [bp + 0xa]                   
  039a  268b07           mov ax, word ptr es:[bx]                 
  039d  c45e06           les bx, ptr [bp + 6]                     
  03a0  268907           mov word ptr es:[bx], ax                 
  03a3  c45e0a           les bx, ptr [bp + 0xa]                   
  03a6  8b46fe           mov ax, word ptr [bp - 2]                
  03a9  268907           mov word ptr es:[bx], ax                 
  03ac  c9               leave                                    
  03ad  cb               retf                                     
  03ae  55               push bp                                  
