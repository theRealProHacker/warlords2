; res_1553 file_off 0x17530

res_1553_000d:  ; ENTRY
  000d  55               push bp                                  
  000e  8bec             mov bp, sp                               
  0010  8a4606           mov al, byte ptr [bp + 6]                
  0013  32e4             xor ah, ah                               
  0015  cd10             int 0x10                                 
  0017  5d               pop bp                                   
  0018  cb               retf                                     
  0019  55               push bp                                  
  001a  8bec             mov bp, sp                               
  001c  8b4e06           mov cx, word ptr [bp + 6]                
  001f  b001             mov al, 1                                
  0021  d2e0             shl al, cl                               
  0023  52               push dx                                  
  0024  bac403           mov dx, 0x3c4                            
  0027  8ae0             mov ah, al                               
  0029  b002             mov al, 2                                
  002b  ef               out dx, ax                               
  002c  5a               pop dx                                   
  002d  5d               pop bp                                   
  002e  cb               retf                                     
  002f  8bd5             mov dx, bp                               
  0031  8bec             mov bp, sp                               
  0033  8b4604           mov ax, word ptr [bp + 4]                
  0036  86c4             xchg ah, al                              
  0038  8bea             mov bp, dx                               
  003a  cb               retf                                     
  003b  55               push bp                                  
  003c  8bec             mov bp, sp                               
  003e  8b5e06           mov bx, word ptr [bp + 6]                
  0041  b80048           mov ax, 0x4800                           
  0044  cd21             int 0x21                                 
  0046  7303             jae 0x4b                                 
  0048  b80000           mov ax, 0                                
  004b  5d               pop bp                                   
  004c  cb               retf                                     
  004d  55               push bp                                  
  004e  8bec             mov bp, sp                               
  0050  06               push es                                  
  0051  8e4606           mov es, word ptr [bp + 6]                
  0054  b80049           mov ax, 0x4900                           
  0057  cd21             int 0x21                                 
  0059  b80100           mov ax, 1                                
  005c  7303             jae 0x61                                 
  005e  b80000           mov ax, 0                                
  0061  07               pop es                                   
  0062  5d               pop bp                                   
  0063  cb               retf                                     
  0064  55               push bp                                  
  0065  8bec             mov bp, sp                               
  0067  06               push es                                  
  0068  1e               push ds                                  
  0069  57               push di                                  
  006a  56               push si                                  
  006b  fc               cld                                      
  006c  8b460c           mov ax, word ptr [bp + 0xc]              
  006f  8ec0             mov es, ax                               
  0071  8b7608           mov si, word ptr [bp + 8]                
  0074  8b460a           mov ax, word ptr [bp + 0xa]              
  0077  2b4612           sub ax, word ptr [bp + 0x12]             
  007a  d1e0             shl ax, 1                                
  007c  8b5e10           mov bx, word ptr [bp + 0x10]             
  007f  d1e3             shl bx, 1                                
  0081  81c3d869         add bx, 0x69d8                           
  0085  8b5614           mov dx, word ptr [bp + 0x14]             
  0088  8b4e06           mov cx, word ptr [bp + 6]                
  008b  8ed9             mov ds, cx                               
  008d  8b4e12           mov cx, word ptr [bp + 0x12]             
  0090  8b7e0e           mov di, word ptr [bp + 0xe]              
  0093  36033f           add di, word ptr ss:[bx]                 
  0096  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0098  03f0             add si, ax                               
  009a  83c302           add bx, 2                                
  009d  4a               dec dx                                   
  009e  75ed             jne 0x8d                                 
  00a0  5e               pop si                                   
  00a1  5f               pop di                                   
  00a2  1f               pop ds                                   
  00a3  07               pop es                                   
  00a4  5d               pop bp                                   
  00a5  cb               retf                                     
  00a6  8bd5             mov dx, bp                               
  00a8  8bec             mov bp, sp                               
  00aa  8b4604           mov ax, word ptr [bp + 4]                
  00ad  8a4e06           mov cl, byte ptr [bp + 6]                
  00b0  d3e8             shr ax, cl                               
  00b2  8bea             mov bp, dx                               
  00b4  cb               retf                                     
  00b5  55               push bp                                  
