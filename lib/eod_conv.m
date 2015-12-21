function hm = eod_conv(data, template, param)
data_size = size(data);
template_size = size(template);
h = zeros(data_size(1) - template_size(1) + 1,...
          data_size(2) - template_size(2) + 1,...
          param.feature_dim);
%   HM = fconvblasfloat(hog{level}, templates, 1, nTemplates);
for d = 1:param.feature_dim
  h(:,:,d) = conv2(data(:,:,d),...
        template(end:-1:1,end:-1:1,d),...
        'valid');
end
hm = sum(h,3);