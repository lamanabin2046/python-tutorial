from django.shortcuts import redirect, render
from django.utils import timezone

from blog_app.models import Post


def post_list(request):
    posts = Post.objects.filter(published_at__isnull=False).order_by("-published_at")
    return render(
        request,
        "post_list.html",
        {"posts": posts},
    )


def post_detail(request, pk):
    post = Post.objects.get(pk=pk, published_at__isnull=False)
    return render(
        request,
        "post_detail.html",
        {"post": post},
    )


def draft_list(request):
    drafts = Post.objects.filter(published_at__isnull=True).order_by("-published_at")
    return render(
        request,
        "draft_list.html",
        {"drafts": drafts},
    )


def draft_detail(request, pk):
    draft = Post.objects.get(pk=pk, published_at__isnull=True)
    return render(
        request,
        "draft_detail.html",
        {"draft": draft},
    )


def draft_publish(request, pk):
    draft = Post.objects.get(pk=pk, published_at__isnull=True)
    draft.published_at = timezone.now()
    draft.save()
    return redirect("post-detail", draft.pk)


def post_delete(request, pk):
    post = Post.objects.get(pk=pk, published_at__isnull=False)
    post.delete()
    return redirect("post-list")


def draft_delete(request, pk):
    draft = Post.objects.get(pk=pk, published_at__isnull=True)
    draft.delete()
    return redirect("draft-list")
