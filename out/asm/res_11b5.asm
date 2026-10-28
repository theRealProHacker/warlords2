; res_11b5 file_off 0x13b50

res_11b5_0003:  ; ENTRY
  0003  55               push bp                                  
  0004  8bec             mov bp, sp                               
  0006  6a01             push 1                                   
  0008  ff760c           push word ptr [bp + 0xc]                 
  000b  ff760a           push word ptr [bp + 0xa]                 
  000e  66ff7606         push dword ptr [bp + 6]                  
  0012  90               nop                                      
  0013  0e               push cs                                  
  0014  e84e00           call 0x65                                
  0017  83c40a           add sp, 0xa                              
  001a  eb00             jmp 0x1c                                 
  001c  5d               pop bp                                   
  001d  cb               retf                                     
  001e  55               push bp                                  
  001f  8bec             mov bp, sp                               
  0021  6a00             push 0                                   
  0023  ff760c           push word ptr [bp + 0xc]                 
  0026  ff760a           push word ptr [bp + 0xa]                 
  0029  66ff7606         push dword ptr [bp + 6]                  
  002d  90               nop                                      
  002e  0e               push cs                                  
  002f  e83300           call 0x65                                
  0032  83c40a           add sp, 0xa                              
  0035  eb00             jmp 0x37                                 
  0037  5d               pop bp                                   
  0038  cb               retf                                     

res_11b5_0039:  ; ENTRY
  0039  55               push bp                                  
  003a  8bec             mov bp, sp                               
  003c  eb05             jmp 0x43                                 
  003e  9a8a001d15       lcall 0x151d, 0x8a                       -> 151d:008a
  0043  6a01             push 1                                   
  0045  ff760c           push word ptr [bp + 0xc]                 
  0048  ff760a           push word ptr [bp + 0xa]                 
  004b  66ff7606         push dword ptr [bp + 6]                  
  004f  90               nop                                      
  0050  0e               push cs                                  
  0051  e81100           call 0x65                                
  0054  83c40a           add sp, 0xa                              
  0057  0bc0             or ax, ax                                
  0059  74e3             je 0x3e                                  
  005b  8b560c           mov dx, word ptr [bp + 0xc]              
  005e  8b460a           mov ax, word ptr [bp + 0xa]              
  0061  eb00             jmp 0x63                                 
  0063  5d               pop bp                                   
  0064  cb               retf                                     

res_11b5_0065:  ; ENTRY
  0065  c8040000         enter 4, 0                               
  0069  56               push si                                  
  006a  8b760e           mov si, word ptr [bp + 0xe]              
  006d  90               nop                                      
  006e  0e               push cs                                  
  006f  e89800           call 0x10a                               
  0072  66a1a26d         mov eax, dword ptr [0x6da2]              
  0076  eb6d             jmp 0xe5                                 
  0078  c45efc           les bx, ptr [bp - 4]                     
  007b  26c45f08         les bx, ptr es:[bx + 8]                  
  007f  268a0f           mov cl, byte ptr es:[bx]                 
  0082  b80100           mov ax, 1                                
  0085  d3e0             shl ax, cl                               
  0087  660fbfc0         movsx eax, ax                            
  008b  66854606         test dword ptr [bp + 6], eax             
  008f  7436             je 0xc7                                  
  0091  6a10             push 0x10                                
  0093  c45efc           les bx, ptr [bp - 4]                     
  0096  26ff770a         push word ptr es:[bx + 0xa]              
  009a  26ff7708         push word ptr es:[bx + 8]                
  009e  ff760c           push word ptr [bp + 0xc]                 
  00a1  ff760a           push word ptr [bp + 0xa]                 
  00a4  9a45430000       lcall 0, 0x4345                          -> 0000:4345
  00a9  83c40a           add sp, 0xa                              
  00ac  0bf6             or si, si                                
  00ae  7412             je 0xc2                                  
  00b0  ff76fe           push word ptr [bp - 2]                   
  00b3  ff76fc           push word ptr [bp - 4]                   
  00b6  1e               push ds                                  
  00b7  689c6d           push 0x6d9c                              
  00ba  9a64019d12       lcall 0x129d, 0x164                      -> 129d:0164
  00bf  83c408           add sp, 8                                
  00c2  b80100           mov ax, 1                                
  00c5  eb40             jmp 0x107                                
  00c7  0bf6             or si, si                                
  00c9  7412             je 0xdd                                  
  00cb  ff76fe           push word ptr [bp - 2]                   
  00ce  ff76fc           push word ptr [bp - 4]                   
  00d1  1e               push ds                                  
  00d2  689c6d           push 0x6d9c                              
  00d5  9a64019d12       lcall 0x129d, 0x164                      -> 129d:0164
  00da  83c408           add sp, 8                                
  00dd  c45efc           les bx, ptr [bp - 4]                     
  00e0  66268b470c       mov eax, dword ptr es:[bx + 0xc]         
  00e5  668946fc         mov dword ptr [bp - 4], eax              
  00e9  66837efc00       cmp dword ptr [bp - 4], 0                
  00ee  7588             jne 0x78                                 
  00f0  666a00           push 0                                   
  00f3  6a00             push 0                                   
  00f5  ff760c           push word ptr [bp + 0xc]                 
  00f8  ff760a           push word ptr [bp + 0xa]                 
  00fb  90               nop                                      
  00fc  0e               push cs                                  
  00fd  e8f400           call 0x1f4                               
  0100  83c40a           add sp, 0xa                              
  0103  33c0             xor ax, ax                               
  0105  ebbe             jmp 0xc5                                 
  0107  5e               pop si                                   
  0108  c9               leave                                    
  0109  cb               retf                                     

