"""The drawn shapes and the text glyphs of a PDF page, from `mutool trace`,
in page coordinates (points, y down)."""
import subprocess
import xml.etree.ElementTree as ET


def _apply(m, x, y):
    a, b, c, d, e, f = m
    return a * x + c * y + e, b * x + d * y + f


def pages(pdf):
    out = subprocess.run(["mutool", "info", pdf], capture_output=True, text=True, check=True).stdout
    return int(next(l for l in out.splitlines() if l.startswith("Pages")).split()[1])


def trace(pdf, page):
    """(shapes, glyphs, page height). A shape is a path's bounding box with its
    number of subpaths and curves; a glyph has its position, font, size,
    advance width, colour and (LilyPond) glyph name."""
    root = ET.fromstring(subprocess.run(["mutool", "trace", pdf, str(page)],
                                        capture_output=True, text=True, check=True).stdout)
    pg = root.find("page")
    height = float(pg.get("mediabox").split()[3])
    shapes, glyphs = [], []
    for el in pg.iter():
        if el.tag in ("fill_path", "stroke_path"):
            m = [float(v) for v in el.get("transform").split()]
            pts, nsub, ncurve = [], 0, 0
            for p in el:
                if p.tag == "moveto":
                    nsub += 1
                if p.tag == "curveto":
                    ncurve += 1
                    pts += [_apply(m, float(p.get("x" + k)), float(p.get("y" + k))) for k in "312"]
                elif p.get("x") is not None:
                    pts.append(_apply(m, float(p.get("x")), float(p.get("y"))))
            if pts:
                xs, ys = [p[0] for p in pts], [p[1] for p in pts]
                shapes.append(dict(kind=el.tag[:4], x0=min(xs), x1=max(xs), y0=min(ys), y1=max(ys),
                                   nsub=nsub, ncurve=ncurve, color=el.get("color"), npts=len(pts)))
        elif el.tag == "fill_text":
            m = [float(v) for v in el.get("transform").split()]
            for span in el:
                size = float(span.get("trm").split()[0])
                for g in span:
                    x, y = _apply(m, float(g.get("x")), float(g.get("y")))
                    glyphs.append(dict(name=g.get("glyph"), u=g.get("unicode"), x=x, y=y, size=size,
                                       font=span.get("font"), color=el.get("color"),
                                       adv=float(g.get("adv")) * size))
    return shapes, glyphs, height
