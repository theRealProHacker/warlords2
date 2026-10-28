; seg 0bfc  img 0xbfc0..0xc070  file off 0xcbc0
  0bfc:0000  c746fe7c01       mov word ptr [bp - 2], 0x17c             
  0bfc:0005  8b46fe           mov ax, word ptr [bp - 2]                
  0bfc:0008  eb00             jmp 0xa                                  
  0bfc:000a  c9               leave                                    
  0bfc:000b  cb               retf                                     

proc_0bfc_000c:
  0bfc:000c  55               push bp                                  
  0bfc:000d  8bec             mov bp, sp                               
  0bfc:000f  8a4606           mov al, byte ptr [bp + 6]                
  0bfc:0012  32e4             xor ah, ah                               
  0bfc:0014  cd10             int 0x10                                 
  0bfc:0016  5d               pop bp                                   
  0bfc:0017  cb               retf                                     

proc_0bfc_0018:
  0bfc:0018  55               push bp                                  
  0bfc:0019  8bec             mov bp, sp                               
  0bfc:001b  8b4e06           mov cx, word ptr [bp + 6]                
  0bfc:001e  b001             mov al, 1                                
  0bfc:0020  d2e0             shl al, cl                               
  0bfc:0022  52               push dx                                  
  0bfc:0023  bac403           mov dx, 0x3c4                            
  0bfc:0026  8ae0             mov ah, al                               
  0bfc:0028  b002             mov al, 2                                
  0bfc:002a  ef               out dx, ax                               
  0bfc:002b  5a               pop dx                                   
  0bfc:002c  5d               pop bp                                   
  0bfc:002d  cb               retf                                     
  0bfc:002e  8bd5             mov dx, bp                               
  0bfc:0030  8bec             mov bp, sp                               
  0bfc:0032  8b4604           mov ax, word ptr [bp + 4]                
  0bfc:0035  86c4             xchg ah, al                              
  0bfc:0037  8bea             mov bp, dx                               
  0bfc:0039  cb               retf                                     

proc_0bfc_003a:
  0bfc:003a  55               push bp                                  
  0bfc:003b  8bec             mov bp, sp                               
  0bfc:003d  8b5e06           mov bx, word ptr [bp + 6]                
  0bfc:0040  b80048           mov ax, 0x4800                           
  0bfc:0043  cd21             int 0x21                                 
  0bfc:0045  7303             jae 0x4a                                 
  0bfc:0047  b80000           mov ax, 0                                
  0bfc:004a  5d               pop bp                                   
  0bfc:004b  cb               retf                                     

proc_0bfc_004c:
  0bfc:004c  55               push bp                                  
  0bfc:004d  8bec             mov bp, sp                               
  0bfc:004f  06               push es                                  
  0bfc:0050  8e4606           mov es, word ptr [bp + 6]                
  0bfc:0053  b80049           mov ax, 0x4900                           
  0bfc:0056  cd21             int 0x21                                 
  0bfc:0058  b80100           mov ax, 1                                
  0bfc:005b  7303             jae 0x60                                 
  0bfc:005d  b80000           mov ax, 0                                
  0bfc:0060  07               pop es                                   
  0bfc:0061  5d               pop bp                                   
  0bfc:0062  cb               retf                                     

proc_0bfc_0063:
  0bfc:0063  55               push bp                                  
  0bfc:0064  8bec             mov bp, sp                               
  0bfc:0066  06               push es                                  
  0bfc:0067  1e               push ds                                  
  0bfc:0068  57               push di                                  
  0bfc:0069  56               push si                                  
  0bfc:006a  fc               cld                                      
  0bfc:006b  8b460c           mov ax, word ptr [bp + 0xc]              
  0bfc:006e  8ec0             mov es, ax                               
  0bfc:0070  8b7608           mov si, word ptr [bp + 8]                
  0bfc:0073  8b460a           mov ax, word ptr [bp + 0xa]              
  0bfc:0076  2b4612           sub ax, word ptr [bp + 0x12]             
  0bfc:0079  d1e0             shl ax, 1                                
  0bfc:007b  8b5e10           mov bx, word ptr [bp + 0x10]             
  0bfc:007e  d1e3             shl bx, 1                                
  0bfc:0080  81c3fa15         add bx, 0x15fa                           
  0bfc:0084  8b5614           mov dx, word ptr [bp + 0x14]             
  0bfc:0087  8b4e06           mov cx, word ptr [bp + 6]                
  0bfc:008a  8ed9             mov ds, cx                               
  0bfc:008c  8b4e12           mov cx, word ptr [bp + 0x12]             
  0bfc:008f  8b7e0e           mov di, word ptr [bp + 0xe]              
  0bfc:0092  36033f           add di, word ptr ss:[bx]                 
  0bfc:0095  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0bfc:0097  03f0             add si, ax                               
  0bfc:0099  83c302           add bx, 2                                
  0bfc:009c  4a               dec dx                                   
  0bfc:009d  75ed             jne 0x8c                                 
  0bfc:009f  5e               pop si                                   
  0bfc:00a0  5f               pop di                                   
  0bfc:00a1  1f               pop ds                                   
  0bfc:00a2  07               pop es                                   
  0bfc:00a3  5d               pop bp                                   
  0bfc:00a4  cb               retf                                     
  0bfc:00a5  8bd5             mov dx, bp                               
  0bfc:00a7  8bec             mov bp, sp                               
  0bfc:00a9  8b4604           mov ax, word ptr [bp + 4]                
  0bfc:00ac  8a4e06           mov cl, byte ptr [bp + 6]                
  0bfc:00af  d3               db d3
