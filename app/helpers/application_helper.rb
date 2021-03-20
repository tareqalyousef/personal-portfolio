module ApplicationHelper
    # todo: redo all the markdown-- it is ugly
    # todo: probably move everything over to a stylesheet
    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, language)
            format = CodeRay.scan(code, language, :ruby).div()

            %(<div style="background: rgb(0, 5, 24); margin-left: -32px; margin-right: -32px; text-align: left;">#{format}</div>)
        end

        def link(link, title, content)
            %(<a href="#{link}" class="glow-text">#{content}</a>)
        end

        def block_quote(quote)
            %(<div style="background: rgb(0, 5, 24); margin-left: 100px; margin-right: 100px; text-align: center; border-radius: 5px;">#{quote}</div>)
        end

        def hrule()
            %(<hr style="background: rgb(93, 170, 250);"></hr>)
        end

        def codespan(text)
            %(<span style="background: rgb(0, 5, 24); border-radius: 5px; font-family: Consolas; font-size: 70%; padding: 5px;">#{text}</span>)
        end
    end

    def markdown(text)
        coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            lax_html_blocks: true,
        }

        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
    end
end