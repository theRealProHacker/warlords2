; res_070b file_off 0x90b0

res_070b_0006:  ; ENTRY
  0006  55               push bp                                  
  0007  8bec             mov bp, sp                               
  0009  1e               push ds                                  
  000a  56               push si                                  
  000b  57               push di                                  
  000c  8b560a           mov dx, word ptr [bp + 0xa]              
  000f  f6c208           test dl, 8                               
  0012  7412             je 0x26                                  
  0014  b43c             mov ah, 0x3c                             
  0016  33c9             xor cx, cx                               
  0018  c55606           lds dx, ptr [bp + 6]                     
  001b  cd21             int 0x21                                 
  001d  7314             jae 0x33                                 
  001f  8b560a           mov dx, word ptr [bp + 0xa]              
  0022  81e2f7ff         and dx, 0xfff7                           
  0026  b8023d           mov ax, 0x3d02                           
  0029  c55606           lds dx, ptr [bp + 6]                     
  002c  cd21             int 0x21                                 
  002e  7303             jae 0x33                                 
  0030  b8ffff           mov ax, 0xffff                           
  0033  5f               pop di                                   
  0034  5e               pop si                                   
  0035  1f               pop ds                                   
  0036  8be5             mov sp, bp                               
  0038  5d               pop bp                                   
  0039  cb               retf                                     

res_070b_003a:  ; ENTRY
  003a  55               push bp                                  
  003b  8bec             mov bp, sp                               
  003d  1e               push ds                                  
  003e  56               push si                                  
  003f  57               push di                                  
  0040  8b5e06           mov bx, word ptr [bp + 6]                
  0043  b43e             mov ah, 0x3e                             
  0045  cd21             int 0x21                                 
  0047  5f               pop di                                   
  0048  5e               pop si                                   
  0049  1f               pop ds                                   
  004a  8be5             mov sp, bp                               
  004c  5d               pop bp                                   
  004d  cb               retf                                     

res_070b_004e:  ; ENTRY
  004e  55               push bp                                  
  004f  8bec             mov bp, sp                               
  0051  1e               push ds                                  
  0052  56               push si                                  
  0053  57               push di                                  
  0054  b440             mov ah, 0x40                             
  0056  8b5e06           mov bx, word ptr [bp + 6]                
  0059  8b4e0c           mov cx, word ptr [bp + 0xc]              
  005c  c55608           lds dx, ptr [bp + 8]                     
  005f  cd21             int 0x21                                 
  0061  7303             jae 0x66                                 
  0063  b8ffff           mov ax, 0xffff                           
  0066  5f               pop di                                   
  0067  5e               pop si                                   
  0068  1f               pop ds                                   
  0069  8be5             mov sp, bp                               
  006b  5d               pop bp                                   
  006c  cb               retf                                     

res_070b_006d:  ; ENTRY
  006d  55               push bp                                  
  006e  8bec             mov bp, sp                               
  0070  1e               push ds                                  
  0071  56               push si                                  
  0072  57               push di                                  
  0073  b43f             mov ah, 0x3f                             
  0075  8b5e06           mov bx, word ptr [bp + 6]                
  0078  8b4e0c           mov cx, word ptr [bp + 0xc]              
  007b  c55608           lds dx, ptr [bp + 8]                     
  007e  cd21             int 0x21                                 
  0080  7303             jae 0x85                                 
  0082  b8ffff           mov ax, 0xffff                           
  0085  5f               pop di                                   
  0086  5e               pop si                                   
  0087  1f               pop ds                                   
  0088  8be5             mov sp, bp                               
  008a  5d               pop bp                                   
  008b  cb               retf                                     

res_070b_008c:  ; ENTRY
  008c  55               push bp                                  
  008d  8bec             mov bp, sp                               
  008f  1e               push ds                                  
  0090  56               push si                                  
  0091  57               push di                                  
  0092  b442             mov ah, 0x42                             
  0094  8a460c           mov al, byte ptr [bp + 0xc]              
  0097  8b5e06           mov bx, word ptr [bp + 6]                
  009a  8b5608           mov dx, word ptr [bp + 8]                
  009d  8b4e0a           mov cx, word ptr [bp + 0xa]              
  00a0  cd21             int 0x21                                 
  00a2  5f               pop di                                   
  00a3  5e               pop si                                   
  00a4  1f               pop ds                                   
  00a5  8be5             mov sp, bp                               
  00a7  5d               pop bp                                   
  00a8  cb               retf                                     

res_070b_00a9:  ; ENTRY
  00a9  55               push bp                                  
  00aa  8bec             mov bp, sp                               
  00ac  1e               push ds                                  
  00ad  56               push si                                  
  00ae  57               push di                                  
  00af  b80142           mov ax, 0x4201                           
  00b2  8b5e06           mov bx, word ptr [bp + 6]                
  00b5  33d2             xor dx, dx                               
  00b7  33c9             xor cx, cx                               
  00b9  cd21             int 0x21                                 
  00bb  7227             jb 0xe4                                  
  00bd  52               push dx                                  
  00be  50               push ax                                  
  00bf  b80242           mov ax, 0x4202                           
  00c2  8b5e06           mov bx, word ptr [bp + 6]                
  00c5  33c9             xor cx, cx                               
  00c7  33d2             xor dx, dx                               
  00c9  cd21             int 0x21                                 
  00cb  8bf8             mov di, ax                               
  00cd  8bf2             mov si, dx                               
  00cf  5a               pop dx                                   
  00d0  59               pop cx                                   
  00d1  57               push di                                  
  00d2  56               push si                                  
  00d3  b80042           mov ax, 0x4200                           
  00d6  8b5e06           mov bx, word ptr [bp + 6]                
  00d9  cd21             int 0x21                                 
  00db  5a               pop dx                                   
  00dc  58               pop ax                                   
  00dd  5f               pop di                                   
  00de  5e               pop si                                   
  00df  1f               pop ds                                   
  00e0  8be5             mov sp, bp                               
  00e2  5d               pop bp                                   
  00e3  cb               retf                                     
  00e4  33c0             xor ax, ax                               
  00e6  8bd0             mov dx, ax                               
  00e8  ebf3             jmp 0xdd                                 
  00ea  3b               db 3b                                    
