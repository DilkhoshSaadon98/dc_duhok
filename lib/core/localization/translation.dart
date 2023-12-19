import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          ' IQ': ' د.ع',
          //! Authentication Translation:
          "Choose Language": "أختر اللغة",
          'Welcome To': 'اهلاً بك في',
          'Sign In With Your Email And Password':
              'قم بتسجيل الدخول بإستخدام بريدك ورقمك السري',
          'E-mail': 'الأيميل',
          'Password': 'كلمة السر',
          'Forget Password': 'نسيت كلمة السر',
          'Log In': 'تسجيل الدخول',
          'Dont Have An Account ? ': 'ليس لديك حساب ؟',
          'Sign Up': 'إنشاء حساب',
          'Username': 'أسم المستخدم',
          'First Name': 'الأسم الأول',
          'Last Name': 'الأسم الثاني',
          'Phone Number': 'رقم الهاتف',
          'Sign In': 'تسجيل الدخول',
          'Already Have an Account? ': 'لديك حساب بالفعل ؟',
          'Check code': 'التحقق من الرمز',
          "Back to login": 'العودة الى تسجيل الدخول',
          "Resend code": 'إعادة أرسال الرمز',
          'Please enter verify code that sent to ':
              'رجاءاً قم بأدخال رمز التحقق',
          'Account created sccesfully open your email folder then use verify code to verify your account':
              "تم إنشاء الحساب بنجاح، افتح مجلد البريد الإلكتروني الخاص بك ثم استخدم رمز التحقق للتحقق من حسابك",
          "email address already exist, please try with another email or reset your password ...":
              "عنوان البريد الإلكتروني موجود بالفعل، يرجى المحاولة باستخدام بريد إلكتروني آخر أو إعادة تعيين كلمة المرور الخاصة بك ...",
          'Please enter your email address and we will send verification code to your account after check your account':
              "الرجاء إدخال عنوان بريدك الإلكتروني وسنرسل رمز التحقق إلى حسابك بعد التحقق من حسابك",
          //! Home Trnaslation:
          'Search For Product . . .': "بحث عن المنتجات. . .",
          'Welcome, ': "أهلاً، ",
          'Search': "بحث",
          'All Categories': " كل الأنواع",
          'Products for you': "منتجات لك",
          "New Arrival Products": 'منتجات جديدة',
          'Products': 'المنتجات',
          'Deliver': 'توصيل',
          'available to': 'متوفر لكافة',
          'All Kurdisatn': 'انحاء كوردستان',
          'Designing': 'تصميم و إعداد',
          'Graduation Projects': 'مشاريع التخرج',
          'Upon Request': 'حسب الطلب',
          'Permanent': 'دائمية',
          'and Discounts': 'والتخفيضات',
          'Advertising': 'إعلان',
          'your used': 'لمنتجاتك',
          'products': 'المستعملة',
          //!Product Details :
          'Go To Cart': 'الذهاب للسلة',
          'Total Price': 'السعر الكلي',
          'Description:': 'معلومات عن المنتج :',
          //! Cart :
          'My Cart': 'سلتي',
          'You Have ': 'لديك ',
          ' Items in Your Cart': 'منتجات في السلة',
          'Check Out': "أتمام العملية",
          'Apply': "تأكيد",
          'Coupon code': "رمز الكوبون",
          'Price': "السعر",
          'Coupon Discount': "تخفيضات الكوبون",
          'Shipping': "مواصلات",
          //! Check Out :
          'Checkout': 'الدفع',
          'Choose Payment Method:': 'أختيار وسيلة الدفع',
          'Cash On Delivery': 'الدفع عند الأستلام',
          'Payments Card': 'بطاقة الأئتمان',
          'Choose Delivery Type': 'أختيار وسيلة التوصيل',
          'Delivery': 'ديليفري',
          'Revice': 'أستلام',
          'Shipping Address': 'عنوان التوصيل',
          //! Notifications :
          'Notifications': 'الأشعارات',
          //! Offers :
          'Offers': 'العروض',
          //! Settings :
          'Call': 'اتصال',
          'Instagram': 'انستغرام',
          'Account': 'الحساب',
          'Dark Mode': 'الوضع الليلي',
          'Favorite': 'المفضلة',
          'Orders': 'الطلبات',
          'Archive': 'الأرشيف',
          'Address': 'العنوان',
          'App Language': 'لغة التطبيق',
          'About Us': 'معلومات المُصنعين',
          'Contact Me': 'اتصل بي',
          'Log Out': 'تسجيل الخروج',
          'Arabic': 'العربية',
          'English': 'الأنكليزية',
          'Kurdish': 'الكردية',
          'Language': 'اللغة',
          'Select Your Language': 'الرجاء أختيار لغتك',
          "Let's Get Started . . . ": 'دعنا نبدأ . . . ',
          //! Orders :
          'Pending Orders': 'الطلبات المعلقة',
          'Archive Orders': 'الطلبات المؤرشفة',
          'Order': 'الطلب ',
          'Recive': 'استلام',
          'Order Type': 'نوع الطلب',
          'Order Price': 'سعر الطلب',
          'Delivery Price': 'سعر التوصيل',
          'Payment Method': 'وسيلة الدفع',
          'Order Status': 'حالة الطلب',
          'Order Details': 'معلومات الطلب',
          'Items': 'المنتج',
          'QTY': 'العدد',
          'Approve Pending': 'الطلب معلق',
          'The Order is being Prepared': 'يجري اعداد الطلب',
          'Ready To Pick Up By Delivery Man':
              'جاهز للاستلام من قبل رجل التوصيل',
          'On The Way': 'في الطريق',
          //! Address :
          'City': 'مدينة',
          'Region': 'منطقة',
          'Street': 'الشارع',
          'Address Title': 'اسم الموقع',
          'Home / Work': 'منزل / عمل',
          'Address ID': 'تسلسل العنوان',
          'Address Name': 'اسم العنوان',
          'Address City': 'المدينة',
          'Address Region': 'المنطقة',
          'Address Street': 'الشارع',
          //! Dialog Box :
          'Sorry': 'نأسف',
          'Error': 'خطأ',
          'Success': 'تم',
          'Warning': 'تحذير',
          'Fail': 'فشلت العملية', 
          'Confirm': 'تأكيد',
          'Cancel': 'الغاء',
          "Are you sure to exit app ?":'هل أنت متأكد من أغلاق التطبيق ؟',
          'It only takes a minute to create an account and join our community. Your journey to a richer app experience starts here!':
              'يستغرق إنشاء حساب دقيقة واحدة فقط، وسيبدأ رحيلك نحو تجربة تطبيق أكثر ثراءً هنا!',
          'Please add address . . .': 'الرجاء أضافة موقعك . . .',
          'Please select a payment method . . .':
              'الرجاء أختيار وسيلة الدفع . . .',
          'Please select an orders type . . .':
              'الرجاء أختيار وسيلة التوصيل . . .',
          'Coming soon stay tuned': 'ستتوفر قريباً',
          "Address can't be empty": 'لا يمكن ترك الموقع فارغاً',
          'Items count not enough': 'عدد المنتج غير كافٍ',
          'The order successfully sent': 'لقد تم حجز الطلب بنجاح',
          'Try again please . . .': 'الرجاء اعادة المحاولة . . .',
          'The items added to cart': 'تم أضافة المنتج للسلة',
          'The items removed from cart': 'تم ازالة المنتج من السلة',
          'Empty cart': 'السلة فارغة',
          'Coupon Not Valid': 'الكوبون غير صالح',
          'The items added to favorite': 'تم أضافة المنتج للمفضلة',
          'The items removed from favorite': 'تم ازالة المنتج من السلة',
          'Thanks for your response': 'شكرا لردك',
          'The Orders Removed From Archive . . .':
              'تم أزالة المنتج من الأرشيف . . .',
          'username not valid try with correct username':
              'اسم المستخدم غير صالح',
          'Not valid text': 'النص غير صالح',
          'E-mail not valid': 'الأيميل غير صالح',
          'Mobile number not valid': 'رقم الهاتف غير صالح',
          "Field can't be empty": 'لا يمكن ترك الحقل فارغاً',
          "Field can't less than ": 'لا يمكن ان تكون القيمة أقل من ',
          "Field can't more than ": 'لا يمكن أن تكون القيمة أكثر من ',
          'Invalid username or password.\n Please try again.':
              'خطأ في الرقم الري أو الأيميل\n رجاء أعادة المحاولة',
          'User with this email does not exist.': 'بريد الكتروني غير متوفر',
          'Incorrect password.': 'كلمة السر غير صحيحة',
          'Your Email Not Valid.': 'بريد الكتروني غير صحيح',
          "Your password reseted succefully now you can login with new password":
              'تم إعادة تعيين كلمة سر حسابك بنجاح يمكنك الأن اسجيل الدخول بمعلوماتك الجديدة',
          'Please type a new password and then repeaet your password to confirm . . .':
              'الرجاء كتابة كلمة مرور جديدة ومن ثم قم بإعادة كتابتها للتأكيد . . .',
          'email address not found':
              'لا يوجد حساب مرتبط بهذا البريد الألكتروني',
          'Verification Code': 'رمز التحقق',
          'Reset Password': 'إعادة التعيين',
          "Save Changes": 'حفظ التغييرات',
          "New Password": 'كلمة السر الجديدة',
          "Confirm Password": "تأكيد كلمة السر",
          "Check": "التحقق",
          'Your Email Not Verified, Please Check Your Email Folder Then Follw Link To Active Your Account.':
              'بريدك الالكتروني غير مفعل, الرجاء فتح صندوق البريد والتحقق من الرابط.',
          'Please enter your email address and we will send vreification code to your account after check your account':
              'الرجاء كتابة بريدك الألكتروني وسنرسل لك رمز التحقق بعد التأكد من حسابك',
          //! On Boarding :
          'Next': 'التالي',
          'Welcome to Your Arduino Adventure!':
              'مرحبًا بك في مغامرة الأردوينو الخاصة بك!',
          'Your Gateway to Arduino Creations!': 'بوابتك إلى إبداعات اردوينو!',
          'Delivering Delight to Your Doorstep!':
              'توصيل البهجة إلى عتبة داركم!',
          'Discover Irresistible Savings!': 'اكتشف التوفير الذي لا يقاوم!',
          'Get ready to explore the world of Arduino with our online store. Shop and bring your ideas to life with confidence.':
              'استعد لاكتشاف عالم أردوينو مع متجرنا الإلكتروني. اشتري وقم بتنفيذ أفكارك بثقة.',
          "Explore our online Arduino store for components, sensors, and more. From hobbyists to pros, we're your one-stop shop for Arduino. Join our electronic adventure":
              'ادخل إلى عالم الابتكار عندما تدخل متجرنا الإلكتروني لمكونات اردوينو. أطلق العنان لخيالك مع مجموعة من أجهزة الاستشعار والوحدات والملحقات. سواء كنت هاويًا أو محترفًا، فإن متجرنا هو متجرك الشامل لكل ما يتعلق بـ اردوينو. لنشرع في هذه المغامرة الإلكترونية معًا!',
          'Experience seamless and secure online shopping delivery with us. Enjoy fast, reliable service, and focus on your shopping experience':
              'استمتع بتجربة توصيل التسوق عبر الإنترنت السلسة والآمنة معنا. استمتع بخدمة سريعة وموثوقة وركز على تجربتك في التسوق',
          "Discover savings and special deals in our online store to enhance your shopping experience. Enjoy affordable and enjoyable shopping with us.":
              'استمتع بتجربة توفير وصفقات خاصة في متجرنا عبر الإنترنت. تمتع بتجربة تسوق ميسرة وممتعة معنا.',
          //! Profile :
          "DC DUHOK is a small business dedicated to serving electronics enthusiasts, students working on graduation projects, and individuals seeking quality electronic components, especially those related to Arduino and its ecosystem. Our mission is to provide a one-stop shop for electronics components, offer design and consulting services for graduation projects, and foster a vibrant community of makers and innovators, DC DUHOK represents both the concept of Direct Current (DC) electronics and the location of the business, Duhok,":
              "DC DUHOK هي شركة صغيرة مخصصة لخدمة عشاق الإلكترونيات، والطلاب العاملين في مشاريع التخرج، والأفراد الذين يبحثون عن مكونات إلكترونية عالية الجودة، وخاصة تلك المتعلقة بـ Arduino ونظامها البيئي. مهمتنا هي توفير متجر شامل للمكونات الإلكترونية، وتقديم خدمات التصميم والاستشارة لمشاريع التخرج، وتعزيز مجتمع نابض بالحياة من الصناع والمبتكرين، يمثل DC DUHOK مفهوم إلكترونيات التيار المباشر (DC) وموقع العمل، دهوك.",
          '\n\nProducts and Services:': '\n\nمنتجات وخدمات:',
          '\n1- Electronic Components Retail: ':
              '\n1- بيع المكونات الإلكترونية بالتجزئة: ',
          'DC DUHOK offers a wide range of electronic components, including Arduino boards, sensors, actuators, LEDs, resistors, capacitors, and more. We source our products from reputable suppliers to ensure the highest quality for our customers.':
              " تقدم DC DUHOK مجموعة واسعة من المكونات الإلكترونية، بما في ذلك لوحات Arduino وأجهزة الاستشعار والمحركات ومصابيح LED والمقاومات والمكثفات والمزيد. نحن نستورد منتجاتنا من موردين ذوي سمعة طيبة لضمان أعلى مستويات الجودة لعملائنا.",
          '\n\n2- Arduino Ecosystem: ': '\n\n2- بيئة الأردوينو: ',
          " We specialize in Arduino-compatible components and accessories, making it easier for hobbyists and professionals to find everything they need to build innovative projects. Our inventory includes Arduino boards, shields, kits, and programming accessories.":
              " نحن متخصصون في المكونات والملحقات المتوافقة مع Arduino، مما يسهل على الهواة والمحترفين العثور على كل ما يحتاجونه لبناء مشاريع مبتكرة. يتضمن مخزوننا لوحات Arduino والدروع والأطقم وملحقات البرمجة.",
          '\n\n3- Design and Consulting Services: ':
              '\n\n3- خدمات التصميم والاستشارات: ',
          "DC DUHOK provides design and consulting services for students and professionals working on graduation projects or other electronic ventures. Our experienced team offers guidance, technical support, and project development assistance to help customers bring their ideas to life.":
              "توفر DC DUHOK خدمات التصميم والاستشارات للطلاب والمهنيين العاملين في مشاريع التخرج أو المشاريع الإلكترونية الأخرى. يقدم فريقنا ذو الخبرة التوجيه والدعم الفني والمساعدة في تطوير المشاريع لمساعدة العملاء على تحقيق أفكارهم على أرض الواقع.",
          '\n\n4- Workshops and Training: ': '\n\n4- ورش العمل والتدريب: ',
          " We host workshops and training sessions to educate customers about electronics and programming. These sessions are suitable for beginners and experienced makers alike, helping them develop their skills and build confidence in working with electronic components.":
              "نستضيف ورش عمل ودورات تدريبية لتثقيف العملاء حول الإلكترونيات والبرمجة. هذه الدورات مناسبة للمبتدئين والصناع ذوي الخبرة على حد سواء، حيث تساعدهم على تطوير مهاراتهم وبناء الثقة في العمل مع المكونات الإلكترونية.",
          '\n\n5- Community Engagement:': '\n\n5- المشاركة المجتمعية:',
          "DC DUHOK aims to foster a strong community of electronics enthusiasts. We organize meetups, online forums, and events where like-minded individuals can share knowledge, collaborate on projects, and inspire each other.":
              " تهدف DC DUHOK إلى تعزيز مجتمع قوي من عشاق الإلكترونيات. نحن ننظم لقاءات ومنتديات عبر الإنترنت وأحداث حيث يمكن للأفراد ذوي التفكير المماثل تبادل المعرفة والتعاون في المشاريع وإلهام بعضهم البعض.",
          "\n\nUnique Selling Points:": "\n\nنقاط البيع الفريدة:",
          '\n1- Quality Assurance: ': '\n1- ضمان الجودة: ',
          "We prioritize quality and reliability in our products, ensuring that our customers have access to the best components for their projects.":
              "نحن نعطي الأولوية للجودة والموثوقية في منتجاتنا، مما يضمن حصول عملائنا على أفضل المكونات لمشاريعهم.",
          '\n\n2-Expert Guidance:': '\n\n2-إرشادات الخبراء:',
          " Our team of experts is always available to provide technical support, answer questions, and offer advice, making electronics accessible to everyone.":
              " فريق الخبراء لدينا متاح دائمًا لتقديم الدعم الفني والإجابة على الأسئلة وتقديم المشورة، مما يجعل الإلكترونيات في متناول الجميع. ",
          '\n\n3-Comprehensive Inventory: ': '\n\n3-المخزون الشامل: ',
          "We maintain a comprehensive inventory of electronic components, reducing the need for customers to search elsewhere for their project needs.":
              " نحن نحتفظ بمخزون شامل من المكونات الإلكترونية، مما يقلل حاجة العملاء للبحث في أماكن أخرى عن احتياجات مشروعاتهم.",
          '\n\n4-Educational Focus: ': '\n\n4-التركيز التعليمي:',
          " We are committed to educating and empowering our customers through workshops, training, and community-building initiatives.":
              " نحن ملتزمون بتثقيف وتمكين عملائنا من خلال ورش العمل والتدريب ومبادرات بناء المجتمع."
        },
        //! Kurdish LAnguage :
        'he': {
          ' IQ': ' د.ع',
          //! Authentication Translation:
          "Choose Language": "زمان هەڵبژێرە",
          'Welcome To': 'بەخێربێیت بۆ',
          'Sign In With Your Email And Password':
              'چونه زورةوة ب ريكا جيميل و پاسووردى ',
          'E-mail': 'ئيميل',
          'Password': 'پاسوورد',
          'Forget Password': 'پاسوورد ژبيركريه؟',
          'Log In': 'چونه ژور',
          'Dont Have An Account ? ': 'ئەکاونتت نییە ؟',
          'Sign Up': 'خۆت تۆمار بکە',
          'Username': 'ناڤى يوزر',
          'First Name': 'ناڤى ئيكى',
          'Last Name': 'ناڤى دووى',
          'Phone Number': 'ژماره  تلفونى',
          'Sign In': 'چونه ژور',
          'Check': 'پشکنین',
          'Verification Code': 'كۆدى دڵنيابوون',
          'Please type a new password and then repeaet your password to confirm . . .':
              'تکایە وشەی نهێنی نوێ بنووسە و پاشان وشەی نهێنی خۆت دووبارە بکەرەوە بۆ پشتڕاستکردنەوە . . .',
          "Your password reseted succefully now you can login with new password":
              "پاسۆردەکەت بە سەرکەوتوویی ڕێست کردەوە ئێستا دەتوانیت بە وشەی نهێنی نوێ بچیتە ژوورەوە",
          'Already Have an Account? ': 'ته ئه كاونت هييه ؟',
          'Check code': 'کۆدەکان بپشکنە',
          'Please enter verify code that sent to ':
              'تکایە کۆدی پشتڕاستکردنەوە داخڵ بکە کە بۆ ',
          "email address already exist, please try with another email or reset your password ...":
              "ناونیشانی ئیمەیڵ پێشتر هەیە، تکایە بە ئیمەیڵێکی تر هەوڵبدە یان وشەی نهێنی خۆت ڕێست بکەرەوە ...",
          'Please enter your email address and we will send verification code to your account after check your account':
              'تکایە ناونیشانی ئیمەیڵەکەت دابنێ و دوای پشکنینی ئەکاونتەکەت کۆدی پشتڕاستکردنەوە بۆ ئەکاونتەکەت دەنێرین',
          'Account created sccesfully open your email folder then use verify code to verify your account':
              'ئەکاونتەکە بە سەرکەوتوویی دروستکراوە فۆڵدەری ئیمەیڵەکەت بکەرەوە پاشان کۆدی پشتڕاستکردنەوە بەکاربهێنە بۆ پشتڕاستکردنەوەی ئەکاونتەکەت',
          //! Home Trnaslation:
          'Search For Product . . .': "گەڕان بۆ بەرهەم . . .",
          'Welcome, ': "بەخێربێیت, ",
          'Search': "گەڕان",
          'All Categories': "هەموو پۆلەکان",
          'Products for you': "بەرهەمە بۆ ته",
          "New Arrival Products": 'بەرهەمی هاتنی نوێ',
          'Products': 'بەرهەم',
          'Deliver': 'گەیاندن',
          'available to': 'به‌رده‌سته‌ بۆ',
          'All Kurdisatn': 'هەموو کوردستان',
          'Designing': 'دیزاینکردن',
          'Graduation Projects': 'پڕۆژەکانی دەرچوون',
          'Upon Request': 'لەکاتی داواکردن',
          'Permanent': 'هەمیشەیی',
          'and Discounts': 'و داشکاندن',
          'Advertising': 'ڕیکلامکردن',
          'your used': 'بۆ بەرهەمە',
          'products': 'بەکارهێنراوەکانت',
          //!Product Details :
          'Go To Cart': 'بڕۆ بۆ سەبەتە',
          'Total Price': 'نرخی گشتی',
          'Description:': 'وەسف: ',
          //! Cart :
          'My Cart': 'سەبەتەکەم',
          'You Have ': 'تۆ هەتە ',
          ' Items in Your Cart': ' شتەکانی ناو سەبەتەکەت ',
          'Check Out': "پشکنین",
          'Apply': "جێبەجێکردن",
          'Coupon Code:': "کۆدی کووپن:",
          'Price': "نرخ",
          'Coupon Discount': "داشکاندنی کووپن",
          'Shipping': 'ناردن',
          //! Check Out :
          'Checkout': 'پشکنین',
          'Choose Payment Method:': 'شێوازی پارەدانەکە دیاری بکە:',
          'Cash On Delivery': 'نەقد لە کاتی گواستنەوە',
          'Payments Card': 'کارتی پارەدان',
          'Choose Delivery Type': 'جۆری گەیاندن هەڵبژێرە',
          'Delivery': 'گەیاندن',
          'Revice': 'پێداچوونەوە',
          'Shipping Address': 'ناونیشانی گەیاندن',
          //! Notifications :
          'Notifications': 'ئاگادارکردنەوەکان',
          //! Offers :
          'Offers': 'ئۆفەرەکان',
          //! Settings :
          'Account': 'ئەژمێر',
          'Dark Mode': 'دۆخی تاریک',
          'Favorite': 'خوازراو',
          'Orders': 'فەرمانەکان',
          'Archive': 'ئەرشیف',
          'Address': 'ناونیشان',
          'App Language': 'زمانی بەرنامە',
          'About Us': 'دەربارەی ئێمە',
          'Contact Me': 'پەیوەندیم پێوە بکە',
          'Log Out': 'چوونە دەرەوە',
          'Arabic': 'عەرەبی',
          'English': 'ئینگلیزی',
          'Kurdish': 'کوردی',
          'Language': 'زمان',
          'Dilkhosh Saadon': 'دلخوش سعدون',
          'Kurdistan - Iraq': 'كردستان - العراق',
          'Mobile Developer': 'مطور تطبيقات الموبايل',
          'Select Your Language': 'زمانەکەت هەڵبژێرە',
          "Let's Get Started . . . ": "با دەست پێ بکەین . . . ",
          //! Orders :
          'Pending Orders': 'فەرمانی چاوەڕوانکراو',
          'Archive Orders': 'فەرمانی ئەرشیف',
          'Order': 'فەرمانی ',
          'Recive': 'وەرگرتن',
          'Order Type': 'جۆری داواکاری',
          'Order Price': 'نرخی داواکاری',
          'Delivery Price': 'نرخی گەیاندن',
          'Payment Method': 'شێوازی پارەدان',
          'Order Status': 'باری داواکاری',
          'Order Details': 'وردەکارییەکانی داواکاری',
          'Items': 'کەرەستەکان',
          'QTY': 'العدد',
          'Approve Pending': 'پەسەندکردن لە چاوەڕوانیدا',
          'The Order is being Prepared': 'فەرمانەکە ئامادە دەکرێت',
          'Ready To Pick Up By Delivery Man':
              'ئامادە بۆ وەرگرتن لەلایەن پیاوی گەیاندن',
          'On The Way': 'لە ڕێگادا',
          //! Address :
          'City': 'شار',
          'Region': 'هەرێم',
          'Street': 'شەقام',
          'Address Title': 'ناونیشانی ناونیشان',
          'Home / Work': 'ئەرکی ماڵەوە',
          //! Dialog Box :
          'Sorry': 'ببوورە',
          'Error': 'هەڵە',
          'Success': 'سەرکەوتن',
          'Warning': 'ئاگادار کردنەوە',
          'Fail': 'شکست',
          'Hint': 'ئاماژە',
          'Confirm': 'دڵنیاکردنەوە',
          'Cancel': 'ڕەتکردنەوە',
          'It only takes a minute to create an account and join our community. Your journey to a richer app experience starts here!':
              'تایبەتە دانیشتنی یەکخوێیەک بەرز یەک خولەکە! لەمەرە، دواییشیان بەرنامەیەکی زانیاری پڕ بکە!',
          "Are you sure to exit app ?": 'ئایا دڵنیای لە دەرچوون لە ئەپ ؟',
          'Please Add Address . . .': 'تکایە ناونیشان زیاد بکە . . .',
          'Please Select A Payment Method . . .':
              'تکایە شێوازێکی پارەدان هەڵبژێرە . . .',
          'Please Select An Orders Type . . .':
              'تکایە جۆرێکی داواکاری هەڵبژێرە . . .',
          'Coming soon stay tuned': 'بەم زووانە چاوەڕوان بن',
          'The Order Successfully Sent': 'فەرمانەکە بە سەرکەوتوویی نێردراوە',
          'Try Again Please . . .': 'دوبارە هەوڵبدەرەوە تکایە . . .',
          'The items added to cart': 'ئەو شتانەی کە زیادکراون بۆ سەبەتە',
          'The Items Removed From Cart': 'ئەو شتانەی لە سەبەتە دەرهێنراون',
          'Empty Cart': 'سەبەتەی بەتاڵ',
          'Coupon Not Valid': 'کوپنەکە کارا نییە',
          'The items added to favorite': 'ئەو بابەتانەی زیاد کراون بۆ دڵخواز',
          'The items removed from favorite': 'The items removed from favorite',
          'Thanks For Your Response': 'سوپاس بۆ وڵامەکەت',
          'The Orders Removed From Archive . . .':
              'ئەو فەرمانانەی لە ئەرشیف لابراون . . .',
          'Username Not Valid': 'ناوی بەکارهێنەر دروست نییە',
          'Not Valid Text': 'دەقی دروست نییە',
          'E-mail Not Valid': 'ئیمەیڵ کارا نییە',
          'Mobile Number Not Valid': 'ژمارەی مۆبایل کارا نییە',
          "Field can't be empty": "مەیدان ناتوانێت بەتاڵ بێت",
          "Field can't less than ": "بەها ناتوانێت کەمتر بێت لە ",
          "Value Can't More Than ": "بەها ناتوانێت لەوە زیاتر بێت ",
          'Invalid username or password.\n Please try again.':
              'ناوی بەکارهێنەر یان وشەی نهێنی نادروست.\n تکایە دووبارە هەوڵبدەرەوە.',
          "Address Can't be Empty": "ناونیشان ناتوانرێت بەتاڵ بێت",
          'User with this email does not exist.':
              'بەکارهێنەرێک کە ئەم ئیمەیڵەی هەیە بوونی نییە.',
          'Incorrect password.': 'ووشەی تێپەڕ هەڵەیە.',
          'Your Email Not Valid.': 'ئیمەیڵەکەت کارا نییە.',
          'Your Email Not Verified, Please Check Your Email Folder Then Follw Link To Active Your Account.':
              'ئیمەیڵەکەت پشتڕاست نەکراوەتەوە، تکایە فۆڵدەری ئیمەیڵەکەت بپشکنە پاشان لینکی فۆڵۆو بکە بۆ چالاککردنی ئەکاونتەکەت.',
          //! On Boarding :
          'Next': 'داهاتوو',
          'Welcome to Your Arduino Adventure!':
              'بەخێر بێیت بۆ سەرگەرمی ئاردینۆکەت!',
          'Your Gateway to Arduino Creations!':
              'دەروازەی تۆ بۆ دروستکردنی ئاردینۆ!',
          'Delivering Delight to Your Doorstep!': 'گەیاندنی خۆشی بۆ دەرگاکەت!',
          'Discover Irresistible Savings!': 'پاشکەوتی بەرگە نەگیراو بدۆزەرەوە!',
          'Get ready to explore the world of Arduino with our online store. Shop and bring your ideas to life with confidence.':
              'ئامادەبە بۆ گەڕان بە جیهانی ئاردینۆ لەگەڵ فرۆشگای ئۆنلاینەکەمان. بازاڕ بکە و بە متمانەوە بیرۆکەکانت بە ژیانەوە بگەیەنە.',
          "Explore our online Arduino store for components, sensors, and more. From hobbyists to pros, we're your one-stop shop for Arduino. Join our electronic adventure":
              "لە فرۆشگای ئۆنلاین ئاردینۆمان بگەڕێ بۆ پێکهاتەکان، هەستەوەرەکان و زۆر شتی تر. لە کەسانی ئارەزوومەندەوە تا پڕۆکان، ئێمە یەک وێستگەی تۆین بۆ ئاردینۆ. بەشداری سەرگەرمی ئەلیکترۆنیمان بکە",
          'Experience seamless and secure online shopping delivery with us. Enjoy fast, reliable service, and focus on your shopping experience':
              'ئەزموونی گەیاندنی بێ کێشە و پارێزراوی کڕینی ئۆنلاین لەگەڵ ئێمە. چێژ لە خزمەتگوزاری خێرا و متمانەپێکراو وەربگرە، و سەرنجت لەسەر ئەزموونی کڕینەکەت بێت',
          "Discover savings and special deals in our online store to enhance your shopping experience. Enjoy affordable and enjoyable shopping with us.":
              "پاشکەوت و گرێبەستی تایبەت لە فرۆشگای ئۆنلاینەکەمان بدۆزەرەوە بۆ بەرزکردنەوەی ئەزموونی کڕینەکەت. چێژ لە بازاڕکردنی گونجاو و چێژبەخش وەربگرە لەگەڵ ئێمە.",
          //! Profile :
          "DC DUHOK is a small business dedicated to serving electronics enthusiasts, students working on graduation projects, and individuals seeking quality electronic components, especially those related to Arduino and its ecosystem. Our mission is to provide a one-stop shop for electronics components, offer design and consulting services for graduation projects, and foster a vibrant community of makers and innovators, DC DUHOK represents both the concept of Direct Current (DC) electronics and the location of the business, Duhok,":
              "DC DUHOK بزنسێکی بچووکە تایبەتە بە خزمەتکردنی ئارەزومەندانی ئەلیکترۆنیات، ئەو خوێندکارانەی کە کار لەسەر پڕۆژەکانی دەرچوون دەکەن، و ئەو کەسانەی بەدوای پێکهاتەی ئەلیکترۆنی کوالیتیدا دەگەڕێن، بەتایبەتی ئەوانەی پەیوەندییان بە ئاردینۆ و ئیکۆسیستەمەکەیەوە هەیە. ئەرکی ئێمە دابینکردنی یەک وێستگەیە بۆ پێکهاتەکانی ئەلیکترۆنی، ئۆفەر. خزمەتگوزاری دیزاین و ڕاوێژکاری بۆ پڕۆژەکانی دەرچوون، و پەروەردەکردنی کۆمەڵگەیەکی زیندوو لە دروستکەران و داهێنەران، دی سی دهۆک نوێنەرایەتی هەردوو چەمکی ئەلیکترۆنی ڕاستەوخۆی کارەبا (DC) و شوێنی بزنسەکە دەکات، دهۆک،",
          '\n\nProducts and Services:': '\n\nبەرهەم و خزمەتگوزارییەکان:',
          '\n1- Electronic Components Retail: ':
              '\n\n1- فرۆشتنی تاکەکەسی پێکهاتە ئەلیکترۆنییەکان: ',
          'DC DUHOK offers a wide range of electronic components, including Arduino boards, sensors, actuators, LEDs, resistors, capacitors, and more. We source our products from reputable suppliers to ensure the highest quality for our customers.':
              'DC DUHOK کۆمەڵێک پێکهاتەی ئەلیکترۆنی بەرفراوان پێشکەش دەکات، لەوانە بۆردەکانی Arduino، هەستەوەر، ئەکتوێتەر، LED، بەرگری، خاوێنکەرەوە و زۆر شتی تر. ئێمە بەرهەمەکانمان لە دابینکەرانی بەناوبانگەوە سەرچاوە دەگرین بۆ ئەوەی بەرزترین کوالیتی بۆ کڕیارەکانمان مسۆگەر بکەین.',
          '\n\n2- Arduino Ecosystem: ': '\n\n2- ئیکۆسیستەمی ئاردینۆ: ',
          " We specialize in Arduino-compatible components and accessories, making it easier for hobbyists and professionals to find everything they need to build innovative projects. Our inventory includes Arduino boards, shields, kits, and programming accessories.":
              " ئێمە پسپۆڕین لە پێکهاتە و ئیکسسواراتەکانی گونجاو لەگەڵ ئاردینۆ، ئەمەش ئاسانکاری دەکات بۆ کەسانی خولیا و پیشەگەرەکان بۆ دۆزینەوەی هەموو ئەو شتانەی کە پێویستیانە بۆ دروستکردنی پڕۆژەی داهێنەرانە. ئینفۆنتۆرەکەمان بریتییە لە بۆردەکانی ئاردینۆ، قەڵغان، کیت و ئیکسسواراتەکانی بەرنامەسازی.",
          '\n\n3- Design and Consulting Services: ':
              '\n\n3- خزمەتگوزاری دیزاین و ڕاوێژکاری: ',
          "DC DUHOK provides design and consulting services for students and professionals working on graduation projects or other electronic ventures. Our experienced team offers guidance, technical support, and project development assistance to help customers bring their ideas to life.":
              "DC DUHOK خزمەتگوزاری دیزاین و ڕاوێژکاری پێشکەش بە خوێندکاران و پیشەگەرەکان دەکات کە کار لەسەر پڕۆژەکانی دەرچوون یان کارە ئەلیکترۆنیەکانی تر دەکەن. تیمە بە ئەزموونەکەمان ڕێنمایی، پشتگیری تەکنیکی، و یارمەتی پەرەپێدانی پڕۆژە پێشکەش دەکات بۆ یارمەتیدانی کڕیاران بۆ ژیانکردنی بیرۆکەکانیان.",
          '\n\n4- Workshops and Training: ': '\n\n4- وۆرک شۆپ و ڕاهێنان: ',
          " We host workshops and training sessions to educate customers about electronics and programming. These sessions are suitable for beginners and experienced makers alike, helping them develop their skills and build confidence in working with electronic components.":
              " ئێمە میوانداری وۆرک شۆپ و کۆبوونەوەکانی ڕاهێنان دەکەین بۆ پەروەردەکردنی کڕیاران دەربارەی ئەلیکترۆنیات و بەرنامەسازی. ئەم کۆبوونەوانە گونجاون بۆ دروستکەرانی سەرەتایی و بە ئەزموون، یارمەتیان دەدات پەرەپێدانی لێهاتووییەکانیان و دروستکردنی متمانە لە کارکردن لەگەڵ پێکهاتە ئەلیکترۆنییەکان.",
          '\n\n5- Community Engagement:': '\n\n5- بەشداریکردنی کۆمەڵگا: ',
          "DC DUHOK aims to foster a strong community of electronics enthusiasts. We organize meetups, online forums, and events where like-minded individuals can share knowledge, collaborate on projects, and inspire each other.":
              "ئامانجی DC DUHOK پەروەردەکردنی کۆمەڵگەیەکی بەهێزە لە ئارەزومەندانی ئەلیکترۆنی. ئێمە کۆبوونەوە، مەکۆی ئۆنلاین و بۆنە ڕێکدەخەین کە کەسانی هاوبیر دەتوانن زانیاری هاوبەش بکەن، هاوکاری بکەن لە پڕۆژەکاندا و ئیلهامبەخش بن بۆ یەکتر.",
          "\n\nUnique Selling Points:": "\n\nخاڵەکانی فرۆشتنی ناوازە:",
          '\n1- Quality Assurance: ': '\n1- دڵنیایی جۆری: ',
          "We prioritize quality and reliability in our products, ensuring that our customers have access to the best components for their projects.":
              "ئێمە کوالیتی و متمانەپێکراوی لە بەرهەمەکانماندا لە پێشینە دەدەین، دڵنیا دەبینەوە لەوەی کڕیارەکانمان دەستیان بە باشترین پێکهاتەکان بۆ پڕۆژەکانیان دەگات.",
          '\n\n2-Expert Guidance:': '\n\n2-ڕێنمایی پسپۆڕان:',
          "Our team of experts is always available to provide technical support, answer questions, and offer advice, making electronics accessible to everyone.":
              "تیمی پسپۆڕەکانمان هەمیشە ئامادەن بۆ پێشکەشکردنی پشتگیری تەکنیکی، وەڵامدانەوەی پرسیارەکان، و پێشکەشکردنی ئامۆژگاری، ئەمەش وا دەکات کە ئامێرە ئەلیکترۆنییەکان بۆ هەمووان دەستبکەوێت.",
          '\n\n3-Comprehensive Inventory: ': '\n\n3-ئینفۆنتۆری گشتگیر: ',
          "We maintain a comprehensive inventory of electronic components, reducing the need for customers to search elsewhere for their project needs.":
              "ئێمە ئینفۆنتۆرێکی گشتگیر لە پێکهاتە ئەلیکترۆنییەکان دەپارێزین، ئەمەش پێویستی کڕیاران کەمدەکاتەوە بۆ گەڕان لە شوێنێکی تر بۆ پێداویستییەکانی پڕۆژەکەیان.",
          '\n\n4-Educational Focus: ': '\n\n4-فۆکەسی پەروەردەیی: ',
          " We are committed to educating and empowering our customers through workshops, training, and community-building initiatives.":
              " ئێمە پابەندین بە پەروەردەکردن و بەهێزکردنی کڕیارەکانمان لە ڕێگەی وۆرک شۆپ و ڕاهێنان و دەستپێشخەرییەکانی بنیاتنانی کۆمەڵگا."
        }
      };
}
