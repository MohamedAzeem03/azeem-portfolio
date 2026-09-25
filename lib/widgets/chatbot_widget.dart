import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isBot;
  ChatMessage({required this.text, required this.isBot});
}

class ChatbotWidget extends StatefulWidget {
  const ChatbotWidget({super.key});

  @override
  State<ChatbotWidget> createState() => _ChatbotWidgetState();
}

class _ChatbotWidgetState extends State<ChatbotWidget> with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  
  late AnimationController _bobController;
  late Animation<double> _bobAnimation;

  @override
  void initState() {
    super.initState();
    _bobController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    
    _bobAnimation = Tween<double>(begin: 0, end: -12).animate(
      CurvedAnimation(parent: _bobController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _bobController.dispose();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  
  final List<ChatMessage> _messages = [
    ChatMessage(text: 'Hi! I am Azeem\'s AI assistant. How can I help you today?', isBot: true),
  ];

  final List<String> _quickQuestions = [
    "What are your core skills?",
    "Tell me about your projects.",
    "What is your experience?",
    "How can I contact you?",
  ];

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;
    
    setState(() {
      _messages.add(ChatMessage(text: text, isBot: false));
    });
    
    _controller.clear();
    _scrollToBottom();

    // Simulate network delay
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _messages.add(ChatMessage(text: _generateReply(text), isBot: true));
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _generateReply(String question) {
    String lowerq = question.toLowerCase();
    if (lowerq.contains('skill') || lowerq.contains('tech') || lowerq.contains('stack')) {
      return 'Azeem is highly skilled in Flutter, Dart, Java, Spring Boot, PostgreSQL, and AI integrations (like Gemini and ChatGPT).';
    } else if (lowerq.contains('project') || lowerq.contains('work')) {
      return 'Azeem has built some amazing projects, including Devora (a productivity & challenge app) and Your Friendeey (an AI-powered mood advice app).';
    } else if (lowerq.contains('experience')) {
      return 'He has strong experience building scalable applications, designing beautiful UIs, and integrating complex backend services with Spring Boot and AWS.';
    } else if (lowerq.contains('contact') || lowerq.contains('hire') || lowerq.contains('email')) {
      return 'You can reach out to Azeem via the Contact section at the bottom of the page, or connect with him on LinkedIn and GitHub!';
    } else if (lowerq.contains('name') || lowerq.contains('who')) {
      return 'My name is Azeem! I am a passionate developer specializing in Flutter and Java.';
    } else if (lowerq.contains('hello') || lowerq.contains('hi') || lowerq.contains('hey')) {
      return 'Hello! How can I assist you in learning more about Azeem?';
    } else {
      return 'That is a great question! I am still learning, but you can find more details in the portfolio sections or by reaching out to Azeem directly.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_isOpen) _buildChatWindow(),
        const SizedBox(height: 16),
        AnimatedBuilder(
          animation: _bobAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _isOpen ? 0 : _bobAnimation.value),
              child: child,
            );
          },
          child: FloatingActionButton(
            onPressed: () => setState(() => _isOpen = !_isOpen),
            backgroundColor: Colors.black,
            elevation: 4,
            shape: const CircleBorder(),
            child: ClipOval(
              child: ColorFiltered(
                colorFilter: const ColorFilter.matrix([
                  0.2126, 0.7152, 0.0722, 0, 0,
                  0.2126, 0.7152, 0.0722, 0, 0,
                  0.2126, 0.7152, 0.0722, 0, 0,
                  0,      0,      0,      1, 0,
                ]),
                child: Image.asset(
                  'assets/images/chatbot.jpg',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatWindow() {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    
    return Container(
      width: isMobile ? MediaQuery.of(context).size.width - 32 : 350,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.matrix([
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0,      0,      0,      1, 0,
                    ]),
                    child: Image.asset(
                      'assets/images/chatbot.jpg',
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'AI Assistant',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 20),
                  onPressed: () => setState(() => _isOpen = false),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          
          // Messages area
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildMessageBubble(msg);
              },
            ),
          ),
          
          // Quick Questions
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _quickQuestions.map((q) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () => _handleSubmitted(q),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        q,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                )).toList(),
              ),
            ),
          ),
          
          // Input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask me anything...',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Colors.grey.shade400,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.black, size: 20),
                  onPressed: () => _handleSubmitted(_controller.text),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage msg) {
    return Align(
      alignment: msg.isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: msg.isBot ? Colors.grey.shade100 : Colors.black,
          borderRadius: BorderRadius.circular(16).copyWith(
            bottomLeft: msg.isBot ? const Radius.circular(0) : null,
            bottomRight: !msg.isBot ? const Radius.circular(0) : null,
          ),
        ),
        constraints: const BoxConstraints(maxWidth: 250),
        child: Text(
          msg.text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: msg.isBot ? Colors.black87 : Colors.white,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
