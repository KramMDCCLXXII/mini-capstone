Supplier.create({name: "Mark Custard", email: "mark@email.com", phone_number: "12345"}) 
Supplier.create({name: "High Times", email: "hightimes@email.com", phone_number: "23456"})


Product.create({supplier_id: 2, name: "Volcano", price: "$500", image: "https://1ikehw1twddx1nfo883n2mn5-wpengine.netdna-ssl.com/wp-content/uploads/2016/12/IMG_5187.jpg", description: "High end vape"}) 
Product.create({supplier_id: 1, name: "Chocolate Kush", price: "$250", image: "https://www.lamota.org/media/images/full/cannabis-seeds/chocolate-kush.jpg", description: "High end indica!!"}) 
Product.create({supplier_id: 1, name: "Brownies", price: "$25", image: "http://i.dailymail.co.uk/i/pix/2015/03/13/269D397200000578-0-image-a-4_1426263592745.jpg", description: "High end edibles!!"})

