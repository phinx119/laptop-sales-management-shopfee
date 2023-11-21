--Roles
INSERT INTO Roles(Role_Name) 
VALUES 
('Admin'),
('Marketing'),
('Sale'),
('Customer');

--Users
INSERT INTO Users(Username, Password, Email, Name, Role_ID, Avatar_Image, Status)
VALUES 
(N'Admin', '123', 'xuanphi2003@gmail.com', N'At Van Min', 1, N'Go Youn Jung.jpg', 1),
(N'Marketing', '123', 'xuanphi2003@gmail.com', N'Ma Ket Tinh', 2, N'default-avatar.jpg', 1),
(N'Sale', '123', 'xuanphi2003@gmail.com', N'Nguyen Van Seu', 3, N'default-avatar.jpg', 1),
(N'Customer', '123', 'xuanphi2003@gmail.com', N'Cut Tom Mo', 4, N'default-avatar.jpg', 1);

--Brands
INSERT INTO Brands(Brand_Name, Brand_Image) 
VALUES 
('Acer', 'Acer.png'),
('Apple', 'Apple.png'),
('HP', 'HP.png'),
('Asus', 'Asus.png'),
('MSI', 'MSI.png'),
('LG', 'LG.png'),
('DELL', 'Dell.png'),
('Lenovo', 'Lenovo.png'),
('Microsoft', 'Microsoft.png');

--Category
INSERT INTO Category(Category_Name, Category_Image) 
VALUES 
(N'Graphics, Architecture', N'cat-1.jpg'),
(N'General, Office', N'cat-2.jpg'),
(N'Business', N'cat-3.jpg'),
(N'Gaming', N'cat-4.jpg');

--Processor_Types
INSERT INTO Processor_Types(Processor_Type_Name) 
VALUES 
('AMD Ryzen 5'),
('Apple M2'),
('Intel Core i3'),
('Intel Core i5'),
('Intel Core i7');

