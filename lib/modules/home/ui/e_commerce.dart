import 'package:flutter/material.dart';

class ECommerceView extends StatelessWidget {
  const ECommerceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFFf6f6fa),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 52),
            const Text("Collection", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 0.5, blurRadius: 50, offset: const Offset(1, 1))]),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Search Place or List", prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)), filled: true, fillColor: Colors.white),
              ),
            ),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My List", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Show all", style: TextStyle(fontSize: 16, color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 32),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    10,
                    (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 24),
                                  Container(
                                    decoration: const BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.horizontal(left: Radius.circular(8))),
                                    height: 52,
                                    width: 5,
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.69,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                  // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 0.5, blurRadius: 50, offset: const Offset(1, 1))],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      child: ListTile(
                                        title: Text("Private List", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                        subtitle: Text(
                                          "by Dabhi Navaghan",
                                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                        ),
                                        trailing: Icon(Icons.more_horiz, color: Colors.grey, size: 32),
                                      ),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 0.5, blurRadius: 50, offset: const Offset(1, 1))],
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset("assets/ice1.jpg")),
                                    const ListTile(
                                      title: Text("Place in india", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                        "42 Places",
                                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: SizedBox(
                                                    width: 42,
                                                    height: 42,
                                                    child: Image.asset(
                                                      "assets/my.png",
                                                      fit: BoxFit.fill,
                                                    )))),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: SizedBox(
                                                    width: 42,
                                                    height: 42,
                                                    child: Image.asset(
                                                      "assets/my.png",
                                                      fit: BoxFit.fill,
                                                    )))),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: SizedBox(
                                                    width: 42,
                                                    height: 42,
                                                    child: Image.asset(
                                                      "assets/my.png",
                                                      fit: BoxFit.fill,
                                                    )))),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: Container(
                                                    color: Colors.orange,
                                                    width: 42,
                                                    height: 42,
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.all(4),
                                                    child: const Text(
                                                      "+18",
                                                    )))),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
              ),
            ),
            const SizedBox(height: 32),
            const Text("You will be interested", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  SizedBox(
                    height: 126,
                    width: 126,
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                            ),
                            clipBehavior: Clip.antiAlias,
                            height: 106,
                            width: 106,
                            child: Image.asset("assets/my.png", fit: BoxFit.fill)),
                        Positioned(
                          right: 3,
                          bottom: 7,
                          child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.orange),
                              clipBehavior: Clip.antiAlias,
                              height: 46,
                              width: 46,
                              child: const Icon(
                                Icons.person,
                                size: 32,
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text("Dabhi Navgahn", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text(
                    "42 Places",
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
