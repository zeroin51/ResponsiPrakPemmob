import 'package:flutter/material.dart';
import 'package:responsi/model/ikan.dart';
import 'package:responsi/ui/ikan_form.dart';
import 'package:responsi/ui/ikan_page.dart';

import '../bloc/ikan_bloc.dart';

class IkanDetail extends StatefulWidget {
  Ikan? ikan;
  IkanDetail({Key? key, this.ikan}) : super(key: key);
  @override
  _IkanDetailState createState() => _IkanDetailState();
}

class _IkanDetailState extends State<IkanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Ikan'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Nama Ikan : ${widget.ikan!.nama}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Jenis Ikan : ${widget.ikan!.jenis}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Warna Ikan : ${widget.ikan!.warna}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Habitat Ikan : ${widget.ikan!.habitat}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
//Tombol Edit
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IkanForm(
                        ikan: widget.ikan!,
                      )));
            }),
//Tombol Hapus
        OutlinedButton(
            child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
//tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            IkanBloc.deleteIkan(id: widget.ikan?.id).then((value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IkanPage()));
            });
          },
        ),
//tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
