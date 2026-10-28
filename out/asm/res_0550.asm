; res_0550 file_off 0x7500
  0002  c8000000         enter 0, 0                               
  0006  1e               push ds                                  
  0007  06               push es                                  
  0008  57               push di                                  
  0009  56               push si                                  
  000a  50               push ax                                  
  000b  53               push bx                                  
  000c  51               push cx                                  
  000d  52               push dx                                  
  000e  fc               cld                                      
  000f  c57606           lds si, ptr [bp + 6]                     
  0012  c47e0a           les di, ptr [bp + 0xa]                   
  0015  8b560e           mov dx, word ptr [bp + 0xe]              
  0018  66a5             movsd dword ptr es:[di], dword ptr [si]  
  001a  a4               movsb byte ptr es:[di], byte ptr [si]    
  001b  037612           add si, word ptr [bp + 0x12]             
  001e  037e14           add di, word ptr [bp + 0x14]             
  0021  4a               dec dx                                   
  0022  75f4             jne 0x18                                 
  0024  5a               pop dx                                   
  0025  59               pop cx                                   
  0026  5b               pop bx                                   
  0027  58               pop ax                                   
  0028  5e               pop si                                   
  0029  5f               pop di                                   
  002a  07               pop es                                   
  002b  1f               pop ds                                   
  002c  c9               leave                                    
  002d  cb               retf                                     
  002e  c8000000         enter 0, 0                               
  0032  1e               push ds                                  
  0033  06               push es                                  
  0034  57               push di                                  
  0035  56               push si                                  
  0036  50               push ax                                  
  0037  53               push bx                                  
  0038  51               push cx                                  
  0039  52               push dx                                  
  003a  fc               cld                                      
  003b  c57606           lds si, ptr [bp + 6]                     
  003e  c47e0a           les di, ptr [bp + 0xa]                   
  0041  8b560e           mov dx, word ptr [bp + 0xe]              
  0044  a5               movsw word ptr es:[di], word ptr [si]    
  0045  a5               movsw word ptr es:[di], word ptr [si]    
  0046  a4               movsb byte ptr es:[di], byte ptr [si]    
  0047  037612           add si, word ptr [bp + 0x12]             
  004a  037e14           add di, word ptr [bp + 0x14]             
  004d  4a               dec dx                                   
  004e  75f4             jne 0x44                                 
  0050  5a               pop dx                                   
  0051  59               pop cx                                   
  0052  5b               pop bx                                   
  0053  58               pop ax                                   
  0054  5e               pop si                                   
  0055  5f               pop di                                   
  0056  07               pop es                                   
  0057  1f               pop ds                                   
  0058  c9               leave                                    
  0059  cb               retf                                     
  005a  55               push bp                                  
