; res_052a file_off 0x72a0

res_052a_0009:  ; ENTRY
  0009  55               push bp                                  
  000a  8bec             mov bp, sp                               
  000c  83ec10           sub sp, 0x10                             
  000f  56               push si                                  
  0010  57               push di                                  
  0011  8b7e0c           mov di, word ptr [bp + 0xc]              
  0014  c746fe0500       mov word ptr [bp - 2], 5                 
  0019  c746fc2800       mov word ptr [bp - 4], 0x28              
  001e  33f6             xor si, si                               
  0020  e94801           jmp 0x16b                                
  0023  56               push si                                  
  0024  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  0029  59               pop cx                                   
  002a  c45e06           les bx, ptr [bp + 6]                     
  002d  26f747350100     test word ptr es:[bx + 0x35], 1          
  0033  7441             je 0x76                                  
  0035  26397f06         cmp word ptr es:[bx + 6], di             
  0039  7f3b             jg 0x76                                  
  003b  26c45f37         les bx, ptr es:[bx + 0x37]               
  003f  8bc6             mov ax, si                               
  0041  c1e002           shl ax, 2                                
  0044  03d8             add bx, ax                               
  0046  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  004a  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  004e  c45e06           les bx, ptr [bp + 6]                     
  0051  52               push dx                                  
  0052  50               push ax                                  
  0053  8bc7             mov ax, di                               
  0055  262b4706         sub ax, word ptr es:[bx + 6]             
  0059  26c45f37         les bx, ptr es:[bx + 0x37]               
  005d  26f76f08         imul word ptr es:[bx + 8]                
  0061  d1e0             shl ax, 1                                
  0063  8bd0             mov dx, ax                               
  0065  58               pop ax                                   
  0066  03c2             add ax, dx                               
  0068  8b560a           mov dx, word ptr [bp + 0xa]              
  006b  8a0e9e69         mov cl, byte ptr [0x699e]                
  006f  d3fa             sar dx, cl                               
  0071  03c2             add ax, dx                               
  0073  5a               pop dx                                   
  0074  eb30             jmp 0xa6                                 
  0076  8bc6             mov ax, si                               
  0078  c1e002           shl ax, 2                                
  007b  c45e06           les bx, ptr [bp + 6]                     
  007e  03d8             add bx, ax                               
  0080  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  0084  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  0088  8b5e06           mov bx, word ptr [bp + 6]                
  008b  52               push dx                                  
  008c  50               push ax                                  
  008d  8bc7             mov ax, di                               
  008f  26f76f08         imul word ptr es:[bx + 8]                
  0093  d1e0             shl ax, 1                                
  0095  8bd0             mov dx, ax                               
  0097  58               pop ax                                   
  0098  03c2             add ax, dx                               
  009a  8b560a           mov dx, word ptr [bp + 0xa]              
  009d  8a0e9e69         mov cl, byte ptr [0x699e]                
  00a1  d3fa             sar dx, cl                               
  00a3  03c2             add ax, dx                               
  00a5  5a               pop dx                                   
  00a6  8956fa           mov word ptr [bp - 6], dx                
  00a9  8946f8           mov word ptr [bp - 8], ax                
  00ac  c45e0e           les bx, ptr [bp + 0xe]                   
  00af  26f747350100     test word ptr es:[bx + 0x35], 1          
  00b5  7445             je 0xfc                                  
  00b7  268b4706         mov ax, word ptr es:[bx + 6]             
  00bb  3b4614           cmp ax, word ptr [bp + 0x14]             
  00be  7f3c             jg 0xfc                                  
  00c0  26c45f37         les bx, ptr es:[bx + 0x37]               
  00c4  8bc6             mov ax, si                               
  00c6  c1e002           shl ax, 2                                
  00c9  03d8             add bx, ax                               
  00cb  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  00cf  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  00d3  c45e0e           les bx, ptr [bp + 0xe]                   
  00d6  52               push dx                                  
  00d7  50               push ax                                  
  00d8  8b4614           mov ax, word ptr [bp + 0x14]             
  00db  262b4706         sub ax, word ptr es:[bx + 6]             
  00df  26c45f37         les bx, ptr es:[bx + 0x37]               
  00e3  26f76f08         imul word ptr es:[bx + 8]                
  00e7  d1e0             shl ax, 1                                
  00e9  8bd0             mov dx, ax                               
  00eb  58               pop ax                                   
  00ec  03c2             add ax, dx                               
  00ee  8b5612           mov dx, word ptr [bp + 0x12]             
  00f1  8a0e9e69         mov cl, byte ptr [0x699e]                
  00f5  d3fa             sar dx, cl                               
  00f7  03c2             add ax, dx                               
  00f9  5a               pop dx                                   
  00fa  eb31             jmp 0x12d                                
  00fc  8bc6             mov ax, si                               
  00fe  c1e002           shl ax, 2                                
  0101  c45e0e           les bx, ptr [bp + 0xe]                   
  0104  03d8             add bx, ax                               
  0106  268b571c         mov dx, word ptr es:[bx + 0x1c]          
  010a  268b471a         mov ax, word ptr es:[bx + 0x1a]          
  010e  8b5e0e           mov bx, word ptr [bp + 0xe]              
  0111  52               push dx                                  
  0112  50               push ax                                  
  0113  8b4614           mov ax, word ptr [bp + 0x14]             
  0116  26f76f08         imul word ptr es:[bx + 8]                
  011a  d1e0             shl ax, 1                                
  011c  8bd0             mov dx, ax                               
  011e  58               pop ax                                   
  011f  03c2             add ax, dx                               
  0121  8b5612           mov dx, word ptr [bp + 0x12]             
  0124  8a0e9e69         mov cl, byte ptr [0x699e]                
  0128  d3fa             sar dx, cl                               
  012a  03c2             add ax, dx                               
  012c  5a               pop dx                                   
  012d  8956f6           mov word ptr [bp - 0xa], dx              
  0130  8946f4           mov word ptr [bp - 0xc], ax              
  0133  c45e06           les bx, ptr [bp + 6]                     
  0136  268b4708         mov ax, word ptr es:[bx + 8]             
  013a  d1e0             shl ax, 1                                
  013c  2b46fe           sub ax, word ptr [bp - 2]                
  013f  8946f2           mov word ptr [bp - 0xe], ax              
  0142  c45e0e           les bx, ptr [bp + 0xe]                   
  0145  268b4708         mov ax, word ptr es:[bx + 8]             
  0149  d1e0             shl ax, 1                                
  014b  2b46fe           sub ax, word ptr [bp - 2]                
  014e  8946f0           mov word ptr [bp - 0x10], ax             
  0151  50               push ax                                  
  0152  ff76f2           push word ptr [bp - 0xe]                 
  0155  ff76fe           push word ptr [bp - 2]                   
  0158  ff76fc           push word ptr [bp - 4]                   
  015b  52               push dx                                  
  015c  ff76f4           push word ptr [bp - 0xc]                 
  015f  66ff76f8         push dword ptr [bp - 8]                  
  0163  ff1e603f         lcall [0x3f60]                           
  0167  83c410           add sp, 0x10                             
  016a  46               inc si                                   
  016b  c45e06           les bx, ptr [bp + 6]                     
  016e  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0172  b400             mov ah, 0                                
  0174  3bc6             cmp ax, si                               
  0176  7e03             jle 0x17b                                
  0178  e9a8fe           jmp 0x23                                 
  017b  5f               pop di                                   
  017c  5e               pop si                                   
  017d  c9               leave                                    
  017e  cb               retf                                     

