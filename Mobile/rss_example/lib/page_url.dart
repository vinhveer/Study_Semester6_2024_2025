import 'package:flutter/material.dart';
import 'package:readability/article.dart' as readability;
import 'package:readability/readability.dart' as readability;
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';

class PageUrl extends StatefulWidget {
  final String link;

  const PageUrl({super.key, required this.link});

  @override
  State<PageUrl> createState() => _PageUrlState();
}

class _PageUrlState extends State<PageUrl> {
  late Future<readability.Article?> articleFuture;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadArticle();
  }

  Future<void> _loadArticle() async {
    try {
      // Thêm timeout để tránh treo vô hạn
      articleFuture = readability.parseAsync(widget.link)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException('Quá thời gian tải bài viết.');
      });

      await articleFuture;

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
          errorMessage = 'Lỗi: ${e.toString()}';
        });
      }
      // Ghi log lỗi
      debugPrint('Lỗi khi tải bài viết: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bài viết"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: isLoading
          ? _buildLoadingView()
          : errorMessage != null
          ? _buildErrorView()
          : _buildArticleView(),
      floatingActionButton: isLoading || errorMessage != null
          ? FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoading = true;
            errorMessage = null;
          });
          _loadArticle();
        },
        child: const Icon(Icons.refresh),
      )
          : null,
    );
  }

  Widget _buildLoadingView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Đang tải bài viết, vui lòng đợi...'),
        ],
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              errorMessage ?? 'Đã xảy ra lỗi không xác định',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                  errorMessage = null;
                });
                _loadArticle();
              },
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleView() {
    return FutureBuilder<readability.Article?>(
      future: articleFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingView();
        }

        final article = snapshot.data;

        if (article == null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Không trích xuất được nội dung bài viết. Định dạng trang web có thể không được hỗ trợ.",
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? "Không có tiêu đề",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              // Sử dụng Html widget thay vì Text widget
              if (article.content != null)
                Html(
                  data: article.content!,
                  style: {
                    "body": Style(
                      fontSize: FontSize(16),
                    ),
                    "img": Style(
                      alignment: Alignment.center,
                    ),
                  },
                )
              else
                Text(
                  article.textContent ?? "Không có nội dung",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
            ],
          ),
        );
      },
    );
  }
}