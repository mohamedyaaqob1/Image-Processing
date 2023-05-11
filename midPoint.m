function midPoint (m , s)
  [r, c ,ch] = size(m);
  m_o = ones(r, c,ch);
  mask = s * s;
  start = floor(s/2);
  end_r = r - start -1 ;
  end_c = c - start - 1;
  for i = start:end_r
    for j = start:end_c
      for k = 1:ch
        result = m(i:i+s-1, j:j+s-1,k);
        b = sum(result);
        m_o(i, j,k) = sum(b,2);
        m_o(i, j,k) = m_o(i, j,k) / mask;
      end
    end
  end
  m_o = uint8(m_o);
  imshow(m_o);
end
