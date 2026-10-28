; res_0719 file_off 0x9190

res_0719_000a:  ; ENTRY
  000a  3b7610           cmp si, word ptr [bp + 0x10]             
  000d  7d01             jge 0x10                                 
  000f  c3               ret                                      
  0010  06               push es                                  
  0011  57               push di                                  
  0012  56               push si                                  
  0013  c47e0c           les di, ptr [bp + 0xc]                   
  0016  c57610           lds si, ptr [bp + 0x10]                  
  0019  8b4e14           mov cx, word ptr [bp + 0x14]             
  001c  f7c10300         test cx, 3                               
  0020  740f             je 0x31                                  
  0022  90               nop                                      
  0023  90               nop                                      
  0024  f7c10100         test cx, 1                               
  0028  7410             je 0x3a                                  
  002a  90               nop                                      
  002b  90               nop                                      
  002c  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  002e  eb0e             jmp 0x3e                                 
  0030  90               nop                                      
  0031  c1c902           ror cx, 2                                
  0034  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0037  eb05             jmp 0x3e                                 
  0039  90               nop                                      
  003a  d1c9             ror cx, 1                                
  003c  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  003e  52               push dx                                  
  003f  51               push cx                                  
  0040  b43f             mov ah, 0x3f                             
  0042  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0045  c55610           lds dx, ptr [bp + 0x10]                  
  0048  8b4e14           mov cx, word ptr [bp + 0x14]             
  004b  cd21             int 0x21                                 
  004d  59               pop cx                                   
  004e  5a               pop dx                                   
  004f  5e               pop si                                   
  0050  2b7610           sub si, word ptr [bp + 0x10]             
  0053  03760c           add si, word ptr [bp + 0xc]              
  0056  5f               pop di                                   
  0057  07               pop es                                   
  0058  c3               ret                                      

res_0719_0059:  ; ENTRY
  0059  55               push bp                                  
  005a  8bec             mov bp, sp                               
  005c  1e               push ds                                  
  005d  56               push si                                  
  005e  57               push di                                  
  005f  b43f             mov ah, 0x3f                             
  0061  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0064  c5560c           lds dx, ptr [bp + 0xc]                   
  0067  8b4e14           mov cx, word ptr [bp + 0x14]             
  006a  d1e1             shl cx, 1                                
  006c  cd21             int 0x21                                 
  006e  c47e06           les di, ptr [bp + 6]                     
  0071  c5760c           lds si, ptr [bp + 0xc]                   
  0074  8b5616           mov dx, word ptr [bp + 0x16]             
  0077  32ed             xor ch, ch                               
  0079  83fa00           cmp dx, 0                                
  007c  7528             jne 0xa6                                 
  007e  8b5618           mov dx, word ptr [bp + 0x18]             
  0081  4a               dec dx                                   
  0082  895618           mov word ptr [bp + 0x18], dx             
  0085  83fa00           cmp dx, 0                                
  0088  7448             je 0xd2                                  
  008a  8b5626           mov dx, word ptr [bp + 0x26]             
  008d  42               inc dx                                   
  008e  895626           mov word ptr [bp + 0x26], dx             
  0091  c47e1a           les di, ptr [bp + 0x1a]                  
  0094  83fa01           cmp dx, 1                                
  0097  74db             je 0x74                                  
  0099  c47e1e           les di, ptr [bp + 0x1e]                  
  009c  83fa02           cmp dx, 2                                
  009f  74d3             je 0x74                                  
  00a1  c47e22           les di, ptr [bp + 0x22]                  
  00a4  ebce             jmp 0x74                                 
  00a6  ac               lodsb al, byte ptr [si]                  
  00a7  a880             test al, 0x80                            
  00a9  741a             je 0xc5                                  
  00ab  8ae0             mov ah, al                               
  00ad  ac               lodsb al, byte ptr [si]                  
  00ae  8a0c             mov cl, byte ptr [si]                    
  00b0  41               inc cx                                   
  00b1  46               inc si                                   
  00b2  2bd1             sub dx, cx                               
  00b4  8bde             mov bx, si                               
  00b6  8bf7             mov si, di                               
  00b8  03f0             add si, ax                               
  00ba  26a4             movsb byte ptr es:[di], byte ptr es:[si] 
  00bc  e2fc             loop 0xba                                 ; "%s's Quest"
  00be  8bf3             mov si, bx                               
  00c0  e847ff           call 0xa                                 
  00c3  ebb2             jmp 0x77                                 
  00c5  8ac8             mov cl, al                               
  00c7  fec1             inc cl                                   
  00c9  2bd1             sub dx, cx                               
  00cb  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  00cd  e83aff           call 0xa                                 
  00d0  eba5             jmp 0x77                                 
  00d2  5f               pop di                                   
  00d3  5e               pop si                                   
  00d4  1f               pop ds                                   
  00d5  8be5             mov sp, bp                               
  00d7  5d               pop bp                                   
  00d8  cb               retf                                     
  00d9  55               push bp                                  
