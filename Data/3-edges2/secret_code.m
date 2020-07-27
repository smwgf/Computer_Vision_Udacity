
function secret_code

    pkg load image;

    frizzy = rgb2gray(imread('frizzy.png'));
    froomer = rgb2gray(imread('froomer.png'));
    
    frizzy_edges = edge(frizzy, 'canny');
    froomer_edges = edge(froomer, 'canny');
    
    %imshow(frizzy_edges);
    %imshow(froomer_edges);
    
    imshow(frizzy_edges & froomer_edges);

endfunction