res_11b5_010a:  ; ENTRY
  010a  56               push si                                  
  010b  57               push di                                  
  010c  33f6             xor si, si                               
  010e  9a4409bf12       lcall 0x12bf, 0x944                      -> 12bf:0944
  0113  8bd0             mov dx, ax                               
  0115  f7c20100         test dx, 1                               
  0119  7405             je 0x120                                 
  011b  b80100           mov ax, 1                                
  011e  eb02             jmp 0x122                                
  0120  33c0             xor ax, ax                               
  0122  8bf0             mov si, ax                               
  0124  f7c20200         test dx, 2                               
  0128  7405             je 0x12f                                 
  012a  b80100           mov ax, 1                                
  012d  eb02             jmp 0x131                                
  012f  33c0             xor ax, ax                               
  0131  8bf8             mov di, ax                               
  0133  3b363e35         cmp si, word ptr [0x353e]                
  0137  7418             je 0x151                                 
  0139  666a00           push 0                                   
  013c  0bf6             or si, si                                
  013e  7405             je 0x145                                 
  0140  b80100           mov ax, 1                                
  0143  eb03             jmp 0x148                                
  0145  b80200           mov ax, 2                                
  0148  50               push ax                                  
  0149  90               nop                                      
  014a  0e               push cs                                  
  014b  e85b00           call 0x1a9                               
  014e  83c406           add sp, 6                                
  0151  3b3e4035         cmp di, word ptr [0x3540]                
  0155  7418             je 0x16f                                 
  0157  666a00           push 0                                   
  015a  0bff             or di, di                                
  015c  7405             je 0x163                                 
  015e  b80300           mov ax, 3                                
  0161  eb03             jmp 0x166                                
  0163  b80400           mov ax, 4                                
  0166  50               push ax                                  
  0167  90               nop                                      
  0168  0e               push cs                                  
  0169  e83d00           call 0x1a9                               
  016c  83c406           add sp, 6                                
  016f  89363e35         mov word ptr [0x353e], si                
  0173  893e4035         mov word ptr [0x3540], di                
  0177  9adc380000       lcall 0, 0x38dc                          -> 0000:38dc
  017c  0bc0             or ax, ax                                
  017e  7426             je 0x1a6                                 
  0180  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  0185  8bf0             mov si, ax                               
  0187  0bc0             or ax, ax                                
  0189  750b             jne 0x196                                
  018b  9a08370000       lcall 0, 0x3708                          -> 0000:3708
  0190  8bf0             mov si, ax                               
  0192  81ce0001         or si, 0x100                             
  0196  660fbfc6         movsx eax, si                            
  019a  6650             push eax                                 
  019c  6a07             push 7                                   
  019e  90               nop                                      
  019f  0e               push cs                                  
  01a0  e80600           call 0x1a9                               
  01a3  83c406           add sp, 6                                
  01a6  5f               pop di                                   
  01a7  5e               pop si                                   
  01a8  cb               retf                                     

res_11b5_01a9:  ; ENTRY
  01a9  c8100000         enter 0x10, 0                            
  01ad  8b4606           mov ax, word ptr [bp + 6]                
  01b0  833ea06d1e       cmp word ptr [0x6da0], 0x1e              
  01b5  7e09             jle 0x1c0                                
  01b7  a99e03           test ax, 0x39e                           
  01ba  7404             je 0x1c0                                 
  01bc  33c0             xor ax, ax                               
  01be  eb32             jmp 0x1f2                                
  01c0  66ff7608         push dword ptr [bp + 8]                  
  01c4  50               push ax                                  
  01c5  16               push ss                                  
  01c6  8d46f0           lea ax, [bp - 0x10]                      
  01c9  50               push ax                                  
  01ca  90               nop                                      
  01cb  0e               push cs                                  
  01cc  e82500           call 0x1f4                               
  01cf  83c40a           add sp, 0xa                              
  01d2  6a10             push 0x10                                
  01d4  16               push ss                                  
  01d5  8d46f0           lea ax, [bp - 0x10]                      
  01d8  50               push ax                                  
  01d9  1e               push ds                                  
  01da  689c6d           push 0x6d9c                              
  01dd  9a60009d12       lcall 0x129d, 0x60                       -> 129d:0060
  01e2  83c40a           add sp, 0xa                              
  01e5  0bc2             or ax, dx                                
  01e7  7405             je 0x1ee                                 
  01e9  b80100           mov ax, 1                                
  01ec  eb02             jmp 0x1f0                                
  01ee  33c0             xor ax, ax                               
  01f0  ebcc             jmp 0x1be                                
  01f2  c9               leave                                    
  01f3  cb               retf                                     