res_052a_017f:  ; ENTRY
  017f  55               push bp                                  
  0180  8bec             mov bp, sp                               
  0182  83ec0a           sub sp, 0xa                              
  0185  56               push si                                  
  0186  c45e06           les bx, ptr [bp + 6]                     
  0189  8b460c           mov ax, word ptr [bp + 0xc]              
  018c  26f76f08         imul word ptr es:[bx + 8]                
  0190  d1e0             shl ax, 1                                
  0192  8b560a           mov dx, word ptr [bp + 0xa]              
  0195  8a0e9e69         mov cl, byte ptr [0x699e]                
  0199  d3fa             sar dx, cl                               
  019b  03c2             add ax, dx                               
  019d  8946fe           mov word ptr [bp - 2], ax                
  01a0  c45e0e           les bx, ptr [bp + 0xe]                   
  01a3  8b4614           mov ax, word ptr [bp + 0x14]             
  01a6  26f76f08         imul word ptr es:[bx + 8]                
  01aa  d1e0             shl ax, 1                                
  01ac  8b5612           mov dx, word ptr [bp + 0x12]             
  01af  d3fa             sar dx, cl                               
  01b1  03c2             add ax, dx                               
  01b3  8946fc           mov word ptr [bp - 4], ax                
  01b6  c45e16           les bx, ptr [bp + 0x16]                  
  01b9  8b461c           mov ax, word ptr [bp + 0x1c]             
  01bc  26f76f08         imul word ptr es:[bx + 8]                
  01c0  d1e0             shl ax, 1                                
  01c2  8b561a           mov dx, word ptr [bp + 0x1a]             
  01c5  d3fa             sar dx, cl                               
  01c7  03c2             add ax, dx                               
  01c9  8946fa           mov word ptr [bp - 6], ax                
  01cc  c746f83000       mov word ptr [bp - 8], 0x30              
  01d1  c746f62800       mov word ptr [bp - 0xa], 0x28            
  01d6  33f6             xor si, si                               
  01d8  eb67             jmp 0x241                                
  01da  56               push si                                  
  01db  9a1800680e       lcall 0xe68, 0x18                        -> 0e68:0018
  01e0  59               pop cx                                   
  01e1  c45e16           les bx, ptr [bp + 0x16]                  
  01e4  26ff7708         push word ptr es:[bx + 8]                
  01e8  ff76fa           push word ptr [bp - 6]                   
  01eb  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  01f0  66c1e810         shr eax, 0x10                            
  01f4  50               push ax                                  
  01f5  ff76f6           push word ptr [bp - 0xa]                 
  01f8  8b46f8           mov ax, word ptr [bp - 8]                
  01fb  8a0ea069         mov cl, byte ptr [0x69a0]                
  01ff  d3f8             sar ax, cl                               
  0201  50               push ax                                  
  0202  c45e0e           les bx, ptr [bp + 0xe]                   
  0205  26ff7708         push word ptr es:[bx + 8]                
  0209  ff76fc           push word ptr [bp - 4]                   
  020c  8bc6             mov ax, si                               
  020e  c1e002           shl ax, 2                                
  0211  03d8             add bx, ax                               
  0213  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0218  66c1e810         shr eax, 0x10                            
  021c  50               push ax                                  
  021d  c45e06           les bx, ptr [bp + 6]                     
  0220  26ff7708         push word ptr es:[bx + 8]                
  0224  ff76fe           push word ptr [bp - 2]                   
  0227  8bc6             mov ax, si                               
  0229  c1e002           shl ax, 2                                
  022c  03d8             add bx, ax                               
  022e  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0233  66c1e810         shr eax, 0x10                            
  0237  50               push ax                                  
  0238  9af300680e       lcall 0xe68, 0xf3                        -> 0e68:00f3
  023d  83c416           add sp, 0x16                             
  0240  46               inc si                                   
  0241  c45e06           les bx, ptr [bp + 6]                     
  0244  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0248  b400             mov ah, 0                                
  024a  3bc6             cmp ax, si                               
  024c  7f8c             jg 0x1da                                 
  024e  5e               pop si                                   
  024f  c9               leave                                    
  0250  cb               retf                                     

res_052a_0251:  ; ENTRY
  0251  55               push bp                                  
  0252  8bec             mov bp, sp                               
  0254  c706623f5005     mov word ptr [0x3f62], 0x550             
  025a  c706603f0200     mov word ptr [0x3f60], 2                 
  0260  5d               pop bp                                   
  0261  cb               retf                                     
  0262  c8               db c8                                    