--Laptops
--Acer
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(1, N'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)', 1, 3, 'Intel® Core i3-1215U', 'Intel® UHD Graphics', 8, '256GB SSD', 15.6, 'Full HD 1920 x 1080', 60, 'Window', 9699000, 10, 'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)_1.jpg', 'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)_2.jpg', 'LAPTOP ACER ASPIRE 3 A315-59-31BT (NX.K6TSV.00L)_3.jpg', N'Một trong những chiếc laptop giá rẻ dành cho học sinh sinh viên và nhân viên không thể không nhắc đến là Acer Aspire 3 A315. Thiết kế nhỏ gọn, hoàn thiện từng chi tiết, cấu hình mạnh đáp ứng các yêu cầu học tập và làm việc mỗi ngày. Hứa hẹn sẽ là sản phẩm laptop văn phòng giá tốt dành cho nhiều người.', 1),
(1, N'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)', 2, 1, 'AMD Ryzen 5 7520U', 'AMD Radeon™ 610M', 8, '512GB SSD', 14, 'FHD(1920 x 1080) IPS LED', 60, 'Window', 12299000, 10, 'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)_1.png', 'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)_2.png', 'LAPTOP ACER ASPIRE 3 A314-23M-R4TX (NX.KEXSV.001)_3.png', N'Một trong những chiếc laptop giá rẻ dành cho học sinh sinh viên và nhân viên không thể không nhắc đến là Acer Aspire 3 A314. Thiết kế nhỏ gọn, hoàn thiện từng chi tiết, cấu hình mạnh đáp ứng các yêu cầu học tập và làm việc mỗi ngày. Hứa hẹn sẽ là sản phẩm laptop văn phòng giá tốt dành cho nhiều người.', 1),
(1, N'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)', 3, 4, 'Intel® Core i5-1240P', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 14, 'QHD (2560 x 1440)', 60, 'Window', 18799000, 10, 'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)_1.png', 'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)_2.png', 'LAPTOP ACER SWIFT 3 SF314-512-56QN (NX.K0FSV.002)_3.png', N'Một trong những chiếc laptop giá rẻ dành cho học sinh sinh viên và nhân viên không thể không nhắc đến là Acer Swift. Thiết kế nhỏ gọn, hoàn thiện từng chi tiết, cấu hình mạnh đáp ứng các yêu cầu học tập và làm việc mỗi ngày. Hứa hẹn sẽ là sản phẩm laptop văn phòng giá tốt dành cho nhiều người.', 1),
(1, N'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)', 4, 4, 'Intel® Core i5 11400H', 'NVIDIA® GTX1650 4G', 8, '512GB SSD', 15.6, 'Full HD 1920 x 1080', 120, 'Window', 18299000, 10, 'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)_1.png', 'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)_2.png', 'LAPTOP ACER GAMING NITRO 5 AN515-57-5669 (NH.QEHSV.001)_3.png', N'Acer Nitro 5 mang đến vẻ hầm hố, mạnh mẽ thông qua ngôn ngữ thiết kế của mình. Thiết kế bên ngoài cũng nổi bật hơn, với các mảng màu đỏ trên các vây ở mặt sau của máy tính xách tay. Sự thay đổi này thay thế cho bản lề màu đỏ, hoạt động êm ái hơn so với năm ngoái. Toàn bộ thân máy được làm bằng nhựa với tone màu đen - đỏ ấn tượng.', 1);
--Apple
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(2, N'LAPTOP APPLE MACBOOK AIR (Z1600005A) (2022)', 1, 2, 'Apple M2', 'Onboard', 16, '512GB SSD', 13.6, 'Retina IPS', 120, 'Mac OS', 18999000, 10, 'LAPTOP APPLE MACBOOK AIR (Z1600005A)_1.png', 'LAPTOP APPLE MACBOOK AIR (Z1600005A)_2.png', 'LAPTOP APPLE MACBOOK AIR (Z1600005A)_3.png', N'Macbook Air sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu sang trọng. Thiết kế laptop mỏng nhẹ thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.', 1),
(2, N'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA) (MIDNIGHT) (2023)', 2, 2, 'Apple M2', 'Onboard', 8, '256GB SSD', 15.3, 'Retina IPS', 120, 'Mac OS', 32499000, 10, 'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA)_1.png', 'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA)_2.png', 'LAPTOP APPLE MACBOOK AIR 15 (MQKW3SA)_3.png', N'Macbook Air sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu sang trọng. Thiết kế laptop mỏng nhẹ thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.', 1),
(2, N'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)', 3, 2, 'Apple M2', 'Onboard', 16, '256GB SSD', 13.3, 'Retina IPS', 120, 'Mac OS', 35699000, 10, 'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)_1.png', 'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)_2.png', 'LAPTOP APPLE MACBOOK PRO 13 (Z16R0003V)_3.png', N'Macbook Air sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu sang trọng. Thiết kế laptop mỏng nhẹ thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.', 1);
--HP
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(3, N'LAPTOP HP PROBOOK 440 G10 (873A9PA)', 1, 4, 'Intel® Core i5-1335U', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 14, 'Full HD 1920 x 1080', 60, 'Window', 21299000, 10, 'LAPTOP HP PROBOOK 440 G10 (873A9PA)_1.jpg', 'LAPTOP HP PROBOOK 440 G10 (873A9PA)_2.jpg', 'LAPTOP HP PROBOOK 440 G10 (873A9PA)_3.jpg', N'Laptop có kiểu dáng bắt mắt với thân máy siêu mỏng, hoàn thiện từ vỏ nhôm nguyên khối sang trọng. Phiên bản màu bạc thời trang, logo HP nổi bật bóng bẩy cùng viền màn hình mỏng hai cạnh thể hiện sự hiện đại và thời thượng. Tuy mỏng nhẹ nhưng chiếc máy này bền bỉ với khả năng chống sốc và chống va đập tối ưu, sử dụng được trong thời gian lâu dài.', 1),
(3, N'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)', 2, 4, 'Intel® Core i5-1335U', 'Intel® Iris Xe Graphics', 8, '512GB SSD', 14, 'Full HD 1920 x 1080', 60, 'Window', 18799000, 10, 'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)_1.jpg', 'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)_2.jpg', 'LAPTOP HP ENVY X360 14-ES0013DX (7H9Y4UA)_3.jpg', N'Laptop HP Envy sở hữu một thiết kế trẻ trung, năng động chắc chắn sẽ mang đến cho bạn sự tự tin nhất khi cầm trên tay. Đây là chiếc laptop kết hợp hoàn hảo của một chiếc laptop văn phòng với thời trang hiện đại.', 1),
(3, N'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)', 3, 4, 'Intel® Core i5-1235U', 'Intel® Iris Xe Graphics', 8, '512GB SSD', 14, 'Full HD 1920 x 1080', 60, 'Window', 19299000, 10, 'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)_1.jpg', 'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)_2.jpg', 'LAPTOP HP PROBOOK 440 G9 (6M0X3PA)_3.jpg', N'Laptop có kiểu dáng bắt mắt với thân máy siêu mỏng, hoàn thiện từ vỏ nhôm nguyên khối sang trọng. Phiên bản màu bạc thời trang, logo HP nổi bật bóng bẩy cùng viền màn hình mỏng hai cạnh thể hiện sự hiện đại và thời thượng. Tuy mỏng nhẹ nhưng chiếc máy này bền bỉ với khả năng chống sốc và chống va đập tối ưu, sử dụng được trong thời gian lâu dài.', 1),
(3, N'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)', 4, 5, 'Intel® Core i7-12700H', 'NVIDIA® GeForce RTX™ 3050 TI 4GB GDDR6', 8, '512GB SSD', 16, 'Full HD 1920 x 1080', 120, 'Window', 29349000, 10, 'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)_1.png', 'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)_2.png', 'LAPTOP HP GAMING VICTUS 16-D1187TX (7C0S4PA)_3.png', N'Laptop HP gaming VICTUS 16 d0291TX sở hữu vẻ ngoài cực kỳ đặc biệt. Có thể nói, VICTUS 16 mang ngôn ngữ thiết kế hoàn toàn mới với hình chữ "V" phản kim loại đồng bộ hợp thời trang. Khoác lên mình màu đen giúp toát lên vẻ tinh tế, thanh lịch nhưng không kém phần mạnh mẽ cho người dùng.', 1);
--Asus
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(4, N'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W', 1, 4, 'Intel® Core i5-1335U', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 15.6, 'Full HD 1920 x 1080', 60, 'Window', 15799000, 10, 'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W_1.jpg', 'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W_2.jpg', 'LAPTOP ASUS VIVOBOOK X1504VA-NJ070W_3.jpg', N'Laptop ASUS VivoBook M513UA L1240T sở hữu thiết kế của một chiếc laptop doanh nhân sang trọng, lịch lãm. Những điều ấy đến từ cấu tạo vỏ máy từ kim loại cao cấp nguyên khối cho sự chắc chắn cao, bảo vệ hoàn hảo linh kiện quý giá bên trong.', 1),
(4, N'ASUS VIVOBOOK 14 OLED A1405VA-KM095W', 2, 4, 'Intel® Core i5-13500H', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 14, '2.8K', 60, 'Window', 17799000, 10, 'ASUS VIVOBOOK 14 OLED A1405VA-KM095W_1.png', 'ASUS VIVOBOOK 14 OLED A1405VA-KM095W_2.png', 'ASUS VIVOBOOK 14 OLED A1405VA-KM095W_3.png', N'Asus Vivobook 14X OLED sở hữu một màu bạc đẹp mắt với thiết kế vuông vắn đầy tinh tế. Bản lề được thiết kế tự tạo một góc nghiêng vừa phải khi mở nắp máy tính lên. Mặt nắp laptop Asus đặt khéo léo phần logo đặc trưng của dòng Asus Vivobook tạo một nét đẹp sang trọng trên sản phẩm nhà Asus.', 1),
(4, N'LAPTOP ASUS VIVOBOOK E1404FA-NK177W', 3, 1, 'AMD Ryzen 5 7520U', 'AMD Radeon Graphics', 16, '512GB SSD', 14, 'Full HD 1920 x 1080', 60, 'Window', 13849000, 10, 'LAPTOP ASUS VIVOBOOK E1404FA-NK177W_1.png', 'LAPTOP ASUS VIVOBOOK E1404FA-NK177W_2.png', 'LAPTOP ASUS VIVOBOOK E1404FA-NK177W_3.png', N'Asus Vivobook sở hữu một màu đẹp mắt với thiết kế vuông vắn đầy tinh tế. Bản lề được thiết kế tự tạo một góc nghiêng vừa phải khi mở nắp máy tính lên. Mặt nắp laptop Asus đặt khéo léo phần logo đặc trưng của dòng Asus Vivobook tạo một nét đẹp sang trọng trên sản phẩm nhà Asus.', 1),
(4, N'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W', 4, 4, 'Intel® Core i5 12500H', 'NVIDIA® GeForce RTX™ 3050 4GB GDDR6', 8, '512GB SSD', 15.6, 'Full HD 1920 x 1080', 120, 'Window', 20299000, 10, 'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W_1.jpg', 'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W_2.jpg', 'LAPTOP ASUS GAMING TUF FX507ZC4-HN074W_3.jpg', N'Sở hữu ngôn ngữ thiết kế hiện đại với tông màu xám đen mạnh mẽ, cuốn hút, ASUS TUF là sự trung hòa hoàn hảo giữa sự hầm hố, bụ bẫm vốn có của dòng laptop gaming với sự trẻ trung, thanh lịch phù hợp với newbie cũng như những game thủ chuyên nghiệp.', 1);
--MSI
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(5, N'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)', 1, 5, 'Intel® Core i7-1360P', 'Intel® Iris Xe Graphics', 16, '1TB SSD', 13.3, 'Full HD 1920 x 1080', 60, 'Window', 31849000, 10, 'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)_1.png', 'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)_2.png', 'LAPTOP MSI PRESTIGE 13EVO (A13M-081VN)_3.png', N'MSI Prestige được đầu tư thiết kế nhằm tối ưu trải nghiệm và phục vụ nhu cầu di chuyển mỗi ngày của người dùng. Trọng lượng chỉ khoảng 1.49kg thuận lợi trong việc bỏ vào balo và mang đi cứ lúc nào. Kiểu dáng sang trọng với tông màu xám thời thượng kết hợp từng đường nét chau chuốt tỉ mỉ tạo ra một nét đẹp đầy phong cách. Bắt kịp xu hướng và thị hiếu của các bạn trẻ ngày nay.', 1),
(5, N'LAPTOP MSI MODERN 15 (B12MO-628VN)', 2, 4, 'Intel® Core i5-1235U', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 15.6, 'Full HD 1920 x 1080', 60, 'Window', 14299000, 10, 'LAPTOP MSI MODERN 15 (B12MO-628VN)_1.jpg', 'LAPTOP MSI MODERN 15 (B12MO-628VN)_2.jpg', 'LAPTOP MSI MODERN 15 (B12MO-628VN)_3.jpg', N'MSI Modern 15 sở hữu thiết kế mỏng nhẹ vô cùng sang trọng và đẳng cấp cùng những chi tiết được gia công tinh xảo. Điểm nổi bật trên dòng sản phẩm MSI Modern 15 có lẽ là đến từ chất liệu vỏ máy tính được làm với chất liệu cao cấp cùng trọng lượng chỉ 1.75 kg để người dùng có thể cất gọn trong balo để mang đi bất kỳ đâu.', 1),
(5, N'LAPTOP MSI MODERN 14 (C13M-611VN)', 3, 4, 'Intel® Core i5-1335U', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 14, 'Full HD 1920 x 1080', 60, 'Window', 16899000, 10, 'LAPTOP MSI MODERN 14 (C13M-611VN)_1.jpg', 'LAPTOP MSI MODERN 14 (C13M-611VN)_2.jpg', 'LAPTOP MSI MODERN 14 (C13M-611VN)_3.jpg', N'MSI Modern 14 là dòng laptop cho sinh viên được nhiều bạn lựa chọn trong việc đồng hành trong mọi công việc và học tập. Và mẫu máy được ra mắt với thiết kế di động cao cùng bộ cấu hình mạnh mẽ đáp ứng nhiều tác vụ hằng ngày.', 1),
(5, N'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)', 4, 5, 'Intel® Core i7-13620H', 'NVIDIA® GeForce RTX™ 4060 8GB', 16, '1TB SSD', 15.6, 'Full HD 1920 x 1080', 120, 'Window', 33849000, 10, 'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)_1.png', 'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)_2.png', 'LAPTOP MSI GAMING KATANA 15 (B13VFK-676VN)_3.png', N'MSI Katana 15 B13VFK 676VN thể hiện sức mạnh của mình với những trang bị cao cấp hiện nay. Với CPU Intel Gen 13 mới nhất cùng model i7-13620H mang lại những đường kiếm nhanh như chớp, giúp bạn xử lý gọn gàng từng tác vụ một.', 1);
--LG
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(6, N'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5', 1, 4, 'Intel® Core i5-1340P', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 16, 'Full HD 1920 x 1080', 60, 'Window', 40999000, 10, 'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5_1.png', 'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5_2.png', 'LAPTOP LG GRAM STYLE 16Z90RS-G.AH54A5_3.png', N'Laptop LG Gram Style khơi nguồn cảm hứng làm việc với thiết kế tinh xảo, kiểu dáng thời thượng chuẩn laptop hiện đại năm nay. Thu hút bởi ngoại hình sang trọng cùng hiệu năng hoạt động đỉnh cao cho mọi yêu cầu học tập và làm việc hằng ngày của người dùng.', 1),
(6, N'LAPTOP LG GRAM 17Z90R-G.AH78A5', 3, 5, 'Intel® Core i7-1360P', 'Intel® Iris Xe Graphics', 16, '1TB SSD', 17, 'Full HD 1920 x 1080', 60, 'Window', 48149000, 10, 'LAPTOP LG GRAM 17Z90R-G.AH78A5_1.png', 'LAPTOP LG GRAM 17Z90R-G.AH78A5_2.png', 'LAPTOP LG GRAM 17Z90R-G.AH78A5_3.png', N'Laptop LG Gram khơi nguồn cảm hứng làm việc với thiết kế tinh xảo, kiểu dáng thời thượng chuẩn laptop hiện đại năm nay. Thu hút bởi ngoại hình sang trọng cùng hiệu năng hoạt động đỉnh cao cho mọi yêu cầu học tập và làm việc hằng ngày của người dùng.', 1);
--DELL
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(7, N'LAPTOP DELL VOSTRO 5620 (VWXVW)', 1, 4, 'Intel® Core i5-1240P', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 16, 'Full HD 1920 x 1080', 60, 'Window', 24599000, 10, 'LAPTOP DELL VOSTRO 5620 (VWXVW)_1.png', 'LAPTOP DELL VOSTRO 5620 (VWXVW)_2.png', 'LAPTOP DELL VOSTRO 5620 (VWXVW)_3.png', N'Laptop Dell Vostro mang đến hiệu suất làm việc cao, xử lý mọi tác vụ nhanh chóng trong thiết kế gọn nhẹ đầy thanh lịch. Đây là một trong những sản phẩm laptop văn phòng phổ thông thu hút được nhiều sự quan tâm của khách hàng nhất.', 1),
(7, N'LAPTOP DELL LATITUDE 3520 (71004153)', 2, 4, 'Intel® Core i5-1135G7', 'Intel® Iris Xe Graphics', 8, '256GB SSD', 15.6, 'Full HD 1920 x 1080', 60, 'Window', 15399000, 10, 'LAPTOP DELL LATITUDE 3520 (71004153)_1.jpg', 'LAPTOP DELL LATITUDE 3520 (71004153)_2.jpg', 'LAPTOP DELL LATITUDE 3520 (71004153)_3.jpg', N'Máy sử dụng tone màu đen cổ điển làm chủ đạo với logo Dell màu trắng đặt tại vị trí trung tâm mặt trên của máy. Đây là thiết kế khá phù hợp với gần như mọi lứa tuổi khách hàng, phù hợp với mọi bối cảnh.', 1),
(7, N'LAPTOP DELL INSPIRON 3520', 3, 4, 'Intel® Core i5-1135G7', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 15.6, 'Full HD 1920 x 1080', 60, 'Window', 13499000, 10, 'LAPTOP DELL INSPIRON 3520_1.jpg', 'LAPTOP DELL INSPIRON 3520_2.jpg', 'LAPTOP DELL INSPIRON 3520_3.jpg', N'Laptop Dell Inspiron được hãng sản xuất vô cùng đơn giản nhưng lại vô cùng bền bỉ. Với những người đã sở hữu cho mình những con laptop từ Dell chắc hẳn không quá xa lạ về độ bền mà nó mang lại. Vỏ máy bao phủ bởi một lớp màu đen đơn giản nhưng không hề đơn điệu với phần logo Dell in chìm chính giữa bề mặt máy.', 1),
(7, N'LAPTOP DELL GAMING G15 5530 (I7H165W11GR4050)', 4, 5, 'Intel® Core i7-13620HX', 'NVIDIA® GeForce RTX™ 4050 6GB GDDR6', 16, '512GB SSD', 15.6, 'Full HD 1920 x 1080', 120, 'Window', 38849000, 10, 'LAPTOP DELL GAMING G15 5530 (I7H165W11GR4050)_1.png', 'LAPTOP DELL GAMING G15 5530 (I7H165W11GR4050)_2.png', 'LAPTOP DELL GAMING G15 5530 (I7H165W11GR4050)_3.png', N'Dòng laptop Dell này được trang bị cấu hình mạnh mẽ giúp cho các game thủ chiến game mượt mà. Đó là sức mạnh đến từ CPU Intel Core i7-13650HX đi cùng là card đồ họa RTX 4060. Bộ vi xử lý đảm bảo tốc độ xử lý các tác vụ, RTX 4060 thì đem lại đồ họa đỉnh cao trên những tựa game AAA, tất cả hướng đến trải nghiệm chơi game tuyệt vời nhất cho người dùng.', 1);
--Lenovo
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(8, N'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 16ARH7 (82SN003HVN)', 1, 1, 'AMD Ryzen 5 6600HS', 'NVIDIA® GeForce RTX™ 3050 Ti 4GB GDDR6', 16, '512GB SSD', 16, 'Full HD 1920 x 1080', 60, 'Window', 22299000, 10, 'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 16ARH7_1.jpg', 'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 16ARH7_2.jpg', 'LAPTOP LENOVO IDEAPAD SLIM 5 PRO 16ARH7_3.jpg', N'Laptop văn phòng, phân khúc sản phẩm cực kì “nóng” với lượng người dùng và nhu cầu sử dụng cao đến từ học sinh - sinh viên hay dân văn phòng chính hiệu. Không còn độc quyền với những “ông hoàng”, nay chúng ta cùng đón chào một tân binh đến từ Lenovo với series Ideapad Slim 5 của mình.', 1),
(8, N'LAPTOP LENOVO THINKPAD E14 GEN 5 (21JK006QVA)', 2, 4, 'Intel® Core i5-1335U', 'Integrated Intel® Iris XE Graphics', 8, '512GB SSD', 14, 'Full HD 1920 x 1080', 60, 'Window', 20299000, 10, 'LAPTOP LENOVO THINKPAD E14 GEN 5 (21JK006QVA)_1.jpg', 'LAPTOP LENOVO THINKPAD E14 GEN 5 (21JK006QVA)_2.jpg', 'LAPTOP LENOVO THINKPAD E14 GEN 5 (21JK006QVA)_3.jpg', N'Lenovo ThinkPad nổi bật với vẻ ngoài lịch lãm, độ hoàn thiện tốt và một thương hiệu đã quá nổi tiếng đối với dân văn phòng. Hướng đến đối tượng là những người cần một mẫu laptop cơ động nhưng cũng đủ chắc chắn để mang lại trải nghiệm tốt khi làm việc ở mọi nơi', 1),
(8, N'LAPTOP LENOVO IDEAPAD SLIM 5 LIGHT 14ABR8 (82XS0006VN)', 3, 1, 'AMD Ryzen 5 7530U', 'Integrated AMD Radeon™ Graphics', 8, '512GB SSD', 14, 'Full HD 1920 x 1080', 60, 'Window', 15299000, 10, 'LAPTOP LENOVO IDEAPAD SLIM 5 LIGHT 14ABR8 (82XS0006VN)_1.jpg', 'LAPTOP LENOVO IDEAPAD SLIM 5 LIGHT 14ABR8 (82XS0006VN)_2.jpg', 'LAPTOP LENOVO IDEAPAD SLIM 5 LIGHT 14ABR8 (82XS0006VN)_3.jpg', N'Laptop văn phòng, phân khúc sản phẩm cực kì “nóng” với lượng người dùng và nhu cầu sử dụng cao đến từ học sinh - sinh viên hay dân văn phòng chính hiệu. Không còn độc quyền với những “ông hoàng”, nay chúng ta cùng đón chào một tân binh đến từ Lenovo với series Ideapad Slim 5 của mình.', 1),
(8, N'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN)', 4, 5, 'Intel® Core i7-12700H', 'NVIDIA® GeForce RTX™ 3060 6GB GDDR6', 16, '512GB SSD', 16, 'Full HD 1920 x 1080', 120, 'Window', 37349000, 10, 'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN)_1.jpg', 'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN)_2.jpg', 'LAPTOP LENOVO LEGION 5 PRO 16IAH7H (82RF0043VN)_3.jpg', N'Lenovo Legion 5 là một trong những dòng sản phẩm laptop gaming với hiệu năng vượt trội, kiểu dáng thời thượng cùng những công nghệ cải tiến mới trong thiết kế. Hứa hẹn mang đến một sản phẩm vượt ngoài mong đợi của nhiều người về dòng Lenovo Legion này.', 1);
--Microsoft
INSERT INTO Laptops(Brand_ID, Model, Category_ID, Processor_Type_ID, Processor_Type_Name, Graphics_Card, RAM, Storage, Screen_Size, Screen_Resolution, Screen_Frequency, Operating_System, Price, Stock_Quantity, Laptop_Image1, Laptop_Image2, Laptop_Image3, Description, Status)
VALUES 
(9, N'SURFACE LAPTOP 5 (RBG-00026)', 3, 5, 'Intel® Core i7-13255U', 'Intel® Iris Xe Graphics', 16, '512GB SSD', 13.3, 'Full HD 1920 x 1080', 120, 'Window', 47349000, 10, 'SURFACE LAPTOP 5 (RBG-00026)_1.png', 'SURFACE LAPTOP 5 (RBG-00026)_2.png', 'SURFACE LAPTOP 5 (RBG-00026)_3.png', N'Thiết kế đơn giản phần mặt lưng cùng bốn góc bo tròn, kết hợp với logo Microsoft tông màu xám bạc (hoặc đen) mang lại cảm giác sang trọng, tinh tế cho Surface Laptop 5.', 1),
(9, N'MICROSOFT SURFACE SURFACE PRO 9', 2, 4, 'Intel® Core i5-1235U', 'Intel® Iris Xe Graphics', 8, '256GB SSD', 13, 'Full HD 1920 x 1080', 120, 'Window', 27299000, 10, 'MICROSOFT SURFACE SURFACE PRO 9_1.png', 'MICROSOFT SURFACE SURFACE PRO 9_2.png', 'MICROSOFT SURFACE SURFACE PRO 9_3.png', N'Sở hữu thiết kế vô cùng sang trọng với chất liệu từ nhôm nguyên khối, mang đến cảm giác chắc chắn nhưng vẫn vô cùng mỏng nhẹ với trọng lượng chỉ 1,29kg - 1,54kg giúp người dùng dễ dàng mang theo bên mình mọi lúc,mọi nơi.', 1);

--Discount
INSERT INTO Discount (Category_ID, Discount) 
VALUES
(1, 0.2),
(2, 0.4),
(3, 0.3),
(4, 0.1);

--Banner
INSERT [dbo].[Banner] ([Banner_Name], [Banner_Image], [Banner_Link]) 
VALUES 
(N'banner1', N'Banner2.jpg', '#'),
(N'banner2', N'Banner3.png', '#'),
(N'banner3', N'Banner4.jpg', '#'),
(N'banner4', N'Banner5.jpg', '#'),
(N'banner5', N'Banner6.jpg', '#'),
(N'banner6', N'Go Yoon Jung.jpg', '#');