res_11b5_01f4:  ; ENTRY
  01f4  55               push bp                                  
  01f5  8bec             mov bp, sp                               
  01f7  56               push si                                  
  01f8  c45e06           les bx, ptr [bp + 6]                     
  01fb  8b460a           mov ax, word ptr [bp + 0xa]              
  01fe  268907           mov word ptr es:[bx], ax                 
  0201  c45e06           les bx, ptr [bp + 6]                     
  0204  668b460c         mov eax, dword ptr [bp + 0xc]            
  0208  6626894702       mov dword ptr es:[bx + 2], eax           
  020d  9af01b0000       lcall 0, 0x1bf0                          -> 0000:1bf0
  0212  52               push dx                                  
  0213  50               push ax                                  
  0214  6658             pop eax                                  
  0216  c45e06           les bx, ptr [bp + 6]                     
  0219  6626894706       mov dword ptr es:[bx + 6], eax           
  021e  8b4606           mov ax, word ptr [bp + 6]                
  0221  050a00           add ax, 0xa                              
  0224  ff7608           push word ptr [bp + 8]                   
  0227  50               push ax                                  
  0228  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  022d  83c404           add sp, 4                                
  0230  9a4409bf12       lcall 0x12bf, 0x944                      -> 12bf:0944
  0235  8bf0             mov si, ax                               
  0237  6a02             push 2                                   
  0239  9a5f2e0000       lcall 0, 0x2e5f                          -> 0000:2e5f
  023e  59               pop cx                                   
  023f  8bd8             mov bx, ax                               
  0241  f7c60100         test si, 1                               
  0245  7405             je 0x24c                                 
  0247  b88000           mov ax, 0x80                             
  024a  eb02             jmp 0x24e                                
  024c  33c0             xor ax, ax                               
  024e  50               push ax                                  
  024f  f7c60200         test si, 2                               
  0253  7405             je 0x25a                                 
  0255  b84000           mov ax, 0x40                             
  0258  eb02             jmp 0x25c                                
  025a  33c0             xor ax, ax                               
  025c  5a               pop dx                                   
  025d  0bd0             or dx, ax                                
  025f  52               push dx                                  
  0260  f7c30300         test bx, 3                               
  0264  7405             je 0x26b                                 
  0266  b80002           mov ax, 0x200                            
  0269  eb02             jmp 0x26d                                
  026b  33c0             xor ax, ax                               
  026d  5a               pop dx                                   
  026e  0bd0             or dx, ax                                
  0270  52               push dx                                  
  0271  f7c30400         test bx, 4                               
  0275  7405             je 0x27c                                 
  0277  b80001           mov ax, 0x100                            
  027a  eb02             jmp 0x27e                                
  027c  33c0             xor ax, ax                               
  027e  5a               pop dx                                   
  027f  0bd0             or dx, ax                                
  0281  52               push dx                                  
  0282  f7c30800         test bx, 8                               
  0286  7405             je 0x28d                                 
  0288  b80008           mov ax, 0x800                            
  028b  eb02             jmp 0x28f                                
  028d  33c0             xor ax, ax                               
  028f  5a               pop dx                                   
  0290  0bd0             or dx, ax                                
  0292  52               push dx                                  
  0293  f7c31000         test bx, 0x10                            
  0297  7405             je 0x29e                                 
  0299  b80010           mov ax, 0x1000                           
  029c  eb02             jmp 0x2a0                                
  029e  33c0             xor ax, ax                               
  02a0  5a               pop dx                                   
  02a1  0bd0             or dx, ax                                
  02a3  52               push dx                                  
  02a4  f7c32000         test bx, 0x20                            
  02a8  7405             je 0x2af                                 
  02aa  b80020           mov ax, 0x2000                           
  02ad  eb02             jmp 0x2b1                                
  02af  33c0             xor ax, ax                               
  02b1  5a               pop dx                                   
  02b2  0bd0             or dx, ax                                
  02b4  52               push dx                                  
  02b5  f7c34000         test bx, 0x40                            
  02b9  7405             je 0x2c0                                 
  02bb  b80004           mov ax, 0x400                            
  02be  eb02             jmp 0x2c2                                
  02c0  33c0             xor ax, ax                               
  02c2  5a               pop dx                                   
  02c3  0bd0             or dx, ax                                
  02c5  c45e06           les bx, ptr [bp + 6]                     
  02c8  2689570e         mov word ptr es:[bx + 0xe], dx           
  02cc  8b5608           mov dx, word ptr [bp + 8]                
  02cf  8b4606           mov ax, word ptr [bp + 6]                
  02d2  eb00             jmp 0x2d4                                
  02d4  5e               pop si                                   
  02d5  5d               pop bp                                   
  02d6  cb               retf                                     
  02d7  cb               retf                                     
